<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin_details = [
            "first_name" => "Raymond",
            "last_name" => "Chuma-Onwuoku",
            "email" => "ray@scala.africa",
            "password" => bcrypt("1234"),
            // 'country_id' => 225
        ];

        $exhibitors =[
            [
                "first_name" => "Philip",
                "last_name" => "Nwokedi",
                "email" => "boscophilz@gmail.com",
                "password" => bcrypt("1234"),
                // 'country_id' => 225
            ]
        ];
 
        $admin = User::create($admin_details);

        $admin->assignRole('admin');

        foreach($exhibitors as $exhibitor)
        {
            $user = User::create($exhibitor);
            $user->assignRole('exhibitor');
        }
    }
}
