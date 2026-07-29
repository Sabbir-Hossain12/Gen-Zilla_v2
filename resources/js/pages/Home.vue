<script setup>

import MainLayout from "../layouts/MainLayout.vue";
import {products} from "../data/products.js";
import Hero from "../components/Hero.vue";
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

   <!--  Recommended Product -->
   <section class="my-15 max-w-7xl mx-auto">
     <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">Recommended For You</h2>
     <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 space-y-3 px-2">
       <!--  Product Card  -->
       <div class="flex flex-col border border-border1 p-3" v-for="product in products" :key="product.id">
         <div class="flex justify-center items-center">
           <router-link :to="{name: 'ProductDetails', params: {id: product.id}}"><img
               :src="product.image"
               loading="lazy" class="object-cover h-full w-full" alt=""/></router-link>
         </div>
         <div class="flex flex-col items-center justify-center">
           <p class="text-[13px] italic hidden md:block">Delivery <span class="italic">{{ product.delivery }}</span></p>
           <router-link :to="{name: 'ProductDetails', params: {id: product.id}}"
                        class="overflow-hidden text-ellipsis text-center text-[13px] md:text-[15px] font-normal md:font-semibold">{{ product.name }}</router-link>
           <div class="flex items-center justify-center gap-1 my-2 flex-wrap leading-none">
             <span class="text-primary text-[15px] font-bold">৳{{ product.price }}</span>
             <span class="text-[13px] mt-0.5">Per {{ product.unit }}</span>
           </div>
           <div class="mt-8 hidden md:block">
             <button
                 class="bg-primary text-white rounded-[200px] text-[14px] font-semibold py-0.5 px-4 cursor-pointer">

               <i class="fa-solid fa-plus"></i>
               <span class="ml-0.5">Add to Bag</span></button>
           </div>
         </div>
       </div>
     </div>
   </section>

   <!-- Product Showcase Banner -->
   <section class="my-15 max-w-7xl mx-auto">
     <div class="grid h-full grid-cols-12">
       <!--   Side Banner     -->
       <div class="col-span-12 md:col-span-3 mx-auto">
         <img
             src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/69d5dc12cd7e34e1dfabd122_ProductTabWeb2_400.webp"
             class="w-100 h-100 object-cover rounded-lg" alt="">
       </div>
       <div class="col-span-12 md:col-span-9">
         <!--  Category Nav -->
         <div>
           <div class="mx-3 mb-2 my-5 md:my-0">
             <div class="flex justify-start items-center gap-2 overflow-x-auto mb-2">
               <button class="active-button-tab">Scoop Heaven</button>
               <button class="inactive-button-tab">Refreshing Drinks</button>
               <button class="inactive-button-tab">Fragrance Collection</button>
             </div>
           </div>
         </div>
         <!--    product Card      -->
         <div class="grid grid-cols-2 md:grid-cols-4">
           <!--  Product Card  -->
           <div class="flex flex-col border border-border1 p-3" v-for="product in products" :key="product.id">
             <div class="flex justify-center items-center">
               <a href=""><img
                   :src="product.image"
                   loading="lazy" class="object-cover h-full w-full" alt=""/></a>
             </div>
             <div class="flex flex-col items-center justify-center">
               <p class="text-[13px] italic hidden md:block">Delivery <span class="italic">{{ product.delivery }}</span></p>
               <a href=""
                  class="overflow-hidden text-ellipsis text-center text-[13px] md:text-[15px] font-normal md:font-semibold">{{ product.name }}</a>
               <div class="flex items-center justify-center gap-1 my-2 flex-wrap leading-none">
                 <span class="text-primary text-[15px] font-bold">৳{{ product.price }}</span>
                 <span class="text-[13px] mt-0.5">Per {{ product.unit }}</span>
               </div>
               <div class="mt-8 hidden md:block">
                 <button
                     class="bg-primary text-white rounded-[200px] text-[14px] font-semibold py-0.5 px-4 cursor-pointer">

                   <i class="fa-solid fa-plus"></i>
                   <span class="ml-0.5">Add to Bag</span></button>
               </div>
             </div>
           </div>
         </div>
       </div>
     </div>
   </section>

   <!--  Category Product -->
   <section class="my-15 max-w-7xl mx-auto">
     <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">Body Spray & Perfume</h2>
     <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
       <!--  Product Card  -->
       <div class="flex flex-col border border-border1 p-3" v-for="product in products" :key="product.id">
         <div class="flex justify-center items-center">
           <a href=""><img
               :src="product.image"
               loading="lazy" class="object-cover h-full w-full" alt=""/></a>
         </div>
         <div class="flex flex-col items-center justify-center">
           <p class="text-[13px] italic hidden md:block">Delivery <span class="italic">{{ product.delivery }}</span></p>
           <a href=""
              class="overflow-hidden text-ellipsis text-center text-[13px] md:text-[15px] font-normal md:font-semibold">{{ product.name }}</a>
           <div class="flex items-center justify-center gap-1 my-2 flex-wrap leading-none">
             <span class="text-primary text-[15px] font-bold">৳{{ product.price }}</span>
             <span class="text-[13px] mt-0.5">Per {{ product.unit }}</span>
           </div>
           <div class="mt-8 hidden md:block">
             <button
                 class="bg-primary text-white rounded-[200px] text-[14px] font-semibold py-0.5 px-4 cursor-pointer">

               <i class="fa-solid fa-plus"></i>
               <span class="ml-0.5">Add to Bag</span></button>
           </div>
         </div>
       </div>

     </div>
   </section>

 </MainLayout>
</template>

<style scoped>

</style>
