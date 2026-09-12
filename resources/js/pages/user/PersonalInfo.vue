<script setup>
import MainLayout from "@/layouts/MainLayout.vue";
import DashboardSidebar from "@/components/DashboardSidebar.vue";
import {useUser} from "@/stores/user";
import {onMounted, reactive, ref} from "vue";
import ToasterUi from "toaster-ui";

const user = useUser();
const toaster = new ToasterUi();
const saving = ref(false);

const form = reactive({
    name: "",
    phone: "",
    email: "",
});

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
    saving.value = true;
    try {
        await user.updateProfile(form);
        toaster.addToast("Profile updated successfully", "success", {duration: 4000});
        Object.assign(form, {
            name: user.profile?.name || "",
            phone: user.profile?.phone || "",
            email: user.profile?.email || "",
        });
    } catch (err) {
        toaster.addToast(err?.response?.data?.message || "Failed to update profile", "danger", {duration: 4000});
    } finally {
        saving.value = false;
    }
}

async function submitPassword() {
    if (passwordForm.new_password !== passwordForm.new_password_confirmation) {
        toaster.addToast("New password and confirmation do not match", "danger", {duration: 4000});
        return;
    }
    saving.value = true;
    try {
        await user.updatePassword(passwordForm);
        toaster.addToast("Password updated successfully", "success", {duration: 4000});
        passwordForm.current_password = "";
        passwordForm.new_password = "";
        passwordForm.new_password_confirmation = "";
    } catch (err) {
        toaster.addToast(err?.response?.data?.message || "Failed to update password", "danger", {duration: 4000});
    } finally {
        saving.value = false;
    }
}

onMounted(async () => {
    try {
        await user.fetchProfile();
        Object.assign(profileForm, {
            name: user.profile?.name || "",
            phone: user.profile?.phone || "",
            email: user.profile?.email || "",
        });
        Object.assign(form, {
            current_password: "",
            new_password: "",
            new_password_confirmation: "",
        });
    } catch (err) {
        toaster.addToast("Failed to load profile", "danger", {duration: 4000});
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
                        <input type="text" v-model="profileForm.name" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Phone</label>
                        <input type="text" v-model="profileForm.phone" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Email Address</label>
                        <input type="email" v-model="profileForm.email" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                        <p class="text-xs text-gray-500 mt-1">Verified</p>
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Account Status</label>
                        <input type="text" value="Active" disabled class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm bg-gray-50 text-gray-500" />
                    </div>
                </div>
                <div class="pt-2">
                    <button type="submit" :disabled="saving" class="bg-primary text-white font-semibold px-6 py-2.5 rounded-md hover:bg-primary/90 focus:outline-none focus:ring-2 focus:ring-primary/40">
                        {{ saving ? "Saving..." : "Save Changes" }}
                    </button>
                </div>
            </form>

            <!-- Password form -->
            <form @submit.prevent="submitPassword" class="bg-white rounded-lg border border-border1 shadow-sm p-6 space-y-5">
                <h2 class="font-semibold text-dark1">Change Password</h2>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div class="sm:col-span-2">
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Current Password</label>
                        <input type="password" v-model="passwordForm.current_password" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">New Password</label>
                        <input type="password" v-model="passwordForm.new_password" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-dark1 mb-1.5">Confirm New Password</label>
                        <input type="password" v-model="passwordForm.new_password_confirmation" class="w-full border border-border1 rounded-md px-3 py-2.5 text-sm focus:outline-none focus:ring-2 focus:ring-primary/40 focus:border-primary" />
                    </div>
                </div>
                <div class="pt-2">
                    <button type="submit" :disabled="saving" class="border border-primary text-primary font-semibold px-6 py-2.5 rounded-md hover:bg-amber focus:outline-none focus:ring-2 focus:ring-primary/40">
                        {{ saving ? "Updating..." : "Update Password" }}
                    </button>
                </div>
            </form>

        </main>
    </div>
</MainLayout>
</template>

<style scoped>

</style>
