<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
import OrderSummaryModal from "@/components/OrderSummaryModal.vue";
import {useUser} from "@/stores/user";
import {onMounted, ref} from "vue";
import {formatPrice} from "@/utils/price";

const user = useUser();

const showOrderModal = ref(false);
const selectedInvoiceId = ref(null);
const selectedOrderData = ref(null);

function viewOrder(order) {
    selectedOrderData.value = order;
    selectedInvoiceId.value = order.invoiceID || order.id;
    showOrderModal.value = true;
}

onMounted(async () => {
    try {
        await Promise.all([
            user.fetchProfile(),
            user.fetchStats(),
            user.fetchRecentOrders(),
        ]);
    } catch (err) {
        console.error("Error loading dashboard data:", err);
    }
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
                    <h1 class="text-2xl font-bold text-dark1">Welcome back, {{ user.profile?.name || user.stats?.name || 'Valued Customer' }}</h1>
                    <p class="text-gray-500 mt-1">Here's a quick overview of your account.</p>
                </div>

                <!-- Stat cards -->
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                    <div class="bg-white rounded-lg border border-border1 shadow-sm p-5">
                        <p class="text-sm text-gray-500">Total Orders</p>
                        <p class="text-3xl font-bold text-dark1 mt-1">{{ user.totalOrders }}</p>
                    </div>
                    <div class="bg-white rounded-lg border border-border1 shadow-sm p-5">
                        <p class="text-sm text-gray-500">Pending Orders</p>
                        <p class="text-3xl font-bold text-amber-600 mt-1">{{ user.pendingOrders }}</p>
                    </div>
                    <div class="bg-white rounded-lg border border-border1 shadow-sm p-5">
                        <p class="text-sm text-gray-500">Delivered Orders</p>
                        <p class="text-3xl font-bold text-green-600 mt-1">{{ user.deliveredOrders }}</p>
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
                            <tr v-if="!user.recentOrders || user.recentOrders.length === 0">
                                <td colspan="6" class="px-6 py-8 text-center text-gray-500">No recent orders yet.</td>
                            </tr>
                            <tr v-for="order in user.recentOrders" :key="order.id">
                                <td class="px-6 py-4 font-medium">{{ order.invoiceID || '#' + order.id }}</td>
                                <td class="px-6 py-4 text-gray-500">{{ order.order_date || (order.created_at ? new Date(order.created_at).toLocaleDateString() : 'N/A') }}</td>
                                <td class="px-6 py-4 text-gray-500 capitalize">{{ order.payment_method || 'Cash' }}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2.5 py-1 rounded-full bg-amber-100 text-amber-800 text-xs font-semibold capitalize">{{ order.order_status || 'Pending' }}</span>
                                </td>
                                <td class="px-6 py-4 text-right font-semibold">৳{{ formatPrice(order.total) }}</td>
                                <td class="px-6 py-4 text-right">
                                    <button @click="viewOrder(order)" class="text-primary font-semibold hover:underline cursor-pointer">View</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>

        <!-- Order Summary & Tracking Modal -->
        <OrderSummaryModal v-model="showOrderModal" :invoice-id="selectedInvoiceId" :order-data="selectedOrderData" />
    </MainLayout>
</template>

<style scoped>

</style>
