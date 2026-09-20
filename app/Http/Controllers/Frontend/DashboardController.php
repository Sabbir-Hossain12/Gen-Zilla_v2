<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function index()
    {
        $user = User::with('orders.orderProducts','wishlists.product.productDetail','wishlists.product.sizes','wishlists.product.colors','wishlists.product.weights')->find(auth()->user()->id);
        $total_orders = $user->orders->count();
        $pending_orders = $user->orders->where('status', 'Pending')->count();
        $wishlists = $user->wishlists()->count();
        return view('frontend.pages.dashboard.user-dashboard', compact('user', 'total_orders', 'pending_orders','wishlists'));
    }

    public function stats()
    {
        $user_id = auth()->id();
        $total_orders = Order::where('user_id', $user_id)->count();
        $pending_orders = Order::where('user_id', $user_id)->where('order_status', 'Pending')->count();
        $delivered_orders = Order::where('user_id', $user_id)->where('order_status', 'Delivered')->count();
        $wishlists = auth()->user()->wishlists()->count();

        return response()->json([
            'success' => true,
            'message' => 'Dashboard Stats Fetched Successfully',
            'data' => [
                'total_orders' => $total_orders,
                'pending_orders' => $pending_orders,
                'delivered_orders' => $delivered_orders,
                'wishlists' => $wishlists,
                'name' => auth()->user()->name,
            ],
        ], 200);
    }

    public function recentOrders()
    {
        $orders = Order::where('user_id', auth()->id())
            ->with('orderProducts')
            ->orderBy('id', 'desc')
            ->take(5)
            ->get();

        return response()->json([
            'success' => true,
            'message' => 'Recent Orders Fetched Successfully',
            'data' => $orders,
        ], 200);
    }

    public function orderDetails(string $id)
    {
        $order=Order::where('id',$id)->with('orderProducts','customer','products')->first();

        return view('frontend.pages.dashboard.order-details', compact('order'));
    }


    public function updateProfileImage(Request $request)
    {
        $user = User::find(auth()->user()->id);
        if ($request->hasFile('profile_pic')) {
            if ($user->profile_pic && file_exists($user->profile_pic)) {
                unlink($user->profile_pic);
            }

            $file = $request->file('profile_pic');
            $filename = time().uniqid().'.'.$file->getClientOriginalExtension();
            $file->move(public_path('/frontend/images/upload/profile/'), $filename);
            $url = asset('frontend/images/upload/profile/'.$filename);
            $user->profile_pic = $url;
            $user->save();
        }

        return response()->json([
            'success' => true,
            'message' => 'Profile Image Updated Successfully',
            'data' => $user,
        ], 200);
    }


    public function getProfileDetails()
    {
        $user = User::find(auth()->user()->id);
        return response()->json([
            'success' => true,
            'message' => 'Profile Details Fetched Successfully',
            'data' => $user,
        ], 200);
    }

    public function updateProfileDetails(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|string',
            'phone' => 'nullable|string|max:11',
            'address' => 'nullable|string',
            'state_district' => 'nullable|string|max:255',
            'zip_code' => 'nullable|string|max:255',
            'thana' => 'nullable|string|max:255',
            'area' => 'nullable|string|max:255',
            'gender' => 'nullable|string|max:255',
        ]);

        $user = User::find(auth()->user()->id);
        $user->name = $request->name;
        $user->email = $request->email;
        if ($request->has('company_name')) $user->company_name = $request->company_name;
        if ($request->has('phone')) $user->phone = $request->phone;
        if ($request->has('address')) $user->address = $request->address;
        if ($request->has('state_district')) $user->state_district = $request->state_district;
        if ($request->has('zip_code')) $user->zip_code = $request->zip_code;
        if ($request->has('thana')) $user->thana = $request->thana;
        if ($request->has('area')) $user->area = $request->area;
        if ($request->has('gender')) $user->gender = $request->gender;
        $user->save();

        return response()->json(['success' => true, 'message' => 'Profile Details Updated Successfully', 'data' => $user], 200);
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required|string',
            'new_password' => 'required|string|min:8',
        ]);

        $user = User::find(auth()->user()->id);
        $oldPassword = $request->current_password ?: $request->old_password;
        if (password_verify($oldPassword, $user->password)) {
            $user->password = bcrypt($request->new_password);
            $user->save();
            return response()->json(['success' => true, 'message' => 'Password Updated Successfully'], 200);
        } else {
            return response()->json(['success' => false, 'message' => 'Current Password Does Not Match'], 400);
        }
    }
}
