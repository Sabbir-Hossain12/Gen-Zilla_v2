<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import ProductCart from "@/components/ProductCart.vue";

import {useRoute} from 'vue-router'
import {onMounted, ref, watch} from "vue";
import axios from "axios";


const route = useRoute()
const category = ref(null)
const loading = ref(true)

async function fetchCategory() {
    loading.value = true
    category.value = null
    try {
        const res = await axios.get(`/api/v1/categories/${route.params.category_slug}/products`)
        if (res.data.success) {
            category.value = res.data.data
        }
    } catch (err) {
        console.error('Error fetching category products:', err)
    } finally {
        loading.value = false
    }
}

onMounted(fetchCategory)

watch(() => route.params.category_slug, fetchCategory)
</script>

<template>
  <MainLayout>
    <!--  Category Product -->
    <section class="my-15 max-w-7xl mx-auto">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">{{ category?.category_name || 'Category' }}</h2>
      <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
        <!--  Product Card  -->
        <ProductCart v-if="loading || (category?.products?.length)" :products="category?.products || []"></ProductCart>
        <p v-else class="col-span-full text-center text-gray-500 py-8">No products found in this category.</p>
      </div>
    </section>
  </MainLayout>
</template>

<style scoped>

</style>