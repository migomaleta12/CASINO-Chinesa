<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

class AddIdUnicoTransaction extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        if (!Schema::hasColumn('transactions', 'idUnico')) {
            Schema::table('transactions', function ($table) {
                $table->string('idUnico')->nullable();
            });
        }
    }
}
