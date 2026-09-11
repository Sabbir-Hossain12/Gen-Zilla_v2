<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import ProductCart from "@/components/ProductCart.vue";

import {useRoute} from 'vue-router'
import {onMounted, ref, watch} from "vue";
import axios from "axios";


const route = useRoute()
const brand = ref(null)
const loading = ref(true)

async function fetchBrand() {
    loading.value = true
    brand.value = null
    try {
        const res = await axios.get(`/api/v1/brands/${route.params.slug}/products`)
        if (res.data.success) {
            brand.value = res.data.data
        }
    } catch (err) {
        console.error('Error fetching brand products:', err)
    } finally {
        loading.value = false
    }
}

onMounted(fetchBrand)

watch(() => route.params.slug, fetchBrand)
</script>

<template>
  <MainLayout>
    <!--  Brand Product -->
    <section class="my-15 max-w-7xl mx-auto">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">{{ brand?.brand_name || 'Brand' }}</h2>
      <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
        <!--  Product Card  -->
        <ProductCart v-if="loading || (brand?.products?.length)" :products="brand?.products || []"></ProductCart>
        <p v-else class="col-span-full text-center text-gray-500 py-8">No products found for this brand.</p>
      </div>
    </section>
  </MainLayout>
</template>

<style scoped>

</style>