<script setup>

import DashboardSidebar from "@/components/DashboardSidebar.vue";
import MainLayout from "@/layouts/MainLayout.vue";
</script>

<template>
    <MainLayout>
        <div class="max-w-6xl mx-auto px-4 py-8 flex flex-col md:flex-row gap-6">

            <!-- Sidebar -->
            <DashboardSidebar></DashboardSidebar>

            <!-- Main content -->
            <main class="flex-1 space-y-6">

                <div class="bg-white rounded-lg border border-border1 shadow-sm p-6">
                    <h1 class="text-2xl font-bold text-dark1">My Wishlist</h1>
                    <p class="text-gray-500 mt-1">Items you've saved for later.</p>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">

                    <!-- Item -->
                    <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden flex flex-col">
                        <img src="https://placehold.co/400x300/e8eaed/31281e?text=Product" alt="Product"
                             class="w-full h-40 object-cover"/>
                        <div class="p-4 flex-1 flex flex-col gap-2">
                            <h3 class="font-semibold text-dark1">Cotton Summer Shirt</h3>
                            <p class="text-xs text-gray-500">Color: Sky Blue · Size: M</p>
                            <p class="text-primary font-bold mt-1">৳1,290</p>
                            <div class="mt-auto flex gap-2 pt-2">
                                <button
                                    class="flex-1 bg-primary text-white text-sm font-medium py-2 rounded-md hover:bg-primary/90">
                                    Add to Cart
                                </button>
                                <button class="p-2 border border-border1 rounded-md hover:bg-gray-50" title="Remove">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-danger"
                                         viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M6 7h12l-1 14H7L6 7zm3-4h6l1 2H8l1-2zM4 5h16v2H4V5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden flex flex-col">
                        <img src="https://placehold.co/400x300/e8eaed/31281e?text=Product" alt="Product"
                             class="w-full h-40 object-cover"/>
                        <div class="p-4 flex-1 flex flex-col gap-2">
                            <h3 class="font-semibold text-dark1">Leather Wallet</h3>
                            <p class="text-xs text-gray-500">Color: Brown</p>
                            <p class="text-primary font-bold mt-1">৳850</p>
                            <div class="mt-auto flex gap-2 pt-2">
                                <button
                                    class="flex-1 bg-primary text-white text-sm font-medium py-2 rounded-md hover:bg-primary/90">
                                    Add to Cart
                                </button>
                                <button class="p-2 border border-border1 rounded-md hover:bg-gray-50" title="Remove">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-danger"
                                         viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M6 7h12l-1 14H7L6 7zm3-4h6l1 2H8l1-2zM4 5h16v2H4V5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden flex flex-col">
                        <img src="https://placehold.co/400x300/e8eaed/31281e?text=Product" alt="Product"
                             class="w-full h-40 object-cover"/>
                        <div class="p-4 flex-1 flex flex-col gap-2">
                            <h3 class="font-semibold text-dark1">Wireless Earbuds</h3>
                            <p class="text-xs text-gray-500">Color: Black</p>
                            <p class="text-primary font-bold mt-1">৳3,500</p>
                            <div class="mt-auto flex gap-2 pt-2">
                                <button
                                    class="flex-1 bg-primary text-white text-sm font-medium py-2 rounded-md hover:bg-primary/90">
                                    Add to Cart
                                </button>
                                <button class="p-2 border border-border1 rounded-md hover:bg-gray-50" title="Remove">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-danger"
                                         viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M6 7h12l-1 14H7L6 7zm3-4h6l1 2H8l1-2zM4 5h16v2H4V5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden flex flex-col">
                        <img src="https://placehold.co/400x300/e8eaed/31281e?text=Product" alt="Product"
                             class="w-full h-40 object-cover"/>
                        <div class="p-4 flex-1 flex flex-col gap-2">
                            <h3 class="font-semibold text-dark1">Running Shoes</h3>
                            <p class="text-xs text-gray-500">Color: Grey · Size: 42</p>
                            <p class="text-primary font-bold mt-1">৳2,990</p>
                            <div class="mt-auto flex gap-2 pt-2">
                                <button
                                    class="flex-1 bg-primary text-white text-sm font-medium py-2 rounded-md hover:bg-primary/90">
                                    Add to Cart
                                </button>
                                <button class="p-2 border border-border1 rounded-md hover:bg-gray-50" title="Remove">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-danger"
                                         viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M6 7h12l-1 14H7L6 7zm3-4h6l1 2H8l1-2zM4 5h16v2H4V5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Item -->
                    <div class="bg-white rounded-lg border border-border1 shadow-sm overflow-hidden flex flex-col">
                        <img src="https://placehold.co/400x300/e8eaed/31281e?text=Product" alt="Product"
                             class="w-full h-40 object-cover"/>
                        <div class="p-4 flex-1 flex flex-col gap-2">
                            <h3 class="font-semibold text-dark1">Ceramic Mug Set</h3>
                            <p class="text-xs text-gray-500">Color: White</p>
                            <p class="text-primary font-bold mt-1">৳650</p>
                            <div class="mt-auto flex gap-2 pt-2">
                                <button
                                    class="flex-1 bg-primary text-white text-sm font-medium py-2 rounded-md hover:bg-primary/90">
                                    Add to Cart
                                </button>
                                <button class="p-2 border border-border1 rounded-md hover:bg-gray-50" title="Remove">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-danger"
                                         viewBox="0 0 24 24" fill="currentColor">
                                        <path d="M6 7h12l-1 14H7L6 7zm3-4h6l1 2H8l1-2zM4 5h16v2H4V5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>

            </main>
        </div>
    </MainLayout>
</template>

<style scoped>

</style>
