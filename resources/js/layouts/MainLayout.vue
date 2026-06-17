<script setup>
import MobileFooter from "@/components/MobileFooter.vue";
import Footer from "@/components/Footer.vue";
import MiniCart from "@/components/MiniCart.vue";
import Header from "@/components/Header.vue";
</script>

<template>
  <!-- Header -->
  <Header></Header>

  <main class="md:max-w-387 mx-auto">
    <slot></slot>

    <!-- Route content goes here -->
    <router-view/>
  </main>

  <!-- Shopping Card-->
  <MiniCart></MiniCart>

  <!-- Footer -->
  <Footer></Footer>

  <!-- Mobile Footer -->
  <MobileFooter></MobileFooter>


</template>

<style scoped>

</style>
