<script setup>

import MainLayout from "@/layouts/MainLayout.vue";
import {useCart} from "@/stores/cart.js";
import {computed, onMounted, ref} from "vue";
import {storeToRefs} from "pinia";
import axios from "axios";
import {Toast} from "toaster-js";
import Router from "@/router/index.js";
import {useRouter} from "vue-router";

const router = useRouter();

const cart = useCart()
const baseUrl = import.meta.env.VITE_APP_URL;
onMounted(async () => {
    // fetch Cart
    await cart.fetchCart();
    await cart.fetchDeliveryList();
})
const selectedDeliveryId = ref(1);
const selectedDelivery = computed(() =>
    cart.deliveryList.find(d => d.id === selectedDeliveryId.value)
)
const selectedDeliveryCharge = computed(() =>
    selectedDelivery.value?.delivery_charge || 0
)

const total = computed(() =>
    cart.subtotal + selectedDeliveryCharge.value
)

const name = ref('');
const phone = ref('');
const email = ref('');
const address = ref('');
const orderNote = ref('');
const paymentMethod = ref('');
const delivery_id = selectedDeliveryId.value;
const subtotal = cart.subtotal;

const token = ref(localStorage.getItem('token') || null);

async function submitOrder() {
    try {
        if (cart.items.length === 0) {
            new Toast("Your Cart is Empty, Add some Products First !", Toast.TYPE_WARNING)

            return;
        }

        if (name.value === '') {
            new Toast("Name field required", Toast.TYPE_WARNING);

            return 0;
        }

        if (phone.value === '') {
            new Toast("Phone field required", Toast.TYPE_WARNING)

            return 0;
        }

        const regex = /^[0-9]{11}$/; // exactly 10 digits

        if (!regex.test(phone.value)) {
            new Toast("Phone Number Format doesnt Match", Toast.TYPE_WARNING)

            return 0;
        }


        if (address.value === '') {
            new Toast("Address field required", Toast.TYPE_WARNING)

            return 0;
        }


        const res = await axios.post('/api/v1/order-submit', {
            "first_name": name.value,
            "address_1": address.value,
            "email": email.value,
            "phone": phone.value,
            "country": "Bangladesh",
            "order_note": orderNote.value,
            "delivery_id": delivery_id.value,
            "payment_method": paymentMethod.value,
            "subtotal": subtotal,
            "total": total.value
        }, {
            headers: {
                Authorization: `Bearer ${token.value}` // or localStorage.getItem('token')
            }
        })

        if (res.data.success === true)
        {
            console.log('here')
            await router.push(`/success/${res.data.data.invoiceID}`)
        }

    } catch (err) {
        throw err
    } finally {

    }
}


</script>

