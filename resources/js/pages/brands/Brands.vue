<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import {onMounted, ref} from "vue";
import axios from "axios";

const brands = ref([])
const loading = ref(true)

onMounted(async () => {
    try {
        const res = await axios.get('/api/v1/brands')
        if (res.data.success) {
            brands.value = res.data.data || []
        }
    } catch (err) {
        console.error('Error fetching brands:', err)
    } finally {
        loading.value = false
    }
})
</script>

<template>
  <MainLayout>
    <!--  Brands -->
    <section class="my-15 max-w-7xl mx-auto">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">Our Brands</h2>
      <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-4 px-2">
        <div class="flex flex-col items-center justify-center" v-for="brand in brands" :key="brand.id">
          <router-link :to="{name: 'BrandProducts', params: {slug: brand.slug}}">
            <div class="flex items-center justify-center rounded-lg shadow-md p-6 bg-white border border-gray-100">
              <img v-if="brand.brand_image"
                   :src="'/' + brand.brand_image"
                   :alt="brand.brand_name"
                   class="h-20 w-auto object-contain"/>
            </div>
            <span class="block text-center text-[15px] font-semibold text-dark2 mt-3">{{ brand.brand_name }}</span>
          </router-link>
        </div>
        <p v-if="!loading && !brands.length" class="col-span-full text-center text-gray-500 py-8">No brands found.</p>
      </div>
    </section>
  </MainLayout>
</template>

<style scoped>

</style>