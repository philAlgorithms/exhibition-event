<?php

namespace Database\Seeders;

use App\Models\Currency;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $currencies = [
            [
                'name' => 'United States Dollar',
                'acronym' => 'USD',
                'symbol' => '$'
            ],
            [
                'name' => 'Nigerian Naira',
                'acronym' => 'NGN',
                'symbol' => '₦'
            ],
        ];

        foreach($currencies as $currency)
        {
            Currency::create($currency);
        }
    }
}