<template>
    <MainLayout>
        <!-- Breadcrumb -->
        <div class="max-w-7xl mx-auto px-4 pt-4 pb-2">
            <nav class="flex items-center gap-1 text-sm text-gray-500">
                <a href="#" class="hover:text-[#E8312A]">Home</a>
                <i class="fa-solid fa-chevron-right text-xs text-gray-400"></i>
                <a href="#" class="hover:text-[#E8312A]">Cart</a>
                <i class="fa-solid fa-chevron-right text-xs text-gray-400"></i>
                <span class="font-semibold text-gray-700">Checkout</span>
            </nav>
        </div>

        <!-- Progress Steps -->
        <div class="max-w-7xl mx-auto px-4 mb-6">
            <div class="flex items-center gap-0">
                <div class="flex items-center gap-2">
                    <div
                        class="w-7 h-7 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">
                        1
                    </div>
                    <span class="text-sm font-semibold text-[#E8312A]">Cart</span>
                </div>
                <div class="flex-1 h-[2px] bg-[#E8312A] mx-3"></div>
                <div class="flex items-center gap-2">
                    <div
                        class="w-7 h-7 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">
                        2
                    </div>
                    <span class="text-sm font-semibold text-[#E8312A]">Checkout</span>
                </div>
                <div class="flex-1 h-[2px] bg-gray-200 mx-3"></div>
                <div class="flex items-center gap-2">
                    <div
                        class="w-7 h-7 rounded-full bg-gray-200 text-gray-500 flex items-center justify-center text-xs font-bold">
                        3
                    </div>
                    <span class="text-sm font-semibold text-gray-400">Confirmation</span>
                </div>
            </div>
        </div>

        <!-- Main Checkout Layout -->
        <div class="max-w-7xl mx-auto px-4 pb-12">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-6">

                <!-- LEFT: Delivery + Payment -->
                <div class="lg:col-span-7 flex flex-col gap-5">

                    <!-- Delivery Information -->
                    <div class="bg-white border border-gray-100 rounded-lg p-5">
                        <div class="flex items-center gap-2 mb-5">
                            <div
                                class="w-6 h-6 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">
                                1
                            </div>
                            <h2 class="text-base font-bold text-gray-800">Delivery Information</h2>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <!-- Full Name -->
                            <div class="flex flex-col gap-1">
                                <label class="text-sm font-semibold text-gray-700">Full Name <span
                                    class="text-[#E8312A]">*</span></label>
                                <input type="text" placeholder="Enter your full name" v-model="name"
                                       class="border border-gray-200 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A] transition-colors"/>
                            </div>

                            <!-- Phone -->
                            <div class="flex flex-col gap-1">
                                <label class="text-sm font-semibold text-gray-700">Phone Number <span
                                    class="text-[#E8312A]">*</span></label>
                                <div class="flex">
                                    <span
                                        class="border border-r-0 border-gray-200 rounded-l-md px-3 py-2.5 text-sm bg-gray-50 text-gray-500 flex items-center">+880</span>
                                    <input type="tel" placeholder="01X XXXX XXXX" v-model="phone"
                                           class="border border-gray-200 rounded-r-md px-3 py-2.5 text-sm flex-1 focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A] transition-colors"/>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="flex flex-col gap-1">
                                <label class="text-sm font-semibold text-gray-700">Email <span
                                    class="text-gray-400 font-normal text-xs">(Optional)</span></label>
                                <input type="email" placeholder="example@email.com" v-model="email"
                                       class="border border-gray-200 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A] transition-colors"/>
                            </div>


                            <!-- Full Address -->
                            <div class="flex flex-col gap-1 md:col-span-2">
                                <label class="text-sm font-semibold text-gray-700">Delivery Address <span
                                    class="text-[#E8312A]">*</span></label>
                                <input type="text" placeholder="House no, Road no, Block, Area..." v-model="address"
                                       class="border border-gray-200 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A] transition-colors"/>
                            </div>

                            <!-- Order Note -->
                            <div class="flex flex-col gap-1 md:col-span-2">
                                <label class="text-sm font-semibold text-gray-700">Order Note <span
                                    class="text-gray-400 font-normal text-xs">(Optional)</span></label>
                                <textarea rows="3" placeholder="Any special instructions for your order..."
                                          v-model="orderNote"
                                          class="border border-gray-200 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:border-[#E8312A] focus:ring-1 focus:ring-[#E8312A] transition-colors resize-none"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Delivery Time -->
                    <div class="bg-white border border-gray-100 rounded-lg p-5">
                        <div class="flex items-center gap-2 mb-5">
                            <div
                                class="w-6 h-6 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">
                                2
                            </div>
                            <h2 class="text-base font-bold text-gray-800">Delivery Area</h2>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-3">
                            <label v-for="delivery in  cart.deliveryList" :key="delivery.id"
                                   :class="delivery.id===1 ? 'border-2 border-[#E8312A]' : ''"
                                   class="flex items-center gap-3  rounded-lg p-3 cursor-pointer bg-red-50">
                                <input type="radio" name="delivery" :value="delivery.id" v-model="selectedDeliveryId"
                                       class="accent-[#E8312A]"/>
                                <div>
                                    <p class="text-sm font-semibold text-gray-800">{{
                                            delivery.delivery_title || ''
                                        }}</p>
                                    <p class="text-xs text-gray-500"></p>
                                    <p class="text-xs font-bold text-[#E8312A] mt-0.5">
                                        ৳{{ delivery.delivery_charge || '' }}</p>
                                </div>
                            </label>

                        </div>
                    </div>

                    <!-- Payment Method -->
                    <div class="bg-white border border-gray-100 rounded-lg p-5">
                        <div class="flex items-center gap-2 mb-5">
                            <div
                                class="w-6 h-6 rounded-full bg-[#E8312A] text-white flex items-center justify-center text-xs font-bold">
                                3
                            </div>
                            <h2 class="text-base font-bold text-gray-800">Payment Method</h2>
                        </div>

                        <div class="flex flex-col gap-3">

                            <!-- Cash on Delivery -->
                            <label id="cod-label"
                                   class="flex items-center gap-3 border-2 border-[#E8312A] rounded-lg p-4 cursor-pointer bg-red-50 transition-all">
                                <input type="radio" name="payment" id="cod" checked class="accent-[#E8312A]"
                                       value="cash" v-model="paymentMethod"/>
                                <div
                                    class="w-10 h-10 rounded-md bg-green-100 flex items-center justify-center shrink-0">
                                    <i class="fa-solid fa-money-bill-wave text-green-600 text-lg"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="text-sm font-bold text-gray-800">Cash on Delivery</p>
                                    <p class="text-xs text-gray-500">Pay when you receive your order</p>
                                </div>
                                <span
                                    class="text-xs bg-green-100 text-green-700 font-semibold px-2 py-0.5 rounded-full">Popular</span>
                            </label>

                            <!-- bKash -->
                            <label id="bkash-label"
                                   class="flex items-center gap-3 border border-gray-200 rounded-lg p-4 cursor-pointer hover:border-[#E8312A] transition-all">
                                <input type="radio" name="payment" id="bkash" class="accent-[#E8312A]" value="bkash"
                                       v-model="paymentMethod"/>
                                <div class="w-10 h-10 rounded-md bg-pink-100 flex items-center justify-center shrink-0">
                                    <span class="text-pink-600 font-black text-xl">b</span>
                                </div>
                                <div class="flex-1">
                                    <p class="text-sm font-bold text-gray-800">bKash</p>
                                    <p class="text-xs text-gray-500">Pay via bKash mobile banking</p>
                                </div>
                            </label>


                        </div>
                    </div>

                </div>

                <!-- RIGHT: Order Summary -->
                <div class="lg:col-span-5 flex flex-col gap-5">

                    <!-- Promo Code -->
                    <div class="bg-white border border-gray-100 rounded-lg p-5">
                        <h2 class="text-base font-bold text-gray-800 mb-3">Promo Code</h2>
                        <div class="flex gap-2">
                            <input type="text" placeholder="Enter promo code"
                                   class="flex-1 border border-gray-200 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:border-[#E8312A]"/>
                            <button
                                class="bg-[#F5C518] hover:bg-[#E0B000] text-black font-semibold rounded-md px-4 py-2.5 text-sm transition-colors">
                                Apply
                            </button>
                        </div>
                    </div>

                    <!-- Order Items -->
                    <div class="bg-white border border-gray-100 rounded-lg p-5">
                        <h2 class="text-base font-bold text-gray-800 mb-4">Order Summary</h2>

                        <div class="flex flex-col divide-y divide-gray-100">

                            <!-- Item 1 -->
                            <div v-for="item in cart.items" :key="item.id" class="flex items-center gap-3 py-3">
                                <div class="relative shrink-0">
                                    <img :src="baseUrl + '/' + item.product_img"
                                         class="w-14 h-14 object-contain border border-gray-100 rounded-md" alt=""/>
                                    <span
                                        class="absolute -top-1.5 -right-1.5 w-5 h-5 rounded-full bg-[#E8312A] text-white text-[10px] font-bold flex items-center justify-center">{{
                                            item.qty || 1
                                        }}</span>
                                </div>
                                <div class="flex-1 min-w-0">
                                    <p class="text-sm font-semibold text-gray-800 truncate">
                                        {{ item.product_name || 'loading' }}</p>
                                    <p class="text-xs text-gray-400 mt-0.5">{{ item.variant_type }} :
                                        {{ item.variant_label }}</p>
                                </div>
                                <span class="text-sm font-bold text-[#E8312A] shrink-0">৳{{ item.price }}</span>
                            </div>

                        </div>

                        <!-- Price Breakdown -->
                        <div class="mt-4 flex flex-col gap-2 border-t border-gray-100 pt-4">
                            <div class="flex justify-between text-sm text-gray-600">
                                <span>Subtotal ({{ cart.totalQty }} items)</span>
                                <span class="font-medium">৳{{ cart.subtotal }}</span>
                            </div>
                            <div class="flex justify-between text-sm text-gray-600">
                                <span>Delivery Charge</span>
                                <span class="font-medium">৳{{ selectedDelivery?.delivery_charge || 0 }}</span>
                            </div>
                            <!--            <div class="flex justify-between text-sm text-green-600">-->
                            <!--              <span>Discount</span>-->
                            <!--              <span class="font-medium">- ৳76</span>-->
                            <!--            </div>-->
                            <div class="flex justify-between text-sm text-gray-600">
                                <span>Promo Code</span>
                                <span class="text-gray-400 italic">Not applied</span>
                            </div>
                        </div>

                        <!-- Total -->
                        <div
                            class="mt-3 flex justify-between items-center bg-gray-50 rounded-lg px-4 py-3 border border-gray-100">
                            <span class="text-base font-bold text-gray-800">Total</span>
                            <span class="text-xl font-bold text-[#E8312A]">৳{{ total }}</span>
                        </div>

                        <!-- Savings badge -->
                        <!--          <div class="mt-2 flex items-center justify-center gap-1.5 bg-green-50 border border-green-100 rounded-md px-3 py-2">-->
                        <!--            <i class="fa-solid fa-tag text-green-600 text-xs"></i>-->
                        <!--            <span class="text-xs text-green-700 font-semibold">You are saving ৳76 on this order!</span>-->
                        <!--          </div>-->

                        <!-- Place Order Button -->
                        <!--            router-link :to="{ name: 'Success' }"-->
                        <button @click="submitOrder()"
                                class="cursor-pointer mt-5 w-full bg-[#E8312A] hover:bg-[#C4251F] text-white font-bold rounded-full py-3.5 text-base flex items-center justify-center gap-2 transition-colors shadow-sm">
                            <i class="fa-solid fa-lock text-sm"></i>
                            Place Order
                        </button>

                        <!-- Trust badges -->
                        <div class="mt-4 flex items-center justify-center gap-5 text-xs text-gray-400">
            <span class="flex items-center gap-1">
              <i class="fa-solid fa-shield-halved text-green-500"></i> Secure Checkout
            </span>
                            <span class="flex items-center gap-1">
              <i class="fa-solid fa-rotate-left text-blue-500"></i> Easy Returns
            </span>
                            <span class="flex items-center gap-1">
              <i class="fa-solid fa-headset text-[#E8312A]"></i> 24/7 Support
            </span>
                        </div>

                    </div>

                    <!-- Delivery Address Preview -->
                    <div class="bg-white border border-gray-100 rounded-lg p-5">
                        <div class="flex items-center justify-between mb-3">
                            <h2 class="text-sm font-bold text-gray-800">Delivering To</h2>
                            <button class="text-xs text-[#E8312A] hover:underline font-medium">Change</button>
                        </div>
                        <div class="flex items-start gap-3">
                            <i class="fa-solid fa-location-dot text-[#E8312A] text-base mt-0.5"></i>
                            <div>
                                <p class="text-sm font-semibold text-gray-800">{{ address || 'Loading' }}</p>
                                <p class="text-xs text-gray-400 mt-1 flex items-center gap-1">
                                    <i class="fa-solid fa-clock text-[10px]"></i> Estimated delivery: 1–2 hours
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </MainLayout>
</template>

<style scoped>

</style>
