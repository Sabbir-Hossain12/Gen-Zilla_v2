/**
 * Bangladesh (BDT) prices are whole taka — never decimals or paisa.
 *
 * `formatPrice` is the single source of truth for every price/total rendered
 * or summed on the storefront. It rounds to the nearest whole taka so cart,
 * checkout, header search, product cards and order pages all agree.
 *
 * @param {*} value any number-like value
 * @returns {number} rounded integer taka (e.g. 149.9 -> 150, 149.4 -> 149)
 */
export function formatPrice(value) {
    const num = Number(value);
    if (!Number.isFinite(num)) return 0;
    return Math.round(num);
}
