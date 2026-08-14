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
        Schema::create('carts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->string('session_token')->nullable()->unique(); // for guest carts

            $table->foreignId('product_id')->constrained()->cascadeOnDelete();

            // Polymorphic-ish variant reference — nullable, matches color/size/weight tables
            $table->string('variant_type')->nullable(); // 'color' | 'size' | 'weight'
            $table->unsignedBigInteger('variant_id')->nullable();

            $table->string('product_img')->nullable();
            $table->string('product_name');      // snapshot at time of add
            $table->string('variant_label')->nullable(); // snapshot e.g. "200ml"
            $table->decimal('price', 10, 2);     // snapshot price at time of add
            $table->unsignedInteger('qty')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('carts');
    }
};
