import { createRouter, createWebHistory } from 'vue-router';
import Home from "../pages/Home.vue";
import ProductDetails from "../pages/product/ProductDetails.vue";
import Checkout from "../pages/Checkout.vue";
import Success from "../pages/Success.vue";
import CategoryProducts from "../pages/product/CategoryProducts.vue";
import SubcategoryProducts from "../pages/product/SubcategoryProducts.vue";

// Import your page views


const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
    },
    {
        path: '/product/:id',
        name: 'ProductDetails',
        component: ProductDetails,
        props: true, // allows route params as props
    },
    {
      path: '/:category_slug',
      name: 'CategoryProducts',
      component: CategoryProducts,
      props: true, // allows route params as props
    },
    {
        path:'/:subcategory_slug',
        name: 'SubcategoryProducts',
        component: SubcategoryProducts,
        props: true, // allows route params as props

    },
    {
        path: '/checkout',
        name: 'Checkout',
        component: Checkout,
    },
    {
        path: '/success',
        name: 'Success',
        component: Success,
    },
    // {
    //     path: '/:pathMatch(.*)*',
    //     name: 'NotFound',
    //     component: () => import('@/pages/NotFound.vue'), // lazy load
    // },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
    scrollBehavior(to, from, savedPosition) {
        // If user used browser back/forward, restore position
        if (savedPosition) {
            return savedPosition;
        } else {
            // Always scroll to top on new route
            return { top: 0 };
        }
    },
});

export default router;
