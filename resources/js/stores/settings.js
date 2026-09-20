import { defineStore } from "pinia";
import { ref } from "vue";
import axios from "axios";

export const useSettings = defineStore('settings', () => {
    const basicInfo = ref({});
    const topCategories = ref([]);
    const brands = ref([]);
    const pages = ref([]);
    const loaded = ref(false);

    async function fetchHeaderData() {
        try {
            const res = await axios.get('/api/v1/header');
            if (res.data.success) {
                topCategories.value = res.data.data.topCategories || [];
                brands.value = res.data.data.brands || [];
                pages.value = res.data.data.pages || [];
                if (res.data.data.basicInfo) {
                    basicInfo.value = res.data.data.basicInfo;
                }
                loaded.value = true;
            }
        } catch (err) {
            console.error('Error fetching header data:', err);
        }
    }

    async function fetchFooterData() {
        try {
            const res = await axios.get('/api/v1/footer');
            if (res.data.success) {
                pages.value = res.data.data.pages || [];
                if (res.data.data.basicInfo) {
                    basicInfo.value = res.data.data.basicInfo;
                }
            }
        } catch (err) {
            console.error('Error fetching footer data:', err);
        }
    }

    return {
        basicInfo,
        topCategories,
        brands,
        pages,
        loaded,
        fetchHeaderData,
        fetchFooterData,
    };
});
