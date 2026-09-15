<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\BasicInfo;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Page;
use App\Models\Product;
use App\Models\Review;
use App\Models\Slider;
use App\Models\Subcategory;
use App\Models\ThemeColor;
use http\Client\Curl\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class WebviewController extends Controller
{
    public function categories()
    {
        try {
            $categories = Category::with(['subcategories' => function ($query) {
                $query->where('status', 1)->orderBy('subcategory_name');
            }])
                ->where('status', 1)
                ->orderBy('category_name')
                ->get();

            return response()->json([
                'success' => true,
                'message' => 'Category List Fetched',
                'data' => $categories
            ]);
        } catch (\Exception $e) {
            Log::error('Category List Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

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

    public function header()
    {
        try {
            $topCategories = Category::where('status', 1)
                ->where('topCategory_status', 1)
                ->get();

            $brands = Brand::where('status', 1)->get();

            $pages = Page::where('status', 1)
                ->get()
                ->map(function ($page) {
                    $page->slug = $page->slug ?: Str::slug($page->title);

                    return $page;
                });

            return response()->json([
                'success' => true,
                'message' => 'Header Data Fetched',
                'data' => [
                    'topCategories' => $topCategories,
                    'brands' => $brands,
                    'pages' => $pages,
                ]
            ]);
        } catch (\Exception $e) {
            Log::error('Header Data Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function brands()
    {
        try {
            $brands = Brand::where('status', 1)->get();

            return response()->json([
                'success' => true,
                'message' => 'Brand List Fetched',
                'data' => $brands
            ]);
        } catch (\Exception $e) {
            Log::error('Brand List Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function brandProducts(string $slug)
    {
        try {
            $brand = Brand::where('slug', $slug)
                ->where('status', 1)
                ->with(['products' => function ($query) {
                    $query->where('status', 1)
                        ->with('productDetail','colors','sizes','weights');
                }])
                ->first();

            if (! $brand) {
                return response()->json([
                    'success' => false,
                    'message' => 'Brand Not Found',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'message' => 'Brand Products Fetched',
                'data' => $brand
            ]);
        } catch (\Exception $e) {
            Log::error('Brand Products Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function basicInfo()
    {
        try {
            $info = BasicInfo::query()
                ->select(
                    'website_name',
                    'black_logo',
                    'light_logo',
                    'email',
                    'phone_1',
                    'store_location',
                    'short_desc',
                    'fb_link',
                    'x_link',
                    'p_link',
                    'youtube_link',
                    'insta_link',
                    'currency_symbol'
                )
                ->first();

            if (! $info) {
                return response()->json([
                    'success' => false,
                    'message' => 'Basic Info Not Found',
                ], 404);
            }

            $info->black_logo = $info->black_logo ? asset($info->black_logo) : null;
            $info->light_logo = $info->light_logo ? asset($info->light_logo) : null;

            return response()->json([
                'success' => true,
                'message' => 'Basic Info Fetched',
                'data' => $info,
            ]);
        } catch (\Exception $e) {
            Log::error('Basic Info Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

    public function showPage(string $slug)
    {
        try {
            $page = Page::where('status', 1)
                ->get()
                ->first(function ($item) use ($slug) {
                    return $item->slug === $slug || Str::slug($item->title) === $slug;
                });

            if (! $page) {
                return response()->json([
                    'success' => false,
                    'message' => 'Page Not Found',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'message' => 'Page Fetched',
                'data' => $page
            ]);
        } catch (\Exception $e) {
            Log::error('Page Fetch Issue:' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong',
            ]);
        }
    }

}
