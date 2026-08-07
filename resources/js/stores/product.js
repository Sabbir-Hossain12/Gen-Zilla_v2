import {defineStore} from "pinia";
import {computed, onMounted, ref} from "vue";
import axios from "axios";

export const useProduct = defineStore('product', () => {

    const products = ref([]);
    const details = ref([])

    async function getPopularProducts() {
        try {
            let res = await axios.get('api/v1/popular-products');
            if (res.data.success) {
                console.log(res.data.data)
                products.value = res.data.data;
            }
        } catch (err) {
            console.error('Error fetching products:', err)
        }
    }

    async function getProductDetails(slug) {
        try {
            let res = await axios.get(`api/v1/product-details/${slug}`);
            if (res.data.success) {
                details.value = res.data.data;
            }
        } catch (err) {
            console.error('Error fetching product details:', err)
        }
    }



    //Expose
    return {products, getPopularProducts,getProductDetails}

})




