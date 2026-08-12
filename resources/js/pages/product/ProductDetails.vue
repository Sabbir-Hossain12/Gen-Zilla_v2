<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import {useProduct} from "@/stores/product.js";
import {useRoute} from 'vue-router'
import {computed, onMounted, ref} from "vue";

//fetch URL product Parameter
const route = useRoute()
const slug = route.params.slug;

console.log('slug:', slug)
const productStore = useProduct();

productStore.getProductDetails(slug);

const baseUrl = import.meta.env.VITE_APP_URL;

const productImages = computed(() => {
    try {
        return JSON.parse(productStore.productDetails.product_detail?.product_img || '[]')
    } catch (e) {
        return []
    }
})

const tags = computed(() => {
    try {
        return JSON.parse(productStore.productDetails?.tag || '[]')
    } catch (e) {
        return []
    }
})

const salePrice = computed(() => {
    try {
        if (productStore.productDetails.colors.length > 0) {
            return productStore.productDetails.colors[0].productSalePrice;
        } else if (productStore.productDetails.sizes.length > 0) {
            return productStore.productDetails.sizes[0].productSalePrice;
        } else {
            return productStore.productDetails.weights[0].productSalePrice;

        }

    } catch (e) {
        return []
    }
})
const attribute = ref('')
const variants = computed(() => {
    try {
        if (productStore.productDetails.colors.length > 0) {
            attribute.value = 'color';
            return productStore.productDetails.colors;
        } else if (productStore.productDetails.sizes.length > 0) {
            attribute.value = 'size';
            return productStore.productDetails.sizes;
        } else {
            attribute.value = 'weight';
            return productStore.productDetails.weights;

        }

    } catch (e) {
        return []
    }
})

const stockStatus = computed(() => {
    try {
        return productStore.productDetails.product_detail.available_qty > 0;

    } catch (e) {
        return []
    }
})

const product = productStore.productDetails.value;





</script>

