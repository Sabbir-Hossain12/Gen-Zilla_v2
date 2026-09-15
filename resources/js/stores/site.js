import { defineStore } from "pinia";
import { ref } from "vue";
import axios from "axios";

export const useSiteInfo = defineStore('site', () => {

    // state
    const info = ref(null);
    const topCategories = ref([]);
    const brands = ref([]);
    const pages = ref([]);

    const infoLoaded = ref(false);
    const headerLoaded = ref(false);

    // actions
    async function getSiteInfo() {
        if (infoLoaded.value) return info.value;
        try {
            const res = await axios.get('/api/v1/basic-info');
            info.value = res.data.success ? res.data.data : null;
        } catch (err) {
            console.error('Error fetching basic info:', err);
            info.value = null;
        } finally {
            infoLoaded.value = true;
        }
        return info.value;
    }

    async function getHeaderData() {
        if (headerLoaded.value) return { topCategories: topCategories.value, brands: brands.value, pages: pages.value };
        try {
            const res = await axios.get('/api/v1/header');
            if (res.data.success) {
                topCategories.value = res.data.data.topCategories || [];
                brands.value = res.data.data.brands || [];
                pages.value = res.data.data.pages || [];
            }
        } catch (err) {
            console.error('Error fetching header data:', err);
        } finally {
            headerLoaded.value = true;
        }
        return { topCategories: topCategories.value, brands: brands.value, pages: pages.value };
    }

    return {
        info,
        topCategories,
        brands,
        pages,
        getSiteInfo,
        getHeaderData,
    }
})