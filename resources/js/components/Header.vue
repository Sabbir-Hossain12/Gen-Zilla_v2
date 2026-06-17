<script setup>
import shwapno_logo from "@/assets/img/shwapno_logo.png";
import app_download from "@/assets/img/app-download.png";
import {categories} from "@/data/Categories";
import {useSidebar} from "@/composable/useSidebar";

const {isOpen} = useSidebar();

const toggleSidebar = () => {
  console.log(isOpen.value)
  isOpen.value = !isOpen.value;
};

function filterCategories () {
  return categories.value.filter(category => category.topbar)
}
</script>

<template>
  <header class="sticky top-0 z-50 shadow-md">
    <!--Top Header-->
    <nav class="bg-primary px-2.5 py-1.5" id="main-header">
      <div class="max-w-387 mx-auto">
        <div class="px-2 flex items-center justify-between  gap-2 md:gap-3">
          <!-- Logo-->

          <button class="md:hidden cursor-pointer w-10 h-10" @click="toggleSidebar">

            <i class="fa-solid text-white text-xl" :class="isOpen ? 'fa-solid fa-xmark' : 'fa-solid fa-bars'"></i>
          </button>
          <router-link :to="{name: 'Home'}">
            <img :src="shwapno_logo" alt="">
          </router-link>
          <!--Delivery Location-->
          <button class="hidden md:flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer ml-2">
            <i class="fa-regular fa-truck" style="color: #e5e7eb;"></i>
            <span class="text-secondary text-xs ">Select your delivery location</span>
          </button>
          <!-- Search Sections-->
          <div class="flex items-center bg-white rounded-md shadow-sm w-full max-w-lg ">
            <!-- Input -->
            <input
                type="text"
                placeholder="Search your products"
                class="flex-1 px-4 py-1.5 text-sm text-gray-700 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-yellow-400 rounded-l-md"
            />

            <!-- Search Button -->
            <button
                class="px-4 py-1.5 bg-yellow-400 text-white font-semibold rounded-r-md hover:bg-yellow-500 focus:outline-none focus:ring-2
                focus:ring-yellow-400">
              <i class="fa-solid fa-magnifying-glass text-black"></i>
            </button>
          </div>
          <!--App Download Section-->
          <a class="cursor-pointer hidden lg:block" href="#">
            <img :src="app_download" alt="" height="40" width="175">
          </a>
          <!--Language and Login/Signup-->
          <div class="hidden lg:flex gap-2 items-center">
            <!-- Language button-->
            <button
                class="flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer hover:bg-danger">
              <span class="text-secondary text-xs font-bold">বাংলা</span>
            </button>
            <!-- Login/Signup  -->
            <button
                class="flex items-center gap-2 border border-danger rounded px-2 py-2 cursor-pointer hover:bg-danger">
              <i class="fa-solid fa-user text-white"></i>
              <span class="text-secondary text-xs font-bold ">Sign in / Sign up</span>
            </button>
          </div>

          <!--Mobile Right Menu-->
          <div class="lg:hidden flex items-center gap-2 ml-2">
            <button>
              <i class="fa-solid fa-user text-white"></i>
            </button>

            <button>
              <i class="fa-solid fa-ellipsis-vertical text-white"></i>
            </button>
          </div>

        </div>
      </div>
    </nav>
    <!--   Bottom Header&ndash-->
    <nav class="bg-white shadow-sm">
      <div class="max-w-387 mx-auto px-2 md:px-4 flex items-center justify-center md:justify-between py-1.5">
        <div class="hidden lg:flex items-center gap-2">
          <i class="fa-solid fa-bars"></i>
          <span class="font-bold text-[13px]">SHOP BY CATEGORY</span>
        </div>
        <ul class="flex items-center gap-2 md:gap-5 text-[11px] md:text-[14px] md:font-medium font-semibold text-nowrap overflow-hidden">
          <li class="mobile-header-button" v-for="(category,index) in filterCategories()" :key="index">
            <router-link :to="{name: 'CategoryProducts', params: {category_slug: category.slug}}">{{ category.name }}</router-link>
          </li>

        </ul>
        <ul class="hidden md:flex items-center gap-2">
          <li>
            <a class="flex items-center gap-1">
              <i class="fa-solid fa-store text-danger"></i>
              <span class="text-[12px] font-light">Our Outlets</span>
            </a>
          </li>
          <li>
            <a class="flex items-center gap-1">
              <i class="fa-regular fa-circle-question text-danger"></i>
              <span class="text-[12px] font-light">Help Line</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</template>

<style scoped>

</style>