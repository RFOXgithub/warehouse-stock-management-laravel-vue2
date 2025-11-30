-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2025 at 06:04 PM
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
-- Database: `warehouse2`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluars`
--

CREATE TABLE `barang_keluars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_keluars`
--

INSERT INTO `barang_keluars` (`id`, `item_id`, `tanggal`, `jumlah_keluar`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-21', 5, 'Order from Rfox', '2025-11-30 09:51:36', '2025-11-30 09:51:36'),
(2, 12, '2025-11-03', 7, 'Restock request from Outlet A', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(3, 5, '2025-11-04', 3, 'Order from Client X', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(4, 27, '2025-11-05', 12, 'Warehouse move batch A1', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(5, 14, '2025-11-05', 4, 'Promo package dispatch', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(6, 33, '2025-11-06', 8, 'Reseller purchase', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(7, 8, '2025-11-06', 6, 'Online shop order', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(8, 19, '2025-11-07', 10, 'Stock transfer to Branch 2', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(9, 41, '2025-11-07', 2, 'Replacement unit request', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(10, 3, '2025-11-08', 5, 'Order from Rfox', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(11, 22, '2025-11-08', 13, 'Bulk reseller order', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(12, 15, '2025-11-09', 4, 'Marketplace shipment', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(13, 49, '2025-11-09', 9, 'Internal usage', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(14, 2, '2025-11-10', 6, 'Distributor purchase', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(15, 31, '2025-11-10', 11, 'E-commerce order pack', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(16, 17, '2025-11-11', 7, 'Promo bundle', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(17, 29, '2025-11-11', 3, 'Store request', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(18, 52, '2025-11-12', 15, 'Branch restock', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(19, 9, '2025-11-12', 2, 'Return replacement', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(20, 36, '2025-11-13', 8, 'Dispatch to offline store', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(21, 47, '2025-11-13', 14, 'Customer large purchase', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(22, 25, '2025-11-14', 9, 'Special order pack', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(23, 10, '2025-11-14', 6, 'New distributor signup', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(24, 30, '2025-11-14', 5, 'Online flash sale order', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(25, 6, '2025-11-15', 12, 'Stock allocation', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(26, 43, '2025-11-15', 7, 'Retail partner request', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(27, 21, '2025-11-16', 16, 'Bulk transfer B', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(28, 18, '2025-11-16', 4, 'Customer order batch', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(29, 11, '2025-11-17', 3, 'Small order shipment', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(30, 28, '2025-11-17', 18, 'Major reseller purchase', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(31, 53, '2025-11-18', 9, 'Replacement for damaged stock', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(32, 4, '2025-11-18', 2, 'Sample distribution', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(33, 34, '2025-11-19', 5, 'Urgent stock request', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(34, 44, '2025-11-19', 11, 'Sales campaign distribution', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(35, 13, '2025-11-20', 8, 'Micro distributor order', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(36, 40, '2025-11-20', 6, 'Store consignment', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(37, 16, '2025-11-21', 4, 'Event stock supply', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(38, 48, '2025-11-21', 15, 'Wholesale outgoing', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(39, 23, '2025-11-22', 10, 'Branch replenishment', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(40, 50, '2025-11-22', 3, 'Small business order', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(41, 1, '2025-11-23', 7, 'Retail sale pack', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(42, 26, '2025-11-23', 9, 'Logistics distribution', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(43, 39, '2025-11-24', 13, 'Outlet supply run', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(44, 7, '2025-11-24', 5, 'After-sales replacement', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(45, 45, '2025-11-25', 8, 'Store inventory shuffle', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(46, 24, '2025-11-25', 2, 'Sample kit usage', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(47, 20, '2025-11-26', 4, 'Courier shipment', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(48, 51, '2025-11-26', 17, 'High volume buyer request', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(49, 42, '2025-11-27', 12, 'Branch opening supply', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(50, 32, '2025-11-27', 5, 'Event booth supplies', '2025-11-30 16:57:33', '2025-11-30 16:57:33'),
(51, 35, '2025-11-28', 9, 'Market distribution', '2025-11-30 16:57:33', '2025-11-30 16:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuks`
--

CREATE TABLE `barang_masuks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang_masuks`
--

