<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    public function loginRegister(Request $request)
    {
        try {
            $validate = $request->validate([
                'phone' => 'required|min:11|max:11',
            ]);

         $exist = User::where('phone', $request->phone)->first();

         $otp = rand(1000, 9999);

         if ($exist) {
            $exist->update([
                'otp' => $otp,
            ]);
         }
         else{
             User::create([
                'phone' => $request->phone,
             ]);
         }

         Session::put('otp', $otp);

         return response()->json([
             'success' => true,
             'message' => 'Login Successful',
             'otp' => $otp,
         ]);
        }
        catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ]);
        }
    }
}
