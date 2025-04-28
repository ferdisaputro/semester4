<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PaymentController;

Route::get('/', function () {
    return view('welcome');
});

Route::post('/payment', [PaymentController::class, 'createPayment'])->name('payment.create');
Route::get('/payment-success', [PaymentController::class, 'paymentSuccess'])->name('payment.success');
Route::get('/payment-failed', [PaymentController::class, 'paymentFailed'])->name('payment.failed');
