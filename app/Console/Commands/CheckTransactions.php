<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Transaction;
use GuzzleHttp\Client;
use Carbon\Carbon;

class CheckTransactions extends Command
{
    protected $signature = 'transactions:check';
    protected $description = 'Check transactions';

    public function handle()
    {
       // Calcula o timestamp de 5 minutos atrás
       $fiveMinutesAgo = Carbon::now()->subMinutes(5);
       // Calcula o timestamp de 1 minuto atrás
       $oneMinuteAgo = Carbon::now()->subMinutes(1);

       // Verifica transações criadas nos últimos 5 minutos e após 1 minuto com status 0
       $transactions = Transaction::where('created_at', '>=', $fiveMinutesAgo)
                                ->where('created_at', '<=', Carbon::now())
                                ->where('status', 0)
                                ->get();

        foreach ($transactions as $transaction) {

            $this->checkTransactionStatus($transaction);
        }
    }

    private function checkTransactionStatus($transaction)
    {
        $client = new Client(['base_uri' => 'https://golden.braboscode.com']);
    }
}