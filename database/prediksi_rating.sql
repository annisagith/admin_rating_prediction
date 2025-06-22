-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 07:36 AM
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
-- Database: `prediksi_rating`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','superadmin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `email`, `nama_lengkap`, `role`, `created_at`, `updated_at`) VALUES
('929347c0-2400-11f0-a107-15c393953547', 'lisaanjani	', 'scrypt:32768:8:1$GPcsbqSXoY6j8RQC$5d276b5f2882a698d399df37c93aa7dac33380a26bc242f2a1d1e4a28a9894ad85f638fa140c18fe76bc0300b2e923d9a903131a5bf6cea24aa77fad37443813', 'lisa.anjani@example.com', 'Lisa Anjani	', 'admin', '2025-04-28 07:15:32', '2025-05-30 16:26:47'),
('936f536b-3d73-11f0-a5a4-466b44159bcc', 'asasasas', 'scrypt:32768:8:1$nXAEAkVTIVWS4OSZ$c86b107401ff2922b2a0b2464da9447dc08d39a20b01b18c0e90b6f0541063f4079b5de7c639a4cf9df9b271983dbf1480f590226e23b34ad173210a0a110cc0', 'asasa@gmail.com', 'asasa', 'admin', '2025-05-30 16:31:45', '2025-05-30 16:31:45'),
('a1d3c319-21a6-11f0-a82b-4d8acd648b8d', 'adnisa', 'scrypt:32768:8:1$M8LjsepKYlY0PRBu$4d0bc34d8c1ddff14d7291c078057452ddc392b10a7af851d3ca76d7ab5183e4cc8ac608575178f78091caab99cd535923e0b2596c4bee25148a6e886d1e15f7', 'adminannisa@gmail.com', 'Admin Annisa Marfadilla', 'admin', '2025-04-25 07:26:29', '2025-05-01 13:17:24'),
('a1fc101c-2400-11f0-a107-15c393953547', 'ahmadf', 'scrypt:32768:8:1$eIk141clkYu5kiLr$ee10706028b101be152a1441f2b967b846776b6c547742c00e8eb3c7099f6d9c9323c0d8d4bd184742c8c2d0e7857d7745a8cc429892cd0db7576ee5efee4a63', 'ahmad.fauzan@example.com', 'Ahmad Fauzan	', 'admin', '2025-04-28 07:15:58', '2025-04-28 07:15:58'),
('ae629bac-2400-11f0-a107-15c393953547', 'mayap', 'scrypt:32768:8:1$e4snZZRFRqBIDDnd$6060ae077da3e3a477eac160c18828375033d5293e0c7f08a7d44b75785ebb3e4ba5e563952e9ca452e19f6064c5ea4c3719141f7e2d0a2fd99e0a92d4e59b77', 'maya.puspita@example.com', 'Maya Puspitasari	', 'admin', '2025-04-28 07:16:19', '2025-04-28 07:16:19'),
('b90437d8-2400-11f0-a107-15c393953547', 'dedipermana	', 'scrypt:32768:8:1$vYVhkCFCsrQlWbM7$76bea19a3dac16500bb6a8b8200cee9c191e7acea938a719c94f7b1c82d7c6910c785d67691e23822648c247054064e6c89fd74753a8f07c3f6a7eaac4917847', 'dedi.permana@example.com', 'Dedi Permana	', 'admin', '2025-04-28 07:16:37', '2025-04-28 07:16:37'),
('c5228ad8-2400-11f0-a107-15c393953547', 'nurulfitri', 'scrypt:32768:8:1$oTOE2NV1jrf2kVbi$42e4e09304a8ad22a00678e3bd39bbda8650cddaed29e94cd07573aa8e1eb58a1fe01a88c9cb76c2ab810f61e80e63f4f84321d023c4131e06c09744d745d0fa', 'nurul.fitri@example.com', 'Nurul Fitriani	', 'admin', '2025-04-28 07:16:57', '2025-04-28 07:16:57'),
('c67c3a02-241a-11f0-a107-15c393953547', 'petugas1', 'scrypt:32768:8:1$DIH8d5cKez2Sr9zs$f63785ca91c9b51f1c175647fd4db07fd20b52ac8e66c2f0af06d3ead95d2e2019e929f97a7d7c48d5f70cd203d0faf1c6c30b5c593f47034a15ac5057c7642c', 'petugas1@gmail.com', 'petugas1', 'admin', '2025-04-28 10:23:06', '2025-04-28 10:23:06'),
('d06e57ba-1dcc-11f0-ba8d-399646993025', 'superadmin', 'scrypt:32768:8:1$vo0eFKxFZNnK3fYt$684c1622aec95938899d0920593da8a74854a8ae0c91e1cd0a973e8e641813eb608173087f4f38ba6b013d69e6b0e3dd4546a9a239f1adfb2a82c4d6efdbc974', 'superadmin@gmail.com', 'Super Admin', 'superadmin', '2025-04-20 09:49:55', '2025-05-30 16:38:35'),
('d145f066-2400-11f0-a107-15c393953547', 'rizkyaditya	', 'scrypt:32768:8:1$PlY7zyaRkToMHB7w$6b67622466b0572d2588e23565f21ccee8bac073c5fb4c2d46941d06db348e4893849e1b51fc8de3040749326191991f6f0fddb48a74900c1a06669957193da3', 'rizky.aditya@example.com', 'Rizky Aditya	', 'admin', '2025-04-28 07:17:17', '2025-04-28 07:17:17'),
('d7453ac1-2406-11f0-a107-15c393953547', 'superadmin2', 'scrypt:32768:8:1$3iWEk4135dxKz76U$e4d0aaa9f6f5441be313bea6c7af9f6abc3b8971e1547229f90bebf91ff4e99c84c5586023dbb0ce0c15a5dcf4fe491669d6dc68f7bbf83a7a02c6faf05626d2', 'superadmin2@gmail.com', 'Super Admin 2', 'superadmin', '2025-04-28 08:00:24', '2025-04-28 08:00:24'),
('dc078d3a-2400-11f0-a107-15c393953547', 'ayulestari', 'scrypt:32768:8:1$xgcQkFaXXNgA1BXW$345fe954d1cc95dff945cd3021019bcf99e8659e19ae8287addef8ebad1964f831e06423afba0e807b8b4396048eddb6def0db51babf241726c26d16ba44358c', 'ayu.lestari@example.com', 'Ayu Lestari	', 'admin', '2025-04-28 07:17:35', '2025-04-28 10:25:07'),
('ddd5f976-21a6-11f0-a82b-4d8acd648b8d', 'adjeong', 'scrypt:32768:8:1$vTxxP2HlRTotNKkd$0ed2691ab646beeac1666b0c5917f1ad814e71b5f50b872006e11d26d62bfdf9fed1658e65386af3ff1ce34ce2add07538240ecb31ab665ad58dc5e8926d6e07', 'adminjeongwoo@gmail.com', 'Admin Park Jeongwoo', 'superadmin', '2025-04-25 07:28:10', '2025-06-01 14:12:19');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `nama_brand` varchar(100) NOT NULL,
  `path_foto_brand` varchar(255) NOT NULL,
  `deskripsi_brand` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id_brand`, `nama_brand`, `path_foto_brand`, `deskripsi_brand`, `created_at`, `updated_at`) VALUES
(1, 'ERHA Acneact	', 'img/brand/erha.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:26:50'),
(2, 'Acnes', 'img/brand/acnes.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 02:31:51'),
(3, 'Acnol', 'img/brand/acnol.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(4, 'Sariayu', 'img/brand/sariayu.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(5, 'Benzolac', 'img/brand/benzolac.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(6, 'Emina', 'img/brand/emina.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(7, 'OXY', 'img/brand/oxy.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(8, 'The Body Shop', 'img/brand/tbs.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(9, 'Verile', 'img/brand/verile.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(10, 'Whitelab', 'img/brand/whitelab.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(11, 'Cosrx', 'img/brand/cosrx.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(12, 'Wardah', 'img/brand/wardah.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(13, 'Azarine Cosmetic', 'img/brand/azarine.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39'),
(14, 'Larissa', 'img/brand/larissa.svg', NULL, '2025-05-11 02:31:51', '2025-05-11 03:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `gender` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `username`, `password`, `email`, `nama_lengkap`, `tgl_lahir`, `gender`, `created_at`, `updated_at`) VALUES
('161066aa-3efb-11f0-9ca0-beb036fd53a9', 'wonuulovechaesa', 'scrypt:32768:8:1$yPXDLfGY8BF86aQT$61c0f0a758c7be1c189dbf67ec9b280c3065ac0796456d0f01476a66d2dfc886fb6041eb0b69eb72e053dc0704b28344cb31cb43b7870c78f5710a24d67df146', 'chaewon@gmail.com', 'Wisnu Pratama', NULL, NULL, '2025-06-01 15:14:04', '2025-06-01 15:14:04'),
('2d03ddcc-3ef0-11f0-9ca0-beb036fd53a9', 'nopawwww', 'scrypt:32768:8:1$VHN0NFGU0Im5LUE5$5072ed27c892f9430ae5221c0d19b055e58f0757770fe2b7626aebcdb3c44b5a6616c9f4c6b45595304bec4427b2502b0bbf1a9670170db88d898492bbc6b8aa', 'nopawww@gmail.com', 'Fatimah Nova Putri Diana', NULL, NULL, '2025-06-01 13:55:58', '2025-06-01 13:55:58'),
('3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'chawoo', 'scrypt:32768:8:1$VZ18nLWlSDjBPSTQ$8e04fb4a05e233bf658d5a9b84b6d858ff92fd15d9d76b5a0b2852f11bf399a099e368dae5eee5b702a74751f4cec87900ef13d6cee6f07ae14b59cd4ba0e390', 'annisamarfadilla@gmail.com', 'Annisa Marfadilla', '2003-07-05', 'Laki-Laki', '2025-04-15 19:31:29', '2025-06-01 14:21:18'),
('58ccda51-3f63-11f0-9ca0-beb036fd53a9', 'Wirdayenti', 'scrypt:32768:8:1$ROIG4EvSzvapoctG$7e0c9970ecfd7318c9846fc915c06818892d9c6fd1bee948b0400568dee4a99f7d20b45430ffceb4d936ba4ba4209a1ff9665433873a5871bd61aefc472d1b22', 'wirdayenti821@gmail.com', 'Wirda Yenti', NULL, NULL, '2025-06-02 03:40:18', '2025-06-02 03:40:18'),
('5c038065-1c42-11f0-918a-56496e4c341e', 'cha', 'scrypt:32768:8:1$NMjznSBfMiCNWZZW$00d51522980aa772adf23ae8e0d245f7b10aaa46c0cb2a0ce7d105fa2c9b947efa85df1a17bfebcd5c25f647b9c6e53056ef3df58ea650a32c4bd956895a043a', 'cha@gmail.com', 'Cha', NULL, NULL, '2025-04-18 10:46:18', '2025-04-18 10:46:18'),
('6c6bed1a-412f-11f0-9ea3-7bed3642a98b', 'abaaa', 'scrypt:32768:8:1$Sem6ymQIz0RGlW9H$f653496e75e4ef1ba37fa0bf8c0f8e069b727a651e030337ba9e9bf41d1db070fd2ba10875b9dfa7ceb912b0a52b5279d0c7e143106e75fc18955f87a1dc5eb5', 'abaaa@gmail.com', 'Faris Adrian Dzaky', NULL, NULL, '2025-06-04 10:33:58', '2025-06-04 10:33:58'),
('87315099-2049-11f0-bf91-23679fe49d64', 'acha', 'scrypt:32768:8:1$GszDT67l39jqe0CN$2c0a7c8a61902839a55ab8d3b32be5f36542c041710fe6752fbd5d27220b4b4b149551299234b44f6e6ecca6a149f09d6d19ff996828457d0eed63f1876caf71', 'annisaicha@gmail.com', 'Annisa Icha', NULL, NULL, '2025-04-23 13:47:42', '2025-04-23 13:47:42'),
('91155d54-1a31-11f0-93bb-38f72f0489a3', 'jewuu', 'scrypt:32768:8:1$2Qx0orbjqpMD1jJ2$e6cef767b67e6c21eecbad0684f306cdca52c1c0beac86bf807f166eb6ebbb35d03c848aba89f7fe99a12c3d057bdb049fffe129089ff933dc1abbd533a0e55b', 'parkjeongwoo@gmail.com', 'Park Jeongwoo', '2004-09-28', 'Laki-Laki', '2025-04-15 19:41:03', '2025-05-09 09:07:23'),
('97013ede-1dc3-11f0-ba8d-399646993025', 'jaejae', 'scrypt:32768:8:1$2H4heKmn5xPZFgtV$121d9bef278e22fd555659333c0f74379a676e3e3967fdf879db55396c646d431826125315edb47af5f27d761a29aa7209f05b67efdd206fd128b8a5e12e11a4', 'yoonjaehyuk@gmail.com', 'Yoon Jaehyuk', NULL, NULL, '2025-04-20 08:43:53', '2025-04-20 08:43:53'),
('ab8e452e-3f6e-11f0-9ca0-beb036fd53a9', 'Delila123', 'scrypt:32768:8:1$oePtF8nKl90Fiwmz$7387298bf692a67db4a50b3c11c0089f52c1f4becae6da9c37c9d029a33dd90d759b51f6067a18983a0cc91a4d6735d17415c57c517cebc65b37bb315f539ca1', 'delilasaridwiputri123@gmail.com', 'Delila Sari', NULL, NULL, '2025-06-02 05:01:21', '2025-06-02 05:01:21'),
('bb395a42-3d75-11f0-a5a4-466b44159bcc', 'ansa', 'scrypt:32768:8:1$DnDeeDYYZIZDEV1a$b07c357e423781d18a5ce5ee45f089d81fd091501851b5df0e5be816cd950f8a910de8d63afacac8d1919e9bf3de8fbfe86626ee9c111103b52de4cb5b8c330e', 'ansa@gmail.com', 'Annama Jiwasa', NULL, NULL, '2025-05-30 16:47:11', '2025-05-30 16:47:11'),
('d9622036-34cc-11f0-9884-453432615276', 'ajong', 'scrypt:32768:8:1$N3F5z03AvADhqw0d$490a6259775a0dc02cec4f29a3622b0974400b515efd82b75f77c83da18307d95a1bb974e6432ecf215308c99594bd6605791141d9895fa6e8fd4f6a0800ceab', 'ajong@gmail.com', 'Kamilia', '2003-07-05', 'Perempuan', '2025-05-19 16:18:07', '2025-05-19 16:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_produk`
--

