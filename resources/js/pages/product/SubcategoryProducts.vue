<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import ProductCart from "@/components/ProductCart.vue";

import {useRoute} from 'vue-router'
import {onMounted, ref} from "vue";
import axios from "axios";


const route = useRoute()
const subcategory = ref(null)
const loading = ref(true)

onMounted(async () => {
    try {
        const res = await axios.get(`/api/v1/subcategories/${route.params.subcategory_slug}/products`)
        if (res.data.success) {
            subcategory.value = res.data.data
        }
    } catch (err) {
        console.error('Error fetching subcategory products:', err)
    } finally {
        loading.value = false
    }
})
</script>

<template>
  <MainLayout>
    <!--  Subcategory Product -->
    <section class="my-15 max-w-7xl mx-auto">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">{{ subcategory?.subcategory_name || 'Products' }}</h2>
      <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
        <!--  Product Card  -->
        <ProductCart v-if="loading || (subcategory?.products?.length)" :products="subcategory?.products || []"></ProductCart>
        <p v-else class="col-span-full text-center text-gray-500 py-8">No products found in this subcategory.</p>
      </div>
    </section>
  </MainLayout>
</template>

<style scoped>

</style>