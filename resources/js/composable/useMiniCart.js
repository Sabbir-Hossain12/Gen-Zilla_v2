import {ref} from "vue";

const isOpen = ref(false);
const qty = ref(1);

export function useMiniCart() {
    function openMiniCard() {
        isOpen.value = true;
    }

    function closeMiniCard() {
        isOpen.value = false;
    }

    function plusQty() {
        qty.value++;
    }

    function minusQty() {
        qty.value--;
        if (qty.value < 1) {
            qty.value = 1;
        }
    }

    return { isOpen, qty, openMiniCard, closeMiniCard, plusQty, minusQty }
}
// defineExpose({ openMiniCard, closeMiniCard })  // ← add this