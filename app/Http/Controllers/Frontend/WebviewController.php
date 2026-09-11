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

    public function home()
    {
        try {
            $sliders = Slider::where('status', 1)->get();

            $featuredSubcategories = Subcategory::where('status', 1)->get();

            $banner = Banner::where('status', 1)
                ->where('banner_type', 'medium')
                ->first();

            if (! $banner) {
                $banner = Banner::where('status', 1)->first();
            }

            $with = ['productDetail','colors','sizes','weights'];

            $popularProducts = Product::where('status', 1)
                ->where('isPopular', 1)
                ->with($with)
                ->get();

            $featuredProducts = Product::where('status', 1)
                ->where('isFeatured', 1)
                ->with($with)
                ->get();

            $hotProducts = Product::where('status', 1)
                ->where('isHot', 1)
                ->with($with)
                ->get();

            $frontCategories = Category::where('status', 1)
                ->where('front_status', 1)
                ->with(['products' => function ($query) use ($with) {
                    $query->where('status', 1)
                        ->with($with)
                        ->limit(8);
                }])
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Home Page Data Fetched',
                'data' => [
                    'sliders' => $sliders,
                    'featuredSubcategories' => $featuredSubcategories,
                    'banner' => $banner,
                    'popularProducts' => $popularProducts,
                    'featuredProducts' => $featuredProducts,
                    'hotProducts' => $hotProducts,
                    'frontCategories' => $frontCategories,
                    'sectionTitles' => [
                        'featured_title' => 'Featured Products',
                    ],
                ]
            ]);
        } catch (\Exception $e) {
            Log::error('Home Page Data Issue:' . $e->getMessage());

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
                ->with('productDetail','colors','sizes','weights')
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
                ->with('productDetail','colors','sizes','weights')
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
                ->with('productDetail','colors','sizes','weights')
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

    public function productDetails(string $slug)
    {
        try {
            $details = Product::where('status', 1)
                ->where('slug', $slug)
                ->with('productDetail','colors','sizes','weights','brand','category','subcategory')
                ->first();

            return response()->json([
                'success' => true,
                'message' => 'Product Detail Fetched',
                'data' => $details
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

    public function search(Request $request)
    {
        try {
            $term = trim((string) $request->get('q'));

            if ($term === '') {
                return response()->json([
                    'success' => true,
                    'message' => 'Search Results Fetched',
                    'data' => []
                ]);
            }

            $products = Product::where('status', 1)
                ->where(function ($query) use ($term) {
                    $query->where('product_name', 'like', "%{$term}%")
                        ->orWhere('short_desc', 'like', "%{$term}%")
                        ->orWhere('tag', 'like', "%{$term}%");
                })
                ->with('productDetail','colors','sizes','weights','brand','category')
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Search Results Fetched',
                'data' => $products
            ]);

        }
        catch (\Exception $e) {
            Log::error('Search Issue:' . $e->getMessage());

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
                ->with(['products' => function ($query) {
                    $query->where('status', 1)
                        ->with('productDetail','colors','sizes','weights')
                        ->limit(8);
                }])
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

    public function categoryProducts(string $slug)
    {
        try {
            $category = Category::where('slug', $slug)
                ->where('status', 1)
                ->with(['products' => function ($query) {
                    $query->where('status', 1)
                        ->with('productDetail','colors','sizes','weights');
                }])
                ->first();

            if (! $category) {
                return response()->json([
                    'success' => false,
                    'message' => 'Category Not Found',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'message' => 'Category Products Fetched',
                'data' => $category
            ]);
        }
        catch (\Exception $e) {
            Log::error('Category Products Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function subcategoryProducts(string $slug)
    {
        try {
            $subcategory = Subcategory::where('slug', $slug)
                ->where('status', 1)
                ->with(['products' => function ($query) {
                    $query->where('status', 1)
                        ->with('productDetail','colors','sizes','weights');
                }])
                ->first();

            if (! $subcategory) {
                return response()->json([
                    'success' => false,
                    'message' => 'Subcategory Not Found',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'message' => 'Subcategory Products Fetched',
                'data' => $subcategory
            ]);
        }
        catch (\Exception $e) {
            Log::error('Subcategory Products Issue:' . $e->getMessage());

            return response([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

}
