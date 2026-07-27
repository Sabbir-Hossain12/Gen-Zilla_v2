-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2026 at 08:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `genzilla_v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT 'admin',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `type`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'SuperAdmin', 'admin@admin.com', '01926241906', NULL, '$2y$12$w2p7rPYEU7CgaglwkytIPelLC7m.CrwBA2SEFscV1beZ7UL7ONh8a', NULL, 0, 'EKGkSj34BZtehBIn1zDyicaDsGetSJlvWAQRrkqIWq29NJg6JmpolleMYhrz', '2024-06-23 12:20:31', '2025-01-30 06:01:00'),
(4, 'Sabbir hossain', 'h.sabbir36@yahoo.com', '01926241906', NULL, '$2y$12$S6oT3M.vQCbm/1mLmnkGOOTCUIMqErtyM3C58cVPkZcOdzngjyIYm', NULL, 1, '50za0lCA47imx3NWcFmOupd3ezBJr0c9qHrlkx4QpZbb2htevQZYTiL45UXO', '2024-06-28 12:13:29', '2024-11-20 05:08:15'),
(5, 'saif hossainnn', 'korbin95@gmail.com', NULL, NULL, '$2y$12$puIoaq.o0Z4NFFBwV.W2de4AAJXXD2I2jGBxzB9rLHCLgCGrkbjJ2', NULL, 1, NULL, '2024-06-28 12:21:08', '2024-07-03 11:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Color', 1, NULL, NULL),
(2, 'Size', 1, NULL, NULL),
(3, 'Weight', 1, NULL, NULL),
(4, 'Tag', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attrvalues`
--

CREATE TABLE `attrvalues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `value` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attrvalues`
--

