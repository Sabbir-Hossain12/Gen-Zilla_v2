<script setup>
import MobileSidebar from "@/components/MobileSidebar.vue";
import Sidebar from "@/components/Sidebar.vue";

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
        <img
            src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/69dca4dd9b3d1a3b582db734_summerBANNER_DESKTOP_1552.webp"
            alt="">
      </a>
      <!--Category Cards-->
      <div class="grid grid-cols-2 md:grid-cols-5 mt-3 gap-x-2 md:gap-3 gap-y-4 md:gap-y-0 px-1 md:px-0">
        <div class="relative flex flex-col items-center justify-center rounded">
          <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65f7d0a7115075f231e8689c_Eggs_300.webp"
               class="rounded" alt="">
          <span
              class="rounded-full bg-yellow px-3 text-dark2 w-full md:w-[85%] text-center py-1 text-[14px] absolute -bottom-3 font-bold">Eggs</span>
        </div>
        <div class="relative flex flex-col items-center justify-center rounded">
          <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65f7d0a7115075f231e8689c_Eggs_300.webp"
               class="rounded" alt="">
          <span
              class="rounded-full bg-yellow px-3 text-dark2 w-full md:w-[85%] text-center py-1 text-[14px] absolute -bottom-3 font-bold">Eggs</span>
        </div>
        <div class="relative flex flex-col items-center justify-center rounded">
          <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65f7d0a7115075f231e8689c_Eggs_300.webp"
               class="rounded" alt="">
          <span
              class="rounded-full bg-yellow px-3 text-dark2 w-full md:w-[85%] text-center py-1 text-[14px] absolute -bottom-3 font-bold">Eggs</span>
        </div>
        <div class="relative flex flex-col items-center justify-center rounded">
          <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65f7d0a7115075f231e8689c_Eggs_300.webp"
               class="rounded" alt="">
          <span
              class="rounded-full bg-yellow px-3 text-dark2 w-full md:w-[85%] text-center py-1 text-[14px] absolute -bottom-3 font-bold">Eggs</span>
        </div>
        <div class="relative flex flex-col items-center justify-center rounded">
          <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65f7d0a7115075f231e8689c_Eggs_300.webp"
               class="rounded" alt="">
          <span
              class="rounded-full bg-yellow px-3 text-dark2 w-full md:w-[85%] text-center py-1 text-[14px] absolute -bottom-3 font-bold">Eggs</span>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>

</style>