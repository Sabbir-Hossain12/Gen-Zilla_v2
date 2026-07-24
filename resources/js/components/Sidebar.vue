<script setup>

import sidebar1 from "@/assets/img/nav1.webp";
// import {categories} from "@/data/Categories";
import {onMounted, ref} from 'vue'

let categories = ref([]);

onMounted(async function (){
    try {
        const response = await fetch('/api/v1/categories')
        console.log(response)// Laravel API endpoint
        if (!response.ok) throw new Error('Network error')
        categories.value = await response.json()
    } catch (error) {
        console.error('Fetch failed:', error)
    }
})



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
          <img :src="`/${category.category_img_path}`" alt="Food category icon" class="h-6 w-6"/>
          <span class="text-[16px] font-medium">{{ category.category_name }}</span>
        </router-link>
        <!-- Right side: expand/collapse button -->
        <button aria-label="Expand Food category" class="ml-2" v-show="category.subcategories">
            <font-awesome-icon icon="chevron-right" class="text-[#94a3b8]" />
        </button>

      <!--  Sub Category  -->
        <div :class="hoveredIndex === index && category.subcategories
        ? 'opacity-100 translate-x-0 pointer-events-auto'
        : 'opacity-0 -translate-x-2 pointer-events-none'"
             class="absolute top-0 left-full w-[200px] bg-white p-3 z-60 h-full shadow-lg
            transition-all duration-400 ease-in-out">
          <ul class="space-y-4">
            <li v-for="(subcategory,index) in category.subcategories" :key="index" class="flex items-center justify-between
              hover:text-primary cursor-pointer text-black">
              <!-- Left side: icon + label -->
              <router-link :to="{name: 'SubcategoryProducts', params: {subcategory_slug: subcategory.slug}}" class="flex items-center gap-2">
                <span class="text-[16px] font-medium">{{ subcategory.subcategory_name }}</span>
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
