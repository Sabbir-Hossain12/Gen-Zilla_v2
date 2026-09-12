<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
import {useUser} from "@/stores/user";
import {onMounted} from "vue";

const user = useUser();

onMounted(() => {
    user.fetchProfile().catch(() => {});
    user.fetchStats().catch(() => {});
});
</script>

<template>
    <MainLayout>
        <div class="max-w-6xl mx-auto px-4 py-8 flex flex-col md:flex-row gap-6">

            <!-- Sidebar -->
            <DashboardSidebar></DashboardSidebar>

            <!-- Main content -->
            <main class="flex-1 space-y-6">

                <div class="bg-white rounded-lg border border-border1 shadow-sm p-6">
                    <h1 class="text-2xl font-bold text-dark1">Welcome back, {{ user.profile?.name || 'Valued Customer' }}</h1>
                    <p class="text-gray-500 mt-1">Here's a quick overview of your account.</p>
                </div>

                <!-- Stat cards -->
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    <div class="bg-white rounded-lg border border-border1 shadow-sm p-5">
                        <p class="text-sm text-gray-500">Total Orders</p>
                        <p class="text-3xl font-bold text-dark1 mt-1">{{ user.totalOrders }}</p>
                    </div>
                    <div class="bg-white rounded-lg border border-border1 shadow-sm p-5">
                        <p class="text-sm text-gray-500">Wishlist Items</p>
                        <p class="text-3xl font-bold text-dark1 mt-1">{{ user.wishlistCount }}</p>
                    </div>
                    <div class="bg-white rounded-lg border border-border1 shadow-sm p-5">
                        <p class="text-sm text-gray-500">Account Status</p>
                        <p class="mt-1"><span class="inline-block px-3 py-1 rounded-full bg-green-100 text-green-700 text-sm font-semibold">Active</span></p>
                    </div>
                </div>

                <!-- Recent orders -->
                <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden">
                    <div class="px-6 py-4 border-b border-border1 flex items-center justify-between">
                        <h2 class="font-semibold text-dark1">Recent Orders</h2>
                        <RouterLink to="/order-history" class="text-primary text-sm font-medium hover:underline">View all</RouterLink>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm">
                            <thead>
                            <tr class="text-left text-gray-500 bg-gray-50">
                                <th class="px-6 py-3 font-medium">Invoice ID</th>
                                <th class="px-6 py-3 font-medium">Order Date</th>
                                <th class="px-6 py-3 font-medium">Payment</th>
                                <th class="px-6 py-3 font-medium">Status</th>
                                <th class="px-6 py-3 font-medium text-right">Total</th>
                                <th class="px-6 py-3 font-medium text-right">Action</th>
                            </tr>
                            </thead>
                            <tbody class="divide-y divide-border1">
                            <tr v-if="user.recentOrders.length === 0">
                                <td colspan="6" class="px-6 py-8 text-center text-gray-500">No recent orders yet.</td>
                            </tr>
                            <tr v-for="order in user.recentOrders" :key="order.id">
                                <td class="px-6 py-4 font-medium">{{ order.invoiceID }}</td>
                                <td class="px-6 py-4 text-gray-500">{{ order.order_date }}</td>
                                <td class="px-6 py-4 text-gray-500">{{ order.payment_method }}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 rounded-full bg-amber text-dark2 text-xs font-semibold">{{ order.order_status }}</span>
                                </td>
                                <td class="px-6 py-4 text-right font-semibold">৳{{ Number(order.total).toLocaleString() }}</td>
                                <td class="px-6 py-4 text-right">
                                    <RouterLink :to="`/order-details/${order.invoiceID}`" class="text-primary font-medium hover:underline">View</RouterLink>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>
    </MainLayout>
</template>

<style scoped>

</style>
