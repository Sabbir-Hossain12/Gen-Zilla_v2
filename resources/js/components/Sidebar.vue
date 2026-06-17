<script setup>

import sidebar1 from "@/assets/img/nav1.webp";
import {categories} from "@/data/Categories";
import { ref } from 'vue'

const hoveredIndex = ref(null)
</script>

<template>
  <aside class="hidden md:block md:col-span-3 shadow-sm relative  pl-4 pt-3">
    <ul class="space-y-4">
      <li v-for="(category,index) in categories" :key="index" class="flex items-center justify-between
       hover:text-primary cursor-pointer"
          @mouseenter="hoveredIndex = index"
          @mouseleave="hoveredIndex = null">
        <!-- Left side: icon + label -->
        <router-link :to="{name: 'CategoryProducts', params: {category_slug: category.slug}}" class="flex items-center gap-2">
          <img :src="sidebar1" alt="Food category icon" class="h-6 w-6"/>
          <span class="text-[16px] font-medium">{{ category.name }}</span>
        </router-link>
        <!-- Right side: expand/collapse button -->
        <button aria-label="Expand Food category" class="ml-2" v-show="category.children">
          <i class="fa-solid fa-chevron-right text-[#94a3b8]"></i>
        </button>

      <!--  Sub Category  -->
        <div :class="hoveredIndex === index && category.children
        ? 'opacity-100 translate-x-0 pointer-events-auto'
        : 'opacity-0 -translate-x-2 pointer-events-none'"
             class="absolute top-0 left-full w-[200px] bg-white p-3 z-60 h-full shadow-lg
            transition-all duration-400 ease-in-out">
          <ul class="space-y-4">
            <li v-for="(subcategory,index) in category.children" :key="index" class="flex items-center justify-between
              hover:text-primary cursor-pointer text-black">
              <!-- Left side: icon + label -->
              <router-link :to="{name: 'SubcategoryProducts', params: {subcategory_slug: subcategory.slug}}" class="flex items-center gap-2">
                <span class="text-[16px] font-medium">{{ subcategory.name }}</span>
              </router-link>
              <!-- Right side: expand/collapse button -->
<!--              <button aria-label="Expand Food category" class="ml-2">-->
<!--                <i class="fa-solid fa-chevron-right text-[#94a3b8]"></i>-->
<!--              </button>-->
            </li>
          </ul>
        </div>
      </li>
    </ul>
  </aside>
</template>

<style scoped>

</style>