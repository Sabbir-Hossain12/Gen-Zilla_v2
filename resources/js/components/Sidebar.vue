<script setup>
import {onMounted, ref} from 'vue'

let categories = ref([]);
const loading = ref(true);
const error = ref('');

onMounted(async function () {
    loading.value = true;
    error.value = '';
    try {
        const response = await fetch('/api/v1/categories')
        if (!response.ok) throw new Error('Network error')
        const json = await response.json()
        categories.value = Array.isArray(json) ? json : (json?.data || [])
    } catch (e) {
        error.value = 'Failed to load categories. Please refresh.'
        console.error('Fetch failed:', e)
    } finally {
        loading.value = false;
    }
})

const hoveredIndex = ref(null)
</script>

<template>
  <aside class="hidden md:block md:col-span-3 shadow-sm relative pl-4 pt-3">

    <!--  Loading skeleton  -->
    <ul v-if="loading" class="space-y-4">
      <li v-for="n in 4" :key="n" class="flex items-center gap-2 animate-pulse">
        <span class="h-6 w-6 rounded bg-gray-200"></span>
        <span class="h-4 w-28 rounded bg-gray-200"></span>
      </li>
    </ul>

    <!--  Error  -->
    <p v-else-if="error" class="text-[14px] text-red-500">{{ error }}</p>

    <!--  Empty  -->
    <p v-else-if="!categories.length" class="text-[14px] text-gray-500">No categories available.</p>

    <ul v-else class="space-y-4">
      <li v-for="(category,index) in categories" :key="index" class="relative flex items-center justify-between
       hover:text-primary cursor-pointer"
          @mouseenter="hoveredIndex = index"
          @mouseleave="hoveredIndex = null">
        <!-- Left side: icon + label -->
        <router-link :to="{name: 'CategoryProducts', params: {category_slug: category.slug}}" class="flex items-center gap-2 min-w-0">
          <img :src="`${category.category_img_path}`" :alt="category.category_name" class="h-6 w-6 shrink-0"/>
          <span class="text-[16px] font-medium truncate">{{ category.category_name }}</span>
        </router-link>
        <!-- Right side: expand button (decorative on desktop) -->
        <button v-if="category.subcategories?.length" :aria-label="`Expand ${category.category_name}`"
                :aria-expanded="hoveredIndex === index"
                class="ml-2 shrink-0">
          <font-awesome-icon icon="chevron-right" class="text-[#94a3b8]"/>
        </button>

        <!--  Sub Category  -->
        <div :class="hoveredIndex === index && category.subcategories?.length
        ? 'opacity-100 translate-x-0 pointer-events-auto'
        : 'opacity-0 -translate-x-2 pointer-events-none'"
             class="absolute top-0 left-full w-[200px] bg-white p-3 z-[60] h-auto shadow-lg
            transition-all duration-400 ease-in-out">
          <ul class="space-y-4">
            <li v-for="(subcategory,index) in category.subcategories" :key="index" class="flex items-center justify-between
               hover:text-primary cursor-pointer text-black">
              <router-link :to="{name: 'SubcategoryProducts', params: {category_slug: category.slug, subcategory_slug: subcategory.slug}}"
                           class="flex items-center gap-2">
                <span class="text-[16px] font-medium">{{ subcategory.subcategory_name }}</span>
              </router-link>
            </li>
          </ul>
        </div>
      </li>
    </ul>
  </aside>
</template>

<style scoped>

</style>
