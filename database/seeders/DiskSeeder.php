<?php

namespace Database\Seeders;

use App\Models\Disk;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DiskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $disks = [...config('filesystems.disks'), 'name' => 'google'];
        foreach ($disks as $name => $attributes) {
            if (is_null(Disk::firstWhere('name', $name))) {
                Disk::create(['name' => $name]);
            }
        }
    }
}
