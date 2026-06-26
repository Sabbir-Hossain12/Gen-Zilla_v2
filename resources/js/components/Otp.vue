<script setup>

</script>

<template>
    <div id="otpModal"
         class="hidden fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4"
         onclick="handleBackdropClick(event, 'otpModal')">

        <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-sm pt-14 pb-8 px-8">

            <!-- Close -->
            <button onclick="closeModal('otpModal')"
                    class="absolute top-4 right-4 w-8 h-8 rounded-full flex items-center justify-center
                     text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors">
                <i class="fa-solid fa-xmark text-base"></i>
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
                <span id="displayPhone" class="text-sm font-semibold text-gray-800">01926241906</span>
                <button onclick="editPhone()"
                        class="text-[#E8312A] hover:text-[#C4251F] transition-colors">
                    <i class="fa-solid fa-pen text-xs"></i>
                </button>
            </div>

            <!-- OTP Input — 6 individual boxes -->
            <div class="flex items-center justify-center gap-2 mb-5" id="otpBoxes">
                <input type="text" maxlength="1" inputmode="numeric" pattern="[0-9]"
                       class="w-11 h-12 text-center text-lg font-bold text-gray-800
                      border border-gray-200 rounded-lg
                      focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
                      transition-all duration-150"
                       oninput="otpInput(this)" onkeydown="otpKeydown(event, this)"/>
                <input type="text" maxlength="1" inputmode="numeric" pattern="[0-9]"
                       class="w-11 h-12 text-center text-lg font-bold text-gray-800
                      border border-gray-200 rounded-lg
                      focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
                      transition-all duration-150"
                       oninput="otpInput(this)" onkeydown="otpKeydown(event, this)"/>
                <input type="text" maxlength="1" inputmode="numeric" pattern="[0-9]"
                       class="w-11 h-12 text-center text-lg font-bold text-gray-800
                      border border-gray-200 rounded-lg
                      focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
                      transition-all duration-150"
                       oninput="otpInput(this)" onkeydown="otpKeydown(event, this)"/>
                <input type="text" maxlength="1" inputmode="numeric" pattern="[0-9]"
                       class="w-11 h-12 text-center text-lg font-bold text-gray-800
                      border border-gray-200 rounded-lg
                      focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
                      transition-all duration-150"
                       oninput="otpInput(this)" onkeydown="otpKeydown(event, this)"/>
                <input type="text" maxlength="1" inputmode="numeric" pattern="[0-9]"
                       class="w-11 h-12 text-center text-lg font-bold text-gray-800
                      border border-gray-200 rounded-lg
                      focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
                      transition-all duration-150"
                       oninput="otpInput(this)" onkeydown="otpKeydown(event, this)"/>
                <input type="text" maxlength="1" inputmode="numeric" pattern="[0-9]"
                       class="w-11 h-12 text-center text-lg font-bold text-gray-800
                      border border-gray-200 rounded-lg
                      focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A]
                      transition-all duration-150"
                       oninput="otpInput(this)" onkeydown="otpKeydown(event, this)"/>
            </div>

            <!-- Verify Button -->
            <button class="w-full bg-[#E8312A] hover:bg-[#C4251F] active:bg-[#A81E16]
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
</template>

<style scoped>

</style>