CREATE TABLE `jenis_produk` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(255) NOT NULL,
  `path_foto_jenis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_produk`
--

INSERT INTO `jenis_produk` (`id_jenis`, `nama_jenis`, `path_foto_jenis`) VALUES
(1, 'Facial Wash / Cleanser', 'img/jenis/1.png'),
(2, 'Toner', 'img/jenis/2.png'),
(3, 'Moisturizer / Gel / Cream', 'img/jenis/3.png'),
(4, 'Spot Treatment', 'img/jenis/4.png'),
(5, 'Serum / Essence', 'img/jenis/5.png'),
(6, 'Mask (Clay / Sheet / Overnight)', 'img/jenis/6.png'),
(7, 'Sunscreen', 'img/jenis/7.png'),
(8, 'Acne Patch', 'img/jenis/8.png'),
(9, 'Exfoliator', 'img/jenis/9.png'),
(10, 'Treatment Gel / Lotion / Solution', 'img/jenis/10.png');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id_aktivitas` char(36) NOT NULL,
  `id_produk` char(36) DEFAULT NULL,
  `id_admin` char(36) DEFAULT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id_aktivitas`, `id_produk`, `id_admin`, `aktivitas`, `deskripsi`, `created_at`) VALUES
('1a68532c-65d1-4745-a912-bc49b682b08f', 'b6c12a7c-badb-4259-8e2a-22350aa001b0', 'a1d3c319-21a6-11f0-a82b-4d8acd648b8d', 'Tambah Produk', 'Menambahkan Produk: Emina Ms. Pimple Acne Solution Spot Gel', '2025-05-01 09:36:34'),
('4ce30901-3f14-4727-baba-faae23f48b4f', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'ddd5f976-21a6-11f0-a82b-4d8acd648b8d', 'Tambah Produk', 'Menambahkan Produk: Benzolac 2.5 Benzoyl Peroxide 2.5%', '2025-05-01 09:42:22'),
('5aef08c9-10cd-4b10-80f9-f534a1d6c383', '7e280966-23e7-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Acne Cream', '2025-05-10 14:50:03'),
('5b793fe8-4896-49a5-ae3d-cb4abbb05996', '5d35f59a-642e-4d5f-a79e-aed5ddcfb8bd', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Centella Blemish Cream', '2025-05-10 14:49:42'),
('5dc62ab8-9e0e-477a-ae68-ef09c4a2c18b', 'd36bc332-23e7-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Point Clear', '2025-05-12 18:20:11'),
('6113a546-dc44-4907-8d75-c3e03a3d5988', '5d35f59a-642e-4d5f-a79e-aed5ddcfb8bd', 'ddd5f976-21a6-11f0-a82b-4d8acd648b8d', 'Tambah Produk', 'Menambahkan Produk: Cosrx Centella Blemish Cream', '2025-05-01 09:44:11'),
('66a3cd1c-415f-4eb0-a9a4-bf80a5555fc3', 'bf24b02e-23e6-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Sealing Gel', '2025-05-11 02:53:41'),
('67d08c85-af22-402c-bfcb-4c60491ef988', '9936a4b5-23e6-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Tea Tree Oil', '2025-05-10 15:00:12'),
('6a579313-6e8c-4f93-819f-693c97e3250d', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Benzoyl Peroxide 2.5%', '2025-05-12 18:21:42'),
('6ab45bd6-11f1-4e60-ae4a-d6c05f1e4030', 'f3700935-23e7-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Intensive Acne Care', '2025-05-10 15:08:10'),
('71ac8249-09bb-46c4-9aab-5d6c5473315c', '8b67aa43-59fb-44e6-b79c-cb80ed9676dd', 'a1d3c319-21a6-11f0-a82b-4d8acd648b8d', 'Tambah Produk', 'Menambahkan Produk: Verile Acne Gel', '2025-05-01 09:35:39'),
('7483cf4e-3c6b-47d4-b6a9-fe2d67bb9abe', '4c6cf694-23e8-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Acne Spot Treatment Gel', '2025-05-12 18:23:50'),
('7e25a1c4-fd0f-4789-9a30-d6a5196abe30', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Acne Lotion', '2025-05-11 02:50:57'),
('80d3ce28-ce96-42ee-8e9c-b6ad981de10d', '7e280966-23e7-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Acne Cream', '2025-05-12 18:26:25'),
('ac8d47d7-7882-445a-bf79-e65a45364c4c', 'bf24b02e-23e6-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk: Sealing Gel', '2025-05-12 18:16:03'),
('b7166358-a306-47d9-9f0c-b16e45ff1b80', 'e2681509-23e6-11f0-a107-15c393953547', 'd06e57ba-1dcc-11f0-ba8d-399646993025', 'Edit Produk', 'Edit Produk:  Lotion for Acne', '2025-05-11 02:50:29'),
('f26a2f06-706f-40cd-900e-438e1c0ea8c8', 'ceb484b0-591f-46af-b965-b5109e27ff73', 'ddd5f976-21a6-11f0-a82b-4d8acd648b8d', 'Tambah Produk', 'Menambahkan Produk: ERHA Acneact Acne Spot Gel', '2025-05-01 09:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` char(36) NOT NULL,
  `nama_produk` varchar(50) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL,
  `rating_total` decimal(3,2) NOT NULL,
  `path_foto_produk` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_jenis` int(11) DEFAULT NULL,
  `id_brand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `rating_total`, `path_foto_produk`, `created_at`, `updated_at`, `id_jenis`, `id_brand`) VALUES
('36ba992c-56bb-410e-a8af-dbcc26fa4ee5', 'Acne Lotion', 'Acne Lotion yang mengandung Sulfur dan Triclosan untuk mengurangi timbulnya jerawat dan mengontrol kadar minyak berlebih di wajah sehingga tidak mudah timbul jerawat.', 27000, 0.00, 'uploads/produk18.jpg', '2025-05-01 09:43:16', '2025-05-12 18:22:18', 10, 14),
('483322c0-23e7-11f0-a107-15c393953547', 'Anti Acne & Brightening Serum', 'Serum dengan dua action yaitu untuk memudarkan jerawat serta kulit kusam. Kandungan cinnamon, asam salisilat dan centella asiatica untuk mengatasi permasalahan jerawat. Sedangkan vitamin B3 niacinamide, bengkoang, dan ekstrak papaya berfungsi untuk mencerahkan wajah dan menyamarkan bekas jerawat, agar kulit tampak lebih bersih.', 30000, 0.00, 'uploads/produk4.png', '2025-04-28 04:14:30', '2025-05-12 18:24:34', 5, 13),
('4c6cf694-23e8-11f0-a107-15c393953547', 'Acne Spot Treatment Gel', 'There\'s no description for this product.', 23000, 0.00, 'uploads/produk12.png', '2025-04-28 04:21:47', '2025-05-12 18:23:50', 4, 12),
('5d35f59a-642e-4d5f-a79e-aed5ddcfb8bd', 'Centella Blemish Cream', 'Cosrx Centella Blemish Cream dibuat dari bahan-bahan natural dan dirancang untuk menenangkan kulit dan mengurangi noda bekas jerawat. Centella Blemish Cream mengurangi stres pada kulit dengan cara mengantarkan hidrasi dan bahan aktif pada area target.How to Use;Oleskan cream pada wajah sebagai tahap akhir setelah dibersihkan, diberi toner dan serum, terutama di bagian yang bermasalah. ', 220000, 0.00, 'uploads/produk19.jpg', '2025-05-01 09:44:11', '2025-05-12 18:25:19', 3, 11),
('64fddc44-23e7-11f0-a107-15c393953547', 'Acne Pimple Master Patch', 'Cosrx Acne Pimple Master Patch merupakan produk perawatan kulit berbentuk stiker bening yang dapat membantu mengatasi dan menyamarkan jerawat, blackhead, dan whitehead dalam semalam. Mampu membunuh bakteri penyebab jerawat. Dalam setiap kemasan, tersedia stiker dalam tiga ukuran yang dapat disesuaikan dengan area yang ingin ditutupi. Tidak mengandung pewangi.', 55000, 0.00, 'uploads/produk5.png', '2025-04-28 04:15:18', '2025-05-12 18:25:52', 8, 11),
('7e280966-23e7-11f0-a107-15c393953547', 'Acne Cream', 'Whitelab Acne Cream merupakan cream yang bermanfaat untuk membantu mengeringkan jerawat pada kulit, mengurangi produksi minyak berlebih, membantu mencegah munculnya noda hitam karena bekas jerawat, membersihkan pori-pori yang tersumbat, membantu mencegah pertumbuhan bakteri penyebab jerawat, mengurangi kemerahan dan iritasi pada jerawat, dan erawat kehalusan dan kelembutan kulit.', 100000, 0.00, 'uploads/produk6.png', '2025-04-28 04:16:00', '2025-05-12 18:26:25', 3, 10),
('8b67aa43-59fb-44e6-b79c-cb80ed9676dd', 'Acne Gel', 'Melepaskan lapisan keratin yang menyumbat jerawat dan membentuk jaringan kulit baru di bekas tumbuhnya jerawat.', 20000, 0.00, 'uploads/produk13.jpg', '2025-05-01 09:35:39', '2025-05-12 18:19:15', 3, 9),
('96ea3307-53d4-41ae-807c-eace80372ed1', 'Acne Pimple Medication 10 (Maximum Strength)', 'Treats stubborn acnes that do not respond to mild acne treatment by killing acne bacteria, unclogging pores and dry up excessive oil.', 85000, 0.00, 'uploads/produk15.jpg', '2025-05-01 09:37:34', '2025-05-12 18:18:05', 4, 7),
('9936a4b5-23e6-11f0-a107-15c393953547', 'Tea Tree Oil', 'The Body Shop Tea Tree Oil memiliki kandungan Community Fair Trade Organic Tea Tree Oil dari Kenya yang dapat membuat kulit bebas dari jerawat. Telah terbukti secara klinis dapat membuat kulit tampak lebih bersih dalam satu minggu. Cocok digunakan pada kulit yang berjerawat dan komedo.', 120000, 0.00, 'uploads/produk2.jpg', '2025-04-28 04:09:36', '2025-05-12 18:18:33', 4, 8),
('99ff698d-23e7-11f0-a107-15c393953547', 'Spot Care', 'Acnes Spot Care dapat membantu menyamarkan flek hitam dan noda bekas jerawat, serta membantu melembutkan kulit yang kasar.', 31500, 0.00, 'uploads/produk7.png', '2025-04-28 04:16:47', '2025-05-12 18:17:33', 4, 2),
('b6c12a7c-badb-4259-8e2a-22350aa001b0', 'Ms. Pimple Acne Solution Spot Gel', 'There\'s no description for this product.', 32000, 0.00, 'uploads/produk14.png', '2025-05-01 09:36:34', '2025-05-12 18:17:07', 4, 6),
('bf24b02e-23e6-11f0-a107-15c393953547', 'Sealing Gel', 'Acnes Sealing Gel adalah gel transparant dengan kombinasi 3 bahan penakluk jerawat, yaitu Isopropylmethylphenol, Salicylic acid, dan Sulfur. Diformulasikan dengan Isopropylmethylphenol, yang dapat menetrasi hingga ke dalam pori-pori, menjernihkan kulit, dan mengurangi kemunculan jerawat. Formulanya juga dapat mengontrol kelebihan minyak, membersihkan sel-sel kulit mati secara mendalam tanpa menyumbat pori-pori.', 25000, 0.00, 'uploads/produk1.png', '2025-04-28 04:10:40', '2025-05-12 18:16:03', 3, 2),
('cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'Benzoyl Peroxide 2.5%', 'Benzolac Benzoyl Peroxide 2.5% adalah obat berbentuk krim yang mengandung benzoil peroksida untuk mengatasi jerawat ringan hingga sedang. Kemampuan utamanya yaitu membasmi bakteri penyebab, mengurangi produksi minyak, juga membersihkan kotoran yang menempel pada kulit. Penggunaan benzoil peroksida dalam membasmi jerawat umumnya dikombinasikan dengan jenis obat lainnya untuk hasil yang maksimal. Ketika diaplikasikan di kulit, Benzolac akan memberikan efek kering dan mempermudah pengelupasan sel kulit yang berjerawat. Jerawat mudah hilang, namun efek kering pada kulit ini harus diatasi dengan pelembab.', 15000, 0.00, 'uploads/produk17.jpg', '2025-05-01 09:42:22', '2025-05-12 18:21:42', 3, 5),
('ceb484b0-591f-46af-b965-b5109e27ff73', 'Acne Spot Gel', 'Reformulation in March 2023ERHA Acneact Acne Spot Gel merupakan gel yang diformulasikan untuk merawat kulit berjerawat. Kombinasi Sulfur & BHA mampu melawan bakteri penyebab jerawat, mempercepat pengeringan jerawat, dan membantu eksfoliasi sel kulit mati. Dengan kandungan Niacinamide membantu menyamarkan noda hitam bekas jerawat serta Allantoin untuk menenangkan kulit yang teriritasi ringan akibat jerawat.', 65000, 0.00, 'uploads/produk16.png', '2025-05-01 09:41:23', '2025-05-12 18:19:44', 4, 1),
('d36bc332-23e7-11f0-a107-15c393953547', 'Point Clear', 'Acnes Point Clear adalah roll on berisi cairan bening dan transparant untuk mencegah timbulnya cikal bakal jerawat serta meningkatkan elastisitas kulit. Formulanya dapat membuat pori-pori tampak lebih kecil dan mengatasi kemerahan akibat jerawat.', 20000, 0.00, 'uploads/produk8.png', '2025-04-28 04:18:23', '2025-05-12 18:20:11', 4, 2),
('e2681509-23e6-11f0-a107-15c393953547', ' Lotion for Acne', 'Acnol Lotion for Acne merupakan perawatan untuk kulit wajah yang berjerawat dan sensitif. Produk ini mampu mengurangi radang jerawat dan minyak berlebih. Produk ini ampuh dalam menyembuhkan kulit serta melawan bakteri yang mengakibatkan timbulnya jerawat.', 25000, 0.00, 'uploads/produk3.jpg', '2025-04-28 04:11:39', '2025-05-12 18:20:38', 10, 3),
('f3700935-23e7-11f0-a107-15c393953547', 'Intensive Acne Care', 'Sariayu Intensive Acne Care merupakan krim untuk mengeringkan jerawat dan mengatur keseimbangan lemak serta mencegah timbulnya jerawat. Produk ini mengandung belerang halus, pegagan dan bahan lain untuk membantu mengurangi jerawat dan merawat kulit berjerawat.', 18500, 0.00, 'uploads/produk9.png', '2025-04-28 04:19:17', '2025-05-12 18:21:10', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id_ulasan` char(36) NOT NULL,
  `id_produk` char(36) DEFAULT NULL,
  `id_customer` char(36) DEFAULT NULL,
  `ulasan_text` text NOT NULL,
  `rating_sentimen` int(11) NOT NULL,
  `status_rating` enum('manual','model') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id_ulasan`, `id_produk`, `id_customer`, `ulasan_text`, `rating_sentimen`, `status_rating`, `created_at`, `updated_at`) VALUES
('15882abf-4130-11f0-9ea3-7bed3642a98b', 'bf24b02e-23e6-11f0-a107-15c393953547', '6c6bed1a-412f-11f0-9ea3-7bed3642a98b', 'saya udah coba 2 kali menggunakan produk ini dan bagus aja sebenernya, tapi ga yang terlalu ngaruh jug. ketika saya plikasikan ke bagian jerawat, jerawatnya akan kering tapi yang saya perhatikan akan muncul jerawat pada bagian wajah lainnya. bagus tapi ada efek samping penumbuhan di area lain.', 3, 'model', '2025-06-04 10:38:42', '2025-06-04 10:38:42'),
('1ddb80ed-30cf-11f0-81b5-dfa7a5466e57', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Obat jerawat totol paling mutakhir di wajahku hahaha. Di pakai pas mau tidur, besok nya jerawatnya mateng wkwkw. Kalo jerawat nya udah mateng, besok nya udah kering. Ajaib. Cuman ya itu sarung bantal jadi bau sulfur. Tapi sepadan sama hasilnya sihh.', 3, 'manual', '2025-05-14 14:24:09', '2025-05-14 14:24:09'),
('24fec889-3efb-11f0-9ca0-beb036fd53a9', 'bf24b02e-23e6-11f0-a107-15c393953547', '161066aa-3efb-11f0-9ca0-beb036fd53a9', 'sebagai pengguna yang kulitnya oily acne prone, produk ini tu cocok banget karena teksturnya yang lebih ke watery gitu jadi ngga lengket di wajah dan cepat menyerap. harganya juga ga terlalu mahal jadi masih cocok di kantong pelajar.', 5, 'model', '2025-06-01 15:14:29', '2025-06-01 15:14:29'),
('2b2bdc42-4130-11f0-9ea3-7bed3642a98b', 'bf24b02e-23e6-11f0-a107-15c393953547', '6c6bed1a-412f-11f0-9ea3-7bed3642a98b', 'saya udah coba 2 kali menggunakan produk ini dan bagus aja sebenernya, tapi ga yang terlalu ngaruh jug. ketika saya plikasikan ke bagian jerawat, jerawatnya akan kering tapi yang saya perhatikan akan muncul jerawat pada bagian wajah lainnya. bagus tapi ada efek samping penumbuhan di area lain.', 4, 'manual', '2025-06-04 10:39:18', '2025-06-04 10:39:18'),
('2fedf2d6-30c3-11f0-81b5-dfa7a5466e57', '9936a4b5-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Tea three oilnya mantepp bgt, bisa bantu ngeringin jerawat dengan cepattt, ngurangin peradangan di muka, bisa juga untuk menenangkan kulit, wanginya emang agak semerbak gitu tapi ini works banget buat kalian yg ada masalah di acne, wajib dicobaa.', 5, 'manual', '2025-05-14 12:58:46', '2025-05-14 12:58:46'),
('34fade1c-3eb5-11f0-9ca0-beb036fd53a9', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Ini produk favoritku sejak zaman lulus kuliah ampe sekarang pun masih menyimpan produknya karena memang sangat ampuh cepat mengeringkan bakal calon jerawat. Untuk yang udah terlanjut menjadi jerawat, aku rasa produk ini tidak bekerja secara baik', 3, 'manual', '2025-06-01 06:54:04', '2025-06-01 06:54:04'),
('37627c17-34cd-11f0-9884-453432615276', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'd9622036-34cc-11f0-9884-453432615276', 'Kalau untuk jerawat di muka aku kurang nampol sih. Aku baru pakai sekali dan engga bikin jerawat aku kempes atau tambah matang. Ngga ada efek apapun di jerawatku. Mungkin untuk penggunaan jangka panjang baru keliatan. Benzoyl peroxide ini fungsinya memang buat menghilangkan bakteri. Maksudnya ngilangin bakteri di muka jadi mencegah tumbuhnya jerawat. Karena jerawat itu kan tumbuh dari bakteri. Aku pakai benzolac ini di ketiak untuk ngilangin body odor karena cara kerjanya yg ngilangin bakteri. Tp benzolac ini memang bukan deo atau antiperspiran jadi memang ngga bisa nahan keringet. Cuma bikin ngga bau aja walaupun ketiak lagi keringatan. And so far, it works on me.', 5, 'manual', '2025-05-19 16:20:45', '2025-05-19 16:20:45'),
('40ef0932-34cd-11f0-9884-453432615276', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'd9622036-34cc-11f0-9884-453432615276', 'BPO ini harus hati hati banget makenya, salah dikit bisa iritasi. But beside that BPO bener bener ampuh buat ngeringin jerawat, closed comedo dan kawan kawannya. Cuman emang ada sensasi cekat cekit dan gatel gitu selama pemakaian. Dan yang bikin sedih adalah bekas jerawatnya jadi item banget membekas dan susah banget diatasinnya.', 3, 'model', '2025-05-19 16:21:01', '2025-05-19 16:21:01'),
('40f32cd7-30af-11f0-81b5-dfa7a5466e57', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'jujur lupa dari kapan udah pake produk ini mungkin bisa dihitung sdh lebih dari 5 tahunann kali yaa, ini ga overclaim sama sekalii, bener-bener sebepengaruh itu dimuka aku khususnya untuk ngatasin jerawat (bruntusan kecil2) dan ngilangin bekasnya, menurut aku dia ga instan lgsg hilangin yaa, tetep butuh konsistensi pemakaian gituu.', 5, 'manual', '2025-05-14 10:36:11', '2025-05-14 10:36:11'),
('483d393b-34cd-11f0-9884-453432615276', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'd9622036-34cc-11f0-9884-453432615276', 'lagi belanja vitamin, ada clearance sale benzolac langsung beli buat stock, setelah pemakaian hasilnya lumayan keliatan di komedo putih perlahan hilang. Klaimnya bikin kulit kering tapi dikulitku kulit tetap lembab bukan tipe obat jerawat yg bikin kulit kering mengelupas. Teksturnya cream thick jadi kalo apply agak banyak bikin peeling dan kebuang sia sia produknya. Aku rekomendasi bagi kalian yang ada jerawat kecil dan komedo putih aja wajib coba', 5, 'model', '2025-05-19 16:21:13', '2025-05-19 16:21:13'),
('4d47da23-3088-11f0-aa3e-e55b1a6dd5e5', '9936a4b5-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'This product help me to fight my acne on my teenage part. Harganya cukup mahal yaa utk produk sekecil ini :( tp memang menurut gua produknya pun cukup bantu bgt buat sembuhin jerawat2 nakal di muka gua. Baunya cukup strong tp pas pemakaian ada efek calming adem gmn gt ke muka. Kurang oke utk yg punya tipe kulit senstive.', 3, 'model', '2025-05-14 05:57:21', '2025-05-14 05:57:21'),
('5055195c-30af-11f0-81b5-dfa7a5466e57', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Botolnya mini, tapi isinya powerful banget buat ngelawan jerawat. Formulanya mengandung tea tree oil murni yang terkenal banget buat antibakteri dan calming, jadi cocok banget dipakai pas ada jerawat yang lagi aktif atau baru mau muncul.', 5, 'manual', '2025-05-14 10:36:37', '2025-05-14 10:36:37'),
('50b9d4ee-34cd-11f0-9884-453432615276', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', 'd9622036-34cc-11f0-9884-453432615276', 'Ini worth it bangeeet sih. Udah sering repurchase. Karena semantul itu alhamdulillah. Pakenya sekali sehari, kalo lagi parah banget sehari bisa dua kali, tipis-tipis aja terus ditotol jangan diusap, besoknya udah kempes perlahan. Kalau untuk jerawat yang besar mesti sabar sekitar 3-4 hari baru kempes. Recommended banget!', 5, 'model', '2025-05-19 16:21:27', '2025-05-19 16:21:27'),
('5716d741-34c8-11f0-9884-453432615276', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'bagus sekali produknya aku make langsung hilang, btw guys aku belum pernah beli produknya ini cuma uji coba sistem female daily aja, maaf ya ganggu kalian dan ngerusak review maaf yaaa bener bener maaf', 1, 'model', '2025-05-19 15:45:50', '2025-05-19 15:45:50'),
('5d83eb9a-30af-11f0-81b5-dfa7a5466e57', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Tekstusnya cair dan oily gitu, wangi tea tree kerasa banget. Di kulit aku ga mempan untuk meredakan jerawat, malah bikin beruntusan banget. Menurutku buat harga segini, mending beli yg harganya lebih affordable atau yg claimnya lebih bagus.', 3, 'model', '2025-05-14 10:36:59', '2025-05-14 10:36:59'),
('5ddb35a7-307f-11f0-aa3e-e55b1a6dd5e5', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'aku pake acne totol ini udh berkali-kali karena seampuh itu buat melawan jerawat, meskipun terkadang bikin mengelupas di bagian jerawatnya, makannya harus di totol di bagian jerawat aja, wangi banget juga????', 4, 'model', '2025-05-14 04:53:24', '2025-05-14 04:53:24'),
('825b6f28-3089-11f0-aa3e-e55b1a6dd5e5', '9936a4b5-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Obat jerawat ampuh. Bikin lumayan kempes bahan natural. Tekstur cair. Agak mahal walaupun beli yang kecil. Agak perih dikit kalau dipakai. Tapi kempes untuk jerawatnya juga lumayan cepet. Ga ganggu penampilan karena warna nya bening. Bau teatree nya agak nusuk tapi ga bikin pusing.', 4, 'manual', '2025-05-14 06:06:00', '2025-05-14 06:06:00'),
('8ab43f9a-307f-11f0-aa3e-e55b1a6dd5e5', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Obat jerawat totol paling mutakhir di wajahku hahaha. Di pakai pas mau tidur, besok nya jerawatnya mateng wkwkw. Kalo jerawat nya udah mateng, besok nya udah kering. Ajaib. Cuman ya itu sarung bantal jadi bau sulfur. Tapi sepadan sama hasilnya sihh.', 5, 'model', '2025-05-14 04:54:39', '2025-05-14 04:54:39'),
('9cdd0513-307f-11f0-aa3e-e55b1a6dd5e5', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Acne lotion ini ampuh bgt buat mengecilkan jerawat, aku biasanya cuma totol 3 kali jerawat udh hampir hilang, tidak meninggalkan bekas jerawat.. Teksturnya jg cair dan mudah di apply di muka yg ada jerawatnya.. Harganya jg worth soalnya jerawat aku jadi hilang..', 5, 'model', '2025-05-14 04:55:09', '2025-05-14 04:55:09'),
('a8b851ad-307f-11f0-aa3e-e55b1a6dd5e5', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Produk unggulan larissa deh ini kayaknya. Acne lotionnya mantul bangeeeeeeet. Walau aku tipe yg jarang jerawatan, tapi gatel bgt tiap muncul jerawat baru\r\nPengen buru buru di hempaskan. Udah pake ini dari SMA, tp karna sejak kuliah udah jarang banget jerawatan jadi ga pernah repurchase lagi.', 5, 'model', '2025-05-14 04:55:29', '2025-05-14 04:55:29'),
('a9c546a7-3d78-11f0-a5a4-466b44159bcc', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Ini produk favoritku sejak zaman lulus kuliah ampe sekarang pun masih menyimpan produknya karena memang sangat ampuh cepat mengeringkan bakal calon jerawat. Untuk yang udah terlanjut menjadi jerawat, aku rasa produk ini tidak bekerja secara baik', 5, 'manual', '2025-05-30 17:08:10', '2025-05-30 17:08:10'),
('b1c75532-307f-11f0-aa3e-e55b1a6dd5e5', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Dulu kulitku berjerawat parah terus, dapet rekomendasi mbakku pakai ini. teksturnya sedikit kasar tapi langsung cair dikulit. baunya ya kaya obat jerawat. cara pakainya tinggal di kocok biar kecampur cairannya. terus ditotol tipis2 aja sis.', 5, 'model', '2025-05-14 04:55:45', '2025-05-14 04:55:45'),
('b3e747af-3089-11f0-aa3e-e55b1a6dd5e5', '9936a4b5-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Obat jerawat ter favorit dari jaman SMA, udah 7 taunan selalu pake obat jerawat ini. Tipe obat jerawat yang bikin jerawat cepet mateng. Teksturnya oily & ada sensasi mint nya gitu waktu dipake. Selalu aku rekomendasiin tiap ada yang tanya obat jerawat yang paling ampuh.', 5, 'model', '2025-05-14 06:07:23', '2025-05-14 06:07:23'),
('c11128e4-3089-11f0-aa3e-e55b1a6dd5e5', '9936a4b5-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Tekstusnya cair dan oily gitu, wangi tea tree kerasa banget. Di kulit aku ga mempan untuk meredakan jerawat, malah bikin beruntusan banget. Menurutku buat harga segini, mending beli yg harganya lebih affordable atau yg claimnya lebih bagus.', 3, 'manual', '2025-05-14 06:07:45', '2025-05-14 06:07:45'),
('c12e0a62-34c8-11f0-9884-453432615276', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Ampuh buat jerawat yang udah mateng atau terbuka, tp gak ampuh sama sekali buat jerawat kecil-kecil yg gak ada matanya.. baunya sulphur banget, dan bikin kering kulit, harganya terlalu mahal untuk produk serupa, brand lain juga ada produk seperti ini persis dengan harga lebih murah dan kualitas yang sama', 1, 'manual', '2025-05-19 15:48:48', '2025-05-19 15:48:48'),
('d48b25f3-3efa-11f0-9ca0-beb036fd53a9', 'bf24b02e-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'sebagai pengguna yang kulitnya oily acne prone, produk ini tu cocok banget karena teksturnya yang lebih ke watery gitu jadi ngga lengket di wajah dan cepat menyerap. harganya juga ga terlalu mahal jadi masih cocok di kantong pelajar.', 5, 'model', '2025-06-01 15:12:14', '2025-06-01 15:12:14'),
('de459e08-30b5-11f0-81b5-dfa7a5466e57', 'bf24b02e-23e6-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Ampun untuk meredakan jerawat diwajah, bekas jerawat dan tidak meninggalkan bekas hitam, sangat mudah ditemui di toko mana pun, harga terjangkau dan rekomendasi untuk kulit sedang berjerawat dan mudah untuk dibawa kemana saja.', 4, 'model', '2025-05-14 11:23:32', '2025-05-14 11:23:32'),
('e653cadf-34c9-11f0-9884-453432615276', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Ini produk favoritku sejak zaman lulus kuliah ampe sekarang pun masih menyimpan produknya karena memang sangat ampuh cepat mengeringkan bakal calon jerawat. Untuk yang udah terlanjut menjadi jerawat, aku rasa produk ini tidak bekerja secara baik', 3, 'manual', '2025-05-19 15:57:00', '2025-05-19 15:57:00'),
('f498a89c-30ce-11f0-81b5-dfa7a5466e57', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Obat jerawat totol paling mutakhir di wajahku hahaha. Di pakai pas mau tidur, besok nya jerawatnya mateng wkwkw. Kalo jerawat nya udah mateng, besok nya udah kering. Ajaib. Cuman ya itu sarung bantal jadi bau sulfur. Tapi sepadan sama hasilnya sihh.', 5, 'model', '2025-05-14 14:23:00', '2025-05-14 14:23:00'),
('f6c17615-3efa-11f0-9ca0-beb036fd53a9', 'cb02dfe1-42f7-4799-9329-cb9ad736c39b', '2d03ddcc-3ef0-11f0-9ca0-beb036fd53a9', 'sebagai pengguna yang kulitnya oily acne prone, produk ini tu cocok banget karena teksturnya yang lebih ke watery gitu jadi ngga lengket di wajah dan cepat menyerap. harganya juga ga terlalu mahal jadi masih cocok di kantong pelajar.', 5, 'model', '2025-06-01 15:13:12', '2025-06-01 15:13:12'),
('f9caaeff-3eef-11f0-9ca0-beb036fd53a9', 'f3700935-23e7-11f0-a107-15c393953547', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'cocok untuk kulit sensitf, meredakan dari rasa gatal, ruam, panas, tidak membuat kulit wajah tertarik. Setelah pemakaian rasanya minyak di wajah hilang tapi tidak membuat kering juga di wajah. Pokoknya produk ini baguss bengete', 4, 'model', '2025-06-01 13:54:32', '2025-06-01 13:54:32'),
('feb685a4-30ce-11f0-81b5-dfa7a5466e57', '36ba992c-56bb-410e-a8af-dbcc26fa4ee5', '3b0be51b-1a30-11f0-93bb-38f72f0489a3', 'Obat jerawat totol paling mutakhir di wajahku hahaha. Di pakai pas mau tidur, besok nya jerawatnya mateng wkwkw. Kalo jerawat nya udah mateng, besok nya udah kering. Ajaib. Cuman ya itu sarung bantal jadi bau sulfur. Tapi sepadan sama hasilnya sihh.', 4, 'manual', '2025-05-14 14:23:17', '2025-05-14 14:23:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id_aktivitas`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `fk_jenis_produk` (`id_jenis`),
  ADD KEY `fk_produk_brand` (`id_brand`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_customer` (`id_customer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jenis_produk`
--
ALTER TABLE `jenis_produk`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_aktivitas_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_jenis_produk` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_produk` (`id_jenis`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produk_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
