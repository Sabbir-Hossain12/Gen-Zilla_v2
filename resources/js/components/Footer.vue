<script setup>
import { computed, onMounted } from "vue";
import { useSiteInfo } from "@/stores/site.js";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import shwapno_logo from "@/assets/img/shwapno_logo.png";

const site = useSiteInfo();

onMounted(async () => {
    await site.getSiteInfo();
    await site.getHeaderData();
})

const info = site.info;
const pages = site.pages;

const contactPage = computed(() =>
    pages.value.find(p =>
        (p.slug && p.slug.toLowerCase() === 'contact') ||
        (p.title && p.title.toLowerCase().includes('contact'))
    )
);

const socials = computed(() => {
    const map = [
        { link: info.value?.fb_link, icon: ['fab', 'facebook'], label: 'Facebook' },
        { link: info.value?.x_link, icon: ['fab', 'x-twitter'], label: 'X' },
        { link: info.value?.p_link, icon: ['fab', 'pinterest'], label: 'Pinterest' },
        { link: info.value?.youtube_link, icon: ['fab', 'youtube'], label: 'YouTube' },
        { link: info.value?.insta_link, icon: ['fab', 'instagram'], label: 'Instagram' },
    ];
    return map.filter(s => s.link);
});

const accountLinks = [
    { to: '/dashboard', label: 'Dashboard' },
    { to: '/order-history', label: 'Order History' },
    { to: '/personal-info', label: 'Personal Info' },
    { to: '/wishlist', label: 'Wishlist' },
];
</script>

<template>
  <footer class="w-full bg-[#f1f4f9] py-15 pb-30 bg-repeat-x bg-bottom"
          style="background-image: url('https://www.shwapno.com/bg_footer.png');">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 md:grid-cols-5 ">
        <div class="space-y-3 text-center md:text-left">
          <router-link :to="{name: 'Home'}">
            <img :src="info?.black_logo || shwapno_logo"
                 :alt="info?.website_name || 'Home'" class="max-w-[158px] w-auto h-auto mx-auto md:mx-0">
          </router-link>
          <h2 class="text-base font-semibold">{{ info?.website_name || 'Always Here for You' }}</h2>
          <p v-if="info?.short_desc" class="text-[13px] text-gray-500">{{ info.short_desc }}</p>
          <div class="text-[14px]">
            <p v-if="info?.phone_1">Call Us: {{ info.phone_1 }}</p>
            <p v-if="info?.email">Email Us: {{ info.email }}</p>
            <p v-if="info?.store_location" class="whitespace-nowrap">{{ info.store_location }}</p>
          </div>
        </div>

        <div class="ml-0 md:ml-10 space-y-3 mt-3 md:mt-0 text-center md:text-left">
          <h1 class="text-base font-semibold">Information</h1>
          <ul class="space-y-1">
            <li v-for="page in pages" :key="page.id">
              <router-link :to="{name: 'PageView', params: {slug: page.slug}}">{{ page.title }}</router-link>
            </li>
          </ul>
        </div>

        <div class="ml-0 md:ml-10 space-y-3 mt-3 md:mt-0 text-center md:text-left">
          <h1 class="text-base font-semibold">Customer Service</h1>
          <ul class="space-y-1">
            <li>
              <router-link v-if="contactPage"
                           :to="{name: 'PageView', params: {slug: contactPage.slug}}">
                Contact Us
              </router-link>
              <a v-else :href="info?.email ? `mailto:${info.email}` : '#'">Contact Us</a>
            </li>
          </ul>
        </div>

        <div class="ml-0 md:ml-10 space-y-3 mt-3 md:mt-0 text-center md:text-left">
          <h1 class="text-base font-semibold">My Account</h1>
          <ul class="space-y-1">
            <li v-for="link in accountLinks" :key="link.to">
              <router-link :to="link.to">{{ link.label }}</router-link>
            </li>
          </ul>
        </div>

        <div class="space-y-3 mt-3 md:mt-0 p-3 md:p-0">
          <h1 class="text-base font-semibold mb-5 md:mb-0">Pay With</h1>
          <div>
            <a href="">
              <img
                  src="https://www.shwapno.com/_next/image?url=https%3A%2F%2Fd2t8nl1y0ie1km.cloudfront.net%2Fpublic%2Fpayment-methods.png&w=1080&q=75"
                  alt="">
            </a>
          </div>
          <h1 v-if="socials.length" class="text-base font-semibold mt-3 md:mt-0">Follow Us</h1>
          <div v-if="socials.length" class="flex gap-x-2 justify-start">
            <a v-for="social in socials"
               :key="social.label"
               :href="social.link"
               target="_blank"
               rel="noopener"
               :aria-label="social.label"
               class="w-9 h-9 flex items-center justify-center rounded-full bg-gray-200 hover:bg-primary transition-colors">
              <FontAwesomeIcon :icon="social.icon" class="text-gray-600 hover:text-white"/>
            </a>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<style scoped>

</style>