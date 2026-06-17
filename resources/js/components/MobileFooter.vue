<script setup>
import { useMiniCart } from "@/composable/useMiniCart";
import MiniCart from "@/components/MiniCart.vue";
const {  openMiniCard } = useMiniCart();
</script>

<template>
  <div class="fixed bottom-0 left-0 right-0 bg-white z-50 block  md:hidden p-2 shadow-2xl rounded-t-2xl">
    <div class="flex items-center justify-center">
      <div>
        <button class="w-12 h-12 bg-primary text-white rounded-full relative -translate-y-4" @click="openMiniCard()">
          <i class="fa-solid fa-basket-shopping"></i>
          <span class="absolute -top-1 -right-2 text-black text-xs rounded-full bg-white
           shadow-md w-5 h-5 font-bold flex justify-center items-center">2</span>
        </button>
      </div>
    </div>
  </div>

<!--  <MiniCart ref="miniCartRef"></MiniCart>-->
</template>

<style scoped>

</style>