import {defineStore} from "pinia";
import {computed, ref} from "vue";
import axios from "axios";
import ToasterUi from "toaster-ui";
import {useAuth} from "@/stores/auth.js";

const toaster = new ToasterUi();

export const useUser = defineStore('user', () => {

    // state
    const auth = useAuth();
    const token = computed(() => auth.token || localStorage.getItem('token') || null);
    const profile = ref({});
    const stats = ref(null);
    const recentOrders = ref([]);
    const orders = ref([]);
    const orderMeta = ref(null);
    const wishlists = ref([]);
    const loading = ref(false);
    const error = ref(null);

    // getters
    const isAuthenticated = computed(() => !!token.value);
    const totalOrders = computed(() => stats.value?.total_orders ?? 0);
    const pendingOrders = computed(() => stats.value?.pending_orders ?? 0);
    const deliveredOrders = computed(() => stats.value?.delivered_orders ?? 0);
    const wishlistCount = computed(() => stats.value?.wishlists ?? 0);

    const headers = computed(() => ({
        Authorization: `Bearer ${token.value}`,
    }));

    // ---- Login profile name ----
    async function fetchProfile() {
        loading.value = true
        error.value = null
        try {
            const res = await axios.get('/api/v1/profile', { headers: headers.value })
            if (res.data.success) {
                profile.value = res.data.data;
            }
            return profile.value
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Dashboard stats ----
    async function fetchStats() {
        loading.value = true
        error.value = null
        try {
            const res = await axios.get('/api/v1/dashboard-stats', { headers: headers.value })
            if (res.data.success) {
                stats.value = res.data.data;
                if (stats.value?.name && !profile.value.name) {
                    profile.value = { ...profile.value, name: stats.value.name };
                }
            }
            return stats.value
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Recent orders (dashboard) ----
    async function fetchRecentOrders() {
        loading.value = true
        error.value = null
        try {
            const res = await axios.get('/api/v1/dashboard-recent-orders', { headers: headers.value })
            if (res.data.success) {
                recentOrders.value = res.data.data || [];
            }
            return recentOrders.value
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Order History (paginated + status filter) ----
    async function fetchOrderHistory({ page = 1, perPage = 10, status = 'All' } = {}) {
        loading.value = true
        error.value = null
        try {
            const params = { page, per_page: perPage }
            if (status && status !== 'All') params.status = status
            const res = await axios.get('/api/v1/orders', { headers: headers.value, params })
            if (res.data.success) {
                const data = res.data.data;
                orders.value = data.data || data || [];
                orderMeta.value = {
                    current_page: data.current_page,
                    last_page: data.last_page,
                    total: data.total,
                    per_page: data.per_page,
                    from: data.from,
                    to: data.to,
                };
            }
            return orders.value
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Single order ----
    async function fetchOrderByOrderID(orderID) {
        loading.value = true
        error.value = null
        try {
            const res = await axios.get(`/api/v1/orders/${orderID}`, { headers: headers.value })
            return res.data.data
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Profile update ----
    async function updateProfile(payload) {
        loading.value = true
        error.value = null
        try {
            const res = await axios.post('/api/v1/profile', payload, { headers: headers.value })
            if (res.data.success) {
                profile.value = { ...profile.value, ...payload };
                toaster.addToast(res.data.message || 'Profile Updated', 'success', { duration: 4000 });
            }
            return res.data
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Profile image ----
    async function updateProfileImage(file) {
        loading.value = true
        error.value = null
        try {
            const formData = new FormData();
            formData.append('profile_pic', file);
            const res = await axios.post('/api/v1/profile/image', formData, {
                headers: { ...headers.value, 'Content-Type': 'multipart/form-data' },
            });
            if (res.data.success) {
                profile.value = { ...profile.value, profile_pic: res.data.data?.profile_pic };
                toaster.addToast(res.data.message || 'Profile Image Updated', 'success', { duration: 4000 });
            }
            return res.data
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Password ----
    async function updatePassword(payload) {
        loading.value = true
        error.value = null
        try {
            const res = await axios.post('/api/v1/profile/password', payload, { headers: headers.value });
            if (res.data.success === false || res.status >= 400) {
                toaster.addToast(res.data.message || 'Password Update Failed', 'error', { duration: 4000 });
            } else {
                toaster.addToast(res.data.message || 'Password Updated', 'success', { duration: 4000 });
            }
            return res.data
        } catch (err) {
            error.value = err
            throw err
        } finally {
            loading.value = false
        }
    }

    // ---- Wishlist (count only; full wishlist page handled separately) ----
    async function fetchWishlists() {
        try {
            const res = await axios.get('/api/v1/wishlists', { headers: headers.value });
            return res.data.data || [];
        } catch (err) {
            error.value = err
            throw err
        }
    }

    return {
        // state
        token,
        profile,
        stats,
        recentOrders,
        orders,
        orderMeta,
        wishlists,
        loading,
        error,
        // getters
        isAuthenticated,
        totalOrders,
        pendingOrders,
        deliveredOrders,
        wishlistCount,
        // actions
        fetchProfile,
        fetchStats,
        fetchRecentOrders,
        fetchOrderHistory,
        fetchOrderByOrderID,
        updateProfile,
        updateProfileImage,
        updatePassword,
        fetchWishlists,
    }
})
