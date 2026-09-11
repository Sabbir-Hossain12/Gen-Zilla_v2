<script setup>
import MainLayout from "../layouts/MainLayout.vue";
import Hero from "../components/Hero.vue";
import {useHome} from "@/stores/home.js";
import ProductCart from "@/components/ProductCart.vue";
import {computed, ref} from "vue";

// Import the store
const home = useHome();
// Call the store action to fetch all home page data from the API
home.getHomeData();

// Active showcase tab
const activeTab = ref(0);
const activeCategory = computed(() => home.frontCategories[activeTab.value] || null);
</script>

<template>
 <MainLayout>
   <!--Hero  -->
   <Hero></Hero>

   <!--  Useful Cards-->
   <section class="grid grid-cols-2 md:grid-cols-4 mt-15 space-x-5">
     <div class=" flex flex-row items-center justify-center rounded shadow-md p-3 space-x-3 border-t border-gray-100">
       <figure>
         <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/65efebe2733cb673c88abce1_Trust%201.png" alt="">
       </figure>
       <div>
         <h2 class="font-bold capitalize text-[15px]">60 Mins Delivery</h2>
         <span class="text-[14px] font-medium">Free Shipping Over 1500tk</span>
       </div>
     </div>

     <div class=" flex flex-row items-center justify-center rounded shadow-md p-3 space-x-3 border-t border-gray-100">
       <figure>
         <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/65efebe2733cb673c88abce1_Trust%201.png" alt="">
       </figure>
       <div>
         <h2 class="font-bold capitalize text-[15px]">60 Mins Delivery</h2>
         <span class="text-[14px] font-medium">Free Shipping Over 1500tk</span>
       </div>
     </div>

     <div class=" flex flex-row items-center justify-center rounded shadow-md p-3 space-x-3 border-t border-gray-100">
       <figure>
         <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/65efebe2733cb673c88abce1_Trust%201.png" alt="">
       </figure>
       <div>
         <h2 class="font-bold capitalize text-[15px]">60 Mins Delivery</h2>
         <span class="text-[14px] font-medium">Free Shipping Over 1500tk</span>
       </div>
     </div>

     <div class=" flex flex-row items-center justify-center rounded shadow-md p-3 space-x-3 border-t border-gray-100">
       <figure>
         <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/65efebe2733cb673c88abce1_Trust%201.png" alt="">
       </figure>
       <div>
         <h2 class="font-bold capitalize text-[15px]">60 Mins Delivery</h2>
         <span class="text-[14px] font-medium">Free Shipping Over 1500tk</span>
       </div>
     </div>
   </section>

   <!--  Popular Product -->
   <section v-if="home.popularProducts.length" class="my-15 max-w-7xl mx-auto">
     <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">Popular Products</h2>
     <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 space-y-3 px-2">
       <!--  Product Card  -->
       <ProductCart :products="home.popularProducts"></ProductCart>
     </div>
   </section>

   <!-- Product Showcase Banner -->
   <section v-if="home.frontCategories.length" class="my-15 max-w-7xl mx-auto">
     <div class="grid h-full grid-cols-12">
       <!--   Side Banner     -->
       <div class="col-span-12 md:col-span-3 mx-auto">
         <a v-if="home.banner" :href="home.banner.banner_link || '#'">
           <img :src="home.banner.banner_img" class="w-100 h-100 object-cover rounded-lg" alt="">
         </a>
       </div>
       <div class="col-span-12 md:col-span-9">
         <!--  Category Nav -->
         <div>
           <div class="mx-3 mb-2 my-5 md:my-0">
             <div class="flex justify-start items-center gap-2 overflow-x-auto mb-2">
               <button
                   v-for="(category, index) in home.frontCategories"
                   :key="category.id"
                   @click="activeTab = index"
                   :class="activeTab === index ? 'active-button-tab' : 'inactive-button-tab'">
                 {{ category.category_name }}
               </button>
             </div>
           </div>
         </div>
         <!--    product Card      -->
         <div class="grid grid-cols-2 md:grid-cols-4">
           <ProductCart v-if="activeCategory?.products?.length" :products="activeCategory.products"></ProductCart>
           <p v-else class="col-span-full text-center text-gray-500 py-8">No products in this category yet.</p>
         </div>
       </div>
     </div>
   </section>

   <!--  Featured Product -->
   <section v-if="home.featuredProducts.length" class="my-15 max-w-7xl mx-auto">
     <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">{{ home.sectionTitles.featured_title || 'Featured Products' }}</h2>
     <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
       <!--  Product Card  -->
       <ProductCart :products="home.featuredProducts"></ProductCart>
     </div>
   </section>

 </MainLayout>
</template>

<style scoped>

</style>