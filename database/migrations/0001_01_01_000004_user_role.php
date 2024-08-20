<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schema;
use Spatie\Permission\Models\Role;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $roles = [
            [
                'name' => 'admin',
            ],
            [
                'name' => 'exhibitor',
            ],
            [
                'name' => 'attendee',
            ],
        ];

        foreach($roles as $role)
        {
            if(Role::firstWhere('name', $role) === null)
                Role::create($role);
        }

        // Create an Admin
        Artisan::call('db:seed', [
            '--class' => 'UserSeeder'
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
};