<template>
    <MainLayout>
        <!-- Breadcrumb -->
        <div class="max-w-7xl mx-auto px-4 pt-4 pb-2">
            <nav class="flex items-center gap-1 text-sm text-gray-500">
                <a href="#" class="hover:text-[#E8312A]">Home</a>
                <font-awesome-icon icon="fa-solid fa-chevron-right" class="text-xs text-gray-400"
                                   style="color: rgb(222, 226, 233);"/>
                <!--      <i class="fa-solid fa-chevron-right text-xs text-gray-400"></i>-->
                <span>...</span>
                <font-awesome-icon icon="fa-solid fa-chevron-right" class="text-xs text-gray-400"
                                   style="color: rgb(222, 226, 233);"/>
                <span class="font-semibold text-gray-700">{{
                        productStore.productDetails.product_name || 'Loading...'
                    }}</span>
            </nav>
        </div>

        <!-- Main Product Section -->
        <div class="max-w-7xl mx-auto px-4 pb-10">
            <div class="grid grid-cols-1 md:grid-cols-12 gap-6">

                <!-- LEFT: Product Images -->
                <div class="md:col-span-4 bg-white border border-gray-100 rounded-lg p-4">
                    <div class="relative flex items-center justify-center bg-white rounded-lg h-72 overflow-hidden">
                        <img id="mainImg" v-if="productStore.productDetails.product_detail.productThumbnail_img"
                             :src="baseUrl + '/' + productStore.productDetails.product_detail.productThumbnail_img"
                             class="object-contain h-full w-full" :alt="productStore.productDetails.product_name"/>
                        <button
                            class="absolute bottom-3 right-3 bg-white border border-gray-200 rounded-full w-8 h-8 flex items-center justify-center text-gray-500 hover:text-[#E8312A] shadow-sm">
                            <i class="fa-solid fa-magnifying-glass text-sm"></i>
                        </button>
                    </div>
                    <div class="flex gap-2 mt-3">
                        <div v-for="sliderImg in productImages" :key="sliderImg" @click=""
                             class="border-2 border-[#E8312A] rounded-md cursor-pointer overflow-hidden w-16 h-16 shrink-0">
                            <img
                                :src="baseUrl + '/backend/assets/images/uploads/products/' + sliderImg"
                                class="w-full h-full object-contain" alt="thumb1"/>
                        </div>
                        <!--                        <div @click=""-->
                        <!--                             class="border-2 border-transparent hover:border-[#E8312A] rounded-md cursor-pointer overflow-hidden w-16 h-16 shrink-0">-->
                        <!--                            <img-->
                        <!--                                src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/692ed719d5287d4d62f634cb_Supermom-Baby-Diaper-Medium-50Pcs_1_80.webp"-->
                        <!--                                class="w-full h-full object-contain" alt="thumb2"/>-->
                        <!--                        </div>-->
                    </div>
                </div>

                <!-- MIDDLE: Product Info -->
                <div class="md:col-span-5 bg-white border border-gray-100 rounded-lg p-5 flex flex-col gap-4">
                    <h1 class="text-xl font-bold text-gray-800 leading-snug">
                        {{ productStore.productDetails.product_name || 'Loading...' }}</h1>

                    <div class="flex items-baseline gap-2">
                        <span class="text-[#E8312A] text-3xl font-bold">৳{{ salePrice || 0 }}</span>
                        <span class="text-gray-500 text-sm">Per Product</span>
                    </div>

                    <div>
                        <p class="text-sm font-semibold text-gray-800 mb-3 tracking-wide">
                            {{ attribute.toUpperCase() }}
                        </p>
                        <div class="flex flex-wrap gap-2.5">
                            <button
                                v-for="variant in variants"
                                :key="variant.id"
                                type="button"
                                class="px-4 py-1.5 rounded-full text-sm font-medium border border-gray-300 text-gray-700 bg-white
                                                hover:border-[#E8312A] hover:text-[#E8312A]
                                                transition-colors duration-150 cursor-pointer
                                                focus:outline-none focus:ring-2 focus:ring-[#E8312A]/30">
                                {{ variant.color_title || variant.size_title || variant.weight_title }}
                            </button>
                        </div>
                    </div>

                    <button
                        class="bg-[#E8312A] hover:bg-[#C4251F] text-white font-semibold rounded-full px-8 py-2.5 flex items-center gap-2 w-fit transition-colors duration-200">
                        <i class="fa-solid fa-plus text-sm"></i>
                        <span>Add to Bag</span>
                    </button>

                    <hr class="border-gray-100"/>

                    <div>
                        <p class="text-sm font-semibold text-gray-700 mb-2">Product Tags :</p>
                        <div class="flex flex-wrap gap-2">
                            <span v-for="tag in tags" :key="tag"
                                  class="border border-gray-300 rounded px-2.5 py-1 text-[13px] text-gray-600">{{
                                    tag
                                }}</span>
                        </div>
                    </div>
                </div>

                <!-- RIGHT: Details Sidebar -->
                <div class="md:col-span-3 flex flex-col gap-4">

                    <div class="bg-white border border-gray-100 rounded-lg p-4 flex flex-col gap-3">
                        <div class="flex items-center justify-between">
                            <span class="text-sm text-gray-600"><span
                                class="font-semibold">SKU:</span> {{ productStore.productDetails.product_detail.SKU || 'N/A' }}</span>
                            <span class="flex items-center gap-1 text-green-600 text-sm font-medium">
              <i class="fa-solid fa-circle-check text-xs"></i> {{ stockStatus? 'In Stock' : 'Out Of Stock'}}
            </span>
                        </div>

                        <div class="text-sm text-gray-600">
                            <span class="font-semibold">Brand: </span>
                            <a href="#" class="text-[#E8312A] hover:underline font-medium">{{ productStore.productDetails.brand.brand_name || 'Loading..' }}</a>
                        </div>

                        <p class="text-sm text-gray-600 leading-relaxed">{{ productStore.productDetails.short_desc || 'Loading ..'}}</p>

                        <hr class="border-gray-100"/>

                        <div class="flex items-center gap-3 flex-wrap">
                            <button
                                class="flex items-center gap-1.5 border border-gray-200 rounded-full px-3 py-1.5 text-sm text-gray-600 hover:border-[#E8312A] hover:text-[#E8312A] transition-colors">
                                <i class="fa-regular fa-heart text-sm"></i>
                                <span>Add to Wishlist</span>
                            </button>
                            <div class="flex items-center gap-2">
                                <a href="#"
                                   class="w-8 h-8 rounded-full bg-blue-600 hover:bg-blue-700 flex items-center justify-center text-white transition-colors">
                                    <i class="fa-brands fa-facebook-f text-xs"></i>
                                </a>
                                <a href="#"
                                   class="w-8 h-8 rounded-full bg-blue-500 hover:bg-blue-600 flex items-center justify-center text-white transition-colors">
                                    <i class="fa-brands fa-facebook-messenger text-xs"></i>
                                </a>
                                <a href="#"
                                   class="w-8 h-8 rounded-full bg-green-500 hover:bg-green-600 flex items-center justify-center text-white transition-colors">
                                    <i class="fa-brands fa-whatsapp text-sm"></i>
                                </a>
                            </div>
                        </div>

                        <hr class="border-gray-100"/>

                        <div class="flex items-center gap-2 text-sm text-gray-700">
                            <i class="fa-solid fa-truck text-gray-400 text-base"></i>
                            <span><span class="font-semibold">Delivery:</span> 1-2 hours</span>
                        </div>

                        <div class="flex items-center gap-2 text-sm">
                            <i class="fa-solid fa-location-dot text-gray-400 text-base"></i>
                            <span class="font-semibold text-gray-600">Location:</span>
                            <button class="text-[#E8312A] hover:underline flex items-center gap-1">
                                Select your delivery location
                                <i class="fa-solid fa-chevron-down text-xs"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Payment Methods -->
                    <div class="bg-white border border-gray-100 rounded-lg p-4">
                        <div class="flex items-center justify-between mb-3">
                            <p class="text-sm font-semibold text-gray-700">Other Payment Methods</p>
                            <div class="flex items-center gap-1.5 text-xs font-bold">
                                <span class="text-orange-500">MC</span>
                                <span class="text-green-600">GPay</span>
                                <span class="text-gray-700">✕Pay</span>
                                <span class="text-blue-700">VISA</span>
                            </div>
                        </div>
                        <div class="grid grid-cols-2 gap-2">
                            <div class="border border-gray-200 rounded-md p-2.5 flex items-center gap-2 bg-white">
                                <span class="text-pink-600 font-bold text-base">b</span>
                                <span class="text-gray-700 text-sm font-medium">bKash</span>
                            </div>
                            <div class="border border-gray-200 rounded-md p-2.5 flex items-center gap-2 bg-white">
                                <i class="fa-solid fa-money-bill-wave text-green-500 text-sm"></i>
                                <div class="leading-tight">
                                    <p class="text-xs font-semibold text-gray-700">Cash on</p>
                                    <p class="text-xs font-semibold text-gray-700">Delivery</p>
                                </div>
                            </div>
                            <div class="border border-gray-200 rounded-md p-2.5 flex items-center gap-2 bg-white">
                                <i class="fa-solid fa-building-columns text-red-500 text-sm"></i>
                                <span class="text-gray-700 text-sm font-medium">City Bank</span>
                            </div>
                            <div class="border border-gray-200 rounded-md p-2.5 flex items-center gap-2 bg-white">
                                <i class="fa-regular fa-credit-card text-gray-500 text-sm"></i>
                                <div class="leading-tight">
                                    <p class="text-xs font-semibold text-gray-700">Card</p>
                                    <p class="text-xs font-semibold text-gray-700">Payment</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Reviews Section -->
            <div class="mt-8 bg-white border border-gray-100 rounded-lg overflow-hidden">
                <div class="p-4 border-b border-gray-100">
                    <button class="bg-[#F5C518] text-black font-semibold px-5 py-1.5 rounded-full text-sm">Reviews
                    </button>
                </div>
                <div class="py-16 flex flex-col items-center justify-center text-gray-400">
                    <i class="fa-regular fa-star text-4xl mb-3 text-gray-300"></i>
                    <p class="font-semibold text-gray-500">No reviews yet, Be the first one to review !</p>
                </div>
            </div>
        </div>
    </MainLayout>
</template>

<style scoped>

</style>
