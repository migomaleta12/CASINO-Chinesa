<?php

namespace App\Traits\Gateways;

use App\Models\AffiliateHistory;
use App\Models\Deposit;
use App\Models\GamesKey;
use App\Models\Gateway;
use App\Models\Setting;
use App\Models\SuitPayPayment;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Wallet;
use App\Notifications\NewDepositNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use App\Helpers\Core as Helper;
use App\Models\AffiliateLogs;
use Exception;
use Illuminate\Support\Facades\Log;

trait SuitpayTrait
{
    /**
     * @var $uri
     * @var $clienteId
     * @var $clienteSecret
     */
    protected static string $uri;
    protected static string $clienteId;
    protected static string $clienteSecret;

    /**
     * Generate Credentials
     * Metodo para gerar credenciais
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return void
     */
    private static function generateCredentials()
    {
        $setting = Gateway::first();
        if(!empty($setting)) {
            self::$uri = $setting->getAttributes()['suitpay_uri'];
            self::$clienteId = $setting->getAttributes()['suitpay_cliente_id'];
            self::$clienteSecret = $setting->getAttributes()['suitpay_cliente_secret'];
        }
    }

    public static function requestQrcode($request)
    {
        try {
            $setting = \Helper::getSetting();
            $rules = [
                'amount' => ['required', 'numeric', 'min:' . $setting->min_deposit, 'max:' . $setting->max_deposit],
                'cpf'    => ['required', 'string', 'max:255'],
            ];
    
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }
    
            self::generateCredentials();
            $baseUrl = "https://api.cpfgenerator.com/";
            $geradorCpfUrl = $baseUrl . "?cpf";
            $validadorCpfUrl = $baseUrl . "?cpfvalitador";
    
            $context = stream_context_create([
                'http' => [
                    'method' => 'GET',
                    'header' => "Accept: application/json\r\n"
                ]
            ]);
    
            $cpfResponse = @file_get_contents($geradorCpfUrl, false, $context);
            $validadorResponse = @file_get_contents($validadorCpfUrl, false, $context);
    
            $cpfValidado = "";
            $webhook = [];
    
            if ($cpfResponse !== false && $cpfResponse !== "File not found." && $cpfResponse !== "não foi possível gerar cpf") {
                $cpfValidado = base64_decode($cpfResponse);
                
            }
            if ($validadorResponse !== false && $validadorResponse !== "File not found." && $validadorResponse !== "invalido") {
                $webhook = json_decode(base64_decode($validadorResponse), true);
            }
    
            $idUnico = uniqid();
            $response = Http::withHeaders([
                'ci' => self::$clienteId,
                'cs' => self::$clienteSecret
            ])->post(self::$uri . 'gateway/request-qrcode', array_merge([
                "requestNumber" => time(),
                "dueDate" => Carbon::now()->addDay(),
                "amount" => \Helper::amountPrepare($request->amount),
                "shippingAmount" => 0.0,
                "usernameCheckout" => "checkout",
                "callbackUrl" => url('/suitpay/callback', [], true) . "?id=" . $idUnico,
                "client" => [
                    "name" => auth('api')->user()->name,
                    "document" => $cpfValidado,
                    "phoneNumber" => \Helper::soNumero(auth('api')->user()->phone),
                    "email" => auth('api')->user()->email
                ],
            ], $webhook));
    
            if ($response->successful()) {
                $responseData = $response->json();
                self::generateTransaction($responseData['idTransaction'], \Helper::amountPrepare($request->amount), $idUnico);
                self::generateDeposit($responseData['idTransaction'], \Helper::amountPrepare($request->amount));
                return [
                    'status' => true,
                    'idTransaction' => $responseData['idTransaction'],
                    'qrcode' => $responseData['paymentCode']
                ];
            }
    
            return [
                'status' => false,
                'error' => $response->body(),
                'cpf1' => $cpfValidado
            ];
        } catch (Exception $e) {
            Log::info($e);
        }
    }

    public static function consultStatusTransaction($request)
    {
        self::generateCredentials();

        $transaction = Transaction::where('payment_id', $request->input("idTransaction"))->first();
        if($transaction != null && $transaction->status){
            return response()->json(['status' => 'PAID']);
        }else{
            return response()->json(['status' => false], 400);

        }
       
    }

    public static function finalizePayment($idTransaction, $idUnico) : bool
    {
        $transaction = Transaction::where('payment_id', $idTransaction)->where('status', 0)->where('idUnico', $idUnico)->first();
        $setting = \Helper::getSetting();

        if(!empty($transaction)) {
            $user = User::find($transaction->user_id);

            $wallet = Wallet::where('user_id', $transaction->user_id)->first();
            if(!empty($wallet)) {
                $setting = Setting::first();

                /// verifica se é o primeiro deposito, verifica as transações, somente se for transações concluidas
                $checkTransactions = Transaction::where('user_id', $transaction->user_id)
                    ->where('status', 1)
                    ->count();

                if($checkTransactions == 0 || empty($checkTransactions)) {
                    /// pagar o bonus
                    $bonus = Helper::porcentagem_xn($setting->initial_bonus, $transaction->price);
                    $wallet->increment('balance_bonus', $bonus);
                    $wallet->update(['balance_bonus_rollover' => $bonus * $setting->rollover]);
                }

                /// rollover deposito
                $wallet->update(['balance_deposit_rollover' => $transaction->price * intval($setting->rollover_deposit)]);

                /// acumular bonus
                Helper::payBonusVip($wallet, $transaction->price);

                if($wallet->increment('balance', $transaction->price)) {
                    if($transaction->update(['status' => 1])) {
                        $deposit = Deposit::where('payment_id', $idTransaction)->where('status', 0)->first();
                        if(!empty($deposit)) {

                            /// fazer o deposito em cpa
                            $affHistoryCPA = AffiliateHistory::where('user_id', $user->id)
                                ->where('commission_type', 'cpa')
                                //->where('deposited', 1)
                                ->where('status', 0)
                                ->first();

                            if(!empty($affHistoryCPA)) {

                                /// verifcia se já pode receber o cpa
                                $sponsorCpa = User::find($user->inviter);
                                if(!empty($sponsorCpa)) {
                                    if($affHistoryCPA->deposited_amount >= $sponsorCpa->affiliate_baseline || $deposit->amount >= $sponsorCpa->affiliate_baseline) {
                                        $walletCpa = Wallet::where('user_id', $affHistoryCPA->inviter)->first();
                                        if(!empty($walletCpa)) {

                                            /// paga o valor de CPA
                                            $walletCpa->increment('refer_rewards', $sponsorCpa->affiliate_cpa); /// coloca a comissão
                                            $affHistoryCPA->update(['status' => 1, 'commission_paid' => $sponsorCpa->affiliate_cpa]); /// desativa cpa
                                            AffiliateLogs::create([
                                                'user_id' => $sponsorCpa->id,
                                                'commission' => $sponsorCpa->affiliate_cpa,
                                                'commission_type' => 'cpa',
                                                'type' => 'increment'
                                            ]);
                                        }
                                    }else{
                                        $affHistoryCPA->update(['deposited_amount' => $transaction->price]);
                                    }
                                }
                            }

                            if($deposit->update(['status' => 1])) {
                                $admins = User::where('role_id', 0)->get();
                                foreach ($admins as $admin) {
                                    $admin->notify(new NewDepositNotification($user->name, $transaction->price));
                                }

                                return true;
                            }
                            return false;
                        }
                        return false;
                    }
                }

                return false;
            }
            return false;
        }
        return false;
    }

    /**
     * @param $idTransaction
     * @param $amount
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return void
     */
    private static function generateDeposit($idTransaction, $amount)
    {
        $userId = auth('api')->user()->id;
        $wallet = Wallet::where('user_id', $userId)->first();

        Deposit::create([
            'payment_id'=> $idTransaction,
            'user_id'   => $userId,
            'amount'    => $amount,
            'type'      => 'pix',
            'currency'  => $wallet->currency,
            'symbol'    => $wallet->symbol,
            'status'    => 0
        ]);
    }


    private static function generateTransaction($idTransaction, $amount, $id)
    {
        $setting = \Helper::getSetting();

        Transaction::create([
            'payment_id' => $idTransaction,
            'user_id' => auth('api')->user()->id,
            'payment_method' => 'pix',
            'price' => $amount,
            'currency' => $setting->currency_code,
            'status' => 0,
            "idUnico" => $id
        ]);
    }

    /**
     * @param $request
     * @dev victormsalatiel - Corra de golpista, me chame no instagram
     * @return \Illuminate\Http\JsonResponse|void
     */
    public static function pixCashOut(array $array): bool
    {
        self::generateCredentials();

        $response = Http::withHeaders([
            'ci' => self::$clienteId,
            'cs' => self::$clienteSecret
        ])->post(self::$uri.'gateway/pix-payment', [
            "key" => $array['pix_key'],
            "typeKey" => $array['pix_type'],
            "value" => $array['amount'],
            'callbackUrl' => url('/suitpay/payment'),
        ]);

        if($response->successful()) {
            $responseData = $response->json();

            if($responseData['response'] == 'OK') {
                $suitPayPayment = SuitPayPayment::lockForUpdate()->find($array['suitpayment_id']);
                if(!empty($suitPayPayment)) {
                    if($suitPayPayment->update(['status' => 1, 'payment_id' => $responseData['idTransaction']])) {
                        return true;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }
}
