<script setup>
import { useMiniCart } from "@/composable/useMiniCart";
import {onMounted} from "vue";
import {useCart} from "@/stores/cart.js";
const { isOpen, qty, openMiniCard, closeMiniCard, plusQty, minusQty } = useMiniCart();

const cart = useCart()

onMounted(async () => {
    // fetch Cart
    await cart.fetchCart();
})
</script>

<template>
  <button
      class="bg-primary fixed top-1/2 right-4 hidden md:block   shadow-sm rounded-sm text-white text-[12px] cursor-pointer
              transition-all duration-300 ease-linear z-99"
      @click="openMiniCard">
    <p class="  bg-center bg-no-repeat bg-center_top_6px    font-semibold px-3 pt-6 pb-1"
       style="background-image:url('https://d2t8nl1y0ie1km.cloudfront.net/public/minicart-icon.svg')">0 Items</p>
    <p class="w-full rounded-b-[5px] bg-black px-3 py-1">৳0</p>
  </button>

  <div id="mini-cart" :class="isOpen ? 'opacity-100 translate-x-0 z-100 ' +
   'pointer-events-auto': 'opacity-0 translate-x-full pointer-events-none'"
       class=" fixed right-0 top-0 md:top-17 bottom-0 bg-[#F8F8F8] text-[#1D1D1B]
       w-full md:w-[350px] z-60 shadow-sm transition-all duration-300 ease-linear flex flex-col">

    <!--Minicart Header-->
    <div class="card-header px-2.5 py-1.5 bg-yellow flex justify-between shrink-0">
      <div class="space-x-1">
        <i class="fa-solid fa-basket-shopping bg-transparent"></i>
        <span class="">1 Items</span>
      </div>
      <div class="space-x-1 cursor-pointer" @click="closeMiniCard">
        <i class="fa-solid fa-xmark bg-transparent"></i>
        <span class="">Close</span>
      </div>
    </div>

    <!--  Products Section  -->
    <div class="overflow-y-auto grow min-h-0 p-1 ">
      <!--  Single Products-->
      <div  class="overflow-hidden flex items-center gap-x-3 py-2 border-b-2 border-b-gray-200 ">
        <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/67c02190656b9dabf0b44640_2819508_1_80.webp"
             height="45" width="56" class="text-center" alt="">
        <div class="flex-1 min-w-0">
          <a class="text-xs mb-0.5 block min-w-full overflow-hidden text-ellipsis
          whitespace-nowrap leading-none text-black font-semibold ">Wow! Masala Instant Noodles 496gm
          </a>
          <div class="flex justify-between mt-1.5 whitespace-nowrap">
            <div class="space-x-2">
              <span class="text-primary text-sm font-semibold">৳99</span>
              <span class="text-primary text-xs font-medium">৳175 | <span class="text-gray-500">Piece</span></span>
            </div>

            <div class="flex justify-between">
              <div class="mr-3 ">
                <button class="text-xs text-gray-500 cursor-pointer"><i class="fa-solid fa-trash-can"></i></button>
              </div>

              <div class="space-x-2">
                <button @click="minusQty"
                        class="text-xs text-primary font-medium rounded-full bg-secondary shadow-xl p-1.5 cursor-pointer">
                    <font-awesome-icon icon="fa-solid fa-minus" style="color: rgb(216, 7, 65);" />
                </button>
                <span class="text-xs text-primary font-medium">{{ qty}}</span>
                <button @click="plusQty"
                        class="text-xs text-primary font-medium rounded-full bg-secondary shadow-xl p-1.5 cursor-pointer">
                    <font-awesome-icon icon="fa-solid fa-plus" style="color: rgb(216, 7, 65);" />
                </button>
              </div>
            </div>
          </div>
          <div class="flex flex-wrap empty:hidden">
            <div class="mr-2 rounded-md px-1 text-xs leading-none text-gray-500">৳76 off</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Minicart Footer   -->
    <div class="flex shrink-0">
      <div class="flex h-11 w-1/2 items-center justify-center bg-yellow text-sm font-medium leading-none text-black">
        <h4
            class="mr-1 inline-block text-sm font-medium leading-none">Total: ৳2,666</h4></div>
      <router-link :to="{name: 'Checkout'}" class="h-11 w-1/2 bg-primary text-center text-sm font-medium leading-9 text-white">Place order</router-link>
    </div>
  </div>


</template>

<style scoped>

</style>
