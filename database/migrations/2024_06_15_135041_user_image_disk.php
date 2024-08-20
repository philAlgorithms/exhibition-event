<?php

use App\Models\Disk;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $disk = Disk::firstWhere('name', 'public');
        Schema::table('users', function (Blueprint $table) use ($disk) {
            $table->foreignId('avatar_disk_id')
                ->default($disk->id)
                ->constrained('disks')
                ->onUpdate('cascade')
                ->onDelete('restrict');
        });
        
        Schema::table('exhibitor_works', function (Blueprint $table) use ($disk) {
            $table->foreignId('disk_id')
                ->default($disk->id)
                ->constrained('disks')
                ->onUpdate('cascade')
                ->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('exhibitors', function (Blueprint $table) {
            //
        });
    }
};
