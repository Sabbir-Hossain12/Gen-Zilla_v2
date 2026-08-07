<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    // Send OTP
    public function sendOtp(Request $request)
    {
        $request->validate([
            'phone' => 'required|regex:/^01[0-9]{9}$/'
        ]);
        try {
            $otp = rand(100000, 999999);
            Cache::put('otp_' . $request->phone, $otp, now()->addMinutes(5));

            // Integrate SMS gateway here (e.g., Twilio, GreenWeb, or local provider)
            Log::info("OTP for {$request->phone}: {$otp}");

            return response()->json([
                'success' => true,
                'message' => 'OTP sent successfully',
                'expires_in' => 300,
                'otp' => $otp
            ]);
        } catch (\Exception $e) {
            Log::error('OTP Send Error: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Failed to send OTP']);
        }
    }

    // Verify OTP
    public function verifyOtp(Request $request)
    {
        $request->validate([
            'phone' => 'required|regex:/^01[0-9]{9}$/',
            'otp' => 'required|digits:6'
        ]);

        $cachedOtp = Cache::get('otp_' . $request->phone);

        if ($cachedOtp && $cachedOtp == $request->otp) {
            Cache::forget('otp_' . $request->phone);

            // Create or fetch user
            $user = \App\Models\User::firstOrCreate(['phone' => $request->phone],
            [
                'password' => bcrypt(Str::random()),
            ]);

            // Generate token (Laravel Sanctum)
            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'success' => true,
                'message' => 'OTP verified successfully',
                'token' => $token,
                'user' => $user
            ]);
        }

        return response()->json(['success' => false, 'message' => 'Invalid or expired OTP']);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

         return response()->json([
             'success' => true,
             'message' => 'Logged out successfully'
         ]);
    }
}
