<?php

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
        Schema::create('exhibitors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')
                ->constrained('users')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->foreignId('photography_genre_id')
                ->constrained('photography_genres')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->string('phone_number');
            $table->unsignedTinyInteger('years_of_experience');
            $table->text('bio');
            $table->string('brand_name');
            $table->string('collection_title');
            $table->text('collection_description');
            $table->string('publicity_mode');
            $table->boolean('works_used_by_external');
            $table->boolean('use_for_promotions');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exhibitors');
    }
};
