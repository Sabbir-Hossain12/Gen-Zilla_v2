<script setup>
import shwapno_logo from "@/assets/img/shwapno_logo.png";
import { useSettings } from "@/stores/settings.js";
import { computed, onMounted } from "vue";

const settings = useSettings();
const baseUrl = import.meta.env.VITE_APP_URL;

const logoUrl = computed(() => {
    if (settings.basicInfo?.black_logo) {
        return settings.basicInfo.black_logo.startsWith('http')
            ? settings.basicInfo.black_logo
            : `${baseUrl}/${settings.basicInfo.black_logo}`;
    }
    return shwapno_logo;
});

onMounted(async () => {
    if (!settings.loaded) {
        await settings.fetchFooterData();
    }
});
</script>

<template>
  <footer class="w-full bg-[#f1f4f9] py-15 pb-30 bg-repeat-x bg-bottom"
          style="background-image: url('https://www.shwapno.com/bg_footer.png');">
    <div class="max-w-7xl mx-auto px-4">
      <div class="grid grid-cols-1 md:grid-cols-5 gap-6">

        <!-- Column 1: Company Info -->
        <div class="space-y-3 text-center md:text-left">
          <router-link :to="{name: 'Home'}">
            <img :src="logoUrl" alt="logo" class="max-w-[158px] max-h-14 w-auto h-auto mx-auto md:mx-0 object-contain">
          </router-link>
          <h2 class="text-base font-semibold">{{ settings.basicInfo?.tagline || 'Always Here for You' }}</h2>
          <div class="text-[14px] space-y-1 text-gray-700">
            <p v-if="settings.basicInfo?.phone_1">
              Call Us: {{ settings.basicInfo.phone_1 }}
              <span v-if="settings.basicInfo?.working_hours" class="text-xs text-gray-500">({{ settings.basicInfo.working_hours }})</span>
            </p>
            <p v-else>Call Us: 16469 (8am-10pm, Everyday)</p>

            <p v-if="settings.basicInfo?.email">Email Us: {{ settings.basicInfo.email }}</p>
            <p v-else>Email Us: queries@acilogistics.net</p>

            <p class="font-medium text-xs mt-2 text-gray-800">
              {{ settings.basicInfo?.copyright_text || settings.basicInfo?.website_name || 'ACI SHWAPNO E-COMMERCE LIMITED' }}
            </p>
          </div>
        </div>

        <!-- Column 2: Information Links -->
        <div class="ml-0 md:ml-10 space-y-3 text-center md:text-left">
          <h1 class="text-base font-semibold">Information</h1>
          <ul class="space-y-1.5 text-sm text-gray-600">
            <li v-for="page in settings.pages" :key="page.id">
              <router-link :to="{name: 'PageView', params: {slug: page.slug}}" class="hover:text-primary transition-colors">
                {{ page.title }}
              </router-link>
            </li>
            <li v-if="settings.basicInfo?.store_location">
              <span class="text-xs text-gray-500 block">Address: {{ settings.basicInfo.store_location }}</span>
            </li>
          </ul>
        </div>

        <!-- Column 3: Customer Service -->
        <div class="ml-0 md:ml-10 space-y-3 text-center md:text-left">
          <h1 class="text-base font-semibold">Customer Service</h1>
          <ul class="space-y-1.5 text-sm text-gray-600">
            <li>
              <router-link to="/order-history" class="hover:text-primary transition-colors">Track Order</router-link>
            </li>
            <li>
              <router-link to="/dashboard" class="hover:text-primary transition-colors">Account Dashboard</router-link>
            </li>
            <li v-for="page in settings.pages.filter(p => p.title.toLowerCase().includes('contact') || p.title.toLowerCase().includes('help'))" :key="page.id">
              <router-link :to="{name: 'PageView', params: {slug: page.slug}}" class="hover:text-primary transition-colors">
                {{ page.title }}
              </router-link>
            </li>
          </ul>
        </div>

        <!-- Column 4: My Account -->
        <div class="ml-0 md:ml-10 space-y-3 text-center md:text-left">
          <h1 class="text-base font-semibold">My Account</h1>
          <ul class="space-y-1.5 text-sm text-gray-600">
            <li><router-link to="/personal-info" class="hover:text-primary transition-colors">Personal Info</router-link></li>
            <li><router-link to="/order-history" class="hover:text-primary transition-colors">Order History</router-link></li>
            <li><router-link to="/wishlist" class="hover:text-primary transition-colors">Wishlist</router-link></li>
          </ul>
        </div>

        <!-- Column 5: Payment & Social Links -->
        <div class="space-y-3 p-3 md:p-0 text-center md:text-left">
          <h1 class="text-base font-semibold mb-2">Pay With</h1>
          <div>
            <img
                :src="settings.basicInfo?.payment_methods_img ? (baseUrl + '/' + settings.basicInfo.payment_methods_img) : 'https://cdn.prod.website-files.com/64db80a5e88c6b1723ff7649/68b008416230fc211fb5610e_What%20are%20alternative%20payment%20methods%20(APMs)%20thumbnail.png'"
                alt="Payment Methods" class="max-w-full h-auto">
          </div>

          <h1 class="text-base font-semibold mt-4">Follow Us</h1>
          <div class="flex gap-x-3 justify-center md:justify-start items-center text-xl">
            <a v-if="settings.basicInfo?.fb_link" :href="settings.basicInfo.fb_link.startsWith('http') ? settings.basicInfo.fb_link : 'https://' + settings.basicInfo.fb_link" target="_blank" class="text-blue-600 hover:opacity-80">

                <font-awesome-icon :icon="['fab', 'facebook-square']" style="color: rgb(216, 7, 65);" />
            </a>
            <a v-if="settings.basicInfo?.youtube_link" :href="settings.basicInfo.youtube_link.startsWith('http') ? settings.basicInfo.youtube_link : 'https://' + settings.basicInfo.youtube_link" target="_blank" class="text-red-600 hover:opacity-80">

                <font-awesome-icon :icon="['fab', 'youtube-square']" style="color: rgb(216, 7, 65);" />

            </a>
            <a v-if="settings.basicInfo?.insta_link" :href="settings.basicInfo.insta_link.startsWith('http') ? settings.basicInfo.insta_link : 'https://' + settings.basicInfo.insta_link" target="_blank" class="text-pink-600 hover:opacity-80">

                <font-awesome-icon :icon="['fab', 'instagram-square']" style="color: rgb(216, 7, 65);" />

            </a>
            <a v-if="settings.basicInfo?.x_link" :href="settings.basicInfo.x_link.startsWith('http') ? settings.basicInfo.x_link : 'https://' + settings.basicInfo.x_link" target="_blank" class="text-gray-800 hover:opacity-80">
              <i class="fa-brands fa-x-twitter"></i>
                <font-awesome-icon :icon="['fab', 'twitter-square']" style="color: rgb(216, 7, 65);" />


            </a>
            <a v-if="settings.basicInfo?.p_link" :href="settings.basicInfo.p_link.startsWith('http') ? settings.basicInfo.p_link : 'https://' + settings.basicInfo.p_link" target="_blank" class="text-red-700 hover:opacity-80">

                <font-awesome-icon :icon="['fab', 'pinterest-square']" style="color: rgb(216, 7, 65);" />

            </a>
          </div>
        </div>

      </div>
    </div>
  </footer>
</template>

<style scoped>

</style>
