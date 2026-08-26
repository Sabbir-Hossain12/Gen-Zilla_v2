<?php

use App\Http\Controllers\Frontend\Auth\AuthController;
use App\Http\Controllers\Frontend\Cart\CartController;
use App\Http\Controllers\Frontend\Order\OrderController;
use App\Http\Controllers\Frontend\WebviewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::get('/categories', function () {
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

    Route::get('/details/{slug}', [WebviewController::class, 'productDetails']);


    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/logout', [AuthController::class, 'logout']);

        //Delivery zone
        Route::get('/delivery-list',[OrderController::class, 'deliveryList']);

        //Cart
        Route::prefix('carts')->group(function () {
            Route::get('/', [CartController::class, 'index']);
            Route::post('/', [CartController::class, 'store']);
            Route::put('/{cart}', [CartController::class, 'updateQuantity']);
            Route::post('/{cart}', [CartController::class, 'destroy']);
            // clear cart (delete by session_token or user_id)
            Route::post('/clear', [CartController::class, 'clear']);
        });

        //Checkout Order
        Route::post('/order-submit', [OrderController::class, 'orderSubmit']);

    });
});
