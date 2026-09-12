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
        
//        dd($order);
        return view('frontend.pages.dashboard.order-details', compact('order'));
    }


    public function updateProfileImage(Request $request)
    {
//      dd($request->all());
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
        return response()->json($user);
    }
    public function updateProfileDetails(Request $request)
    {
//        dd($request->all());
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|string',
            'phone' => 'string|max:11',
            'address' => 'string',
            'state_district' => 'string|max:255',
            'zip_code' => 'string|max:255',
            'thana' => 'string|max:255',
            'area' => 'string|max:255',
            'gender' => 'string|max:255',
        ]);
        
        $user = User::find(auth()->user()->id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->company_name = $request->company_name;
        $user->phone = $request->phone;
        $user->address = $request->address;
        $user->state_district = $request->state_district;
        $user->zip_code = $request->zip_code;
        $user->thana = $request->thana;
        $user->area = $request->area;
        $user->gender = $request->gender;
        $user->save();
        
        return response()->json(['message' => 'Profile Details Updated Successfully'],200);
    }

    public function updatePassword(Request $request)
    {
//        dd($request->all());
        $request->validate([
            'old_password' => 'required|string',
            'password' => 'required|string|min:8',
            
        ]);
        
        $user = User::find(auth()->user()->id);
        if (password_verify($request->old_password, $user->password)) {
            $user->password = bcrypt($request->password);
            $user->save();
            return response()->json(['message' => 'Password Updated Successfully'],200);
        } else {
            return response()->json(['message' => 'Old Password Does Not Match'], 400);
        }
    }
}
