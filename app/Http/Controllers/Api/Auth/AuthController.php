<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\SpinRuns;
use App\Models\Setting;
use App\Models\Wallet;
use App\Traits\Affiliates\AffiliateHistoryTrait;
use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;

class AuthController extends Controller
{
    use AffiliateHistoryTrait;

    public function __construct()
    {
        $this->middleware('auth.jwt', ['except' => ['login', 'register', 'submitForgetPassword', 'submitResetPassword']]);
    }

    public function register(Request $request)
    {
        try {
            $setting = \Helper::getSetting();

            $rules = [
                'name'          => 'required|string',
                'email'         => 'required|email|unique:users',
                'password'      => ['required', 'confirmed', Rules\Password::min(6)],
                'phone'         => 'required',
                'term_a'        => 'required',
                'agreement'     => 'required',
            ];

            $validator = \Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            $userData = $request->only(['name', 'password', 'email', 'phone', 'cpf']);
            $userData['phone'] = \Helper::soNumero($userData['phone']);

            // Gerar o código de afiliado
            $userData['inviter_code'] = $this->generateAffiliateCode();

            // Criando dados do afiliado
            $userData['affiliate_revenue_share']    = $setting->revshare_percentage;
            $userData['affiliate_cpa']              = $setting->cpa_value;
            $userData['affiliate_baseline']         = $setting->cpa_baseline;
            $userData['affiliate_bau_baseline']     = $setting->trunk_baseline;
            $userData['affiliate_bau_value']         = $setting->trunk_valor;
            $userData['affiliate_bau_aposta']         = $setting->trunk_aposta;

            if ($user = User::create($userData)) {
                if (isset($request->reference_code) && !empty($request->reference_code)) {
                    $checkAffiliate = User::where('inviter_code', $request->reference_code)->first();
                    if (!empty($checkAffiliate)) {
                        if ($checkAffiliate->affiliate_revenue_share > 0 || $checkAffiliate->affiliate_cpa > 0) {
                            $user->update(['inviter' => $checkAffiliate->id]);
                            self::saveAffiliateHistory($user);
                        }
                    }
                }

                if ($setting->disable_spin) {
                    if (!empty($request->spin_token)) {
                        try {
                            $str = base64_decode($request->spin_token);
                            $obj = json_decode($str);

                            $spin_run = SpinRuns::where([
                                'key'   => $obj->signature,
                                'nonce' => $obj->nonce
                            ])->first();

                            $data = $spin_run->prize;
                            $obj = json_decode($data);
                            $value = $obj->value;

                            Wallet::where('user_id', $user->id)->increment('balance_bonus', $value);
                        } catch (\Exception $e) {
                            return response()->json(['error' => $e->getMessage()], 400);
                        }
                    }
                }

                $credentials = $request->only(['email', 'password']);
                $token = auth('api')->attempt($credentials);
                if (!$token) {
                    return response()->json(['error' => 'Unauthorized'], 401);
                }

                return $this->respondWithToken($token);
            }
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 400);
        }
    }

    private function generateAffiliateCode()
    {
        do {
            $code = \Helper::generateCode(8); // Gerar código de 8 caracteres
            $checkCode = User::where('inviter_code', $code)->first();
        } while ($checkCode);

        return $code;
    }

    public function verify()
    {
        return response()->json(auth('api')->user());
    }

    public function login()
    {
        try {
            $credentials = request(['email', 'password']);

            if (!$token = auth('api')->attempt($credentials)) {
                return response()->json(['error' => trans('Check credentials')], 400);
            }

            return $this->respondWithToken($token);
        } catch (JWTException $e) {
            return response()->json([
                'error' => 'Could not create token'
            ], 400);
        }
    }

    public function me()
    {
        return response()->json(auth('api')->user());
    }

    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }

    public function submitForgetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email|exists:users',
        ]);

        $token = Str::random(5);

        $psr = DB::table('password_reset_tokens')->where('email', $request->email)->first();
        if (!empty($psr)) {
            DB::table('password_reset_tokens')->where('email', $request->email)->delete();
        }

        DB::table('password_reset_tokens')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now()
        ]);

        \Mail::send('emails.forget-password', ['token' => $token, 'resetLink' => url('/reset-password/' . $token)], function ($message) use ($request) {
            $message->to($request->email);
            $message->subject('Reset Password');
        });

        return response()->json(['status' => true, 'message' => 'We have e-mailed your password reset link!'], 200);
    }

    public function submitResetPassword(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email|exists:users',
                'password' => 'required|string|min:6|confirmed',
                'password_confirmation' => 'required',
                'token' => 'required',
            ]);

            $checkToken = DB::table('password_reset_tokens')->where('token', $request->token)->first();
            if (!empty($checkToken)) {
                $user = User::where('email', $request->email)->first();
                if (!empty($user)) {
                    if ($user->update(['password' => $request->password])) {
                        DB::table('password_reset_tokens')->where(['email' => $request->email])->delete();
                        return response()->json(['status' => true, 'message' => 'Your password has been changed!'], 200);
                    } else {
                        return response()->json(['error' => 'Erro ao atualizar senha'], 400);
                    }
                } else {
                    return response()->json(['error' => 'Email não é valido!'], 400);
                }
            }

            return response()->json(['error' => 'Token não é valido!'], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }

    protected function respondWithToken(string $token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'user' => auth('api')->user(),
            'expires_in' => time() + 1
        ]);
    }
}
