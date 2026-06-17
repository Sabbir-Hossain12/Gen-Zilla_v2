# Using Vue.js in Laravel 12/13 Projects — Setup & Troubleshooting Guide

A reference for integrating a Vue.js frontend into a Laravel project using the official Laravel Vite plugin, based on real issues encountered during a standalone-Vue-to-Laravel migration.

---

## 1. Recommended Project Structure

Laravel's Vite plugin expects your frontend code to live under `resources/`. A typical Vue + Laravel structure looks like this:

```
resources/
├── css/
│   └── app.css
├── js/
│   ├── app.js              ← Vue entry point
│   ├── App.vue              ← root component
│   ├── components/
│   ├── composable/          ← shared reactive logic (composables)
│   ├── data/
│   ├── layouts/
│   ├── pages/
│   ├── router/
│   └── stores/               ← Pinia stores
vite.config.js
package.json
```

There is no nested `src/` folder — Vue files sit directly inside `resources/js/`.

---

## 2. Installing Dependencies

```bash
npm install vue @vitejs/plugin-vue
npm install tailwindcss@latest @tailwindcss/vite@latest --save-dev
```

If you plan to use routing or state management:

```bash
npm install vue-router pinia
```

**Important:** Do not install Tailwind v3 packages (like `@tailwindcss/forms`) alongside Tailwind v4. Mixing versions causes dependency conflicts (see Troubleshooting section).

---

## 3. Configuring `vite.config.js`

This is the most error-prone part of the integration. A correct, complete config looks like this:

```js
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import tailwindcss from '@tailwindcss/vite';
import path from 'path';
import { fileURLToPath } from 'url';

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
        vue(),
        tailwindcss(),
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'resources/js'), // must be an ABSOLUTE path
        },
    },
});
```

### Key points

- **The `@` alias is not automatic in Laravel.** Standalone Vue/Vite projects set this up by default — Laravel does not. You must add it manually under `resolve.alias`.
- **Always use an absolute path** for the alias (`path.resolve(__dirname, 'resources/js')`), never a relative string like `'resources/js'`. Relative alias strings resolve inconsistently depending on which file is importing.
- **`__dirname` doesn't exist by default** in ESM-mode config files. If your `package.json` has `"type": "module"`, recreate it manually:
  ```js
  const __dirname = path.dirname(fileURLToPath(import.meta.url));
  ```
- **Vite config changes are never hot-reloaded.** After editing `vite.config.js`, fully stop the dev server (`Ctrl+C`) and run `npm run dev` again.

---

## 4. Configuring Tailwind CSS v4

Tailwind v4 changed its setup significantly from v3. There is no `tailwind.config.js` or `postcss.config.js` needed when using the Vite plugin.

### `resources/css/app.css`

```css
@import "tailwindcss";

@theme {
    --color-primary: #df0000;
    --color-secondary: #e5e7eb;
}

@layer base {
    body {
        font-family: 'Rubik', sans-serif;
    }
}

@layer components {
    .active-button-tab {
        @apply px-3 py-1 bg-yellow rounded-full shadow-sm text-sm font-semibold cursor-pointer;
    }
}

@layer utilities {
    .text-black {
        @apply text-[#222222];
    }
}
```

### Critical rule — delete `postcss.config.js`

If a `postcss.config.js` file exists in your project (often leftover from a Laravel starter kit or an old Tailwind v3 setup), **delete it**. Tailwind v4 with `@tailwindcss/vite` does not use PostCSS — having both active at once causes Vite to try to parse Tailwind's JS files as CSS, producing errors like:

```
[postcss] postcss-import: ...tailwindcss\lib\index.js:1:1: Unknown word "use strict"
```

```bash
rm postcss.config.js   # macOS/Linux
del postcss.config.js  # Windows
```

### Critical rule — never mix Tailwind v3 and v4 packages

Run `npm list tailwindcss` to check for duplicate versions:

