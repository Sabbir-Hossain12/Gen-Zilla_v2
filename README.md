
## Project Overview

**Gen-Zilla_v2** is an e-commerce application (grocery/general store, styled after "Shwapno") built as a **hybrid Laravel 11 + Vue 3 SPA**. A Blade-based admin panel coexists with a Vue 3 frontend that consumes a JSON API.

## Technology Stack

| Layer | Tech |
|---|---|
| Backend | Laravel 11, PHP 8.2 (`C:\Users\hsabb\.config\herd\bin\php.bat`) |
| Frontend | Vue 3 (`<script setup>`), Vue Router 4 (history), Pinia, Tailwind CSS v4, FontAwesome |
| Build | Vite 8 + `laravel-vite-plugin` + `@vitejs/plugin-vue` |
| DB | MySQL `genzilla_v2` (root, no password) + `database/genzilla_v2.sql` dump (~115 KB) |
| Packages | Sanctum, spatie/laravel-permission, yajra DataTables, intervention/image 3.7, anayarojo/shoppingcart, laravel/socialite, laravel-toastr, custom `app/Library/SslCommerz` |

## Architecture

```
Browser → Vue SPA (resources/js) → /api/v1/*  → Laravel JSON controllers
                        └─ /admin/*           → Blade admin panel (resources/views/backend)
```

- **SPA shell**: `resources/views/app.blade.php` mounts Vue via `@vite(['resources/js/style.css','resources/js/main.js'])`; `routes/web.php:83` catch-all returns `view('app')` for every path.
- **API**: `routes/api.php` under `api/v1` prefix. Guest endpoints (home, products, categories, search) + `auth:sanctum` group (cart, orders, profile, wishlist).
- **Admin**: `routes/admin.php` under `/admin`, guarded by `admin` middleware (`Auth::guard('admin')`).
- **Auth**: OTP login by Bangladeshi phone (`^01[0-9]{9}$`), OTP cached 5 min (`AuthController`), Sanctum token stored in `localStorage` and sent as Bearer.

## Data Model Highlights
`Product` has 1:1 `ProductDetail`, 1:n variant tables (`Color`, `Size`, `Weight`), belongsTo `Brand`/`Category`/`Subcategory`. `Order`→`OrderProduct`→(shelf items), `Customer` persisted per order, DB-backed `Cart` keyed by `user_id` (+ unused `session_token` for guests).

## Notable Issues Found

### Bugs
1. **`resources/js/stores/user.js:22`** — `computed(() => !!token.valueerscript)` → `isAuthenticated` is **always false** (typo).
2. **`OrderController::orderSubmit`** (`app/Http/Controllers/Frontend/Order/OrderController.php:76`) — `DeliveryCharge::where('id', ...)->first()->delivery_charge ?? 0` throws "property access on null" in PHP 8 when `delivery_id` is missing; the `??` doesn't protect a null object.
3. **Checkout.vue:40-41** — `delivery_id` and `subtotal` are captured as **non-reactive constants** at mount: `delivery_id` is always `1` and `subtotal` is `0` (sent before cart loads). Only `total` is reactive. So orders get wrong subtotal/delivery charge.
4. **cart.js:124** — `clearCart()` calls `axios.delete('/api/carts')` (wrong path + wrong verb; route is `POST /api/v1/carts/clear`) → 404.
5. **cart.js addItem** — when not logged in it shows "Please Log in" toast but does **not** stop, then hits a 401 unauthenticated request.
6. **api.php duplicates** — `/orders`, `/profile`, `/wishlists`, dashboard routes are registered twice; wishlists has both `DELETE /wishlists/{wishlist}` and `POST /wishlists/{wishlist}` for destroy.

### Pricing / Integrity
7. **Server trusts client pricing** — `OrderController::orderSubmit` records `subtotal`/`total` straight from the request instead of recomputing from cart rows → a tampered request can underpay.
8. **Coupon flow is dead** — checkout "Apply" does nothing; server reads `Session::get('coupon')`, but the API uses bearer tokens (no session) and no API sets a coupon.
9. **SSL Commerz unreachable** — server checks `payment_method == 'sslcommerzz'` (triple-z typo); UI only sends `cash`/`bkash`. `SSLCZ_STORE_ID/PASSWORD/TESTMODE` env vars are also unset in `.env`.

### Security
10. **OTP leaked in API response** (`AuthController::sendOtp` returns `'otp' => $otp`) and logged to `Log::info` — fine for dev, unsafe for production.
11. **No rate limiting** on `send-otp`/`verify-otp` (sanctum throttle not applied) → SMS/OTP brute-force surface.

### Dead / Leftover Code
12. `routes/web.php` — the entire old Blade frontend route file is commented out.
13. `AppServiceProvider` — view composers reference deleted `frontend.*` views, and `View::composer('*', ...)` runs `BasicInfo`/`ThemeColor` DB queries on **every** render (including the SPA shell).
14. `resources/js/app.js` + `resources/css/app.css` (Alpine bootstrap) still in `vite.config.js` input but unused by the SPA → wasted build chunks.
15. `app/Providers/testProvider.php` — empty provider, registered in `bootstrap/providers.php`.
16. `app.js` / `bootstrap.js` duplicate entries vs the real `main.js`; `VerifyCsrfToken` middleware file is obsolete (CSRF handled in `bootstrap/app.php`).
17. `routes/admin.php` — `/sliders` and `/banners` resources registered twice; several backend controllers (`DashboardController`) are mostly empty stubs.
18. Tests are stock Laravel scaffolds (Breeze `ProfileTest`, `Auth/*`) — zero coverage of the actual app.
19. **No role/permission middleware applied** on admin resource routes despite spatie being set up.

### Performance
20. Home/search endpoints load full variant sets with no pagination (`home`, `popularProducts`, `featuredProducts`, `hotProducts`, `search`); `header` loads all pages then slugs them in PHP.

## Summary

Solid scaffold for a Laravel+Vue e-commerce site with a working storefront (home, search, product variants, cart, checkout→order, OTP auth, wishlist, user dashboard) and a full Blade admin panel. The frontend migrated recently from Blade to Vue (see commits and `vue-laravel-setup-guide.md`), leaving dead code behind. **Highest-priority fixes**: the `user.js` getter typo, checkout stale subtotal/`delivery_id`, server-side price recomputation, and the api.php route duplicates.

Want me to turn any of these into an actionable fix plan (e.g., a prioritized bug-fix task list)?
