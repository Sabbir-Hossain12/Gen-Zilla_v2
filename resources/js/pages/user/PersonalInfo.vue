<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
import {useUser} from "@/stores/user";
import {onMounted, reactive, ref} from "vue";
import { Toast } from "toaster-js";

const user = useUser();
const savingProfile = ref(false);
const savingPassword = ref(false);

const profileForm = reactive({
    name: "",
    phone: "",
    email: "",
});

const passwordForm = reactive({
    current_password: "",
    new_password: "",
    new_password_confirmation: "",
});

async function submitProfile() {
    savingProfile.value = true;
    try {
        await user.updateProfile(profileForm);
        new Toast("Profile updated successfully", Toast.TYPE_SUCCESS);
    } catch (err) {
        new Toast(err?.response?.data?.message || "Failed to update profile", Toast.TYPE_WARNING);
    } finally {
        savingProfile.value = false;
    }
}

async function submitPassword() {
    if (passwordForm.new_password !== passwordForm.new_password_confirmation) {
        new Toast("New password and confirmation do not match", Toast.TYPE_WARNING);
        return;
    }
    savingPassword.value = true;
    try {
        await user.updatePassword(passwordForm);
        new Toast("Password updated successfully", Toast.TYPE_SUCCESS);
        passwordForm.current_password = "";
        passwordForm.new_password = "";
        passwordForm.new_password_confirmation = "";
    } catch (err) {
        new Toast(err?.response?.data?.message || "Failed to update password", Toast.TYPE_WARNING);
    } finally {
        savingPassword.value = false;
    }
}

onMounted(async () => {
    try {
        await user.fetchProfile();
        profileForm.name = user.profile?.name || "";
        profileForm.phone = user.profile?.phone || "";
        profileForm.email = user.profile?.email || "";
    } catch (err) {
        console.error("Failed to load profile", err);
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
                <h1 class="text-2xl font-bold text-dark1">Personal Info</h1>
                <p class="text-gray-500 mt-1">Update your account details below.</p>
            </div>

            <!-- Profile form -->
            <form @submit.prevent="submitProfile" class="bg-white rounded-lg border border-border1 shadow-sm p-6 space-y-5">
                <h2 class="font-semibold text-dark1">Profile Details</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Full Name</label>
                        <input type="text" v-model="profileForm.name" required class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Phone</label>
                        <input type="text" v-model="profileForm.phone" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Email Address</label>
                        <input type="email" v-model="profileForm.email" required class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                </div>
                <div class="pt-2">
                    <button type="submit" :disabled="savingProfile" class="bg-primary text-white font-semibold px-6 py-2.5 rounded-md hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary/40 cursor-pointer">
                        {{ savingProfile ? "Saving..." : "Save Changes" }}
                    </button>
                </div>
            </form>

            <!-- Password form -->
            <form @submit.prevent="submitPassword" class="bg-white rounded-lg border border-border1 shadow-sm p-6 space-y-5">
                <h2 class="font-semibold text-dark1">Change Password</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div class="sm:col-span-2">
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Current Password</label>
                        <input type="password" v-model="passwordForm.current_password" required class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">New Password</label>
                        <input type="password" v-model="passwordForm.new_password" required minlength="8" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Confirm New Password</label>
                        <input type="password" v-model="passwordForm.new_password_confirmation" required minlength="8" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                </div>
                <div class="pt-2">
                    <button type="submit" :disabled="savingPassword" class="bg-primary text-white font-semibold px-6 py-2.5 rounded-md hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary/40 cursor-pointer">
                        {{ savingPassword ? "Updating..." : "Update Password" }}
                    </button>
                </div>
            </form>

        </main>
    </div>
</MainLayout>
</template>

<style scoped>

</style>
