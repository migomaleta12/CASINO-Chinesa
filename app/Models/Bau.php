<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bau extends Model
{
    use HasFactory;

    protected $table = 'baus'; // Certifique-se de que o nome da tabela está correto

    protected $fillable = [
        'status',
        'user_id',
        'bau_id',
        'opened_at',
        'caminho',
    ];
}
