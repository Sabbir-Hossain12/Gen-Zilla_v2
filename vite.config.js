import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import path from 'path';
import { fileURLToPath } from 'url';
import tailwindcss from '@tailwindcss/vite'
import {devtools} from "vue";
import vueDevTools from 'vite-plugin-vue-devtools'


const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/js/app.js',
            ],
            refresh: true,
        }),
        vue(),vueDevTools(),
        tailwindcss(),

    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'resources/js'),  // ✅ absolute path
        },
    },
});
