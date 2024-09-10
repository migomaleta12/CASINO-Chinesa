<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class RestrictIpMiddleware
{
    // Restrinja os IPs permitidos
    protected $allowedIps = [
        '51.79.39.218', // Substitua esses IPs pelos IPS da sua VPS que irão interagir com seu webhook
        '51.79.39.218',
    ];

    public function handle(Request $request, Closure $next)
    {
        if (!in_array($request->ip(), $this->allowedIps)) {
            // Responde com 'Forbidden' se o IP não está na lista
            return response()->json(['message' => 'IP not allowed'], 403);
        }

        return $next($request);
    }
}

