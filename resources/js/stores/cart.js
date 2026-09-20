import {defineStore} from "pinia";
import {computed, ref} from "vue";
import axios from "axios";
import {Toast} from "toaster-js";
import "toaster-js/default.css";
import ToasterUi from 'toaster-ui';
import {useAuth} from "@/stores/auth.js";

const toaster = new ToasterUi();
export const useCart = defineStore('cart', () => {

    // state
    const items = ref([]) // array of cart rows
    const deliveryList = ref([])
    const loading = ref(false)
    const error = ref(null)

    const auth = useAuth()
    const token = computed(() => auth.token || localStorage.getItem('token') || null)

    // getters
    const totalQty = computed(() => items.value.reduce((s, i) => s + (i.qty || 0), 0))
    const subtotal = computed(() => Math.round(items.value.reduce((s, i) => s + (parseFloat(i.price) * (i.qty || 0)), 0)))

    // actions
    async function fetchCart() {
        if (!token.value) {
            items.value = []
            return []
        }
        loading.value = true
        error.value = null
        try {
            const res = await axios.get('/api/v1/carts', {
                headers: {
                    Authorization: `Bearer ${token.value}`
                }
            })
            items.value = res.data.data || []
            return items.value
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    async function addItem(payload) {
        if (!token.value) {
            toaster.addToast(`Please Log in to Continue`, 'error', {duration: 5000})
            auth.showSendOtpModal = true
            return
        }

        loading.value = true
        error.value = null
        try {
            const res = await axios.post('/api/v1/carts', payload, {
                headers: {
                    Authorization: `Bearer ${token.value}`
                }
            })

            await fetchCart()

            new Toast("Product Added to Cart!", Toast.TYPE_DONE);
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    async function updateQuantity(id, qty) {
        if (!token.value) return
        loading.value = true
        error.value = null
        try {
            const res = await axios.put(`/api/v1/carts/${id}`, {qty}, {
                headers: {
                    Authorization: `Bearer ${token.value}`
                }
            })
            const updated = res.data.data
            const idx = items.value.findIndex(i => i.id === updated.id)
            if (idx !== -1) {
                items.value[idx] = updated
            }
            return updated
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    async function removeItem(id) {
        if (!token.value) return
        loading.value = true
        error.value = null

        try {
            await axios.post(`/api/v1/carts/${id}`, {}, {
                headers: {
                    Authorization: `Bearer ${token.value}`
                }
            })
            new Toast("Product Deleted from Cart!", Toast.TYPE_DONE);

            items.value = items.value.filter(i => i.id !== id)
            return true
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    async function clearCart({sessionToken = null, userId = null} = {}) {
        loading.value = true
        error.value = null
        try {
            const params = {}
            if (sessionToken) params.session_token = sessionToken
            if (userId) params.user_id = userId
            await axios.delete('/api/carts', {params})
            items.value = []
            return true
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    async function fetchDeliveryList() {
        if (!token.value) return []
        loading.value = true
        try {
            const res = await axios.get('/api/v1/delivery-list', {
                headers: {
                    Authorization: `Bearer ${token.value}`
                }
            })
            deliveryList.value = res.data.data || []
            return deliveryList.value
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    return {
        items,
        loading,
        error,
        token,
        totalQty,
        subtotal,
        fetchCart,
        addItem,
        updateQuantity,
        removeItem,
        clearCart,
        fetchDeliveryList,
        deliveryList
    }
})
