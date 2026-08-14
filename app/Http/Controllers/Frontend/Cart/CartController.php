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
            'session_token' => 'nullable|string',
            'user_id' => 'nullable|integer|exists:users,id',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        try {
            $cart = Cart::create([
                'user_id' => $request->user_id,
                'session_token' => $request->session_token,
                'product_id' => $request->product_id,
                'variant_type' => $request->variant_type,
                'variant_id' => $request->variant_id,
                'product_img' => $request->product_img,
                'product_name' => $request->product_name,
                'variant_label' => $request->variant_label,
                'price' => $request->price,
                'qty' => $request->qty,
            ]);

            return response()->json(['success' => true, 'data' => $cart], 201);
        } catch (\Throwable $e) {
            return response()->json(['success' => false, 'message' => 'Failed to add to cart', 'error' => $e->getMessage()], 500);
        }
    }

    public function update(Request $request, Cart $cart)
    {
        $rules = [
            'qty' => 'nullable|integer|min:1',
            'price' => 'nullable|numeric|min:0',
            'variant_label' => 'nullable|string|max:255',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        try {
            $cart->fill($request->only(['qty', 'price', 'variant_label']));
            $cart->save();

            return response()->json(['success' => true, 'data' => $cart], 200);
        } catch (\Throwable $e) {
            return response()->json(['success' => false, 'message' => 'Failed to update cart item', 'error' => $e->getMessage()], 500);
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

            if ($request->filled('session_token')) {
                $query->where('session_token', $request->session_token);
            }

            if ($request->filled('user_id')) {
                $query->where('user_id', $request->user_id);
            }

            $deleted = $query->delete();

            return response()->json(['success' => true, 'deleted' => $deleted], 200);
        } catch (\Throwable $e) {
            return response()->json(['success' => false, 'message' => 'Failed to clear cart', 'error' => $e->getMessage()], 500);
        }
    }
}
