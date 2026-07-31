<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use App\Models\Review;
use App\Models\Slider;
use App\Models\Subcategory;
use App\Models\ThemeColor;
use http\Client\Curl\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class WebviewController extends Controller
{
    public function slider()
    {
        try {
            $sliders = Slider::where('status', 1)->get();

            return response()->json([
                'success' => true,
                'message' => 'Slider List Fetched',
                'data' => $sliders
            ]);
        } catch (\Exception $e) {
            Log::error('Slider Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function featuredSubcategory()
    {
        try {
            $subcategories = Subcategory::where('status', 1)->get();

            return response()->json([
                'success' => true,
                'message' => 'Featured Subcategory List Fetched',
                'data' => $subcategories
            ]);
        } catch (\Exception $e) {
            Log::error('Featured Subcategory Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function hotProducts()
    {
        try {
            $products = Product::where('status', 1)
                ->where('isHot', 1)
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Hot Product List Fetched',
                'data' => $products
            ]);

        }
        catch (\Exception $e) {
            Log::error('Hot Product Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function popularProducts()
    {
        try {
            $products = Product::where('status', 1)
                ->where('isPopular', 1)
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Popular Product List Fetched',
                'data' => $products
            ]);

        }
        catch (\Exception $e) {
            Log::error('Popular Product Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function featuredProducts()
    {
        try {
            $products = Product::where('status', 1)
                ->where('isFeatured', 1)
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Featured Product List Fetched',
                'data' => $products
            ]);

        }
        catch (\Exception $e) {
            Log::error('Featured Product Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function showBanner()
    {
        try {
            $banner = Banner::where('status',1)->where('banner_type', 'small')->first();

            return response()->json([
                'success' => true,
                'message' => 'Banner Image Fetched',
                'data' => $banner
            ]);
        }
        catch (\Exception $e) {
            Log::error('Banner Image Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }

    }

    public function frontCategories()
    {
        try {
            $categories = Category::where('status', 1)
                ->where('front_status',1)
                ->with('products')
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Front Categories Fetched',
                'data' => $categories
            ]);
        }
        catch (\Exception $e) {
            Log::error('Front Categories Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

}