```
+-- @tailwindcss/forms@0.5.7
|   `-- tailwindcss@3.4.19 deduped   ← v3, conflicting
+-- @tailwindcss/vite@4.3.1
|   `-- tailwindcss@4.3.1            ← v4, correct
`-- tailwindcss@3.4.19               ← v3, conflicting
```

Plugins built for v3 (like `@tailwindcss/forms`) are **not compatible** with v4 and will pull the old `tailwindcss@3.x` package back into `node_modules`, causing resolution conflicts.

**Fix:**

```bash
npm uninstall tailwindcss @tailwindcss/forms
npm install tailwindcss@latest @tailwindcss/vite@latest --save-dev
```

If you need form styling resets in v4, use the CSS-based plugin import instead of the old JS plugin:

```css
@import "tailwindcss";
@plugin "@tailwindcss/forms";
```

---

## 5. Understanding `tailwindcss` vs `@tailwindcss/vite`

These are two different packages that work together, not alternatives:

| Package | Role |
|---|---|
| `tailwindcss` | The core engine — compiles your utility classes, processes `@theme`/`@layer` |
| `@tailwindcss/vite` | The Vite integration — plugs the engine into Vite's build pipeline so no PostCSS is needed |

`@tailwindcss/vite` depends on `tailwindcss` internally, but you should still install both directly as `devDependencies` for reliable resolution.

---

## 6. Blade Entry Point

In your main Blade layout (e.g. `resources/views/app.blade.php`):

```blade
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body>
    <div id="app"></div>
</body>
</html>
```

In `resources/js/app.js`:

```js
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia'
import './bootstrap'
import '../css/app.css'

const app = createApp(App)
app.use(router)
app.use(createPinia())
app.mount('#app')
```

---

## 7. Running the Dev Server

```bash
npm run dev      # starts Vite dev server with HMR
php artisan serve  # serves Laravel at http://127.0.0.1:8000
```

Both need to run simultaneously during development — Laravel serves the Blade shell and API routes, Vite serves the compiled/hot-reloaded Vue assets.

---

## 8. Troubleshooting Checklist

When the dev server throws import or CSS errors after merging a Vue project into Laravel, check in this order:

1. **`Failed to resolve import "@/..."`**
   → The `@` alias is missing, misconfigured, or set as a relative (not absolute) path in `vite.config.js`. See Section 3.

2. **`Can't resolve 'tailwindcss'` or PostCSS parsing JS as CSS**
   → Run `npm list tailwindcss`. If both v3 and v4 appear, uninstall v3 and any v3-only plugins (`@tailwindcss/forms`), then reinstall v4 cleanly. Delete `postcss.config.js` if present. See Section 4.

3. **`vite.config.js.timestamp-*.mjs` files piling up**
   → Harmless temporary cache files Vite generates on each dev server start. Safe to delete; add to `.gitignore`:
   ```
   vite.config.js.timestamp-*
   ```

4. **`Unresolved variable __dirname` warning in editor**
   → Cosmetic IDE warning if your `vite.config.js` runs in ESM mode. Recreate `__dirname` manually with `fileURLToPath` (see Section 3), or use a plain string path without `path.resolve`.

5. **Config changes not taking effect**
   → Fully stop (`Ctrl+C`) and restart `npm run dev`. Vite config files are never hot-reloaded.

---

## 9. Quick Reference — Full Restart Sequence

When things break after a config change, run this sequence:

```bash
# 1. Remove conflicting/legacy config
del postcss.config.js          # if it exists and you're on Tailwind v4

# 2. Clean Vite's temp cache files
del vite.config.js.timestamp-*

# 3. Verify package versions
npm list tailwindcss @tailwindcss/vite

# 4. Reinstall if conflicts found
npm uninstall tailwindcss @tailwindcss/forms
npm install tailwindcss@latest @tailwindcss/vite@latest --save-dev

# 5. Fully restart dev server
npm run dev
```

---

## 10. Cart/State Management Note (Laravel Blade vs Vue)

When migrating cart or similar stateful UI from Blade (even Blade + Ajax) to Vue:

- **Blade + Ajax**: state lives server-side (session/DB); UI waits for server response before updating.
- **Vue + Pinia**: state lives client-side in JS memory; UI updates instantly (optimistic UI), then syncs to the server in the background via API calls.
- For guest users, persist cart state to `localStorage` using a Pinia plugin (`pinia-plugin-persistedstate`).
- For logged-in users, sync Pinia state to a Laravel API endpoint so the cart persists across devices.

