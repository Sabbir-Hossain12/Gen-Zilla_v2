import {defineStore} from "pinia";
import {onMounted, ref} from "vue";
import axios from "axios";

export const useAuth = defineStore('auth', () => {
    const isAuthenticated = ref(false);
    const token = ref(localStorage.getItem('token'));
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

        } catch (err) {
            console.log(err)
        }
    }

    //Expose
    return {isAuthenticated, token, sendOtp, verifyOtp, showSendOtpModal, showVerifyOtpModal,phone}

})




