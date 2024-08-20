<?php

namespace Database\Seeders;

use App\Models\SanityDocument;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SanityDocumentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $genres = [
            [
                'name' => 'The forgotten Country 2024',
                'key' => 'THE_FORGOTTEN_COUNTRY_2024',
                'sanity_id' => '5f1894b4-ba39-4e92-b2d7-7e1070e92c47',
                'sanity_type' => 'event',
            ],
        ];

        foreach($genres as $genre)
        {
            SanityDocument::create($genre);
        }
    }
}
