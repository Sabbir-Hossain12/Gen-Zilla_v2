<script setup>
const props = defineProps({
    products: {
        type: [],
        required: true
    }
})

//Calculate Sale Price
function getSalePrice(product) {
    if (product.sizes?.length) {
        return product.sizes[0].productSalePrice
    } else if (product.weights?.length) {
        return product.weights[0].productSalePrice
    } else if (product.colors?.length) {
        return product.colors[0].productSalePrice
    }
    return product.product_detail.sale_price ?? 0
}
</script>

<template>
    <div class="flex flex-col border border-border1 p-3" v-for="product in props.products" :key="product.id">
        <div class="flex justify-center items-center">
            <router-link :to="{name: 'ProductDetails', params: {slug: product.slug}}"><img
                :src="product.product_detail.productThumbnail_img"
                loading="lazy" class="object-cover h-full w-full" alt=""/></router-link>
        </div>
        <div class="flex flex-col items-center justify-center">
            <p class="text-[13px] italic hidden md:block">Delivery <span class="italic"></span></p>
            <router-link :to="{name: 'ProductDetails', params: {slug: product.slug}}"
                         class="overflow-hidden text-ellipsis text-center text-[13px] md:text-[15px] font-normal md:font-semibold">
                {{ product.product_name }}
            </router-link>
            <div class="flex items-center justify-center gap-1 my-2 flex-wrap leading-none">
                <span class="text-primary text-[15px] font-bold">৳{{ parseInt(getSalePrice(product)) }}</span>
                <span class="text-[13px] mt-0.5">Per unit </span>
            </div>
            <div class="mt-8 hidden md:block">
                <button
                    class="bg-primary text-white rounded-[200px] text-[14px] font-semibold py-0.5 px-4 cursor-pointer">

                    <i class="fa-solid fa-plus"></i>
                    <span class="ml-0.5">Add to Bag</span></button>
            </div>
        </div>
    </div>
</template>

<style scoped>

</style>
