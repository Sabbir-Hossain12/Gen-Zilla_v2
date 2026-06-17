<script setup>

import MainLayout from "@/layouts/MainLayout.vue";
</script>

<template>
  <MainLayout>
    <!-- Progress Steps -->
    <div class="max-w-7xl mx-auto px-4 pt-4 pb-2">
      <div class="flex items-center gap-0 max-w-sm">
        <div class="flex items-center gap-2">
          <div class="w-7 h-7 rounded-full bg-green-500 text-white flex items-center justify-center text-xs">
            <i class="fa-solid fa-check text-[10px]"></i>
          </div>
          <span class="text-sm font-semibold text-green-500">Cart</span>
        </div>
        <div class="flex-1 h-[2px] bg-green-500 mx-3"></div>
        <div class="flex items-center gap-2">
          <div class="w-7 h-7 rounded-full bg-green-500 text-white flex items-center justify-center text-xs">
            <i class="fa-solid fa-check text-[10px]"></i>
          </div>
          <span class="text-sm font-semibold text-green-500">Checkout</span>
        </div>
        <div class="flex-1 h-[2px] bg-green-500 mx-3"></div>
        <div class="flex items-center gap-2">
          <div class="w-7 h-7 rounded-full bg-green-500 text-white flex items-center justify-center text-xs">
            <i class="fa-solid fa-check text-[10px]"></i>
          </div>
          <span class="text-sm font-semibold text-green-500">Confirmed</span>
        </div>
      </div>
    </div>

    <div class="max-w-4xl mx-auto px-4 pb-12 pt-4">

      <!-- Success Banner -->
      <div
          class="bg-white border border-gray-100 rounded-2xl p-8 flex flex-col items-center text-center mb-6 shadow-sm">
        <div class="w-20 h-20 rounded-full bg-green-100 flex items-center justify-center mb-4">
          <i class="fa-solid fa-circle-check text-green-500 text-4xl"></i>
        </div>
        <h1 class="text-2xl font-bold text-gray-800 mb-1">Order Placed Successfully!</h1>
        <p class="text-gray-500 text-sm max-w-md">Thank you for shopping with ShopBD. Your order has been confirmed and
          is being prepared for delivery.</p>

        <div class="flex items-center gap-2 mt-4 bg-gray-50 border border-gray-100 rounded-full px-5 py-2">
          <span class="text-sm text-gray-500">Order ID:</span>
          <span class="text-sm font-bold text-gray-800">#SBD-20250609-4821</span>
          <button onclick="navigator.clipboard.writeText('SBD-20250609-4821')"
                  class="text-[#E8312A] hover:text-[#C4251F] text-xs ml-1">
            <i class="fa-regular fa-copy"></i>
          </button>
        </div>

        <div class="flex items-center gap-1.5 mt-3 text-xs text-gray-400">
          <i class="fa-regular fa-clock"></i>
          <span>Placed on Tuesday, 09 June 2026 at 3:45 PM</span>
        </div>
      </div>

      <!-- Delivery Status Tracker -->
      <div class="bg-white border border-gray-100 rounded-xl p-5 mb-6">
        <h2 class="text-base font-bold text-gray-800 mb-5">Order Status</h2>
        <div class="flex items-start justify-between relative">

          <!-- Line behind steps -->
          <div class="absolute top-4 left-0 right-0 h-[2px] bg-gray-100 z-0 mx-8"></div>
          <div class="absolute top-4 left-0 h-[2px] bg-green-500 z-0" style="width: 12%"></div>

          <!-- Step 1: Confirmed -->
          <div class="flex flex-col items-center gap-2 z-10 flex-1">
            <div class="w-8 h-8 rounded-full bg-green-500 text-white flex items-center justify-center">
              <i class="fa-solid fa-check text-xs"></i>
            </div>
            <p class="text-xs font-semibold text-green-600 text-center">Confirmed</p>
            <p class="text-[10px] text-gray-400 text-center">3:45 PM</p>
          </div>

          <!-- Step 2: Processing -->
          <div class="flex flex-col items-center gap-2 z-10 flex-1">
            <div class="w-8 h-8 rounded-full bg-[#F5C518] text-black flex items-center justify-center animate-pulse">
              <i class="fa-solid fa-box text-xs"></i>
            </div>
            <p class="text-xs font-semibold text-[#E8312A] text-center">Processing</p>
            <p class="text-[10px] text-gray-400 text-center">In progress</p>
          </div>

          <!-- Step 3: Picked Up -->
          <div class="flex flex-col items-center gap-2 z-10 flex-1">
            <div class="w-8 h-8 rounded-full bg-gray-100 text-gray-400 flex items-center justify-center">
              <i class="fa-solid fa-bag-shopping text-xs"></i>
            </div>
            <p class="text-xs font-semibold text-gray-400 text-center">Picked Up</p>
            <p class="text-[10px] text-gray-400 text-center">Pending</p>
          </div>

          <!-- Step 4: On the Way -->
          <div class="flex flex-col items-center gap-2 z-10 flex-1">
            <div class="w-8 h-8 rounded-full bg-gray-100 text-gray-400 flex items-center justify-center">
              <i class="fa-solid fa-truck text-xs"></i>
            </div>
            <p class="text-xs font-semibold text-gray-400 text-center">On the Way</p>
            <p class="text-[10px] text-gray-400 text-center">Pending</p>
          </div>

          <!-- Step 5: Delivered -->
          <div class="flex flex-col items-center gap-2 z-10 flex-1">
            <div class="w-8 h-8 rounded-full bg-gray-100 text-gray-400 flex items-center justify-center">
              <i class="fa-solid fa-house text-xs"></i>
            </div>
            <p class="text-xs font-semibold text-gray-400 text-center">Delivered</p>
            <p class="text-[10px] text-gray-400 text-center">Pending</p>
          </div>

        </div>

        <div class="mt-5 flex items-center gap-2 bg-yellow-50 border border-yellow-100 rounded-lg px-4 py-2.5">
          <i class="fa-solid fa-clock text-[#E8312A] text-sm"></i>
          <p class="text-sm text-gray-700">Estimated delivery: <span class="font-bold text-[#E8312A]">Today, 5:45 PM — 6:45 PM</span>
          </p>
        </div>
      </div>

      <!-- Two column: Items + Details -->
      <div class="grid grid-cols-1 md:grid-cols-12 gap-6">

        <!-- Order Items -->
        <div class="md:col-span-7 bg-white border border-gray-100 rounded-xl p-5">
          <h2 class="text-base font-bold text-gray-800 mb-4">Items Ordered</h2>

          <div class="flex flex-col divide-y divide-gray-100">

            <div class="flex items-center gap-3 py-3">
              <div class="relative shrink-0">
                <img
                    src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65fa961e115075f231ecce6b_Radhuni-Shadmishali-Seasoning-Mixed-96gm_1_415.webp"
                    class="w-14 h-14 object-contain border border-gray-100 rounded-md" alt=""/>
                <span
                    class="absolute -top-1.5 -right-1.5 w-5 h-5 rounded-full bg-[#E8312A] text-white text-[10px] font-bold flex items-center justify-center">1</span>
              </div>
              <div class="flex-1 min-w-0">
                <p class="text-sm font-semibold text-gray-800 truncate">ACI Pure Puffed Rice 500gm</p>
                <p class="text-xs text-gray-400 mt-0.5">Per Piece · SKU: 2812693</p>
              </div>
              <div class="text-right shrink-0">
                <p class="text-sm font-bold text-[#E8312A]">৳75</p>
                <p class="text-xs text-gray-400">Qty: 1</p>
              </div>
            </div>

            <div class="flex items-center gap-3 py-3">
              <div class="relative shrink-0">
                <img
                    src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/67c02190656b9dabf0b44640_2819508_1_80.webp"
                    class="w-14 h-14 object-contain border border-gray-100 rounded-md" alt=""/>
                <span
                    class="absolute -top-1.5 -right-1.5 w-5 h-5 rounded-full bg-[#E8312A] text-white text-[10px] font-bold flex items-center justify-center">2</span>
              </div>
              <div class="flex-1 min-w-0">
                <p class="text-sm font-semibold text-gray-800 truncate">Wow! Masala Instant Noodles 496gm</p>
                <p class="text-xs text-gray-400 mt-0.5">Per Piece · SKU: 2819508</p>
              </div>
              <div class="text-right shrink-0">
                <p class="text-sm font-bold text-[#E8312A]">৳198</p>
                <p class="text-xs text-gray-400">Qty: 2</p>
              </div>
            </div>

            <div class="flex items-center gap-3 py-3">
              <div class="relative shrink-0">
                <img
                    src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/692ed719d5287d4d62f634cb_Supermom-Baby-Diaper-Medium-50Pcs_1_80.webp"
                    class="w-14 h-14 object-contain border border-gray-100 rounded-md" alt=""/>
                <span
                    class="absolute -top-1.5 -right-1.5 w-5 h-5 rounded-full bg-[#E8312A] text-white text-[10px] font-bold flex items-center justify-center">1</span>
              </div>
              <div class="flex-1 min-w-0">
                <p class="text-sm font-semibold text-gray-800 truncate">Supermom Baby Diaper Medium 50Pcs</p>
                <p class="text-xs text-gray-400 mt-0.5">Per Pack · SKU: 692ed719</p>
              </div>
              <div class="text-right shrink-0">
                <p class="text-sm font-bold text-[#E8312A]">৳1,500</p>
                <p class="text-xs text-gray-400">Qty: 1</p>
              </div>
            </div>
          </div>

          <!-- Price Summary -->
          <div class="mt-4 flex flex-col gap-2 border-t border-gray-100 pt-4">
            <div class="flex justify-between text-sm text-gray-600">
              <span>Subtotal (4 items)</span>
              <span class="font-medium">৳1,773</span>
            </div>
            <div class="flex justify-between text-sm text-gray-600">
              <span>Delivery Charge</span>
              <span class="font-medium">৳60</span>
            </div>
            <div class="flex justify-between text-sm text-green-600">
              <span>Discount</span>
              <span class="font-medium">− ৳76</span>
            </div>
            <div class="flex justify-between items-center pt-2 border-t border-gray-100 mt-1">
              <span class="text-base font-bold text-gray-800">Total Paid</span>
              <span class="text-xl font-bold text-[#E8312A]">৳1,757</span>
            </div>
          </div>

          <!-- Savings -->
          <div class="mt-3 flex items-center gap-1.5 bg-green-50 border border-green-100 rounded-md px-3 py-2">
            <i class="fa-solid fa-tag text-green-600 text-xs"></i>
            <span class="text-xs text-green-700 font-semibold">You saved ৳76 on this order!</span>
          </div>
        </div>

        <!-- Right: Delivery + Payment + Actions -->
        <div class="md:col-span-5 flex flex-col gap-5">

          <!-- Delivery Details -->
          <div class="bg-white border border-gray-100 rounded-xl p-5">
            <h2 class="text-base font-bold text-gray-800 mb-4">Delivery Details</h2>
            <div class="flex flex-col gap-3 text-sm">
              <div class="flex items-start gap-3">
                <i class="fa-solid fa-user text-gray-400 w-4 mt-0.5 text-center"></i>
                <div>
                  <p class="text-xs text-gray-400 mb-0.5">Recipient</p>
                  <p class="font-semibold text-gray-800">Md. Rahim Uddin</p>
                </div>
              </div>
              <div class="flex items-start gap-3">
                <i class="fa-solid fa-phone text-gray-400 w-4 mt-0.5 text-center"></i>
                <div>
                  <p class="text-xs text-gray-400 mb-0.5">Phone</p>
                  <p class="font-semibold text-gray-800">+880 1712-345678</p>
                </div>
              </div>
              <div class="flex items-start gap-3">
                <i class="fa-solid fa-location-dot text-gray-400 w-4 mt-0.5 text-center"></i>
                <div>
                  <p class="text-xs text-gray-400 mb-0.5">Address</p>
                  <p class="font-semibold text-gray-800">House 12, Road 5, Block C</p>
                  <p class="text-gray-500 text-xs">Gulshan-1, Dhaka 1212</p>
                </div>
              </div>
              <div class="flex items-start gap-3">
                <i class="fa-solid fa-truck text-gray-400 w-4 mt-0.5 text-center"></i>
                <div>
                  <p class="text-xs text-gray-400 mb-0.5">Delivery Type</p>
                  <p class="font-semibold text-gray-800">Express <span
                      class="text-gray-400 font-normal">· 1–2 hours</span></p>
                </div>
              </div>
            </div>
          </div>

          <!-- Payment Info -->
          <div class="bg-white border border-gray-100 rounded-xl p-5">
            <h2 class="text-base font-bold text-gray-800 mb-4">Payment Info</h2>
            <div class="flex items-center gap-3">
              <div class="w-10 h-10 rounded-md bg-green-100 flex items-center justify-center shrink-0">
                <i class="fa-solid fa-money-bill-wave text-green-600 text-lg"></i>
              </div>
              <div>
                <p class="text-sm font-bold text-gray-800">Cash on Delivery</p>
                <p class="text-xs text-gray-500">Pay ৳1,757 when order arrives</p>
              </div>
              <span
                  class="ml-auto text-xs bg-yellow-100 text-yellow-700 font-semibold px-2 py-0.5 rounded-full">Pending</span>
            </div>
          </div>

          <!-- Actions -->
          <div class="flex flex-col gap-3">
            <button
                class="w-full bg-[#E8312A] hover:bg-[#C4251F] text-white font-bold rounded-full py-3 text-sm flex items-center justify-center gap-2 transition-colors">
              <i class="fa-solid fa-truck text-sm"></i>
              Track My Order
            </button>
            <button
                class="w-full bg-white hover:bg-gray-50 text-gray-700 font-semibold rounded-full py-3 text-sm border border-gray-200 flex items-center justify-center gap-2 transition-colors">
              <i class="fa-solid fa-bag-shopping text-sm"></i>
              Continue Shopping
            </button>
            <button
                class="w-full text-[#E8312A] hover:underline text-sm font-medium flex items-center justify-center gap-1.5 py-1">
              <i class="fa-solid fa-file-invoice text-sm"></i>
              Download Invoice
            </button>
          </div>

          <!-- Help -->
          <div class="bg-gray-50 border border-gray-100 rounded-xl p-4 flex items-start gap-3">
            <i class="fa-solid fa-headset text-[#E8312A] text-lg mt-0.5"></i>
            <div>
              <p class="text-sm font-semibold text-gray-800">Need help with your order?</p>
              <p class="text-xs text-gray-500 mt-0.5">Our support team is available 24/7</p>
              <button class="text-xs text-[#E8312A] font-semibold hover:underline mt-1.5">Contact Support →</button>
            </div>
          </div>

        </div>
      </div>

      <!-- You May Also Like -->
      <div class="mt-8 bg-white border border-gray-100 rounded-xl p-5">
        <h2 class="text-base font-bold text-gray-800 mb-4">You May Also Like</h2>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">

          <div
              class="border border-gray-100 rounded-lg p-3 flex flex-col items-center gap-2 hover:border-[#E8312A] transition-colors cursor-pointer">
            <img
                src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65fa961e115075f231ecce6b_Radhuni-Shadmishali-Seasoning-Mixed-96gm_1_415.webp"
                class="w-20 h-20 object-contain" alt=""/>
            <p class="text-xs font-semibold text-gray-700 text-center leading-snug">Radhuni Seasoning Mixed 96gm</p>
            <span class="text-[#E8312A] text-sm font-bold">৳120</span>
            <button
                class="w-full bg-[#E8312A] hover:bg-[#C4251F] text-white text-xs rounded-full py-1.5 font-semibold transition-colors">
              <i class="fa-solid fa-plus mr-1 text-[10px]"></i>Add
            </button>
          </div>

          <div
              class="border border-gray-100 rounded-lg p-3 flex flex-col items-center gap-2 hover:border-[#E8312A] transition-colors cursor-pointer">
            <img src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/67c02190656b9dabf0b44640_2819508_1_80.webp"
                 class="w-20 h-20 object-contain" alt=""/>
            <p class="text-xs font-semibold text-gray-700 text-center leading-snug">Wow! Chicken Noodles 496gm</p>
            <span class="text-[#E8312A] text-sm font-bold">৳99</span>
            <button
                class="w-full bg-[#E8312A] hover:bg-[#C4251F] text-white text-xs rounded-full py-1.5 font-semibold transition-colors">
              <i class="fa-solid fa-plus mr-1 text-[10px]"></i>Add
            </button>
          </div>

          <div
              class="border border-gray-100 rounded-lg p-3 flex flex-col items-center gap-2 hover:border-[#E8312A] transition-colors cursor-pointer">
            <img
                src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/692ed719d5287d4d62f634cb_Supermom-Baby-Diaper-Medium-50Pcs_1_80.webp"
                class="w-20 h-20 object-contain" alt=""/>
            <p class="text-xs font-semibold text-gray-700 text-center leading-snug">Supermom Baby Diaper Large 40Pcs</p>
            <span class="text-[#E8312A] text-sm font-bold">৳1,350</span>
            <button
                class="w-full bg-[#E8312A] hover:bg-[#C4251F] text-white text-xs rounded-full py-1.5 font-semibold transition-colors">
              <i class="fa-solid fa-plus mr-1 text-[10px]"></i>Add
            </button>
          </div>

          <div
              class="border border-gray-100 rounded-lg p-3 flex flex-col items-center gap-2 hover:border-[#E8312A] transition-colors cursor-pointer">
            <img
                src="https://d2t8nl1y0ie1km.cloudfront.net/images/thumbs/65fa961e115075f231ecce6b_Radhuni-Shadmishali-Seasoning-Mixed-96gm_1_415.webp"
                class="w-20 h-20 object-contain" alt=""/>
            <p class="text-xs font-semibold text-gray-700 text-center leading-snug">ACI Pure Mustard Oil 1 Litre</p>
            <span class="text-[#E8312A] text-sm font-bold">৳220</span>
            <button
                class="w-full bg-[#E8312A] hover:bg-[#C4251F] text-white text-xs rounded-full py-1.5 font-semibold transition-colors">
              <i class="fa-solid fa-plus mr-1 text-[10px]"></i>Add
            </button>
          </div>

        </div>
      </div>

    </div>
  </MainLayout>
</template>

<style scoped>

</style>