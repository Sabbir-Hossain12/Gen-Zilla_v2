<?php

use App\Http\Controllers\Frontend\Auth\AuthController;
use App\Http\Controllers\Frontend\WebviewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::get('/categories',function ()
    {
       $categories = \App\Models\Category::with('subcategories')->get();

       return response()->json($categories);
    });

    //Auth
    Route::post('/auth/send-otp', [AuthController::class, 'sendOtp']);
    Route::post('/auth/verify-otp', [AuthController::class, 'verifyOtp']);

    //Home Page
    Route::get('/sliders', [WebviewController::class, 'slider']);
    Route::get('/featured-subcategories', [WebviewController::class, 'featuredSubcategory']);
    Route::get('/hot-products', [WebviewController::class, 'hotProducts']);
    Route::get('/popular-products', [WebviewController::class, 'popularProducts']);
    Route::get('/featured-products', [WebviewController::class, 'featuredProducts']);
    Route::get('/banner', [WebviewController::class, 'showBanner']);
    Route::get('/front-categories', [WebviewController::class, 'frontCategories']);
});
