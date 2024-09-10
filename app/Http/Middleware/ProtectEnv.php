<?php

namespace App\Http\Middleware;

use Closure;

class ProtectEnv
{
    public function handle($request, Closure $next)
    {
        $prohibitedFiles = ['.env', 'composer.json', 'composer.lock', '.git', '.gitignore'];
        
        $requestedPath = $request->path();

        foreach ($prohibitedFiles as $file) {
            if ($requestedPath === $file || strpos($requestedPath, "../$file") !== false) {
                return abort(403, 'Access denied');
            }
        }

        return $next($request);
    }
}
