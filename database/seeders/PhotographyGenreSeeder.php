<?php

namespace Database\Seeders;

use App\Models\PhotographyGenre;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PhotographyGenreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $genres = [
            [
                'name' => 'Landscape Photography',
                'key' => 'GENRE_LANDSCAPE'
            ],
            [
                'name' => 'Portrait Photography',
                'key' => 'GENRE_PORTRAIT'
            ],
            [
                'name' => 'Documentary Photography',
                'key' => 'GENRE_DOCUMENTARY'
            ],
            [
                'name' => 'Arial/Drone Photography',
                'key' => 'GENRE_ARIAL'
            ],
            [
                'name' => 'Abstract Photography',
                'key' => 'GENRE_ABSTRACT'
            ],
            [
                'name' => 'Others',
                'key' => 'GENRE_MISCELLANEOUS'
            ],
        ];

        foreach($genres as $genre)
        {
            PhotographyGenre::create($genre);
        }
    }
}
