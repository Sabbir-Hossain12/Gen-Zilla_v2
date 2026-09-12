import { createRouter, createWebHistory } from 'vue-router';
import Home from "../pages/Home.vue";

// Lazy-loaded (code-split) page components — each is its own async chunk,
// downloaded only when its route is first visited.
const ProductDetails = () => import("../pages/product/ProductDetails.vue");
const Checkout = () => import("../pages/Checkout.vue");
const Success = () => import("../pages/Success.vue");
const CategoryProducts = () => import("../pages/product/CategoryProducts.vue");
const SubcategoryProducts = () => import("../pages/product/SubcategoryProducts.vue");
const SearchResults = () => import("../pages/SearchResults.vue");
const Brands = () => import("../pages/brands/Brands.vue");
const BrandProducts = () => import("../pages/brands/BrandProducts.vue");
const PageView = () => import("../pages/PageView.vue");
const Dashboard = () => import("@/pages/user/Dashboard.vue");
const OrderHistory = () => import("@/pages/user/OrderHistory.vue");
const PersonalInfo = () => import("@/pages/user/PersonalInfo.vue");
const Wishlist = () => import("@/pages/user/Wishlist.vue");


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
        path: '/search',
        name: 'SearchResults',
        component: SearchResults,
    },
    {
        path: '/brands',
        name: 'Brands',
        component: Brands,
    },
    {
        path: '/brands/:slug',
        name: 'BrandProducts',
        component: BrandProducts,
        props: true,
    },
    {
        path: '/pages/:slug',
        name: 'PageView',
        component: PageView,
        props: true,
    },
    {
      path: '/:category_slug',
      name: 'CategoryProducts',
      component: CategoryProducts,
      props: true, // allows route params as props
    },
    {
        path:'/:category_slug/:subcategory_slug',
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
        path: '/success/:invoiceID',
        name: 'Success',
        component: Success,
        props: true, // allows route params as props

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
