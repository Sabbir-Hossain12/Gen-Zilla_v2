<script setup>
import { useMiniCart } from "@/composable/useMiniCart";
import { useCart } from "@/stores/cart.js";
import { useAuth } from "@/stores/auth.js";
import { useSidebar } from "@/composable/useSidebar";
import { formatPrice } from "@/utils/price";
import { useRouter } from "vue-router";

const { openMiniCard } = useMiniCart();
const { isOpen: isSidebarOpen } = useSidebar();
const cart = useCart();
const auth = useAuth();
const router = useRouter();

function toggleSidebar() {
    isSidebarOpen.value = !isSidebarOpen.value;
}

function handleAccountClick() {
    if (auth.isAuthenticated) {
        router.push({ name: 'Dashboard' });
    } else {
        auth.showSendOtpModal = true;
    }
}
</script>

<template>
  <div class="fixed bottom-0 left-0 right-0 bg-white z-50 block md:hidden border-t border-gray-200 shadow-2xl">
    <div class="max-w-md mx-auto grid grid-cols-4 items-center h-14 px-2">

      <!-- Home -->
      <router-link :to="{ name: 'Home' }"
                   class="flex flex-col items-center justify-center text-gray-600 hover:text-primary transition-colors py-1"
                   active-class="text-primary font-bold">
        <i class="fa-solid fa-house text-base"></i>
        <span class="text-[10px] mt-1 leading-none">Home</span>
      </router-link>

      <!-- Categories -->
      <button @click="toggleSidebar"
              class="flex flex-col items-center justify-center text-gray-600 hover:text-primary transition-colors py-1 cursor-pointer">
        <i class="fa-solid fa-layer-group text-base"></i>
        <span class="text-[10px] mt-1 leading-none">Categories</span>
      </button>

      <!-- Cart Button -->
      <button @click="openMiniCard"
              class="flex flex-col items-center justify-center text-gray-600 hover:text-primary transition-colors py-1 relative cursor-pointer">
        <div class="relative">
          <i class="fa-solid fa-basket-shopping text-base text-primary"></i>
          <span v-if="cart.totalQty > 0"
                class="absolute -top-2 -right-3 bg-primary text-white text-[9px] font-bold rounded-full w-4 h-4 flex items-center justify-center shadow">
            {{ cart.totalQty > 99 ? '99+' : cart.totalQty }}
          </span>
        </div>
        <span class="text-[10px] mt-1 leading-none text-primary font-semibold">৳{{ formatPrice(cart.subtotal || 0) }}</span>
      </button>

      <!-- Account / Sign In -->
      <button @click="handleAccountClick"
              class="flex flex-col items-center justify-center text-gray-600 hover:text-primary transition-colors py-1 cursor-pointer">
        <i class="fa-solid fa-user text-base"></i>
        <span class="text-[10px] mt-1 leading-none">{{ auth.isAuthenticated ? 'Account' : 'Sign In' }}</span>
      </button>

    </div>
  </div>
</template>

<style scoped>

</style>
