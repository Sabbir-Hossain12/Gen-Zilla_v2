import { createRouter, createWebHistory } from 'vue-router';
import Home from "../pages/Home.vue";
import ProductDetails from "../pages/product/ProductDetails.vue";
import Checkout from "../pages/Checkout.vue";
import Success from "../pages/Success.vue";
import CategoryProducts from "../pages/product/CategoryProducts.vue";
import SubcategoryProducts from "../pages/product/SubcategoryProducts.vue";
import Dashboard from "@/pages/user/Dashboard.vue";
import OrderHistory from "@/pages/user/OrderHistory.vue";
import PersonalInfo from "@/pages/user/PersonalInfo.vue";
import Wishlist from "@/pages/user/Wishlist.vue";

// Import your page views


const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
    },
    {
        path: '/product/:slug',
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
    {
        path: '/dashboard',
        name: 'Dashboard',
        component: Dashboard
    },
    {
        path: '/order-history',
        name:'OrderHistory',
        component: OrderHistory
    },
    {
        path: '/personal-info',
        name:'PersonalInfo',
        component: PersonalInfo
    },
    {
        path: '/wishlist',
        name:'Wishlist',
        component: Wishlist
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
