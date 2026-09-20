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
        Schema::table('basic_infos', function (Blueprint $table) {
            $table->string('tagline')->nullable()->after('website_name');
            $table->string('working_hours')->nullable()->after('phone_1');
            $table->string('copyright_text')->nullable()->after('store_location');
            $table->string('app_download_link')->nullable();
            $table->string('app_download_img')->nullable();
            $table->string('payment_methods_img')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('basic_infos', function (Blueprint $table) {
            $table->dropColumn([
                'tagline',
                'working_hours',
                'copyright_text',
                'app_download_link',
                'app_download_img',
                'payment_methods_img',
            ]);
        });
    }
};
