<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function () {
    Route::get('/categories',function ()
    {
       $categories = \App\Models\Category::with('subcategories')->get();

       return response()->json($categories);
    });
});
