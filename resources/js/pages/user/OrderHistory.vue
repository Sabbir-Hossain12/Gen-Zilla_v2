<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
import OrderSummaryModal from "@/components/OrderSummaryModal.vue";
import {useUser} from "@/stores/user";
import {onMounted, ref} from "vue";
import {formatPrice} from "@/utils/price";

const user = useUser();
const activeStatus = ref('All');

const showOrderModal = ref(false);
const selectedInvoiceId = ref(null);
const selectedOrderData = ref(null);

function viewOrder(order) {
    selectedOrderData.value = order;
    selectedInvoiceId.value = order.invoiceID || order.id;
    showOrderModal.value = true;
}

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
                        class="border border-border1 rounded-md px-3 py-2 text-sm text-dark1 focus:outline-none focus:border-primary">
                    <option>All</option>
                    <option>Pending</option>
                    <option>Processing</option>
                    <option>Shipped</option>
                    <option>Delivered</option>
                    <option>Cancelled</option>
                </select>
            </div>

            <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden">
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
                        <tr v-if="!user.orders || user.orders.length === 0">
                            <td colspan="6" class="px-6 py-8 text-center text-gray-500">No orders found.</td>
                        </tr>
                        <tr v-for="order in user.orders" :key="order.id">
                            <td class="px-6 py-4 font-medium">{{ order.invoiceID || '#' + order.id }}</td>
                            <td class="px-6 py-4 text-gray-500">{{ order.order_date || new Date(order.created_at).toLocaleDateString() }}</td>
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

                <!-- Pagination -->
                <div v-if="user.orderMeta && user.orderMeta.last_page > 1" class="px-6 py-4 border-t border-border1 flex items-center justify-between text-sm text-gray-500">
                    <span>Showing {{ user.orderMeta.from }}-{{ user.orderMeta.to }} of {{ user.orderMeta.total }} orders</span>
                    <div class="flex gap-1">
                        <button v-for="page in user.orderMeta.last_page" :key="page"
                                @click="user.fetchOrderHistory({ page, perPage: 10, status: activeStatus })"
                                :class="page === user.orderMeta.current_page ? 'bg-primary text-white' : 'border border-border1 hover:bg-gray-50'"
                                class="px-3 py-1.5 rounded-md cursor-pointer">
                            {{ page }}
                        </button>
                    </div>
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
