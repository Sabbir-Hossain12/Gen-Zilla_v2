<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
import {useUser} from "@/stores/user";
import {onMounted, ref} from "vue";

const user = useUser();
const activeStatus = ref('All');

async function loadOrders() {
    try {
        await user.fetchOrderHistory({page: 1, perPage: 10, status: activeStatus.value});
    } catch (err) {
        console.error("Failed to load orders", err);
    }
}

async function changeStatus(filter) {
    activeStatus.value = filter;
    await loadOrders();
}

async function goToPage(page) {
    try {
        await user.fetchOrderHistory({page, perPage: 10, status: activeStatus.value});
    } catch (err) {
        console.error("Failed to load orders", err);
    }
}

onMounted(loadOrders);
</script>

<template>
<MainLayout>
    <div class="max-w-6xl mx-auto px-4 py-8 flex flex-col md:flex-row gap-6">

        <!-- Sidebar -->
     <DashboardSidebar></DashboardSidebar>

        <!-- Main content -->
        <main class="flex-1 space-y-6">

            <div class="bg-white rounded-lg border border-border1 shadow-sm p-6 flex items-center justify-between flex-wrap gap-4">
                <div>
                    <h1 class="text-2xl font-bold text-dark1">Order History</h1>
                    <p class="text-gray-500 mt-1">Track and review all your past orders.</p>
                </div>
                    <select v-model="activeStatus" @change="changeStatus(activeStatus)"
                            class="border border-border1 rounded-md px-3 py-2 text-sm text-dark1">
                        <option>All</option>
                        <option>Pending</option>
                        <option>Processing</option>
                        <option>Delivered</option>
                        <option>Cancelled</option>
                    </select>
            </div>

            <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden">
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
                    <tr v-if="user.orders.length === 0">
                        <td colspan="6" class="px-6 py-8 text-center text-gray-500">No orders found.</td>
                    </tr>
                    <tr v-for="order in user.orders" :key="order.id">
                        <td class="px-6 py-4 font-medium">{{ order.invoiceID }}</td>
                        <td class="px-6 py-4 text-gray-500">{{ order.order_date }}</td>
                        <td class="px-6 py-4 text-gray-500">{{ order.payment_method }}</td>
                        <td class="px-6 py-4"><span class="px-2 py-1 rounded-full bg-amber text-dark2 text-xs font-semibold">{{ order.order_status }}</span></td>
                        <td class="px-6 py-4 text-right font-semibold">৳{{ Number(order.total).toLocaleString() }}</td>
                        <td class="px-6 py-4 text-right"><RouterLink :to="`/order-details/${order.invoiceID}`" class="text-primary font-medium hover:underline">View</RouterLink></td>
                    </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="px-6 py-4 border-t border-border1 flex items-center justify-between text-sm text-gray-500">
                    <span>Showing 1–4 of 12 orders</span>
                    <div class="flex gap-1">
                        <button class="px-3 py-1.5 rounded-md border border-border1 hover:bg-gray-50">Prev</button>
                        <button class="px-3 py-1.5 rounded-md bg-primary text-white">1</button>
                        <button class="px-3 py-1.5 rounded-md border border-border1 hover:bg-gray-50">2</button>
                        <button class="px-3 py-1.5 rounded-md border border-border1 hover:bg-gray-50">3</button>
                        <button class="px-3 py-1.5 rounded-md border border-border1 hover:bg-gray-50">Next</button>
                    </div>
                </div>
            </div>

        </main>
    </div>
</MainLayout>
</template>

<style scoped>

</style>
