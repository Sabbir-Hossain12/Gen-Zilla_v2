<script setup>
import { computed, ref, watch } from 'vue';
import axios from 'axios';
import { formatPrice } from '@/utils/price';
import { useAuth } from '@/stores/auth.js';

const props = defineProps({
    modelValue: {
        type: Boolean,
        default: false
    },
    invoiceId: {
        type: String,
        default: null
    },
    orderData: {
        type: Object,
        default: null
    }
});

const emit = defineEmits(['update:modelValue']);

const auth = useAuth();
const loading = ref(false);
const order = ref(null);

const token = computed(() => auth.token || localStorage.getItem('token') || null);

async function fetchOrderDetails(invId) {
    if (!invId) return;
    loading.value = true;
    try {
        const res = await axios.get(`/api/v1/orders/${invId}`, {
            headers: {
                Authorization: `Bearer ${token.value}`
            }
        });
        if (res.data.success) {
            order.value = res.data.data;
        }
    } catch (err) {
        console.error('Failed to fetch order details:', err);
    } finally {
        loading.value = false;
    }
}

watch(() => props.modelValue, (isOpen) => {
    if (isOpen) {
        if (props.orderData && props.orderData.order_products) {
            order.value = props.orderData;
        } else if (props.invoiceId || props.orderData?.invoiceID) {
            fetchOrderDetails(props.invoiceId || props.orderData.invoiceID);
        }
    } else {
        order.value = null;
    }
});

function closeModal() {
    emit('update:modelValue', false);
}

// Tracking step calculations
const trackingSteps = [
    { key: 'Pending', label: 'Order Placed', icon: 'fa-cart-shopping' },
    { key: 'Processing', label: 'Processing', icon: 'fa-box-open' },
    { key: 'Shipped', label: 'On The Way', icon: 'fa-truck-fast' },
    { key: 'Delivered', label: 'Delivered', icon: 'fa-house-circle-check' },
];

const currentStatus = computed(() => order.value?.order_status || 'Pending');

const isCancelled = computed(() => currentStatus.value.toLowerCase() === 'cancelled');

function getStepStatus(stepKey) {
    if (isCancelled.value) return 'cancelled';
    const statusMap = {
        'pending': 1,
        'processing': 2,
        'shipped': 3,
        'delivered': 4
    };
    const currentLevel = statusMap[currentStatus.value.toLowerCase()] || 1;
    const stepLevel = statusMap[stepKey.toLowerCase()] || 1;

    if (stepLevel < currentLevel) return 'completed';
    if (stepLevel === currentLevel) return 'active';
    return 'upcoming';
}
</script>

