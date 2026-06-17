<script setup>

import sidebar1 from "@/assets/img/nav1.webp";
import {useSidebar} from "@/composable/useSidebar.js";
import {categories} from "@/data/Categories";
const {isOpen} = useSidebar();
</script>

<template>
  <aside :class="isOpen
    ? 'opacity-100 translate-x-0 pointer-events-auto'
    : 'opacity-0 -translate-x-full pointer-events-none'"
         class="fixed top-[50px] left-0 block md:hidden md:col-span-3
  shadow-sm p-3 bg-white w-[300px] z-100 h-full overflow-y-auto
  transition-all duration-300 ease-linear">
    <ul class="space-y-4">
      <li class="flex items-center justify-between" v-for="(category,index) in categories" :key="index">
        <!-- Left side: icon + label -->
        <router-link :to="{name: 'CategoryProducts', params: {category_slug: category.slug}}" class="flex items-center gap-2">
          <img :src="sidebar1" alt="Food category icon" class="h-6 w-6"/>
          <span class="text-[16px] font-medium">{{ category.name}}</span>
        </router-link>
        <!-- Right side: expand/collapse button -->
        <button aria-label="Expand Food category" class="ml-2">
          <i class="fa-solid fa-chevron-right text-[#94a3b8]"></i>
        </button>
      </li>
    </ul>
  </aside>
</template>

<style scoped>

</style>