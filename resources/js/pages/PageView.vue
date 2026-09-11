<script setup>
import MainLayout from "@/layouts/MainLayout.vue";

import {useRoute} from 'vue-router'
import {onMounted, ref, watch} from "vue";
import axios from "axios";


const route = useRoute()
const page = ref(null)
const loading = ref(true)

async function fetchPage() {
    loading.value = true
    page.value = null
    try {
        const res = await axios.get(`/api/v1/pages/${route.params.slug}`)
        if (res.data.success) {
            page.value = res.data.data
        }
    } catch (err) {
        console.error('Error fetching page:', err)
    } finally {
        loading.value = false
    }
}

onMounted(fetchPage)

watch(() => route.params.slug, fetchPage)
</script>

<template>
  <MainLayout>
    <!--  Page Content -->
    <section class="my-15 max-w-7xl mx-auto px-4">
      <h2 class="text-center uppercase text-[24px] text-dark2 font-semibold my-5">{{ page?.title || 'Page' }}</h2>
      <div class="prose max-w-none text-gray-700 leading-7">
        <p v-if="page?.desc">{{ page.desc }}</p>
        <p v-else-if="!loading" class="text-center text-gray-500 py-8">No content available.</p>
      </div>
    </section>
  </MainLayout>
</template>

<style scoped>

</style>