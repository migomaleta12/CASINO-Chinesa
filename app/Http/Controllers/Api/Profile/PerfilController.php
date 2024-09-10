<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class PerfilController extends Controller
{
    public function getUserEmail(Request $request)
    {
        $user = Auth::guard('api')->user();
        Log::info('Token JWT: ' . $request->bearerToken());
        Log::info('Usuário autenticado: ' . json_encode($user));

        if ($user) {
            return response()->json(['email' => $user->email]);
        }
        return response()->json(['error' => 'User not authenticated'], 401);
    }
}
