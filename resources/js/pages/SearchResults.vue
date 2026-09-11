<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import ProductCart from "@/components/ProductCart.vue";

import {useRoute} from 'vue-router'
import {onMounted, ref, watch} from "vue";
import axios from "axios";


const route = useRoute()
const keyword = ref(route.query.q || '')
const results = ref([])
const loading = ref(true)

async function fetchResults() {
    loading.value = true
    try {
        const res = await axios.get('/api/v1/search', {params: {q: keyword.value}})
        if (res.data.success) {
            results.value = res.data.data || []
        }
    } catch (err) {
        console.error('Error fetching search results:', err)
        results.value = []
    } finally {
        loading.value = false
    }
}

onMounted(fetchResults)

watch(() => route.query.q, (val) => {
    keyword.value = val || ''
    fetchResults()
})
</script>

<template>
  <MainLayout>
    <!--  Search Results -->
    <section class="my-15 max-w-7xl mx-auto">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">Search Results for "{{ keyword }}"</h2>
      <div class="grid grid-cols-2 md:grid-cols-5 space-x-3 px-2">
        <!--  Product Card  -->
        <ProductCart v-if="loading || results.length" :products="results"></ProductCart>
        <p v-else class="col-span-full text-center text-gray-500 py-8">No products found for "{{ keyword }}".</p>
      </div>
    </section>
  </MainLayout>
</template>

<style scoped>

</style>