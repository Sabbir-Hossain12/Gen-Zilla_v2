<script setup>
import MobileSidebar from "@/components/MobileSidebar.vue";
import Sidebar from "@/components/Sidebar.vue";
import {Swiper, SwiperSlide} from 'swiper/vue';
import {Autoplay, Navigation} from 'swiper/modules';
import axios from "axios";

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/autoplay'
import 'swiper/css/navigation'
import {onMounted, reactive, ref} from "vue";

// swiper.js
const onSwiper = (swiper) => {

};
const onSlideChange = () => {

};

const subcategories = ref([])
const sliders = ref([])

onMounted(async () => {
    const res1 = await axios.get('api/v1/featured-subcategories')
    subcategories.value = res1.data.data

    const res2 = await axios.get('api/v1/sliders')
    sliders.value = res2.data.data;
})

</script>

<template>
    <section class="grid grid-cols-12 gap-1">
        <!--Sidebar Section-->
        <Sidebar></Sidebar>
        <!--  Mobile Sidebar  -->
        <MobileSidebar></MobileSidebar>
        <!--Hero banner-->
        <div class="col-span-12 md:col-span-9">
            <a href="">
                <swiper :slides-per-view="1" :space-between="50" @swiper="onSwiper"
                        @slideChange="onSlideChange" :modules="[Autoplay,Navigation]"
                        :autoplay="{ delay: 3000, disableOnInteraction: false }"
                        navigation loop>
                    <swiper-slide v-for="(slider,index) in sliders" :key="index">
                        <img
                            :src="slider.slider_img"
                            alt="">
                    </swiper-slide>
                    ...
                </swiper>
            </a>
            <!--Category Cards-->
            <!--Category Cards-->
            <swiper :slides-per-view="5" :space-between="10" @swiper="onSwiper"
                    @slideChange="onSlideChange" :modules="[Autoplay, Navigation]"
                    :breakpoints="{
                                    320: { slidesPerView: 3, spaceBetween: 8 },
                                    640: { slidesPerView: 3, spaceBetween: 10 },
                                    768: { slidesPerView: 4, spaceBetween: 12 },
                                    1024: { slidesPerView: 5, spaceBetween: 14 }
                                    }"
                    class="mt-3 gap-x-2 md:gap-3 gap-y-4 md:gap-y-0 px-1 md:px-0">
                <swiper-slide
                    v-for="(subcategory, index) in subcategories"
                    :key="index"
                    class="relative flex flex-col items-center justify-center rounded overflow-visible">
                    <a href="" class="block w-full">
                        <img
                            :src="subcategory.subcategory_img"
                            class="rounded w-full h-auto object-cover"
                            :alt="subcategory.subcategory_name">
                    </a>
                    <span
                        class="rounded-full bg-yellow text-dark2 text-center py-1 text-[14px]
                   font-bold absolute bottom-1 left-1/2 -translate-x-1/2
                   w-[85%] md:w-[85%]">
            {{ subcategory.subcategory_name }}
        </span>
                </swiper-slide>
            </swiper>
        </div>
    </section>
</template>

<style scoped>

</style>
