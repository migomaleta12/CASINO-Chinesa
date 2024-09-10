<?php

use App\Http\Controllers\Api\Profile\AffiliateController;

Route::middleware('auth:api')->group(function () {
    Route::post('verificar-bau/{bauId}', [AffiliateController::class, 'verificarBau']);
    Route::post('abrir-bau/{bauId}', [AffiliateController::class, 'abrirBau']);
});