INSERT INTO `attrvalues` (`id`, `attribute_id`, `attribute_name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Color', 'Red', 1, NULL, NULL),
(5, 1, 'Color', 'Sky Blue', 0, '2024-07-07 08:01:35', '2024-07-07 08:01:35'),
(6, 4, 'Tag', 'Vegetables', 1, '2024-07-07 11:43:43', '2024-07-07 11:43:43'),
(7, 4, 'Tag', 'Healthy', 1, '2024-07-07 11:43:57', '2024-07-07 11:43:57'),
(9, 1, 'Color', 'Purple', 1, '2024-07-09 00:02:29', '2024-07-09 00:02:29'),
(10, 1, 'Color', 'Lavender', 1, '2024-07-09 00:02:42', '2024-07-09 00:02:42'),
(11, 3, 'Weight', '1 KG', 1, '2024-07-12 05:24:39', '2024-07-12 05:24:39'),
(12, 3, 'Weight', '3 KG', 1, '2024-07-12 05:24:52', '2024-07-12 05:24:52'),
(13, 4, 'Tag', 'Nutritents', 1, '2024-07-19 03:04:29', '2024-07-19 03:04:29'),
(14, 2, 'Size', 'S', 1, '2024-07-27 08:51:19', '2024-07-27 08:51:19'),
(15, 2, 'Size', 'M', 1, '2024-07-27 08:51:28', '2024-07-27 08:51:28'),
(16, 2, 'Size', 'L', 1, '2024-07-27 08:51:39', '2024-07-27 08:51:39'),
(17, 2, 'Size', 'XL', 1, '2024-07-27 08:51:48', '2024-07-27 08:51:48'),
(18, 4, 'Tag', 'Sharee', 1, '2024-08-03 00:00:42', '2024-08-03 00:00:42'),
(19, 4, 'Tag', 'Dress', 1, '2024-08-03 00:00:52', '2024-08-03 00:00:52'),
(20, 1, 'Color', 'Blue', 1, '2024-10-26 01:17:06', '2024-10-26 01:17:06'),
(21, 1, 'Color', 'Brown', 1, '2024-10-26 01:17:16', '2024-10-26 01:17:16'),
(22, 2, 'Size', '38', 1, '2024-10-26 01:18:30', '2024-10-26 01:18:30'),
(23, 2, 'Size', '39', 1, '2024-10-26 01:18:39', '2024-10-26 01:18:39'),
(24, 2, 'Size', '40', 1, '2024-10-26 01:18:47', '2024-10-26 01:18:47'),
(25, 2, 'Size', '41', 1, '2024-10-26 01:18:53', '2024-10-26 01:18:53'),
(26, 2, 'Size', '42', 1, '2024-10-26 01:18:58', '2024-10-26 01:18:58'),
(27, 2, 'Size', '43', 1, '2024-10-26 01:19:07', '2024-10-26 01:19:07'),
(28, 2, 'Size', 'Free', 1, '2026-07-27 10:24:47', '2026-07-27 10:24:47'),
(29, 2, 'Size', 'Universal', 1, '2026-07-27 10:36:36', '2026-07-27 10:36:36'),
(30, 2, 'Size', '100ml', 1, '2026-07-27 12:00:00', '2026-07-27 12:00:00'),
(31, 2, 'Size', '200ml', 1, '2026-07-27 12:00:12', '2026-07-27 12:00:12'),
(32, 2, 'Size', '500ml', 1, '2026-07-27 12:00:24', '2026-07-27 12:00:24'),
(33, 3, 'Weight', '2KG', 1, '2026-07-27 12:20:39', '2026-07-27 12:20:39'),
(34, 3, 'Weight', '1300gm', 1, '2026-07-27 12:22:10', '2026-07-27 12:23:06');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `banner_img` text DEFAULT NULL,
  `banner_link` text DEFAULT NULL,
  `banner_type` varchar(255) DEFAULT 'small' COMMENT 'small,medium,large',
  `banner_title_1` varchar(255) DEFAULT NULL,
  `banner_title_2` varchar(255) DEFAULT NULL,
  `banner_title_3` varchar(255) DEFAULT NULL,
  `banner_btn_name` varchar(255) DEFAULT NULL,
  `banner_btn_link` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `slug`, `banner_img`, `banner_link`, `banner_type`, `banner_title_1`, `banner_title_2`, `banner_title_3`, `banner_btn_name`, `banner_btn_link`, `status`, `created_at`, `updated_at`) VALUES
(4, '100-fresh-cow-milk', 'backend/assets/images/uploads/banners/1785177154.webp', '#', 'small', 'Beat the Heat', '#', NULL, 'Shop Now', '#', 1, '2024-09-06 14:31:39', '2026-07-27 12:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `black_logo` text NOT NULL,
  `light_logo` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `fb_link` varchar(255) DEFAULT NULL,
  `x_link` varchar(255) DEFAULT NULL,
  `p_link` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `insta_link` varchar(255) DEFAULT NULL,
  `inside_dhaka_charge` int(11) DEFAULT NULL,
  `outside_dhaka_charge` int(11) DEFAULT NULL,
  `store_location` text DEFAULT NULL,
  `short_desc` text NOT NULL,
  `fb_pixel` text DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `chatbox_script` text DEFAULT NULL,
  `marquee_text` text DEFAULT NULL,
  `currency_symbol` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_infos`
--

INSERT INTO `basic_infos` (`id`, `website_name`, `black_logo`, `light_logo`, `email`, `phone_1`, `fb_link`, `x_link`, `p_link`, `youtube_link`, `insta_link`, `inside_dhaka_charge`, `outside_dhaka_charge`, `store_location`, `short_desc`, `fb_pixel`, `google_analytics`, `chatbox_script`, `marquee_text`, `currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 'Gen-zilla', 'backend/images/logo/1729705556Screenshot_2024-10-23_234348-removebg-preview.png', 'backend/images/logo/1729705556Screenshot_2024-10-23_234348-removebg-preview.png', 'info@ecobazar.com', '(219) 555-0114', 'facebook.com/ecobazar', 'x.com/ecobazar', 'pinterest.com/ecobazar', 'youtube.com', 'insta.com', NULL, NULL, 'Lincoln- 344, Illinois, Chicago, USA', 'Morbi cursus porttitor enim lobortis molestie. Duis gravida turpis dui, eget bibendum magna congue nec', NULL, NULL, NULL, NULL, '৳', '2024-06-20 14:09:21', '2024-10-23 11:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_image` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `slug`, `brand_name`, `brand_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'samsung', 'Unilever', 'public/backend/assets/images/uploads/brand/1785166909.webp', 1, NULL, '2026-07-27 09:41:49'),
(3, 'lg', 'ACI', 'public/backend/assets/images/uploads/brand/1785166924.webp', 1, '2024-07-03 13:05:45', '2026-07-27 09:42:04'),
(6, 'panasonic', 'Swapno', 'public/backend/assets/images/uploads/brand/1785166936.webp', 1, '2024-07-08 23:33:43', '2026-07-27 09:42:16'),
(7, 'ncb', 'Square', 'public/backend/assets/images/uploads/brand/1785166966.webp', 1, '2024-08-01 11:36:58', '2026-07-27 09:42:46'),
(8, 'german', 'German', 'public/backend/assets/images/uploads/brand/1785166978.webp', 1, '2026-07-27 09:42:58', '2026-07-27 09:42:58'),
(9, 'dano', 'Dano', 'public/backend/assets/images/uploads/brand/1785166993.jpeg', 1, '2026-07-27 09:43:13', '2026-07-27 09:43:13'),
(10, 'single', 'Single', 'public/backend/assets/images/uploads/brand/1785169370.webp', 1, '2026-07-27 10:22:50', '2026-07-27 10:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL DEFAULT 'female' COMMENT 'male,female',
  `slug` varchar(255) NOT NULL,
  `category_img` text DEFAULT NULL,
  `category_img_path` text DEFAULT NULL,
  `front_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `topCategory_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `gender`, `slug`, `category_img`, `category_img_path`, `front_status`, `topCategory_status`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Home & Kitchen', 'female', 'home-kitchen', '75338720.jpg', 'public/backend/images/category/19948952.avif', 1, 1, 1, '2024-08-01 10:29:54', '2026-06-20 08:30:49'),
(4, 'Pet Care', 'female', 'pet-care', '2409603.jpeg', 'public/backend/images/category/62754067.avif', 1, 1, 1, '2024-08-01 10:30:59', '2026-06-20 08:29:51'),
(5, 'Home Cleaning', 'female', 'home-cleaning', '15934357.webp', 'public/backend/images/category/71368881.avif', 1, 1, 1, '2024-08-01 10:34:04', '2026-06-20 08:29:37'),
(6, 'Diapers', 'male', 'diapers', '54306198.jpg', 'public/backend/images/category/68317308.avif', 1, 1, 1, '2024-08-01 10:43:25', '2026-06-20 08:29:18'),
(7, 'Baby Food & Care', 'female', 'baby-food-care', '45798660.jpeg', 'public/backend/images/category/7321759.avif', 1, 1, 1, '2024-08-01 10:45:06', '2026-06-20 08:28:50'),
(8, 'Food', 'male', 'food', '55331913.avif', 'public/backend/images/category/61839184.avif', 0, 0, 1, '2025-02-03 19:16:15', '2026-06-20 08:20:21'),
(9, 'Mobile & Accessories', 'male', 'mobile-accessories', '81286346.avif', 'public/backend/images/category/81286346.avif', 0, 1, 1, '2026-06-22 12:55:49', '2026-06-22 12:56:06');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_title` varchar(255) NOT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `attrvalue_id`, `product_id`, `color_title`, `productRegularPrice`, `productSalePrice`, `discount_percentage`, `created_at`, `updated_at`) VALUES
(11, 1, 32, 'Red', 5000.00, 4750.00, 5, '2024-08-01 11:45:05', '2024-08-08 16:08:09'),
(12, 9, 32, 'Purple', 5500.00, 5225.00, 5, '2024-08-01 11:45:05', '2024-08-08 16:08:09'),
(13, 10, 32, 'Lavender', 6000.00, 5400.00, 10, '2024-08-01 11:45:05', '2024-08-08 16:08:09'),
(14, 20, 34, 'Blue', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(15, 21, 34, 'Brown', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(16, 1, 35, 'Red', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(17, 10, 35, 'Lavender', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(18, 20, 35, 'Blue', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `max_used` int(11) DEFAULT 1,
  `total_used` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=active, 0=deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `code`, `discount`, `amount`, `start_date`, `expire_date`, `quantity`, `max_used`, `total_used`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Eid Special 2024', 'EID2024', 2, NULL, '2024-01-15', '2025-06-05', 50, 4, 0, 1, '2024-09-02 12:21:58', '2024-09-02 13:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address_1` text NOT NULL,
  `address_2` text DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `thana` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `state_district` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'Bangladesh',
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `company_name`, `address_1`, `address_2`, `area`, `thana`, `gender`, `state_district`, `zip`, `country`, `phone`, `email`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Jennifer', 'Yolanda', 'Geoffrey', 'Joel', 'Moses', NULL, NULL, NULL, 'Dhaka', 'Iris', 'Bangladesh', 'Lester', 'Lucius', 1, '2024-08-16 15:20:58', '2024-08-16 15:20:58'),
(9, 'Jennifer', 'Yolanda', 'Geoffrey', 'Joel', 'Moses', NULL, NULL, NULL, 'Dhaka', 'Iris', 'Bangladesh', 'Lester', 'Lucius', 1, '2024-08-16 15:21:42', '2024-08-16 15:21:42'),
(10, 'Amela', 'Mallory', 'Mariko', 'Cedric', 'Remedios', NULL, NULL, NULL, 'Dhaka', 'Amelia', 'Bangladesh', '01318503492', 'Louis@gmail.com', 1, '2024-08-20 14:46:29', '2024-08-20 14:46:29'),
(11, 'Dexter', 'Colorado', 'Elton', 'Ira', 'Hall', NULL, NULL, NULL, 'Dhaka', 'Scott', 'Bangladesh', 'Hasad', 'August', 1, '2024-08-28 14:10:16', '2024-08-28 14:10:16'),
(12, 'Denise', 'Buffy', 'Joseph', 'Alea', 'Colton', NULL, NULL, NULL, 'Dhaka', 'Nell', 'Bangladesh', 'Adria', 'Christian', 1, '2024-08-28 14:11:19', '2024-08-28 14:11:19'),
(37, 'Sybill', 'Lunea', 'Mona', 'Vladimir', 'Paul', NULL, NULL, NULL, 'Dhaka', 'Ann', 'Bangladesh', 'Teegan', 'Thomas', 1, '2024-08-30 08:36:48', '2024-08-30 08:36:48'),
(39, 'Nero', 'Lynn', 'Fitzgerald', 'Ignatius', 'Emerald', NULL, NULL, NULL, 'Dhaka', 'Lucius', 'Bangladesh', 'Nicole', 'Madeline', 1, '2024-08-30 08:40:07', '2024-08-30 08:40:07'),
(42, 'Iris', 'Gail', 'Clio', 'Reese', 'Otto', NULL, NULL, NULL, 'Dhaka', 'Guinevere', 'Bangladesh', 'Magee', 'Quincy', 1, '2024-08-30 08:47:59', '2024-08-30 08:47:59'),
(43, 'Colt', 'Basia', 'Mari', 'Raja', 'Carl', NULL, NULL, NULL, 'Dhaka', 'Emma', 'Bangladesh', 'Baker', 'Ima', 1, '2024-08-30 08:48:45', '2024-08-30 08:48:45'),
(44, 'Callie', 'Kyra', 'Blair', 'Jaime', 'Illiana', NULL, NULL, NULL, 'Dhaka', 'Hermione', 'Bangladesh', 'Nicole', 'Farrah', 1, '2024-08-30 08:56:15', '2024-08-30 08:56:15'),
(45, 'Cora', 'Haviva', 'Blossom', 'Jena', 'Zoe', NULL, NULL, NULL, 'Dhaka', 'Jelani', 'Bangladesh', 'Mara', 'Orla', 1, '2024-08-30 09:11:34', '2024-08-30 09:11:34'),
(46, 'Joelle', 'Wendy', 'Theodore', 'Keane', 'Jael', NULL, NULL, NULL, 'Dhaka', 'Christine', 'Bangladesh', 'September', 'August', 1, '2024-08-30 09:15:47', '2024-08-30 09:15:47'),
(53, 'Price', 'Sharon', 'Axel', 'Eliana', 'Quinn', NULL, NULL, NULL, 'Dhaka', 'Raymond', 'Bangladesh', 'Shea', 'Phyllis', 1, '2024-08-30 14:52:01', '2024-08-30 14:52:01'),
(54, 'Vielka', 'James', 'Nicholas', 'Odette', 'Michael', NULL, NULL, NULL, 'Dhaka', 'Pearl', 'Bangladesh', '0192624190', 'Dolan', 1, '2024-09-11 11:05:21', '2024-09-11 11:05:21'),
(55, 'Reagan', 'Evan', 'Mariam', 'Joy', 'David', NULL, NULL, NULL, 'Dhaka', 'Carol', 'Bangladesh', '025757353', 'Summer', 1, '2024-09-11 11:53:48', '2024-09-11 11:53:48'),
(56, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:55:27', '2024-09-11 11:55:27'),
(57, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:55:54', '2024-09-11 11:55:54'),
(58, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:57:48', '2024-09-11 11:57:48'),
(59, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:58:16', '2024-09-11 11:58:16'),
(60, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(61, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(62, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(63, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(64, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(65, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(66, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(67, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(68, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(69, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(70, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(71, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(72, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(73, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(74, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(75, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(76, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(77, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(78, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(79, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(80, 'Judah', 'Angelica', 'Madaline', 'Adam', 'Jeremy', NULL, NULL, NULL, 'Dhaka', 'Adria', 'Bangladesh', '45245354354', 'Adrienne', 1, '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(81, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(82, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(83, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(84, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(85, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(86, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(87, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(88, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(89, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(90, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(91, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(92, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(93, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(94, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(95, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(96, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(97, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(98, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(99, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(100, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(101, 'Adena', 'Melyssa', 'Myra', 'Ethan', 'Tanek', NULL, NULL, NULL, 'Dhaka', 'Hanna', 'Bangladesh', 'Bevis', 'Summer', 1, '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(102, 'Cedric', 'Uta', 'Jasmine', 'Heidi', 'Tarik', NULL, NULL, NULL, 'Dhaka', 'Sylvester', 'Bangladesh', '01318503492', 'Raymond', 1, '2024-09-13 08:07:02', '2024-09-13 08:07:02'),
(103, 'Gage', 'Sebastian', 'Carson', 'Herman', 'Ethan', NULL, NULL, NULL, 'Dhaka', 'Remedios', 'Bangladesh', 'Leila', 'Maya', 1, '2024-10-24 04:43:32', '2024-10-24 04:43:32'),
(104, 'Kirestin', 'Chase', 'Christine', 'Minerva', 'Venus', NULL, NULL, NULL, 'Dhaka', 'Odette', 'Bangladesh', 'Keely', 'Galena', 1, '2024-11-04 12:35:46', '2024-11-04 12:35:46'),
(105, 'Keiko', 'Emmanuel', 'Hammett', 'Cadman', 'Nevada', NULL, NULL, NULL, 'Dhaka', 'Lucas', 'Bangladesh', 'Glenna', 'Adam', 1, '2024-11-04 12:37:20', '2024-11-04 12:37:20'),
(106, 'Graham', 'Cruz', 'Byron', 'Tanek', 'Melvin', NULL, NULL, NULL, 'Dhaka', 'Upton', 'Bangladesh', 'Guy', 'Kirk', 1, '2024-11-04 12:38:10', '2024-11-04 12:38:10'),
(107, 'Grace', 'Kermit', 'Fulton', 'Gary', 'Mari', NULL, NULL, NULL, 'Dhaka', 'Mara', 'Bangladesh', 'Hermione', 'Eve', 1, '2024-11-04 12:48:29', '2024-11-04 12:48:29'),
(108, 'Orson', 'Brianna', 'Yetta', 'Burke', 'Sawyer', NULL, NULL, NULL, 'Dhaka', 'Tate', 'Bangladesh', 'Kelly', 'Carol', 1, '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(109, 'Nathan', 'Eric', 'Driscoll', 'Nadine', 'Jenna', NULL, NULL, NULL, 'Dhaka', 'Tate', 'Bangladesh', 'Jerome', 'Erica', 1, '2024-11-20 05:00:38', '2024-11-20 05:00:38'),
(110, 'Mohsin', 'Mea', 'SR group', 'Mipur 12', 'Dhaka', NULL, NULL, NULL, 'Dhaka', '1216', 'Bangladesh', '01718756084', 'admin@gmail.com', 1, '2025-01-19 04:14:14', '2025-01-19 04:14:14'),
(111, 'Mohsin', 'Mea', 'SR group', 'Mipur 12', 'Dhaka', NULL, NULL, NULL, 'Dhaka', '1216', 'Bangladesh', '01718756084', 'h.sabbir36@yahoo.com', 1, '2025-01-19 04:15:34', '2025-01-19 04:15:34'),
(112, 'Lysandra', 'Brett', 'Austin', 'Dhaka', 'Mirpur', NULL, NULL, NULL, 'Dhaka', 'Patrick', 'Bangladesh', '01926241906', 'Kennan@gmail.com', 1, '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(113, 'Judith', 'Sierra', 'Clayton', 'Keaton', 'Anne', NULL, NULL, NULL, 'Dhaka', 'Driscoll', 'Bangladesh', '01772554516', 'Tamara@gmail.com', 1, '2025-01-27 09:38:09', '2025-01-27 09:38:09'),
(114, 'Carol', 'Yasir', 'Sophia', 'Dhaka', 'Zahir', NULL, NULL, NULL, 'Dhaka', 'Garrett', 'Bangladesh', '01318503492', 'Rose@gmail.com', 1, '2025-01-27 15:40:47', '2025-01-27 15:40:47'),
(115, 'Nell', 'Nayda', 'Willa', 'Chelsea', 'Dieter', 'Jonas', 'Ciara', 'male', 'Dhaka', 'Rama', 'Bangladesh', 'Shannon', 'jakyji@mailinator.com', 1, '2025-01-29 08:49:41', '2025-01-29 08:49:41'),
(116, 'Stuff', NULL, NULL, 'asdas', NULL, NULL, NULL, 'male', 'Dhaka', '1240', 'Bangladesh', '01318503492', 'sh1389045@gmail.com', 1, '2025-01-30 18:23:48', '2025-01-30 18:23:48'),
(117, 'Sabbir hossain', NULL, NULL, 'Dhaka North City corporation, Dhaka', NULL, NULL, NULL, 'male', 'Dhaka', '1230', 'Bangladesh', '01926241905', 'h.sabbir36@yahoo.com', 1, '2025-01-30 18:42:30', '2025-01-30 18:42:30'),
(118, 'Hollee', 'Zenaida', 'Hermione', 'Duncan', 'Jada', 'Burton', 'Cyrus', 'female', 'Dhaka', 'Jamal', 'Bangladesh', 'Dale', 'wuziji@mailinator.com', 1, '2025-02-03 18:41:19', '2025-02-03 18:41:19'),
(119, 'Sacha', 'Leroy', 'Brock', 'Ila', 'Baxter', 'Stacey', 'Gwendolyn', 'male', 'Dhaka', 'Tiger', 'Bangladesh', 'Emily', 'xuduton@mailinator.com', 1, '2025-02-05 16:24:02', '2025-02-05 16:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_charges`
--

CREATE TABLE `delivery_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_charges`
--

INSERT INTO `delivery_charges` (`id`, `delivery_title`, `slug`, `delivery_charge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Inside Dhaka', 'inside-dhaka', 60, 1, NULL, '2025-01-30 06:24:40'),
(2, 'Outside Dhaka', 'outside-dhaka', 120, 1, '2025-01-30 06:00:56', '2025-01-30 06:13:51'),
(5, 'Sub area', 'sub-area', 60, 1, '2025-01-30 15:23:37', '2025-01-30 15:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2024_06_16_134501_create_admins_table', 1),
(14, '2024_06_17_194041_create_pages_table', 1),
(15, '2024_06_19_130434_create_basic_infos_table', 1),
(17, '2024_06_20_192342_create_subcategories_table', 1),
(18, '2024_06_20_192432_create_brands_table', 1),
(19, '2024_06_21_155212_create_sliders_table', 2),
(20, '2024_06_21_160221_create_banners_table', 3),
(21, '2024_06_21_163121_create_products_table', 4),
(22, '2024_06_21_163158_create_product_details_table', 4),
(23, '2024_06_21_173303_create_tags_table', 5),
(24, '2024_06_21_173846_create_product_tag_table', 5),
(26, '2024_06_21_193623_create_permission_tables', 7),
(27, '2024_07_05_181617_create_attributes_table', 8),
(28, '2024_07_05_181657_create_attrvalues_table', 8),
(29, '2024_06_20_191855_create_categories_table', 9),
(31, '2024_07_13_143822_create_coupons_table', 10),
(32, '2024_06_21_181703_create_reviews_table', 11),
(34, '2024_07_19_100337_create_weights_table', 12),
(35, '2024_07_19_100338_create_sizes_table', 12),
(36, '2024_07_19_100422_create_colors_table', 12),
(37, '2024_08_16_184705_create_customers_table', 13),
(38, '2024_08_16_184709_create_orders_table', 13),
(39, '2024_08_16_184728_create_order_products_table', 13),
(40, '2024_09_13_063359_create_theme_colors_table', 14),
(41, '2024_09_13_142429_create_wishlists_table', 15),
(42, '2025_01_30_112509_create_delivery_charges_table', 16),
(43, '2026_06_17_195309_create_personal_access_tokens_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 2),
(7, 'App\\Models\\Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `invoiceID` varchar(255) NOT NULL,
  `tran_id` longtext DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL DEFAULT 'BDT',
  `shipping_charge` int(11) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `subtotal` int(11) NOT NULL,
  `discount_amount` varchar(255) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `complete_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_SKU` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL DEFAULT 0,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `product_discount` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `vendor_id`, `product_name`, `product_SKU`, `quantity`, `product_price`, `purchase_price`, `size`, `color`, `weight`, `length`, `product_discount`, `total`, `created_at`, `updated_at`) VALUES
(56, 51, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:58:16', '2024-09-11 11:58:16'),
(57, 52, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(58, 52, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 11:58:30', '2024-09-11 11:58:30'),
(59, 53, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(60, 53, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:35:29', '2024-09-11 12:35:29'),
(61, 54, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(62, 54, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:39:53', '2024-09-11 12:39:53'),
(63, 55, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(64, 55, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:40:53', '2024-09-11 12:40:53'),
(65, 56, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(66, 56, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:41:57', '2024-09-11 12:41:57'),
(67, 57, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(68, 57, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:06', '2024-09-11 12:45:06'),
(69, 58, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(70, 58, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:17', '2024-09-11 12:45:17'),
(71, 59, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(72, 59, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:46', '2024-09-11 12:45:46'),
(73, 60, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(74, 60, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:45:56', '2024-09-11 12:45:56'),
(75, 61, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(76, 61, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:46:21', '2024-09-11 12:46:21'),
(77, 62, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(78, 62, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:46:27', '2024-09-11 12:46:27'),
(79, 63, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(80, 63, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:48:53', '2024-09-11 12:48:53'),
(81, 64, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(82, 64, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:49:00', '2024-09-11 12:49:00'),
(83, 65, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(84, 65, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:50:03', '2024-09-11 12:50:03'),
(85, 66, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(86, 66, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:50:45', '2024-09-11 12:50:45'),
(87, 67, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(88, 67, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:51:04', '2024-09-11 12:51:04'),
(89, 68, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(90, 68, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:51:17', '2024-09-11 12:51:17'),
(91, 69, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(92, 69, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:51:36', '2024-09-11 12:51:36'),
(93, 70, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(94, 70, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:52:06', '2024-09-11 12:52:06'),
(95, 71, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(96, 71, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:52:37', '2024-09-11 12:52:37'),
(97, 72, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(98, 72, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 12:53:32', '2024-09-11 12:53:32'),
(99, 73, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(100, 73, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:02:12', '2024-09-11 13:02:12'),
(101, 74, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(102, 74, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:02:39', '2024-09-11 13:02:39'),
(103, 75, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(104, 75, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:03:35', '2024-09-11 13:03:35'),
(105, 76, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(106, 76, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:06:13', '2024-09-11 13:06:13'),
(107, 77, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(108, 77, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:06:28', '2024-09-11 13:06:28'),
(109, 78, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(110, 78, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:06:59', '2024-09-11 13:06:59'),
(111, 79, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(112, 79, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:08:11', '2024-09-11 13:08:11'),
(113, 80, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(114, 80, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:09:38', '2024-09-11 13:09:38'),
(115, 81, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(116, 81, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:09:59', '2024-09-11 13:09:59'),
(117, 82, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(118, 82, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:10:34', '2024-09-11 13:10:34'),
(119, 83, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(120, 83, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:10:40', '2024-09-11 13:10:40'),
(121, 84, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(122, 84, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:11:33', '2024-09-11 13:11:33'),
(123, 85, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(124, 85, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:11:50', '2024-09-11 13:11:50'),
(125, 86, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(126, 86, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:12:14', '2024-09-11 13:12:14'),
(127, 87, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(128, 87, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:12:48', '2024-09-11 13:12:48'),
(129, 88, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(130, 88, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:13:16', '2024-09-11 13:13:16'),
(131, 89, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(132, 89, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:13:33', '2024-09-11 13:13:33'),
(133, 90, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(134, 90, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:14:04', '2024-09-11 13:14:04'),
(135, 91, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(136, 91, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:14:17', '2024-09-11 13:14:17'),
(137, 92, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(138, 92, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:15:04', '2024-09-11 13:15:04'),
(139, 93, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5600, 0, 'XL', NULL, NULL, NULL, NULL, 5600, '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(140, 93, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', NULL, NULL, NULL, NULL, 5525, '2024-09-11 13:15:26', '2024-09-11 13:15:26'),
(141, 94, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 3, 5600, 0, 'XL', 'Purple', '1 KG', NULL, NULL, 16800, '2024-09-13 08:07:02', '2024-09-13 08:07:02'),
(142, 95, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 2, 5400, 0, 'M', NULL, NULL, NULL, NULL, 10800, '2024-10-24 04:43:32', '2024-10-24 04:43:32'),
(143, 96, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2024-11-04 12:35:46', '2024-11-04 12:35:46'),
(144, 97, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', 'Red', NULL, NULL, NULL, 1000, '2024-11-04 12:37:20', '2024-11-04 12:37:20'),
(145, 98, 40, NULL, 'New Design Half Silk Skin Printer Saree', NULL, 1, 784, 0, 'L', NULL, NULL, NULL, NULL, 784, '2024-11-04 12:38:10', '2024-11-04 12:38:10'),
(146, 99, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2024-11-04 12:48:29', '2024-11-04 12:48:29'),
(147, 100, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'L', NULL, NULL, NULL, NULL, 1000, '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(148, 100, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'M', NULL, NULL, NULL, NULL, 1000, '2024-11-20 04:59:24', '2024-11-20 04:59:24'),
(149, 101, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'M', NULL, NULL, NULL, NULL, 1000, '2024-11-20 05:00:38', '2024-11-20 05:00:38'),
(150, 102, 34, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', NULL, 1, 1900, 0, '41', NULL, NULL, NULL, NULL, 1900, '2025-01-19 04:14:14', '2025-01-19 04:14:14'),
(151, 103, 34, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', NULL, 1, 1900, 0, NULL, 'Blue', NULL, NULL, NULL, 1900, '2025-01-19 04:15:34', '2025-01-19 04:15:34'),
(152, 104, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 4750, 0, 'S', 'Purple', '1 KG', NULL, NULL, 4750, '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(153, 104, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5525, 0, 'L', 'Purple', '1 KG', NULL, NULL, 5525, '2025-01-27 09:34:35', '2025-01-27 09:34:35'),
(154, 105, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 2, 5525, 0, 'L', NULL, NULL, NULL, NULL, 11050, '2025-01-27 09:38:09', '2025-01-27 09:38:09'),
(155, 106, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2025-01-27 15:40:47', '2025-01-27 15:40:47'),
(156, 107, 32, NULL, 'Tangail Tat Multi Colour Trendy Moslin Jamdani Saree for Women', NULL, 1, 5400, 0, 'M', NULL, NULL, NULL, NULL, 5400, '2025-01-29 08:49:41', '2025-01-29 08:49:41'),
(157, 108, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'S', NULL, NULL, NULL, NULL, 1000, '2025-01-30 18:23:48', '2025-01-30 18:23:48'),
(158, 109, 35, NULL, 'Short Sleeve T Shirt For Women Jersey Fabric', NULL, 1, 1000, 0, 'M', NULL, NULL, NULL, NULL, 1000, '2025-01-30 18:42:30', '2025-01-30 18:42:30'),
(159, 110, 40, NULL, 'New Design Half Silk Skin Printer Saree', NULL, 2, 784, 0, 'L', NULL, NULL, NULL, NULL, 1568, '2025-02-03 18:41:19', '2025-02-03 18:41:19'),
(160, 111, 34, NULL, 'Men\'s casual shoes Vulcanized Work loafers Mesh Lightweight Man sports shoes Canvas Shoes for Men zapatos para hombres2024', NULL, 1, 1900, 0, '42', NULL, NULL, NULL, NULL, 1900, '2025-02-05 16:24:02', '2025-02-05 16:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `url`, `desc`, `meta_title`, `meta_desc`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 'About Us', NULL, NULL, 'More Content are coming Soon', NULL, NULL, NULL, 1, NULL, '2024-07-07 08:04:31'),
(2, 'Terms and Condition', NULL, NULL, 'More Content are coming Soon', NULL, NULL, NULL, 1, NULL, NULL),
(3, 'Contact Us', NULL, NULL, 'More Content are coming Soon', NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(13, 'Create Admin', 'admin', '2024-06-28 11:49:44', '2024-06-28 11:49:44'),
(14, 'View Admin', 'admin', '2024-06-28 11:49:59', '2024-06-28 11:49:59'),
(15, 'Edit Admin', 'admin', '2024-06-28 11:50:08', '2024-06-28 11:50:08'),
(16, 'Delete Admin', 'admin', '2024-06-28 11:50:17', '2024-06-28 11:50:17'),
(17, 'Status Admin', 'admin', '2024-06-29 01:26:59', '2024-06-29 01:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `isPopular` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `isHot` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `isFeatured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active,0=inactive',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `brand_id`, `product_name`, `slug`, `color`, `size`, `weight`, `tag`, `short_desc`, `isPopular`, `isHot`, `isFeatured`, `status`, `created_at`, `updated_at`) VALUES
(45, 3, NULL, 3, 'Radhuni Shadmishali Seasoning Mixed 96gm', 'radhuni-shadmishali-seasoning-mixed-96gm', NULL, NULL, NULL, '[\"Healthy\",\"Nutritents\"]', '#', 0, 0, 0, 1, '2026-07-27 10:41:26', '2026-07-27 10:41:26'),
(46, 8, 7, 1, 'Nescafe Classic 200(±)20gm (Jar)', 'nescafe-classic-20020gm-jar', NULL, NULL, NULL, '[\"Nutritents\"]', '#', 0, 0, 0, 1, '2026-07-27 10:44:55', '2026-07-27 10:44:55'),
(47, 8, 9, 3, 'Mojo 2000ml (Pet Bottle)', 'mojo-2000ml-pet-bottle', NULL, NULL, NULL, '[\"Nutritents\"]', '#', 0, 0, 0, 1, '2026-07-27 12:00:56', '2026-07-27 12:00:56'),
(48, 3, NULL, 3, 'ACI Pure Atta 2kg', 'aci-pure-atta-2kg', NULL, NULL, NULL, NULL, '#', 0, 0, 0, 1, '2026-07-27 12:21:02', '2026-07-27 12:21:02'),
(49, 3, NULL, 10, 'KaziFarms Kitchen Plain Paratha 1300gm', 'kazifarms-kitchen-plain-paratha-1300gm', NULL, NULL, NULL, NULL, '#', 0, 0, 0, 1, '2026-07-27 12:23:24', '2026-07-27 12:23:24'),
(50, 5, NULL, 1, 'Ariel Detergent Powder 1kg', 'ariel-detergent-powder-1kg', NULL, NULL, NULL, NULL, '#', 0, 0, 0, 1, '2026-07-27 12:34:27', '2026-07-27 12:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `purchase_price` int(11) NOT NULL DEFAULT 0,
  `regular_price` decimal(8,2) DEFAULT NULL,
  `sale_price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `long_desc` longtext DEFAULT NULL,
  `initial_stock` int(11) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT 0,
  `available_qty` int(11) DEFAULT 0,
  `sold_qty` int(11) DEFAULT 0,
  `youtube_embed_link` text DEFAULT NULL,
  `productThumbnail_img` text NOT NULL,
  `product_img` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `product_id`, `SKU`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `long_desc`, `initial_stock`, `total_qty`, `available_qty`, `sold_qty`, `youtube_embed_link`, `productThumbnail_img`, `product_img`, `meta_title`, `meta_key`, `meta_desc`, `created_at`, `updated_at`) VALUES
(30, 45, 'EB-82552506', 110, NULL, NULL, NULL, '<p>#</p>', 50, 50, 50, 0, NULL, 'backend/assets/images/uploads/products/Radhuni Shadmishali Seasoning Mixed 96gm1785170486.webp', '[\"6a678a3696979Radhuni Shadmishali Seasoning Mixed 96gm-1785170486.webp\"]', NULL, NULL, NULL, '2026-07-27 10:41:26', '2026-07-27 10:41:26'),
(31, 46, 'EB-92436614', 940, NULL, NULL, NULL, '<p>#</p>', 50, 50, 50, 0, NULL, 'backend/assets/images/uploads/products/Nescafe Classic 200(±)20gm (Jar)1785170695.webp', '[\"6a678b0789659Nescafe Classic 200(\\u00b1)20gm (Jar)-1785170695.webp\"]', NULL, NULL, NULL, '2026-07-27 10:44:55', '2026-07-27 10:44:55'),
(32, 47, 'EB-59689527', 90, NULL, NULL, NULL, '<p>#</p>', 50, 50, 50, 0, NULL, 'backend/assets/images/uploads/products/Mojo 2000ml (Pet Bottle)1785175256.webp', '[\"6a679cd842b70Mojo 2000ml (Pet Bottle)-1785175256.webp\"]', NULL, NULL, NULL, '2026-07-27 12:00:56', '2026-07-27 12:00:56'),
(33, 48, 'EB-81755938', 90, NULL, NULL, NULL, '<p>#</p>', 50, 50, 50, 0, NULL, 'backend/assets/images/uploads/products/ACI Pure Atta 2kg1785176462.webp', '[\"6a67a18e5535bACI Pure Atta 2kg-1785176462.webp\"]', NULL, NULL, NULL, '2026-07-27 12:21:02', '2026-07-27 12:21:02'),
(34, 49, 'EB-30799481', 250, NULL, NULL, NULL, '<p>#</p>', 50, 50, 50, 0, NULL, 'backend/assets/images/uploads/products/KaziFarms Kitchen Plain Paratha 1300gm1785176604.webp', '[\"6a67a21c5a7e2KaziFarms Kitchen Plain Paratha 1300gm-1785176604.webp\"]', NULL, NULL, NULL, '2026-07-27 12:23:24', '2026-07-27 12:23:24'),
(35, 50, 'EB-63261129', 180, NULL, NULL, NULL, '<p>#</p>', 50, 50, 50, 0, NULL, 'backend/assets/images/uploads/products/Ariel Detergent Powder 1kg1785177267.webp', '[\"6a67a4b3121adAriel Detergent Powder 1kg-1785177267.webp\"]', NULL, NULL, NULL, '2026-07-27 12:34:27', '2026-07-27 12:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `review_text` longtext NOT NULL,
  `rating` varchar(255) NOT NULL,
  `review_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `review_text`, `rating`, `review_date`, `status`, `created_at`, `updated_at`) VALUES
(2, 4, 32, 'good product', '4', '2024-10-25', 0, '2024-08-03 20:41:45', '2024-10-24 04:23:13'),
(5, 4, 32, 'abc', '1', '2024-10-24', 1, '2024-10-24 02:21:34', '2024-10-24 04:22:35'),
(8, 4, 32, 'good man', '2', '2024-10-24', 1, '2024-10-24 04:25:01', '2024-10-24 04:25:16'),
(9, 4, 32, 'need to improve the quality better.', '2', '2024-10-27', 0, '2024-10-27 02:33:41', '2024-10-27 02:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', NULL, NULL),
(7, 'Admin', 'admin', '2024-06-28 11:54:57', '2024-06-28 11:54:57'),
(8, 'Stuff', 'admin', '2024-06-28 11:55:05', '2024-06-28 11:55:05'),
(11, 'dummy2', 'admin', '2024-09-18 12:11:21', '2024-09-18 12:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(13, 1),
(13, 7),
(13, 11),
(14, 1),
(14, 7),
(14, 8),
(15, 1),
(15, 8),
(15, 11),
(16, 1),
(17, 1),
(17, 7),
(17, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('SHO3392exJXSmiY2Zbsmg2cic8UATnQ75k9xprgl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmpxeE5YMmo2VTNwTjVaSXlYM3Q3VzdCM3RqbE1HUUQ5clpLVjdDMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdjEvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1785178020);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_title` varchar(255) NOT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `attrvalue_id`, `product_id`, `size_title`, `productRegularPrice`, `productSalePrice`, `discount_percentage`, `created_at`, `updated_at`) VALUES
(9, 14, 32, 'S', 5000.00, 4750.00, 5, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(10, 15, 32, 'M', 6000.00, 5400.00, 10, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(11, 16, 32, 'L', 6500.00, 5525.00, 15, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(12, 17, 32, 'XL', 7000.00, 5600.00, 20, '2024-08-08 16:05:35', '2024-08-08 16:08:09'),
(13, 25, 34, '41', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(14, 26, 34, '42', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(15, 27, 34, '43', 2000.00, 1900.00, 5, '2024-10-26 01:22:03', '2024-10-27 05:25:17'),
(16, 14, 35, 'S', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(17, 15, 35, 'M', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(18, 16, 35, 'L', 2000.00, 1000.00, 50, '2024-11-01 11:25:21', '2024-11-02 11:56:01'),
(19, 16, 40, 'L', 800.00, 784.00, 2, '2024-11-02 12:12:51', '2024-11-02 12:12:51'),
(22, 29, 45, 'Universal', 130.00, 123.50, 5, '2026-07-27 10:41:26', '2026-07-27 10:41:26'),
(23, 29, 46, 'Universal', 970.00, 921.50, 5, '2026-07-27 10:44:55', '2026-07-27 10:44:55'),
(24, 31, 47, '200ml', 970.00, 921.50, 5, '2026-07-27 12:00:56', '2026-07-27 12:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `slider_img` text DEFAULT NULL,
  `slider_title_1` varchar(255) DEFAULT NULL,
  `slider_title_2` varchar(255) DEFAULT NULL,
  `slider_title_3` varchar(255) DEFAULT NULL,
  `slider_text` text DEFAULT NULL,
  `slider_btn_name` varchar(255) DEFAULT NULL,
  `slider_btn_link` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slug`, `slider_img`, `slider_title_1`, `slider_title_2`, `slider_title_3`, `slider_text`, `slider_btn_name`, `slider_btn_link`, `status`, `created_at`, `updated_at`) VALUES
(5, 'asd', 'backend/assets/images/uploads/sliders/1785166361.webp', 'Welcome to Uthao Bazar', 'Womens and Girls Fashion', 'Sale up to <span>30% OFF</span>', 'Free shipping on all your order. we deliver, you enjoy', 'Shop Now', '#', 1, '2024-07-10 10:00:23', '2026-07-27 09:32:41'),
(11, 'welcome-to-uthao-bazar', 'backend/assets/images/uploads/sliders/1785166370.webp', 'Welcome to Uthao Bazar', 'Mothers and Baby', 'Sale up to <span>20% OFF</span>', 'Free Shipping on all of Our Featured Product', 'Shop Now', '#', 1, '2024-08-04 09:14:23', '2026-07-27 09:32:50'),
(12, 'one', 'backend/assets/images/uploads/sliders/1785166377.webp', 'one', 'two', 'three', 'sada', 'sadas', '#', 1, '2024-11-08 14:10:28', '2026-07-27 09:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_img` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `subcategory_name`, `slug`, `category_id`, `subcategory_img`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Juice', 'juice', 8, 'public/backend/images/subCategory/38697140.webp', 1, '2024-08-01 11:29:50', '2026-07-27 09:40:22'),
(7, 'Coffee', 'coffee', 8, 'public/backend/images/subCategory/43872564.webp', 1, '2026-06-22 13:13:38', '2026-07-27 09:39:45'),
(8, 'Frozen', 'frozen', 8, 'public/backend/images/subCategory/22392009.png', 1, '2026-06-22 13:14:03', '2026-07-27 09:39:19'),
(9, 'Soft Drinks', 'soft-drinks', 8, 'public/backend/images/subCategory/29547017.webp', 1, '2026-06-22 13:14:20', '2026-07-27 09:38:52'),
(10, 'Teabag', 'teabag', 8, 'public/backend/images/subCategory/8139694.webp', 1, '2026-06-22 13:14:38', '2026-07-27 09:38:34'),
(11, 'Egg', 'egg', 8, 'public/backend/images/subCategory/77222959.webp', 1, '2026-06-22 13:15:04', '2026-07-27 09:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_icon` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_colors`
--

CREATE TABLE `theme_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `primary_color_key` varchar(255) DEFAULT NULL,
  `primary_color_value` varchar(255) DEFAULT NULL,
  `secondary_color_key` varchar(255) DEFAULT NULL,
  `secondary_color_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_colors`
--

INSERT INTO `theme_colors` (`id`, `primary_color_key`, `primary_color_value`, `secondary_color_key`, `secondary_color_value`, `created_at`, `updated_at`) VALUES
(2, NULL, '#fe5200', NULL, '#191919', '2024-09-13 02:31:50', '2024-09-13 04:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_pic` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `thana` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `state_district` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `profile_pic`, `name`, `email`, `phone`, `address`, `thana`, `area`, `gender`, `company_name`, `state_district`, `zip_code`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'public/frontend/images/upload/profile/172655352366e91db39fa18.jpg', 'Sabbir hossain', 'h.sabbir36@yahoo.com', '01926241905', 'Dhaka North City corporation, Dhaka', 'Dakshinkhan', 'Ashkona', 'male', 'Gen-Zilla', 'Dhaka', '1230', NULL, '$2y$12$ElwNwruoltBWuQpvaoHoweh2aif/NXc79Yb.UjGpm49UVwImijmq.', 1, 'k41VqSlutHKixa0EKk2bIhdFLnpROoWc49flK0kW0FCqi9kzJ4Jx2voiZmX7', '2024-09-06 13:30:09', '2025-02-04 18:49:52'),
(12, NULL, 'Rifat Khan', 'rifat@gmail.com', NULL, 'test address', 'Dakshinkhan', 'Ashkona', 'male', NULL, NULL, NULL, NULL, '$2y$12$a4BV5vIahFbXzqmr//xVUOqWHNIlhiM2JTOqpLsd.rAbJbexRYs0C', 1, NULL, '2025-01-30 17:49:27', '2025-01-30 17:49:27'),
(13, NULL, 'Stuff', 'sh1389045@gmail.com', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, '$2y$12$CvGifb.u9ohR5V6Ax7dE3O6p9se6ezn5PSyFQHaKS/QvR9AQjblhe', 1, NULL, '2025-01-30 18:03:23', '2025-01-30 18:03:23'),
(14, NULL, 'saif hossain', 'sf@gmail.com', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, '$2y$12$S.TSA1KrqrNEYnwfo/t3UePl4iGMWV3tOABqOUjRDyQNuqR5Ol9J2', 1, NULL, '2025-01-30 18:26:18', '2025-01-30 18:26:18'),
(15, NULL, 'Sabbir hossain', 'sh139045@gmail.com', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, NULL, '$2y$12$Rqhm3ZHpKoqPAgPHRO4JqO.d4HVKnTO/3GNrX.45SAXf1fbExCdxq', 1, NULL, '2025-01-30 18:26:48', '2025-01-30 18:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `weight_title` varchar(255) NOT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weights`
--

INSERT INTO `weights` (`id`, `attrvalue_id`, `product_id`, `weight_title`, `productRegularPrice`, `productSalePrice`, `discount_percentage`, `created_at`, `updated_at`) VALUES
(9, 11, 32, '1 KG', 6000.00, 5100.00, 15, '2024-08-08 16:08:09', '2024-08-08 16:08:09'),
(10, 12, 32, '3 KG', 6500.00, 5200.00, 20, '2024-08-08 16:08:09', '2024-08-08 16:08:09'),
(11, 33, 48, '2KG', 130.00, 123.50, 5, '2026-07-27 12:21:02', '2026-07-27 12:21:02'),
(12, 34, 49, '1300gm', 280.00, 266.00, 5, '2026-07-27 12:23:24', '2026-07-27 12:23:24'),
(13, 11, 50, '1 KG', 220.00, 209.00, 5, '2026-07-27 12:34:27', '2026-07-27 12:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `weight_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attrvalues`
--
ALTER TABLE `attrvalues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attrvalues_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `basic_infos`
--
ALTER TABLE `basic_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colors_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `colors_product_id_foreign` (`product_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_charges_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sizes_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `sizes_product_id_foreign` (`product_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sliders_slug_unique` (`slug`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_slug_unique` (`slug`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `theme_colors`
--
ALTER TABLE `theme_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weights_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `weights_product_id_foreign` (`product_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attrvalues`
--
ALTER TABLE `attrvalues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `delivery_charges`
--
ALTER TABLE `delivery_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_colors`
--
ALTER TABLE `theme_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attrvalues`
--
ALTER TABLE `attrvalues`
  ADD CONSTRAINT `attrvalues_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weights`
--
ALTER TABLE `weights`
  ADD CONSTRAINT `weights_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `weights_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
