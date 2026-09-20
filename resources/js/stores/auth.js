import {defineStore} from "pinia";
import {computed, ref} from "vue";
import axios from "axios";
import ToasterUi from 'toaster-ui';
import {useCart} from "@/stores/cart.js";

const toaster = new ToasterUi();

export const useAuth = defineStore('auth', () => {
    const token = ref(localStorage.getItem('token') || null);
    let isAuthenticated = computed(() => !!token.value);

    const phone = ref('');

    const showSendOtpModal = ref(false)
    const showVerifyOtpModal = ref(false)

    async function sendOtp() {
        try {
            const res = await axios.post('/api/v1/auth/send-otp', {phone: phone.value})
            if (res.data.success) {
                toaster.addToast(`6 Digit OTP send to your phone number!`, 'info',{ duration:5000})
                showSendOtpModal.value = false;
                showVerifyOtpModal.value = true;
            }
        } catch (err) {
            console.log(err)
        }

    }

    async function verifyOtp(otp) {
        try {
            const res = await axios.post('/api/v1/auth/verify-otp', {phone: phone.value, otp})
            if (res.data.success) {
                toaster.addToast(`Login Successful`, 'success', {duration: 5000})
                showSendOtpModal.value = false;
                showVerifyOtpModal.value = false;
                localStorage.setItem('token', res.data.token);
                token.value = res.data.token;

                // Fetch user cart immediately after login
                const cart = useCart();
                await cart.fetchCart();
            }
            else {
                toaster.addToast(`Incorrect OTP, Try Again`, 'error', {duration: 5000})

            }
        } catch (err) {
            toaster.addToast(`Incorrect OTP`, 'error', {duration: 5000})

        }
    }

    async function handleLogout() {
        try {
            await axios.post('/api/v1/logout', {}, {
                headers: {
                    Authorization: `Bearer ${token.value}`
                }
            })

            // Clear local state + storage
            token.value = null
            localStorage.removeItem('token')

            const cart = useCart()
            cart.items = []

            toaster.addToast(`You have been Logged Out`, 'info',{ duration:5000})
        } catch (error) {
            toaster.addToast('Something went wrong while logging out')
        }
    }

    //Expose
    return {isAuthenticated, token, sendOtp, verifyOtp, showSendOtpModal, showVerifyOtpModal, phone, handleLogout}

})
