<script setup>
import Xmark from "@/components/Xmark.vue";
import {useAuth} from "../stores/auth.js";
import {ref} from "vue";
const auth = useAuth();

//OTP JOIN
const otp = ref(Array(6).fill(''))

function handleInput(e, index) {
    otp.value[index] = e.target.value

    // auto-focus next box if a digit was entered
    if (e.target.value && index < otp.value.length - 1) {
        e.target.nextElementSibling?.focus()
    }
}

function handleKeydown(e, index) {
    if (e.key === 'Backspace' && !otp.value[index] && index > 0) {
        e.target.previousElementSibling?.focus()
    }
}


async function handleVerifyOtp(){
    const code = otp.value.join('')
  await  auth.verifyOtp(code);
}
</script>

<template>
    <Teleport to="body">
        <div v-if="auth.showVerifyOtpModal" id="otpModal"
             class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4">
            <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-sm pt-14 pb-8 px-8">

                <!-- Close -->
                <button
                        class="absolute top-4 right-4 w-8 h-8 rounded-full flex items-center justify-center
                     text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors">
                    <!--                <i class="fa-solid fa-xmark text-base"></i>-->
                    <Xmark></Xmark>

                </button>

                <!-- Logo -->
                <div class="absolute -top-9 left-1/2 -translate-x-1/2">
                    <div class="w-[72px] h-[72px] rounded-full border-[3px] border-[#E8312A] bg-white
                    flex items-center justify-center shadow-lg">
                        <span class="text-[#E8312A] font-black text-xl">শ্বপ</span>
                    </div>
                </div>

                <!-- Title -->
                <h2 class="text-center text-gray-800 font-bold text-[17px] mb-2">
                    OTP Verification
                </h2>

                <!-- Subtitle -->
                <p class="text-center text-sm text-gray-500 leading-snug mb-1">
                    Please enter the OTP which is sent to mobile no.
                </p>

                <!-- Phone number + edit -->
                <div class="flex items-center justify-center gap-1.5 mb-6">
                    <span id="displayPhone" class="text-sm font-semibold text-gray-800"></span>
                    <button
                            class="text-[#E8312A] hover:text-[#C4251F] transition-colors">
                        <i class="fa-solid fa-pen text-xs"></i>
                    </button>
                </div>

                <!-- OTP Input — 6 individual boxes -->
                <div class="flex items-center justify-center gap-2 mb-5" id="otpBoxes">
                    <input
                        v-for="(digit, index) in otp"
                        :key="index"
                        type="text"
                        maxlength="1"
                        inputmode="numeric"
                        pattern="[0-9]"
                        v-model="otp[index]"
                        @input="handleInput($event, index)"
                        @keydown="handleKeydown($event, index)"
                        class="w-11 h-12 text-center text-lg font-bold text-gray-800
             border border-gray-200 rounded-lg
             focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
             transition-all duration-150"
                    />
                </div>

                <!-- Verify Button -->
                <button @click="handleVerifyOtp" class="w-full bg-[#E8312A] hover:bg-[#C4251F] active:bg-[#A81E16]
                     text-white font-bold text-[15px] rounded-lg py-3
                     transition-colors duration-200 shadow-sm mb-4">
                    Verify
                </button>

                <!-- Resend OTP -->
                <div class="flex items-center justify-center gap-1 text-sm">
                    <span class="text-gray-500 font-medium">Not received your OTP?</span>
                    <button id="resendBtn" disabled
                            class="text-gray-400 font-semibold flex items-center gap-1 disabled:cursor-not-allowed">
                        Resend OTP
                        <span id="countdown" class="text-[#E8312A] font-bold">00:30</span>
                    </button>
                </div>

            </div>
        </div>
    </Teleport>
</template>

<style scoped>

</style>
