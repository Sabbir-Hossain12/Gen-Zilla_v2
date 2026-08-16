<?php

namespace App\Http\Controllers\Frontend\Cart;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class CartController extends Controller
{
    public function index(Request $request)
    {
        try {
            $query = Cart::query();

            $query->where('user_id', auth()->id());

            $carts = $query->orderBy('created_at', 'desc')->get();

            return response()->json(['success' => true, 'data' => $carts], 200);
        } catch (\Throwable $e) {
            return response()->json(['success' => false, 'message' => 'Failed to fetch cart', 'error' => $e->getMessage()], 500);
        }
    }

    public function store(Request $request)
    {
        $rules = [
            'product_id' => 'required|exists:products,id',
            'variant_type' => ['nullable', Rule::in(['color', 'size', 'weight'])],
            'variant_id' => 'nullable|integer',
            'product_img' => 'nullable|string',
            'product_name' => 'required|string|max:255',
            'variant_label' => 'nullable|string|max:255',
            'price' => 'required|numeric|min:0',
            'qty' => 'required|integer|min:1',
            'user_id' => 'nullable|integer|exists:users,id',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        try {
            $userId = auth()->id();
            // Check if cart row already exists for same product + variant
            $cart = Cart::where('user_id', $userId)
                ->where('product_id', $request->product_id)
                ->where('variant_type', $request->variant_type)
                ->where('variant_label', $request->variant_label)
                ->first();

            if ($cart) {
                // Increase qty
                $cart->qty += $request->qty;
                $cart->save();
            } else {
                // Create new row
                $cart = Cart::create([
                    'user_id' => $userId,
                    'product_id' => $request->product_id,
                    'variant_type' => $request->variant_type,
                    'variant_id' => $request->variant_id,
                    'product_img' => $request->product_img,
                    'product_name' => $request->product_name,
                    'variant_label' => $request->variant_label,
                    'price' => $request->price,
                    'qty' => $request->qty,
                ]);
            }

            return response()->json(['success' => true, 'data' => $cart], 201);
        } catch (\Throwable $e) {
            return response()->json(['success' => false, 'message' => 'Failed to add to cart', 'error' => $e->getMessage()], 500);
        }
    }

    public function updateQuantity(Request $request, Cart $cart)
    {
        // Validation rules
        $rules = [
            'qty' => 'required|integer|min:1'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors()
            ], 422);
        }

        try {
            // Update quantity
            $cart->qty = $request->qty;
            $cart->save();

            return response()->json([
                'success' => true,
                'message' => 'Cart Quantity updated successfully',
                'data' => $cart
            ], 200);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update cart quantity',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function destroy(Cart $cart)
    {
        try {
            $cart->delete();
            return response()->json(['success' => true, 'message' => 'Item removed'], 200);
        } catch (\Throwable $e) {
            return response()->json(['success' => false, 'message' => 'Failed to remove item', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Clear cart by session_token or user_id (query params)
     */
    public function clear(Request $request)
    {
        try {
            $query = Cart::query();

            $deleted = $query->where('user_id', auth()->id())->delete();

            return response()->json(['success' => true, 'message'=> 'Cart Cleared Successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to clear cart', 'error' => $e->getMessage()], 500);
        }
    }
}