INSERT INTO `barang_masuks` (`id`, `item_id`, `tanggal`, `jumlah_masuk`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-29', 10, 'Order from TikTok', '2025-11-30 09:50:46', '2025-11-30 09:50:46'),
(2, 14, '2025-11-01', 12, 'Restock supplier A', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(3, 33, '2025-11-01', 20, 'Return from reseller', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(4, 5, '2025-11-02', 18, 'Incoming goods batch B1', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(5, 27, '2025-11-02', 10, 'Supplier delivery', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(6, 10, '2025-11-03', 25, 'Purchase order arrival', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(7, 48, '2025-11-03', 16, 'Bulk stock refill', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(8, 2, '2025-11-04', 14, 'Stock replenishment', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(9, 37, '2025-11-04', 22, 'Incoming shipment', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(10, 21, '2025-11-05', 8, 'Vendor delivery', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(11, 51, '2025-11-05', 19, 'Restock for warehouse B', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(12, 11, '2025-11-06', 30, 'PO Batch C2 arrived', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(13, 43, '2025-11-06', 26, 'Purchase restock', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(14, 32, '2025-11-07', 15, 'Return processed', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(15, 7, '2025-11-07', 23, 'Stock arrival from vendor', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(16, 49, '2025-11-08', 10, 'Shipment unload', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(17, 13, '2025-11-08', 18, 'Component refill', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(18, 50, '2025-11-09', 17, 'Distributor restock', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(19, 6, '2025-11-09', 12, 'Purchase order regular', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(20, 20, '2025-11-10', 28, 'Bulk PO arrival', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(21, 38, '2025-11-10', 12, 'Vendor resupply', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(22, 4, '2025-11-11', 9, 'Return to warehouse', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(23, 25, '2025-11-11', 13, 'Incoming shipment pack', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(24, 29, '2025-11-12', 14, 'Supplier drop-off', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(25, 18, '2025-11-12', 27, 'Goods arrival batch D', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(26, 45, '2025-11-13', 21, 'Stock reinforcement', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(27, 23, '2025-11-13', 11, 'Vendor goods intake', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(28, 46, '2025-11-14', 30, 'Mass shipment intake', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(29, 3, '2025-11-14', 20, 'PO restock batch F', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(30, 35, '2025-11-15', 17, 'Purchase from supplier X', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(31, 15, '2025-11-15', 19, 'Returned by customer', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(32, 52, '2025-11-16', 24, 'Distributor delivery', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(33, 28, '2025-11-16', 8, 'Warehouse incoming load', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(34, 44, '2025-11-17', 10, 'Stock increase', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(35, 26, '2025-11-17', 18, 'Scheduled vendor restock', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(36, 53, '2025-11-18', 29, 'Major supplier intake', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(37, 9, '2025-11-18', 12, 'Stock from HQ', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(38, 36, '2025-11-19', 15, 'Shipment from Jakarta', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(39, 22, '2025-11-19', 23, 'Refill due to high demand', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(40, 19, '2025-11-20', 16, 'Vendor recurring PO', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(41, 12, '2025-11-20', 21, 'Returned inventory', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(42, 30, '2025-11-21', 11, 'Import stock intake', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(43, 31, '2025-11-21', 20, 'Shipment F2 unload', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(44, 8, '2025-11-22', 13, 'Incoming restock E1', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(45, 47, '2025-11-22', 6, 'Small supplier shipment', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(46, 17, '2025-11-23', 28, 'Restock due to promotion', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(47, 40, '2025-11-23', 18, 'PO arrival from warehouse C', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(48, 24, '2025-11-24', 22, 'Purchase order arrival', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(49, 42, '2025-11-24', 16, 'Supplier cycle shipment', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(50, 34, '2025-11-25', 19, 'Distributor supply', '2025-11-30 16:58:29', '2025-11-30 16:58:29'),
(51, 16, '2025-11-25', 25, 'Vendor shipment arrival', '2025-11-30 16:58:29', '2025-11-30 16:58:29');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1),
(5, '2025_11_25_093639_create_products_table', 1),
(6, '2025_11_26_101853_create_barang_masuks_table', 1),
(7, '2025_11_29_061640_create_barang_keluars_table', 1);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `stock_awal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`item_id`, `kode_barang`, `nama_barang`, `satuan`, `stock_awal`, `created_at`, `updated_at`) VALUES
(1, 'BRG-001', 'Asus TUF Gaming ZX001', 'unit', 50, '2025-11-30 09:49:13', '2025-11-30 09:49:13'),
(2, 'BRG-002', 'HP Pavillion 15 StreetX', 'unit', 25, '2025-11-30 09:49:30', '2025-11-30 09:49:30'),
(3, 'BRG-003', 'Marina Natural Purple', 'pcs', 75, '2025-11-30 09:49:48', '2025-11-30 09:49:48'),
(4, 'BRG-004', 'Logitech G102 Wired Mouse', 'unit', 20, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(5, 'BRG-005', 'Samsung Galaxy Fit Pro', 'unit', 15, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(6, 'BRG-006', 'Bardi Smart LED Bulb 12W', 'pcs', 30, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(7, 'BRG-007', 'WD Blue SSD 500GB', 'unit', 25, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(8, 'BRG-008', 'NYX Soft Matte Lip Cream', 'pcs', 50, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(9, 'BRG-009', 'Lenovo ThinkVision M14', 'unit', 10, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(10, 'BRG-010', 'Acer Nitro Wireless Keyboard', 'pcs', 18, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(11, 'BRG-011', 'Oriflame Tender Care Protecting Balm', 'pcs', 40, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(12, 'BRG-012', 'JBL Tune 510BT Headphone', 'unit', 22, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(13, 'BRG-013', 'Xiaomi Mi Band 8', 'unit', 28, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(14, 'BRG-014', 'Emina Bright Stuff Face Wash', 'pcs', 75, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(15, 'BRG-015', 'Seagate Barracuda 1TB', 'unit', 17, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(16, 'BRG-016', 'PlayStation DualSense Controller', 'unit', 12, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(17, 'BRG-017', 'Nivea Extra White Lotion', 'pcs', 90, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(18, 'BRG-018', 'Adata PowerBank 20000mAh', 'unit', 35, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(19, 'BRG-019', 'Vaseline Healthy Bright Serum', 'pcs', 60, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(20, 'BRG-020', 'Rexus Headset F30', 'unit', 18, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(21, 'BRG-021', 'Garnier Micellar Water Blue', 'pcs', 70, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(22, 'BRG-022', 'Canon Pixma Ink Black 790', 'pcs', 33, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(23, 'BRG-023', 'TP-Link Deco M5 Mesh WiFi', 'unit', 14, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(24, 'BRG-024', 'Wardah Lightening Facial Scrub', 'pcs', 82, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(25, 'BRG-025', 'Sandisk Ultra 64GB Flashdrive', 'unit', 48, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(26, 'BRG-026', 'Realme Buds Air Neo', 'unit', 20, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(27, 'BRG-027', 'Citra Green Tea Body Gel', 'pcs', 55, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(28, 'BRG-028', 'HP 680 Ink Cartridge Black', 'pcs', 32, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(29, 'BRG-029', 'Asus ROG Gaming Mousepad XL', 'pcs', 26, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(30, 'BRG-030', 'Olay Regenerist Night Cream', 'pcs', 40, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(31, 'BRG-031', 'Kingston DDR4 8GB RAM', 'unit', 13, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(32, 'BRG-032', 'MSI DS501 Gaming Headset', 'unit', 27, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(33, 'BRG-033', 'Pixy UV Whitening Two Way Cake', 'pcs', 46, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(34, 'BRG-034', 'NZXT RGB Fan 120mm', 'unit', 19, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(35, 'BRG-035', 'Hanasui Serum Vitamin C', 'pcs', 90, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(36, 'BRG-036', 'Xiaomi Smart Camera 1080p', 'unit', 24, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(37, 'BRG-037', 'Rimmel Stay Matte Compact', 'pcs', 33, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(38, 'BRG-038', 'Edifier R1280T Speaker', 'unit', 11, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(39, 'BRG-039', 'NYX Total Control Foundation', 'pcs', 58, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(40, 'BRG-040', 'Corsair Harpoon RGB Mouse', 'unit', 29, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(41, 'BRG-041', 'Herborist Zaitun Body Lotion', 'pcs', 72, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(42, 'BRG-042', 'Anker PowerCore Select 10000', 'unit', 21, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(43, 'BRG-043', 'Emina Cream Blush Peach', 'pcs', 95, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(44, 'BRG-044', 'Philips LED Warm White 9W', 'pcs', 60, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(45, 'BRG-045', 'ONEX Gaming Chair GX1', 'unit', 8, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(46, 'BRG-046', 'Viva Milk Cleanser Spirulina', 'pcs', 45, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(47, 'BRG-047', 'Redragon K617 Keyboard', 'unit', 25, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(48, 'BRG-048', 'Maybelline Fit Me Concealer', 'pcs', 80, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(49, 'BRG-049', 'Baseus USB-C Hub 8in1', 'unit', 14, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(50, 'BRG-050', 'Ponds White Beauty Day Cream', 'pcs', 66, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(51, 'BRG-051', 'AOC 24G2 Gaming Monitor', 'unit', 10, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(52, 'BRG-052', 'Skintific 5X Ceramide Serum', 'pcs', 77, '2025-11-30 16:56:17', '2025-11-30 16:56:17'),
(53, 'BRG-053', 'Logitech MX Master 3S', 'unit', 9, '2025-11-30 16:56:17', '2025-11-30 16:56:17');

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
('xSzdTbtGxPoTblxwLDQyM0qsFqCGjZ2jymMeEFzP', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTlRyTmxXWWtsMTJyU0I5NmRVVng1dEhHZDlCQ2FwUlREcDZQYVQzRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1764522207);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'RFOX', 'rfox@gmail.com', NULL, '$2y$12$Gzh4Prko3Vn9mcC4OXqdVOZc.VXudAgDupqjz7aSy7Iz5RtpFxqhe', NULL, NULL, NULL, NULL, '2025-11-30 09:48:44', '2025-11-30 09:48:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluars`
--
ALTER TABLE `barang_keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_keluars_item_id_foreign` (`item_id`);

--
-- Indexes for table `barang_masuks`
--
ALTER TABLE `barang_masuks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_masuks_item_id_foreign` (`item_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluars`
--
ALTER TABLE `barang_keluars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `barang_masuks`
--
ALTER TABLE `barang_masuks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_keluars`
--
ALTER TABLE `barang_keluars`
  ADD CONSTRAINT `barang_keluars_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `products` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `barang_masuks`
--
ALTER TABLE `barang_masuks`
  ADD CONSTRAINT `barang_masuks_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `products` (`item_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
