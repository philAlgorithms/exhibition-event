<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sanity_documents', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('key')->unique();
            $table->string('sanity_id');
            $table->string('sanity_type');
            $table->string('sanity_slug')->nullable();
            $table->timestamps();
            $table->unique(['sanity_id', 'sanity_type']);
        });

        Artisan::call('db:seed', [
            '--class' => 'SanityDocumentSeeder'
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sanity_documents');
    }
};
