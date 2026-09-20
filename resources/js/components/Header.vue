<script setup>
import shwapno_logo from "@/assets/img/shwapno_logo.png";
import app_download from "@/assets/img/app-download.png";
import {useSidebar} from "@/composable/useSidebar";
import SendOtp from "@/components/SendOtp.vue";
import {FontAwesomeIcon} from "@fortawesome/vue-fontawesome";
import VerifyOtp from "@/components/VerifyOtp.vue";

import {useAuth} from "../stores/auth.js";
import {useSettings} from "../stores/settings.js";
import {computed, onMounted, ref, watch} from "vue";
import {useRouter} from "vue-router";
import axios from "axios";
import {formatPrice} from "@/utils/price";

const auth = useAuth();
const settings = useSettings();
const router = useRouter();
const showUserDropdown = ref(false)
const {isOpen} = useSidebar();
const baseUrl = import.meta.env.VITE_APP_URL;

const logoUrl = computed(() => {
    if (settings.basicInfo?.black_logo) {
        return settings.basicInfo.black_logo.startsWith('http')
            ? settings.basicInfo.black_logo
            : `${baseUrl}/${settings.basicInfo.black_logo}`;
    }
    return shwapno_logo;
});

onMounted(async () => {
    await settings.fetchHeaderData();
})

//Search
const query = ref('');
const searchResults = ref([]);
const showSearchDropdown = ref(false);
let searchTimer = null;

watch(query, (val) => {
    clearTimeout(searchTimer);
    if (!val.trim()) {
        searchResults.value = [];
        showSearchDropdown.value = false;
        return;
    }
    searchTimer = setTimeout(async () => {
        try {
            const res = await axios.get('/api/v1/search', {params: {q: val.trim()}});
            searchResults.value = res.data.success ? res.data.data : [];
        } catch (err) {
            console.error('Search error:', err);
            searchResults.value = [];
        }
        showSearchDropdown.value = true;
    }, 300);
});

function goToProduct(slug) {
    showSearchDropdown.value = false;
    query.value = '';
    router.push({name: 'ProductDetails', params: {slug}});
}

//Calculate Sale Price (matches ProductCart logic)
function getSalePrice(product) {
    if (product.sizes?.length) {
        return product.sizes[0].productSalePrice
    } else if (product.weights?.length) {
        return product.weights[0].productSalePrice
    } else if (product.colors?.length) {
        return product.colors[0].productSalePrice
    }
    return product.product_detail?.sale_price ?? 0
}

function submitSearch() {
    const term = query.value.trim();
    if (!term) return;
    showSearchDropdown.value = false;
    router.push({name: 'SearchResults', query: {q: term}});
}


const toggleSidebar = () => {
    isOpen.value = !isOpen.value;
};

const toggleUserDropdown = () => {
    showUserDropdown.value = !showUserDropdown.value;
}

//Logout
async function logout() {
    showUserDropdown.value = false;
    await auth.handleLogout();
}

</script>

