import { ref } from 'vue'

const categories = ref([
    {
        name: 'Food',
        slug: 'food',
        children: [
            { name: 'Rice', slug: 'rice' },
            { name: 'Oil', slug: 'oil' },
            { name: 'Spices', slug: 'spices' },
            { name: 'Snacks', slug: 'snacks' }
        ]
    },
    {
        name: 'Baby Food and Care',
        slug: 'baby-food-and-care',
        children: [
            { name: 'Baby Food', slug: 'baby-food' },
            { name: 'Baby Wash', slug: 'baby-wash' },
            { name: 'Baby Lotion', slug: 'baby-lotion' }
        ]
    },
    {
        name: 'Diapers',
        slug: 'diapers',
        children: [
            { name: 'Newborn', slug: 'newborn' },
            { name: 'Small', slug: 'small' },
            { name: 'Medium', slug: 'medium' },
            { name: 'Large', slug: 'large' }
        ]
    },
    {
        name: 'Home Cleaning',
        slug: 'home-cleaning',
        children: [
            { name: 'Detergent', slug: 'detergent' },
            { name: 'Dishwash', slug: 'dishwash' },
            { name: 'Floor Cleaner', slug: 'floor-cleaner' }
        ]
    },
    { name: 'Pet Care', slug: 'pet-care' },
    {
        name: 'Beauty & Health',
        slug: 'beauty-health',
        children: [
            { name: 'Detergent', slug: 'detergent' },
            { name: 'Dishwash', slug: 'dishwash' },
            { name: 'Floor Cleaner', slug: 'floor-cleaner' }
        ]
    },
    {
        name: 'Fashion & Lifestyle',
        slug: 'fashion-lifestyle',
        children: [
            { name: 'Detergent', slug: 'detergent' },
            { name: 'Dishwash', slug: 'dishwash' },
            { name: 'Floor Cleaner', slug: 'floor-cleaner' }
        ]
    },
    {
        name: 'Home & Living',
        slug: 'home-living',
        children: [
            { name: 'Detergent', slug: 'detergent' },
            { name: 'Dishwash', slug: 'dishwash' },
            { name: 'Floor Cleaner', slug: 'floor-cleaner' }
        ]
    },
    {
        name: 'Toys & Sports',
        slug: 'toys-sports',
        children: [
            { name: 'Detergent', slug: 'detergent' },
            { name: 'Dishwash', slug: 'dishwash' },
            { name: 'Floor Cleaner', slug: 'floor-cleaner' }
        ]
    },
    // Special Topbar Categories
    { name: 'Summer Fest', slug: 'summer-fest', topbar: true },
    { name: 'Great Deals', slug: 'great-deals', topbar: true },
    { name: 'Unilever-Stock & Save', slug: 'unilever-stock-save', topbar: true },
    { name: 'Buy & Save More', slug: 'buy-save-more', topbar: true },
    { name: 'Our Brands', slug: 'our-brands', topbar: true },
    { name: 'Women\'s Corner', slug: 'womens-corner', topbar: true }
])

export { categories }
