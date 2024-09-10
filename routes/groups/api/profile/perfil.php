<?php

use App\Http\Controllers\Api\Profile\PerfilController;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth.jwt'])->group(function () {
    Route::get('/email', [PerfilController::class, 'getUserEmail']);
});
