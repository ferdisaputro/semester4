<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Midtrans\Config;
use Midtrans\Snap;

class paymentController extends Controller
{
    public function __construct()
    {
        // Set konfigurasi Midtrans
        Config::$serverKey = env('MIDTRANS_SERVER_KEY');
        Config::$clientKey = env('MIDTRANS_CLIENT_KEY');
        Config::$isProduction = env('MIDTRANS_IS_PRODUCTION', false);
        Config::$isSanitized = true;
        Config::$is3ds = true;
    }

    public function createPayment(Request $request)
    {
        // Data transaksi
        $orderId = 'order-' . uniqid();
        $grossAmount = mt_rand(1000 , 100000);

        // Informasi transaksi
        $transactionDetails = array(
            'order_id' => $orderId,
            'gross_amount' => $grossAmount, // Jumlah total pembayaran
        );

        // Metode pembayaran
        $itemDetails = [
            [
                'id' => 'item1',
                'price' => $grossAmount,
                'quantity' => 1,
                'name' => 'Produk Anda',
            ]
        ];

        $customerDetails = [
            'first_name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
        ];

        $transactionData = [
            'payment_type' => 'credit_card',
            'transaction_details' => $transactionDetails,
            'item_details' => $itemDetails,
            'customer_details' => $customerDetails,
        ];

        try {
            // Request ke Midtrans untuk membuat transaksi
            $snapToken = Snap::getSnapToken($transactionData);
            // dd($snapToken);
            return view('payment', ['snapToken' => $snapToken]);
        } catch (\Exception $e) {
            // dd($e->getMessage());
            return redirect()->route('payment.failed');
        }
    }

    public function paymentSuccess(Request $request)
    {
        // Tangani pembayaran sukses
        return view('payment-success');
    }

    public function paymentFailed(Request $request)
    {
        // Tangani pembayaran gagal
        return view('payment-failed');
    }
}
