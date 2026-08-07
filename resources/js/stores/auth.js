import {defineStore} from "pinia";
import {computed, onMounted, ref} from "vue";
import axios from "axios";

export const useAuth = defineStore('auth', () => {
    const token = ref(localStorage.getItem('token') || null);
    let isAuthenticated = computed(()=> !!token.value);

    const phone = ref('');
    // const otp = ref('');
    // const expires = ref('');

    const showSendOtpModal = ref(false)
    const showVerifyOtpModal = ref(false)

    async function sendOtp() {
        try {
            const res = await axios.post('api/v1/auth/send-otp', {phone: phone.value})
            if (res.data.success)
                alert(`6 Digit OTP send to your phone number ! ${res.data.otp}`)
            // otp.value = res.data.otp;
            // expires.value = res.data.expires_in;
            showSendOtpModal.value = false;
            showVerifyOtpModal.value = true;

        } catch (err) {
            console.log(err)
        }

    }

    async function verifyOtp(otp) {
        try {
            const res = await axios.post('api/v1/auth/verify-otp', {phone: phone.value, otp})
            if (res.data.success)
                alert('Login Successful')
            showSendOtpModal.value = false;
            showVerifyOtpModal.value = false;
            localStorage.setItem('token', res.data.token);
            token.value = res.data.token;

        } catch (err) {
            console.log(err)
        }
    }

    async function handleLogout() {
        try {
            await axios.post('/api/v1/logout', {}, {
                headers: {
                    Authorization: `Bearer ${token.value}` // or localStorage.getItem('token')
                }
            })

            // Clear local state + storage
            token.value = null
            localStorage.removeItem('token')

            alert('Logged out successfully')
        } catch (error) {
            console.error('Logout failed:', error)
            alert('Something went wrong while logging out')
        }
    }

    //Expose
    return {isAuthenticated, token, sendOtp, verifyOtp, showSendOtpModal, showVerifyOtpModal, phone, handleLogout}

})




