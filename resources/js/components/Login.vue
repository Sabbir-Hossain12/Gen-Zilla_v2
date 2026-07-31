<script setup>
import Xmark from "@/components/Xmark.vue";

defineProps({ modelValue: Boolean })
const emit = defineEmits(['update:modelValue'])
const close = () => emit('update:modelValue', false)

const sendOtp = async () => {
    try {
        const res = await axios.post('api/v1/auth/send-otp', { phone: phone.value })
        if (res.data.success) showOtpModal.value = true
    } catch (err) {
        console.error(err)
    }
}
</script>

<template>
    <Teleport to="body">
        <div v-if="modelValue" class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4"
             @click.self="close">
            <div id="loginModal"
                 class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4">

                <div class="relative bg-white rounded-2xl shadow-2xl w-full max-w-sm pt-14 pb-8 px-8">

                    <!-- Close -->
                    <button class="absolute top-4 right-4 w-8 h-8 rounded-full flex items-center justify-center
                     text-gray-400 hover:text-gray-700 hover:bg-gray-100 transition-colors">
                        <Xmark @click="close()"></Xmark>
                    </button>

                    <!-- Logo -->
                    <div class="absolute -top-9 left-1/2 -translate-x-1/2">
                        <div class="w-[72px] h-[72px] rounded-full border-[3px] border-[#E8312A] bg-white
                    flex items-center justify-center shadow-lg">
                            <span class="text-[#E8312A] font-black text-xl">শ্বপ</span>
                        </div>
                    </div>

                    <!-- Title -->
                    <h2 class="text-center text-gray-800 font-semibold text-[15px] leading-snug mb-6">
                        Sign in to get best online experience
                    </h2>

                    <!-- Phone Input -->
                    <div class="flex items-center border border-gray-200 rounded-lg overflow-hidden
                  focus-within:border-[#E8312A] focus-within:ring-1 focus-within:ring-[#E8312A]
                  transition-all duration-200 mb-4">
                        <button class="flex items-center gap-1.5 px-3 py-3 border-r border-gray-200
                       bg-white hover:bg-gray-50 transition-colors shrink-0">
                            <span class="text-lg leading-none">🇧🇩</span>
                            <span class="text-sm text-gray-700 font-medium">+880</span>
                            <i class="fa-solid fa-chevron-down text-[10px] text-gray-400 ml-0.5"></i>
                        </button>
                        <input id="phoneInput" type="tel" placeholder="1XXXXXXXXX"
                               class="flex-1 px-3 py-3 text-sm text-gray-800 placeholder-gray-400
                      focus:outline-none bg-white min-w-0"/>
                    </div>

                    <!-- Login Button -->
                    <button onclick="goToOtp()"
                            class="w-full bg-[#E8312A] hover:bg-[#C4251F] active:bg-[#A81E16]
                     text-white font-bold text-[15px] rounded-lg py-3
                     transition-colors duration-200 shadow-sm mb-5">
                        Login
                    </button>

                    <!-- Divider -->
                    <div class="flex items-center gap-3 mb-5">
                        <div class="flex-1 h-px bg-gray-200"></div>
                        <span class="text-xs text-gray-400 font-medium shrink-0">or, sign in with</span>
                        <div class="flex-1 h-px bg-gray-200"></div>
                    </div>

                    <!-- Google Sign In -->
                    <button class="w-full flex items-center justify-center gap-3 border border-gray-200
                     rounded-lg py-2.5 px-4 hover:bg-gray-50 transition-colors duration-200">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" class="w-5 h-5 shrink-0">
                            <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/>
                            <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/>
                            <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/>
                            <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/>
                        </svg>
                        <span class="text-sm font-medium text-gray-700">Sign in with Google</span>
                    </button>

                </div>
            </div>
        </div>
    </Teleport>


</template>

<style scoped>

</style>
