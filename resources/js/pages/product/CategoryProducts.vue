<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import {products} from "@/data/products.js";

import {useRoute} from 'vue-router'
import {categories} from "@/data/Categories.js";
import {computed} from "vue";



const props = defineProps({
  category_slug: String
})

const category =computed(() => categories.value.find(c => c.slug === props.category_slug) )
</script>

<template>
  <MainLayout>
    <!--  Category Product -->
    <section class="my-15 max-w-7xl mx-auto">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">{{ category.name }}</h2>
      <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
        <!--  Product Card  -->
        <div class="flex flex-col border border-border1 p-3" v-for="product in products" :key="product.id">
          <div class="flex justify-center items-center">
            <a href=""><img
                :src="product.image"
                loading="lazy" class="object-cover h-full w-full" alt=""/></a>
          </div>
          <div class="flex flex-col items-center justify-center">
            <p class="text-[13px] italic hidden md:block">Delivery <span class="italic">{{ product.delivery }}</span>
            </p>
            <a href=""
               class="overflow-hidden text-ellipsis text-center text-[13px] md:text-[15px] font-normal md:font-semibold">{{
                product.name
              }}</a>
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