<template>
    <!-- Modal Backdrop -->
    <div v-if="modelValue" class="fixed inset-0 z-50 overflow-y-auto bg-black/60 flex items-center justify-center p-4">
        <div class="bg-white w-full max-w-2xl rounded-2xl shadow-2xl overflow-hidden animate-fadeIn my-8">

            <!-- Header -->
            <div class="bg-primary text-white p-5 flex items-center justify-between">
                <div>
                    <h3 class="text-lg font-bold">Order Summary & Tracking</h3>
                    <p class="text-xs text-amber-200 mt-0.5" v-if="order">Invoice: #{{ order.invoiceID }}</p>
                </div>
                <button @click="closeModal" class="w-8 h-8 rounded-full bg-white/20 hover:bg-white/30 flex items-center justify-center text-white transition cursor-pointer">
                    <i class="fa-solid fa-xmark text-lg"></i>
                </button>
            </div>

            <!-- Modal Content -->
            <div v-if="loading" class="p-12 text-center text-gray-500">
                <i class="fa-solid fa-spinner fa-spin text-3xl text-primary mb-3 block"></i>
                Loading order details...
            </div>

            <div v-else-if="order" class="p-6 space-y-6 max-h-[80vh] overflow-y-auto">

                <!-- Cancelled Alert -->
                <div v-if="isCancelled" class="bg-red-50 border border-red-200 text-red-700 p-4 rounded-xl flex items-center gap-3">
                    <i class="fa-solid fa-circle-xmark text-2xl text-red-500"></i>
                    <div>
                        <p class="font-bold text-sm">Order Cancelled</p>
                        <p class="text-xs text-red-600">This order has been cancelled. Please contact customer support for further info.</p>
                    </div>
                </div>

                <!-- Tracking Progress Bar -->
                <div v-else class="bg-gray-50 p-5 rounded-xl border border-gray-100">
                    <h4 class="text-xs font-bold text-gray-500 uppercase tracking-wider mb-4">Order Status</h4>
                    <div class="grid grid-cols-4 gap-2 relative">
                        <div v-for="(step, idx) in trackingSteps" :key="step.key" class="flex flex-col items-center text-center relative z-10">
                            <!-- Icon Circle -->
                            <div :class="{
                                'bg-green-600 text-white shadow-md': getStepStatus(step.key) === 'completed',
                                'bg-primary text-white ring-4 ring-primary/20 shadow-md': getStepStatus(step.key) === 'active',
                                'bg-gray-200 text-gray-400': getStepStatus(step.key) === 'upcoming'
                            }" class="w-10 h-10 rounded-full flex items-center justify-center text-sm font-bold transition-all duration-300">
                                <i v-if="getStepStatus(step.key) === 'completed'" class="fa-solid fa-check text-xs"></i>
                                <i v-else :class="['fa-solid', step.icon]"></i>
                            </div>
                            <!-- Label -->
                            <span :class="{
                                'text-green-700 font-bold': getStepStatus(step.key) === 'completed',
                                'text-primary font-bold': getStepStatus(step.key) === 'active',
                                'text-gray-400 font-medium': getStepStatus(step.key) === 'upcoming'
                            }" class="text-xs mt-2">
                                {{ step.label }}
                            </span>
                        </div>
                    </div>
                </div>

                <!-- Info Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs bg-gray-50 p-4 rounded-xl border border-gray-100">
                    <div>
                        <p class="text-gray-400 font-medium uppercase">Customer Details</p>
                        <p class="font-bold text-gray-800 text-sm mt-0.5">{{ order.customer?.first_name }} {{ order.customer?.last_name }}</p>
                        <p class="text-gray-600">{{ order.customer?.phone }}</p>
                        <p class="text-gray-600">{{ order.customer?.email }}</p>
                    </div>
                    <div>
                        <p class="text-gray-400 font-medium uppercase">Delivery Address</p>
                        <p class="text-gray-700 font-medium mt-0.5">{{ order.customer?.address_1 }}</p>
                        <p class="text-gray-500" v-if="order.customer?.state_district">{{ order.customer?.state_district }}, {{ order.customer?.country }}</p>
                    </div>
                    <div>
                        <p class="text-gray-400 font-medium uppercase">Order Date</p>
                        <p class="text-gray-700 font-semibold mt-0.5">{{ order.order_date || new Date(order.created_at).toLocaleDateString() }}</p>
                    </div>
                    <div>
                        <p class="text-gray-400 font-medium uppercase">Payment Method</p>
                        <p class="text-gray-700 font-semibold mt-0.5 capitalize">{{ order.payment_method || 'Cash on Delivery' }}</p>
                    </div>
                </div>

                <!-- Product Items List -->
                <div>
                    <h4 class="text-xs font-bold text-gray-500 uppercase tracking-wider mb-2">Items Purchased</h4>
                    <div class="divide-y divide-gray-100 border border-gray-100 rounded-xl overflow-hidden">
                        <div v-for="item in (order.order_products || order.orderProducts || [])" :key="item.id" class="p-3 bg-white flex items-center justify-between gap-3">
                            <div class="flex-1 min-w-0">
                                <p class="text-sm font-semibold text-gray-800 truncate">{{ item.product_name }}</p>
                                <p class="text-xs text-gray-400" v-if="item.variant">Variant: {{ item.variant }}</p>
                                <p class="text-xs text-gray-500">Qty: {{ item.quantity }} × ৳{{ formatPrice(item.product_price) }}</p>
                            </div>
                            <span class="text-sm font-bold text-primary shrink-0">৳{{ formatPrice(item.total || (item.quantity * item.product_price)) }}</span>
                        </div>
                    </div>
                </div>

                <!-- Financial Breakdown -->
                <div class="bg-gray-50 p-4 rounded-xl border border-gray-100 space-y-2 text-sm">
                    <div class="flex justify-between text-gray-600">
                        <span>Subtotal</span>
                        <span class="font-medium">৳{{ formatPrice(order.subtotal) }}</span>
                    </div>
                    <div class="flex justify-between text-gray-600">
                        <span>Delivery Fee</span>
                        <span class="font-medium">৳{{ formatPrice(order.shipping_charge || 0) }}</span>
                    </div>
                    <div class="flex justify-between text-gray-900 font-bold text-base border-t border-gray-200 pt-2">
                        <span>Total Paid</span>
                        <span class="text-primary">৳{{ formatPrice(order.total) }}</span>
                    </div>
                </div>

            </div>

            <!-- Footer -->
            <div class="bg-gray-50 p-4 border-t border-gray-100 flex justify-end gap-3">
                <button @click="closeModal" class="px-5 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 text-sm font-semibold rounded-lg transition cursor-pointer">
                    Close
                </button>
            </div>

        </div>
    </div>
</template>

<style scoped>
@keyframes fadeIn {
    from { opacity: 0; transform: scale(0.95); }
    to { opacity: 1; transform: scale(1); }
}
.animate-fadeIn {
    animation: fadeIn 0.2s ease-out forwards;
}
</style>
