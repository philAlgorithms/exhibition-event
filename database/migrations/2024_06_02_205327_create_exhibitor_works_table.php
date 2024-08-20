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
        Schema::create('exhibitor_works', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->unsignedSmallInteger('year');
            $table->string('photograph');
            $table->foreignId('exhibitor_id')
                ->constrained('exhibitors')
                ->cascadeOnDelete()
                ->cascadeOnUpdate();
            $table->decimal('proposed_value', 17, 2);
            $table->foreignId('value_currency_id')
                ->constrained('currencies')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->string('description');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exhibitor_works');
    }
};
