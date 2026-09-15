<?php

use App\Http\Controllers\Frontend\Auth\AuthController;
use App\Http\Controllers\Frontend\Cart\CartController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Frontend\Order\OrderController;
use App\Http\Controllers\Frontend\WebviewController;
use App\Http\Controllers\Frontend\WishlistController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::get('/categories', [WebviewController::class, 'categories']);

    //Auth
    Route::post('/auth/send-otp', [AuthController::class, 'sendOtp']);
    Route::post('/auth/verify-otp', [AuthController::class, 'verifyOtp']);

    //Home Page
    Route::get('/header', [WebviewController::class, 'header']);
    Route::get('/home', [WebviewController::class, 'home']);
    Route::get('/sliders', [WebviewController::class, 'slider']);
    Route::get('/featured-subcategories', [WebviewController::class, 'featuredSubcategory']);
    Route::get('/hot-products', [WebviewController::class, 'hotProducts']);
    Route::get('/popular-products', [WebviewController::class, 'popularProducts']);
    Route::get('/featured-products', [WebviewController::class, 'featuredProducts']);
    Route::get('/banner', [WebviewController::class, 'showBanner']);
    Route::get('/front-categories', [WebviewController::class, 'frontCategories']);

    Route::get('/details/{slug}', [WebviewController::class, 'productDetails']);
    Route::get('/search', [WebviewController::class, 'search']);
    Route::get('/categories/{slug}/products', [WebviewController::class, 'categoryProducts']);
    Route::get('/subcategories/{slug}/products', [WebviewController::class, 'subcategoryProducts']);

    Route::get('/brands', [WebviewController::class, 'brands']);
    Route::get('/brands/{slug}/products', [WebviewController::class, 'brandProducts']);
    Route::get('/pages/{slug}', [WebviewController::class, 'showPage']);
    Route::get('/basic-info', [WebviewController::class, 'basicInfo']);

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
        Route::get('/order/{invoiceID}', [OrderController::class, 'orderByInvoiceID']);
        //User Dashboard
        Route::prefix('dashboard')->group(function () {
            Route::get('/stats', [DashboardController::class, 'stats']);
        });

        //Order History
        Route::get('/orders', [OrderController::class, 'orderHistory']);
        Route::get('/orders/{invoiceID}', [OrderController::class, 'orderByInvoiceID']);

        //Profile
        Route::get('/profile', [DashboardController::class, 'getProfileDetails']);
        Route::post('/profile', [DashboardController::class, 'updateProfileDetails']);
        Route::post('/profile/image', [DashboardController::class, 'updateProfileImage']);
        Route::post('/profile/password', [DashboardController::class, 'updatePassword']);

        //Wishlist
        Route::get('/wishlists', [WishlistController::class, 'index']);
        Route::post('/wishlists', [WishlistController::class, 'store']);
        Route::delete('/wishlists/{wishlist}', [WishlistController::class, 'destroy']);

        //User Dashboard
        Route::get('/dashboard-stats', [DashboardController::class, 'stats']);
        Route::get('/dashboard-recent-orders', [DashboardController::class, 'recentOrders']);

        //Order History
        Route::get('/orders', [OrderController::class, 'orderHistory']);

        //Profile
        Route::get('/profile', [DashboardController::class, 'getProfileDetails']);
        Route::post('/profile', [DashboardController::class, 'updateProfileDetails']);
        Route::post('/profile/image', [DashboardController::class, 'updateProfileImage']);
        Route::post('/profile/password', [DashboardController::class, 'updatePassword']);

        //Wishlist
        Route::get('/wishlists', [WishlistController::class, 'index']);
        Route::post('/wishlists', [WishlistController::class, 'store']);
        Route::post('/wishlists/{wishlist}', [WishlistController::class, 'destroy']);

    });
});
