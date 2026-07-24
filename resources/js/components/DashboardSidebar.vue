<script setup>

</script>

<template>
    <aside class="md:w-72 shrink-0">
        <nav class="bg-white rounded-lg border border-border1 shadow-sm divide-y divide-border1 overflow-hidden">
            <RouterLink to="/dashboard" class="flex items-center gap-3 px-5 py-4 text-dark1 hover:bg-gray-50 font-medium">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-primary" viewBox="0 0 24 24" fill="currentColor"><path d="M12 3 2 12h3v8h6v-6h2v6h6v-8h3z"/></svg>
                Dashboard
            </RouterLink>
            <RouterLink to="/order-history" class="flex items-center gap-3 px-5 py-4 text-dark1 hover:bg-gray-50 font-medium">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-primary" viewBox="0 0 24 24" fill="currentColor"><path d="M6 2h12a1 1 0 0 1 1 1v18l-2-1-2 1-2-1-2 1-2-1-2 1-2-1V3a1 1 0 0 1 1-1zm2 5h8v2H8V7zm0 4h8v2H8v-2z"/></svg>
                Order History
            </RouterLink>
            <RouterLink to="/personal-info" class="flex items-center gap-3 px-5 py-4 text-dark1 hover:bg-gray-50 font-medium">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-primary" viewBox="0 0 24 24" fill="currentColor"><path d="M12 12a5 5 0 1 0-5-5 5 5 0 0 0 5 5zm0 2c-4 0-8 2-8 5v2h16v-2c0-3-4-5-8-5z"/></svg>
                Personal Info
            </RouterLink>
            <RouterLink to="/wishlist" class="flex items-center gap-3 px-5 py-4 bg-amber text-primary font-semibold">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor"><path d="M12 21s-7.5-4.6-10-9C.3 8.5 2 4 6 4c2.1 0 3.6 1.1 4.5 2.2C11.4 5.1 12.9 4 15 4c4 0 5.7 4.5 4 8-2.5 4.4-10 9-10 9z"/></svg>
                Wishlist
            </RouterLink>
            <a href="#" class="flex items-center gap-3 px-5 py-4 text-dark1 hover:bg-gray-50 font-medium">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-primary" viewBox="0 0 24 24" fill="currentColor"><path d="M10 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h5v-2H5V5h5V3zm9 9-4-4v3H9v2h6v3l4-4z"/></svg>
                Logout
            </a>
        </nav>
    </aside>
</template>

<style scoped>

</style>
