<script setup>

import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
</script>

<template>
<MainLayout>
    <div class="max-w-6xl mx-auto px-4 py-8 flex flex-col md:flex-row gap-6">

        <!-- Sidebar -->
        <DashboardSidebar></DashboardSidebar>

        <!-- Main content -->
        <main class="flex-1 space-y-6">

            <div class="bg-white rounded-lg border border-border1 shadow-sm p-6">
                <h1 class="text-2xl font-bold text-dark1">Personal Info</h1>
                <p class="text-gray-500 mt-1">Update your account details below.</p>
            </div>

            <!-- Profile form -->
            <form class="bg-white rounded-lg border border-border1 shadow-sm p-6 space-y-5">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Full Name</label>
                        <input type="text" value="Sadia Islam" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Phone</label>
                        <input type="text" value="+880 1712-345678" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Email Address</label>
                        <input type="email" value="sadia.islam@example.com" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                        <p class="text-xs text-gray-500 mt-1">Verified</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Account Status</label>
                        <input type="text" value="Active" disabled class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm bg-gray-50 text-gray-500" />
                    </div>
                </div>

                <div class="pt-2">
                    <button type="submit" class="bg-primary text-white font-semibold px-6 py-2.5 rounded-md hover:bg-primary/90">Save Changes</button>
                </div>
            </form>

            <!-- Password -->
            <form class="bg-white rounded-lg border border-border1 shadow-sm p-6 space-y-5">
                <h2 class="font-semibold text-dark1">Change Password</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Current Password</label>
                        <input type="password" placeholder="••••••••" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div></div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">New Password</label>
                        <input type="password" placeholder="••••••••" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Confirm New Password</label>
                        <input type="password" placeholder="••••••••" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                </div>
                <div class="pt-2">
                    <button type="submit" class="border border-primary text-primary font-semibold px-6 py-2.5 rounded-md hover:bg-amber">Update Password</button>
                </div>
            </form>

        </main>
    </div>
</MainLayout>
</template>

<style scoped>

</style>
