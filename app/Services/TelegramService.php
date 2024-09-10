<?php

namespace App\Services;

use GuzzleHttp\Client;

class TelegramService
{
    protected $client;
    protected $botToken;

    public function __construct()
    {
        $this->client = new Client();
        $this->botToken = env('TELEGRAM_BOT_TOKEN');
    }

    public function sendMessage($params)
    {
        $url = "https://api.telegram.org/bot{$this->botToken}/sendMessage";
        $this->client->post($url, ['form_params' => $params]);
    }

    public function sendFormattedMessage($name, $email, $phone)
    {
        $message = "NOVO USUÁRIO REGISTRADO\n\n<b>NOME:</b> $name\n<b>EMAIL:</b> $email\n<b>TELEFONE:</b> $phone";
        $this->sendMessage([
            'chat_id' => env('TELEGRAM_CHAT_ID'),
            'text' => $message,
            'parse_mode' => 'HTML'
        ]);
    }

    public function sendPixNotification($name, $email, $amount, $dateTime)
    {
        $message = "NOVO PIX GERADO\n\n<b>USUÁRIO:</b> $name\n<b>EMAIL:</b> $email\n<b>VALOR:</b> R$ $amount\n<b>DATA E HORA:</b> $dateTime";
        $this->sendMessage([
            'chat_id' => env('TELEGRAM_CHAT_ID'),
            'text' => $message,
            'parse_mode' => 'HTML'
        ]);
    }

    public function sendPixPaymentConfirmed($name, $email, $amount, $date, $time)
    {
        $message = "PAGAMENTO PIX CONFIRMADO\n\n<b>USUÁRIO:</b> $name\n<b>EMAIL:</b> $email\n<b>VALOR:</b> R$ $amount\n<b>DATA:</b> $date\n<b>HORA:</b> $time";
        $this->sendMessage([
            'chat_id' => env('TELEGRAM_CHAT_ID'),
            'text' => $message,
            'parse_mode' => 'HTML'
        ]);
    }

public function sendGameRoundNotification($name, $email, $date, $time, $game, $beforeAmount, $betMoney, $afterAmount)
{
    $message = "NOVA RODADA\n\n"
        . "<b>USUÁRIO:</b> $name\n"
        . "<b>EMAIL:</b> $email\n"
        . "<b>DATA:</b> $date\n"
        . "<b>HORA:</b> $time\n"
        . "<b>GAME:</b> $game\n"
        . "<b>VALOR ANTES DE JOGAR:</b> R$ $beforeAmount\n"
        . "<b>VALOR DEPOIS DE JOGAR:</b> R$ $betMoney\n"
        . "<b>VALOR DA APOSTA:</b> R$ $afterAmount";
        
    $this->sendMessage([
        'chat_id' => env('TELEGRAM_CHAT_ID'),
        'text' => $message,
        'parse_mode' => 'HTML'
    ]);
}

}
