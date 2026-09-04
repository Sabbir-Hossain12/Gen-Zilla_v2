<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import { useRoute, RouterLink } from "vue-router";
import axios from "axios";
import { onMounted, ref, computed } from "vue";

const route = useRoute();
const invoiceID = route.params.invoiceID;

const order = ref(null);
const loading = ref(true);

async function fetchOrderByInvoiceID() {
    const token = localStorage.getItem('token');
    loading.value = true;
    try {
        const res = await axios.get(`/api/v1/order/${invoiceID}`, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        if (res.data.success) {
            order.value = res.data.data;
        } else {
            console.warn('API returned success=false');
        }
    } catch (err) {
        console.error('Failed to fetch order:', err);
    } finally {
        loading.value = false;
    }
}

// Computed total items count across ordered products
const totalItemsCount = computed(() => {
    if (!order.value?.order_products) return 0;
    return order.value.order_products.reduce((acc, item) => acc + (item.quantity || 0), 0);
});

// Helper: Format Date String
function formatDate(dateStr) {
    if (!dateStr) return 'N/A';
    const date = new Date(dateStr);
    return date.toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

onMounted(() => {
    fetchOrderByInvoiceID();
});
</script>

<template>
    <MainLayout>
        <!-- Breadcrumb -->
        <div class="max-w-7xl mx-auto px-4 pt-4 pb-2">
            <nav class="flex items-center gap-1 text-sm text-gray-500">
                <RouterLink to="/" class="hover:text-[#E8312A]">Home</RouterLink>
                <i class="fa-solid fa-chevron-right text-xs text-gray-400"></i>
                <RouterLink to="/cart" class="hover:text-[#E8312A]">Cart</RouterLink>
                <i class="fa-solid fa-chevron-right text-xs text-gray-400"></i>
                <span class="font-semibold text-gray-700">Order Confirmation</span>
            </nav>
        </div>

        <!-- Progress Steps -->
        <div class="max-w-7xl mx-auto px-4 mb-6">
            <div class="flex items-center gap-0">
                <div class="flex items-center gap-2">
                    <div class="w-7 h-7 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">1</div>
                    <span class="text-sm font-semibold text-[#E8312A]">Cart</span>
                </div>
                <div class="flex-1 h-[2px] bg-[#E8312A] mx-3"></div>
                <div class="flex items-center gap-2">
                    <div class="w-7 h-7 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">2</div>
                    <span class="text-sm font-semibold text-[#E8312A]">Checkout</span>
                </div>
                <div class="flex-1 h-[2px] bg-[#E8312A] mx-3"></div>
                <div class="flex items-center gap-2">
                    <div class="w-7 h-7 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">3</div>
                    <span class="text-sm font-semibold text-[#E8312A]">Confirmation</span>
                </div>
            </div>
        </div>

        <!-- Loading Skeleton -->
        <div v-if="loading" class="max-w-4xl mx-auto px-4 py-12 text-center">
            <div class="animate-pulse flex flex-col items-center">
                <div class="w-16 h-16 bg-gray-200 rounded-full mb-4"></div>
                <div class="h-6 w-48 bg-gray-200 rounded mb-2"></div>
                <div class="h-4 w-64 bg-gray-200 rounded"></div>
            </div>
        </div>

        <!-- Main Content (Renders when order data is populated) -->
        <div v-else-if="order" class="max-w-4xl mx-auto px-4 pb-12 pt-4">

            <!-- Success Banner -->
            <div class="bg-white border border-gray-100 rounded-2xl p-8 flex flex-col items-center text-center mb-6 shadow-sm">
                <div class="w-20 h-20 rounded-full bg-green-100 flex items-center justify-center mb-4">
                    <FontAwesomeIcon icon="circle-check" class="text-4xl text-green-500" />
                </div>
                <h1 class="text-2xl font-bold text-gray-800 mb-1">Order Placed Successfully!</h1>
                <p class="text-gray-500 text-sm max-w-md">Thank you for shopping with Us. Your order has been confirmed and is being prepared for delivery.</p>

                <div class="flex items-center gap-2 mt-4 bg-gray-50 border border-gray-100 rounded-full px-5 py-2">
                    <span class="text-sm text-gray-500">Invoice ID:</span>
                    <span class="text-sm font-bold text-gray-800">#{{ order.invoiceID }}</span>
                </div>

                <div class="flex items-center gap-1.5 mt-3 text-xs text-gray-400">
                    <i class="fa-regular fa-clock"></i>
                    <span>Placed on {{ formatDate(order.created_at) }}</span>
                </div>
            </div>

            <!-- Delivery Status Tracker -->
            <div class="bg-white border border-gray-100 rounded-xl p-5 mb-6">
                <h2 class="text-base font-bold text-gray-800 mb-5">Order Status</h2>
                <div class="flex items-start justify-between relative">
                    <!-- Line behind steps -->
                    <div class="absolute top-4 left-0 right-0 h-[2px] bg-gray-100 z-0 mx-8"></div>
                    <div class="absolute top-4 left-0 h-[2px] bg-green-500 z-0" style="width: 20%"></div>

                    <!-- Step 1: Confirmed -->
                    <div class="flex flex-col items-center gap-2 z-10 flex-1">
                        <div class="w-8 h-8 rounded-full bg-green-500 text-white flex items-center justify-center">
                            <i class="fa-solid fa-check text-xs"></i>
                        </div>
                        <p class="text-xs font-semibold text-green-600 text-center">Confirmed</p>
                        <p class="text-[10px] text-gray-400 text-center">{{ order.order_date }}</p>
                    </div>

                    <!-- Step 2: Processing -->
                    <div class="flex flex-col items-center gap-2 z-10 flex-1">
                        <div class="w-8 h-8 rounded-full bg-[#F5C518] text-black flex items-center justify-center animate-pulse">
                            <i class="fa-solid fa-box text-xs"></i>
                        </div>
                        <p class="text-xs font-semibold text-[#E8312A] text-center">Processing</p>
                        <p class="text-[10px] text-gray-400 text-center">{{ order.order_status }}</p>
                    </div>

                    <!-- Step 3: Picked Up -->
                    <div class="flex flex-col items-center gap-2 z-10 flex-1">
                        <div class="w-8 h-8 rounded-full bg-gray-100 text-gray-400 flex items-center justify-center">
                            <i class="fa-solid fa-bag-shopping text-xs"></i>
                        </div>
                        <p class="text-xs font-semibold text-gray-400 text-center">Picked Up</p>
                        <p class="text-[10px] text-gray-400 text-center">Pending</p>
                    </div>

                    <!-- Step 4: On the Way -->
                    <div class="flex flex-col items-center gap-2 z-10 flex-1">
                        <div class="w-8 h-8 rounded-full bg-gray-100 text-gray-400 flex items-center justify-center">
                            <i class="fa-solid fa-truck text-xs"></i>
                        </div>
                        <p class="text-xs font-semibold text-gray-400 text-center">On the Way</p>
                        <p class="text-[10px] text-gray-400 text-center">Pending</p>
                    </div>

                    <!-- Step 5: Delivered -->
                    <div class="flex flex-col items-center gap-2 z-10 flex-1">
                        <div class="w-8 h-8 rounded-full bg-gray-100 text-gray-400 flex items-center justify-center">
                            <i class="fa-solid fa-house text-xs"></i>
                        </div>
                        <p class="text-xs font-semibold text-gray-400 text-center">Delivered</p>
                        <p class="text-[10px] text-gray-400 text-center">Pending</p>
                    </div>
                </div>

                <div v-if="order.order_note" class="mt-5 flex items-center gap-2 bg-yellow-50 border border-yellow-100 rounded-lg px-4 py-2.5">
                    <i class="fa-solid fa-note-sticky text-[#E8312A] text-sm"></i>
                    <p class="text-sm text-gray-700">Note: <span class="font-medium text-gray-800">{{ order.order_note }}</span></p>
                </div>
            </div>

            <!-- Two column: Items + Details -->
            <div class="grid grid-cols-1 md:grid-cols-12 gap-6">

                <!-- Order Items -->
                <div class="md:col-span-7 bg-white border border-gray-100 rounded-xl p-5">
                    <h2 class="text-base font-bold text-gray-800 mb-4">Items Ordered ({{ totalItemsCount }})</h2>

                    <div class="flex flex-col divide-y divide-gray-100">
                        <div v-for="item in order.order_products" :key="item.id" class="flex items-center gap-3 py-3">
                            <div class="relative shrink-0">
                                <div class="w-14 h-14 bg-gray-100 border border-gray-100 rounded-md flex items-center justify-center text-gray-400 font-bold text-xs">
                                    {{ item.variant || 'Unit' }}
                                </div>
                                <span class="absolute -top-1.5 -right-1.5 w-5 h-5 rounded-full bg-[#E8312A] text-white text-[10px] font-bold flex items-center justify-center">
                                    {{ item.quantity }}
                                </span>
                            </div>
                            <div class="flex-1 min-w-0">
                                <p class="text-sm font-semibold text-gray-800 truncate">{{ item.product_name }}</p>
                                <p class="text-xs text-gray-400 mt-0.5">
                                    Variant: {{ item.variant || 'Standard' }}
                                    <span v-if="item.product_SKU"> · SKU: {{ item.product_SKU }}</span>
                                </p>
                            </div>
                            <div class="text-right shrink-0">
                                <p class="text-sm font-bold text-[#E8312A]">৳{{ item.product_price }}</p>
                                <p class="text-xs text-gray-400">Qty: {{ item.quantity }}</p>
                            </div>
                        </div>
                    </div>

                    <!-- Price Summary -->
                    <div class="mt-4 flex flex-col gap-2 border-t border-gray-100 pt-4">
                        <div class="flex justify-between text-sm text-gray-600">
                            <span>Subtotal ({{ totalItemsCount }} items)</span>
                            <span class="font-medium">৳{{ order.subtotal }}</span>
                        </div>
                        <div class="flex justify-between text-sm text-gray-600">
                            <span>Delivery Charge</span>
                            <span class="font-medium">৳{{ order.shipping_charge || 0 }}</span>
                        </div>
                        <div v-if="order.discount_amount" class="flex justify-between text-sm text-green-600">
                            <span>Discount</span>
                            <span class="font-medium">− ৳{{ order.discount_amount }}</span>
                        </div>
                        <div class="flex justify-between items-center pt-2 border-t border-gray-100 mt-1">
                            <span class="text-base font-bold text-gray-800">Total Payable</span>
                            <span class="text-xl font-bold text-[#E8312A]">৳{{ order.total }} {{ order.currency }}</span>
                        </div>
                    </div>

                    <!-- Discount Tag -->
                    <div v-if="order.discount_amount" class="mt-3 flex items-center gap-1.5 bg-green-50 border border-green-100 rounded-md px-3 py-2">
                        <i class="fa-solid fa-tag text-green-600 text-xs"></i>
                        <span class="text-xs text-green-700 font-semibold">You saved ৳{{ order.discount_amount }} on this order!</span>
                    </div>
                </div>

                <!-- Right: Delivery + Payment + Actions -->
                <div class="md:col-span-5 flex flex-col gap-5">

                    <!-- Delivery Details -->
                    <div v-if="order.customer" class="bg-white border border-gray-100 rounded-xl p-5">
                        <h2 class="text-base font-bold text-gray-800 mb-4">Delivery Details</h2>
                        <div class="flex flex-col gap-3 text-sm">
                            <div class="flex items-start gap-3">
                                <i class="fa-solid fa-user text-gray-400 w-4 mt-0.5 text-center"></i>
                                <div>
                                    <p class="text-xs text-gray-400 mb-0.5">Recipient</p>
                                    <p class="font-semibold text-gray-800">
                                        {{ order.customer.first_name }} {{ order.customer.last_name || '' }}
                                    </p>
                                </div>
                            </div>
                            <div class="flex items-start gap-3">
                                <i class="fa-solid fa-phone text-gray-400 w-4 mt-0.5 text-center"></i>
                                <div>
                                    <p class="text-xs text-gray-400 mb-0.5">Phone</p>
                                    <p class="font-semibold text-gray-800">{{ order.customer.phone }}</p>
                                </div>
                            </div>
                            <div class="flex items-start gap-3">
                                <i class="fa-solid fa-location-dot text-gray-400 w-4 mt-0.5 text-center"></i>
                                <div>
                                    <p class="text-xs text-gray-400 mb-0.5">Address</p>
                                    <p class="font-semibold text-gray-800">{{ order.customer.address_1 }}</p>
                                    <p v-if="order.customer.address_2" class="text-gray-500 text-xs">{{ order.customer.address_2 }}</p>
                                    <p class="text-gray-500 text-xs">
                                        {{ [order.customer.thana, order.customer.state_district, order.customer.country].filter(Boolean).join(', ') }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Info -->
                    <div class="bg-white border border-gray-100 rounded-xl p-5">
                        <h2 class="text-base font-bold text-gray-800 mb-4">Payment Info</h2>
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 rounded-md bg-green-100 flex items-center justify-center shrink-0">
<!--                                <i class="fa-solid fa-money-bill-wave text-green-600 text-lg"></i>-->
                                <FontAwesomeIcon icon="fa-money-bill-wave" class="text-green-600 text-lg"/>
                            </div>
                            <div>
                                <p class="text-sm font-bold text-gray-800">{{ order.payment_method || 'Cash on Delivery' }}</p>
                                <p class="text-xs text-gray-500">Pay ৳{{ order.total }} when order arrives</p>
                            </div>
                            <span class="ml-auto text-xs bg-yellow-100 text-yellow-700 font-semibold px-2 py-0.5 rounded-full">
                                {{ order.payment_status }}
                            </span>
                        </div>
                    </div>

                    <!-- Actions -->
                    <div class="flex flex-col gap-3">
                        <RouterLink to="/order-history" class="w-full bg-[#E8312A] hover:bg-[#C4251F] text-white font-bold rounded-full py-3 text-sm flex items-center justify-center gap-2 transition-colors">
                            <i class="fa-solid fa-truck text-sm"></i>
                            Track My Order
                        </RouterLink>
                        <RouterLink to="/" class="w-full bg-white hover:bg-gray-50 text-gray-700 font-semibold rounded-full py-3 text-sm border border-gray-200 flex items-center justify-center gap-2 transition-colors">
                            <i class="fa-solid fa-bag-shopping text-sm"></i>
                            Continue Shopping
                        </RouterLink>
                    </div>

                    <!-- Support Card -->
                    <div class="bg-gray-50 border border-gray-100 rounded-xl p-4 flex items-start gap-3">
                        <i class="fa-solid fa-headset text-[#E8312A] text-lg mt-0.5"></i>
                        <div>
                            <p class="text-sm font-semibold text-gray-800">Need help with your order?</p>
                            <p class="text-xs text-gray-500 mt-0.5">Our support team is available 24/7</p>
                            <button class="text-xs text-[#E8312A] font-semibold hover:underline mt-1.5">Contact Support →</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Order Not Found Fallback -->
        <div v-else class="max-w-md mx-auto px-4 py-16 text-center">
            <h2 class="text-xl font-bold text-gray-800 mb-2">Order Not Found</h2>
            <p class="text-sm text-gray-500 mb-6">We couldn't retrieve the details for order #{{ invoiceID }}.</p>
            <RouterLink to="/" class="bg-[#E8312A] text-white px-6 py-2.5 rounded-full text-sm font-semibold">
                Back to Shopping
            </RouterLink>
        </div>
    </MainLayout>
</template>