<template>
    <header class="sticky top-0 z-50 shadow-md">
        <!--Top Header-->
        <nav class="bg-primary px-2.5 py-1.5  md:block" id="main-header">
            <div class="max-w-387 mx-auto">
                <div class="px-2 flex items-center justify-between  gap-2 md:gap-3">
                    <!-- Logo-->

                    <button class="md:hidden cursor-pointer w-10 h-10" @click="toggleSidebar">
                        <FontAwesomeIcon class="text-white text-xl" :icon="isOpen ? 'xmark' : 'bars'"></FontAwesomeIcon>
                    </button>
                    <router-link :to="{name: 'Home'}">
                        <img :src="logoUrl" alt="logo" class="max-h-12 object-contain">
                    </router-link>
                    <!--Delivery Location-->
                    <button
                        class="hidden md:flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer ml-2">
                        <i class="fa-regular fa-truck" style="color: #e5e7eb;"></i>
                        <span class="text-secondary text-xs ">{{ settings.basicInfo?.store_location || 'Select your delivery location' }}</span>
                    </button>
                    <!-- Search Sections-->
                    <div class="flex items-center bg-white rounded-md shadow-sm w-full max-w-lg relative">
                        <!-- Input -->
                        <form @submit.prevent="submitSearch" class="flex items-center w-full">
                            <input
                                v-model="query"
                                type="text"
                                placeholder="Search your products"
                                class="flex-1 px-4 py-1.5 text-sm text-gray-700 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-yellow-400 rounded-l-md"
                            />

                            <!-- Search Button -->
                            <button
                                type="submit"
                                class="px-4 py-1.5 bg-yellow-400 text-white font-semibold rounded-r-md hover:bg-yellow-500 focus:outline-none focus:ring-2
                                focus:ring-yellow-400 cursor-pointer">
                                <FontAwesomeIcon icon="magnifying-glass" class="text-black"/>
                            </button>
                        </form>

                        <!-- Close overlay -->
                        <div v-if="showSearchDropdown"
                             class="fixed inset-0 z-40"
                             @click="showSearchDropdown = false"></div>

                        <!-- Search Suggestions Dropdown -->
                        <div v-if="showSearchDropdown"
                             class="absolute top-full left-0 right-0 mt-1 bg-white rounded-lg shadow-lg border border-gray-100 z-50 max-h-96 overflow-y-auto">
                            <button
                                v-for="product in searchResults"
                                :key="product.id"
                                @click="goToProduct(product.slug)"
                                class="w-full flex items-center gap-3 p-3 text-left hover:bg-gray-100 border-b border-gray-100 cursor-pointer">
                                <img :src="product.product_detail?.productThumbnail_img"
                                     class="w-10 h-10 object-cover rounded" alt="">
                                <div class="flex flex-col flex-1 min-w-0">
                                    <span class="text-sm font-medium text-gray-800 truncate">{{ product.product_name }}</span>
                                    <span class="text-xs text-primary font-bold">৳{{formatPrice(getSalePrice(product))}}</span>
                                </div>
                            </button>
                            <p v-if="!searchResults.length" class="p-3 text-sm text-gray-500">No products found.</p>
                        </div>
                    </div>
                    <!--App Download Section-->
                    <a class="cursor-pointer hidden lg:block" :href="settings.basicInfo?.app_download_link || '#'">
                        <img :src="settings.basicInfo?.app_download_img ? (baseUrl + '/' + settings.basicInfo.app_download_img) : app_download" alt="" height="40" width="175">
                    </a>
                    <!--Language and SendOtp/Signup-->
                    <div class="hidden lg:flex gap-2 items-center">
                        <!-- Language button-->
                        <button
                            class="flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer hover:bg-danger">
                            <span class="text-secondary text-xs font-bold">বাংলা</span>
                        </button>
                        <!--                        SendOtp/Signup-->
                        <button v-if="!auth.isAuthenticated"
                                class="flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer hover:bg-danger"
                                @click="auth.showSendOtpModal = true">
                            <i class="fa-solid fa-user text-white"></i>
                            <span class="text-secondary text-xs font-bold ">Sign in / Sign up</span>
                        </button>

                        <button v-else
                                class="flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer hover:bg-danger"
                                @click="toggleUserDropdown">
                            <font-awesome-icon icon="user" class="text-secondary"/>
                            <span class="text-secondary text-xs font-bold ">Welcome</span>
                        </button>

                        <div v-show="showUserDropdown"
                             class="absolute right-2 top-15 mt-2 w-64 bg-[#ffffff] rounded-lg shadow-lg border border-gray-100 text-xs z-50">
                            <div class="flex flex-col space-y-2 p-1 ">
                                <RouterLink to="/dashboard"
                                            @click="showUserDropdown = false"
                                            class="flex items-center gap-3 p-3 rounded-md hover:bg-gray-200 cursor-pointer transition border-b border-gray-200">
                                    <span class="text-red-600 text-xl">
                                        <font-awesome-icon icon="house" class="text-primary"/>
                                    </span>
                                    <span class="font-semibold text-gray-700">Dashboard</span>
                                </RouterLink>

                                <RouterLink to="/order-history"
                                            @click="showUserDropdown = false"
                                            class="flex items-center gap-3 p-3 rounded-md hover:bg-gray-200 cursor-pointer transition border-b border-gray-200">
                                    <span class="text-red-600 text-xl">
                                      <font-awesome-icon icon="receipt" class="text-primary"/>
                                    </span>
                                    <span class="font-semibold text-gray-700">Order History</span>
                                </RouterLink>

                                <RouterLink to="/personal-info"
                                            @click="showUserDropdown = false"
                                            class="flex items-center gap-3 p-3 rounded-md hover:bg-gray-200 cursor-pointer transition border-b border-gray-200">
                                    <span class="text-red-600 text-xl">
                                       <font-awesome-icon icon="user" class="text-primary"/>
                                    </span>
                                    <span class="font-semibold text-gray-700">Personal Info</span>
                                </RouterLink>

                                <button @click="logout()"
                                        class="flex items-center gap-3 p-3 rounded-md hover:bg-gray-200 cursor-pointer transition border-b border-gray-200 text-left w-full">
                                    <span class="text-red-600 text-xl">
                                       <font-awesome-icon icon="fa-arrow-right-from-bracket" class="text-primary"/>
                                    </span>
                                    <span class="font-semibold text-gray-700">Logout</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!--Mobile Right Menu-->
                    <div class="lg:hidden flex items-center gap-2 ml-2">
                        <button v-if="!auth.isAuthenticated" @click="auth.showSendOtpModal = true">
                            <i class="fa-solid fa-user text-white"></i>
                        </button>
                        <button v-else @click="toggleUserDropdown">
                            <font-awesome-icon icon="user" class="text-white"/>
                        </button>
                    </div>

                </div>
            </div>
        </nav>
        <!--   Bottom Header   -->
        <nav class="bg-white shadow-sm">
            <div class="max-w-387 mx-auto px-2 md:px-4 flex items-center justify-center md:justify-between py-1.5">
                <div class="hidden lg:flex items-center gap-2">
                    <i class="fa-solid fa-bars"></i>
                    <span class="font-bold text-[13px]">SHOP BY CATEGORY</span>
                </div>
                <ul class="flex items-center gap-2 md:gap-5 text-[11px] md:text-[14px] md:font-medium font-semibold text-nowrap overflow-hidden">
                    <li class="mobile-header-button" v-for="(category,index) in settings.topCategories" :key="index">
                        <router-link :to="{name: 'CategoryProducts', params: {category_slug: category.slug}}">
                            {{ category.category_name }}
                        </router-link>
                    </li>
                    <li class="mobile-header-button">
                        <router-link :to="{name: 'Brands'}">Brands</router-link>
                    </li>
                </ul>
                <ul class="hidden md:flex items-center gap-2">
                    <li v-for="page in settings.pages" :key="page.id">
                        <router-link :to="{name: 'PageView', params: {slug: page.slug}}" class="flex items-center gap-1">
                            <i class="fa-regular fa-circle-question text-danger"></i>
                            <span class="text-[12px] font-light">{{ page.title }}</span>
                        </router-link>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!--  SendOtp Modal  -->
    <SendOtp v-model="auth.showSendOtpModal"></SendOtp>
    <VerifyOtp></VerifyOtp>
</template>

<style scoped>

</style>
