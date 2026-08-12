import {defineStore} from "pinia";
import {computed, onMounted, reactive, ref} from "vue";
import axios from "axios";

export const useProduct = defineStore('product', () => {

    const products = ref([]);
    const productDetails = ref({})

    async function getPopularProducts() {
        try {
            let res = await axios.get('/api/v1/popular-products');
            if (res.data.success) {

                products.value = res.data.data;

                console.log('popular:',products.value)
            }
        } catch (err) {
            console.error('Error fetching products:', err)
        }
    }

    async function getProductDetails(slug) {
        try {
            let res2 = await axios.get(`/api/v1/details/${slug}`);


            if (res2.data.success) {
                productDetails.value = res2.data.data;

                console.log('product details:', productDetails.value)
            }
        } catch (err) {
            console.error('Error fetching product details:', err)
        }
    }



    //Expose
    return {products, getPopularProducts,getProductDetails, productDetails}

})




