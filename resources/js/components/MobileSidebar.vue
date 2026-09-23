<script setup>

import {useSidebar} from "@/composable/useSidebar.js";
import {onMounted, ref} from 'vue'

const {isOpen} = useSidebar();

let categories = ref([]);
const loading = ref(true);
const error = ref('');
const expandedIndex = ref(null);

onMounted(async function () {
    loading.value = true;
    error.value = '';
    try {
        const response = await fetch('/api/v1/categories')
        if (!response.ok) throw new Error('Network error')

        const json = await response.json()
        if (json?.success === false) throw new Error(json?.message || 'Failed to load categories')

        categories.value = Array.isArray(json) ? json : (json?.data || [])
    } catch (e) {
        error.value = 'Failed to load categories. Please refresh.'
        console.error('Fetch failed:', e)
    } finally {
        loading.value = false;
    }
})

function toggle(index) {
    expandedIndex.value = expandedIndex.value === index ? null : index;
}
</script>

<template>
  <aside :class="isOpen
    ? 'opacity-100 translate-x-0 pointer-events-auto'
    : 'opacity-0 -translate-x-full pointer-events-none'"
         class="fixed top-[50px] left-0 block md:hidden md:col-span-3
  shadow-sm p-3 bg-white w-[300px] z-100 h-full overflow-y-auto
  transition-all duration-300 ease-linear">
    <p v-if="loading" class="text-[14px] text-gray-500">Loading categories...</p>
    <p v-else-if="error" class="text-[14px] text-red-500">{{ error }}</p>
    <p v-else-if="!categories.length" class="text-[14px] text-gray-500">No categories available.</p>

    <ul v-else class="space-y-4">
      <li v-for="(category,index) in categories" :key="index">
        <div class="flex items-center justify-between">
          <router-link :to="{name: 'CategoryProducts', params: {category_slug: category.slug}}"
                       class="flex items-center gap-2 min-w-0 py-1"
                       @click="isOpen = false">
            <img :src="`/${category.category_img_path}`" :alt="category.category_name" class="h-6 w-6 shrink-0"/>
            <span class="text-[16px] font-medium truncate">{{ category.category_name }}</span>
          </router-link>
          <button v-if="category.subcategories"
                  :aria-label="`Toggle ${category.category_name} subcategories`"
                  :aria-expanded="expandedIndex === index"
                  class="ml-2 shrink-0 cursor-pointer"
                  @click="toggle(index)">
            <i :class="expandedIndex === index
              ? 'fa-solid fa-chevron-down text-[#94a3b8]'
              : 'fa-solid fa-chevron-right text-[#94a3b8]'"></i>
          </button>
        </div>

        <ul v-if="expandedIndex === index && category.subcategories" class="ml-8 mt-1 space-y-1 border-l border-gray-200 pl-3">
          <li v-for="(subcategory, key) in category.subcategories" :key="key">
            <router-link :to="{name: 'SubcategoryProducts', params: {category_slug: category.slug, subcategory_slug: subcategory.slug}}"
                         class="block py-1 text-[14px] font-medium text-gray-700 hover:text-primary"
                         @click="isOpen = false">
              {{ subcategory.subcategory_name }}
            </router-link>
          </li>
        </ul>
      </li>
    </ul>
  </aside>
</template>

<style scoped>

</style>