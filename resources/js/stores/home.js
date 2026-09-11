import {defineStore} from "pinia";
import {ref} from "vue";
import axios from "axios";

export const useHome = defineStore('home', () => {

    const loading = ref(false);
    const sliders = ref([]);
    const featuredSubcategories = ref([]);
    const banner = ref(null);
    const popularProducts = ref([]);
    const featuredProducts = ref([]);
    const hotProducts = ref([]);
    const frontCategories = ref([]);
    const sectionTitles = ref({});

    async function getHomeData() {
        loading.value = true;
        try {
            let res = await axios.get('/api/v1/home');
            if (res.data.success) {
                const data = res.data.data;
                sliders.value = data.sliders || [];
                featuredSubcategories.value = data.featuredSubcategories || [];
                banner.value = data.banner || null;
                popularProducts.value = data.popularProducts || [];
                featuredProducts.value = data.featuredProducts || [];
                hotProducts.value = data.hotProducts || [];
                frontCategories.value = data.frontCategories || [];
                sectionTitles.value = data.sectionTitles || {};
            }
        } catch (err) {
            console.error('Error fetching home data:', err)
        } finally {
            loading.value = false;
        }
    }

    return {
        loading,
        sliders,
        featuredSubcategories,
        banner,
        popularProducts,
        featuredProducts,
        hotProducts,
        frontCategories,
        sectionTitles,
        getHomeData
    }
})