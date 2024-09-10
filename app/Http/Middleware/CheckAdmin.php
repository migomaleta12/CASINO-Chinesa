<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckAdmin
{
    public function handle(Request $request, Closure $next)
    {
        // Verifica se o usuário está logado
        if (!Auth::check()) {
            // Se o usuário não estiver logado, permite a requisição seguir adiante
            return $next($request);
        }

        // Verifica se o usuário tem o papel de 'admin'
        if ($request->user()->hasRole('admin')) {
            return $next($request);
        }

        // Retorna uma resposta de erro se o usuário logado não for um administrador
        return response()->json(['error' => 'Sai daiii mama ovo, (41) 98448-7588'], 403);
    }
}
