-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 13, 2024 lúc 03:27 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laptop_group5`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` varchar(40) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `picture`, `title`, `description`) VALUES
('', 'images\\2024-11-05T16-53-10.147Z-baner2.jpg', 'lenovo', NULL),
('4', 'images\\2024-11-05T16-53-10.147Z-baner4.jpg', 'acer', NULL),
('7192b2ef-d2a3-4525-92bd-df72eb87de78', 'images\\2024-11-05T16-53-10.147Z-baner1.jpg', 'msi', NULL),
('952d0e78-8882-4397-981a-fb0a3dc62dfc', 'images\\2024-11-05T16-53-10.147Z-baner3.jpg', 'dell', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` varchar(40) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `created_by`, `status`, `created_at`, `updated_at`, `is_deleted`) VALUES
('1b7c436a-b66d-11ef-aacc-93c52050320c', 'user1', 1, '2024-12-10', '2024-12-10', b'0'),
('1b7c4b9e-b66d-11ef-aacc-93c52050320c', 'user2', 0, '2024-12-10', '2024-12-10', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id` varchar(40) NOT NULL,
  `cart_id` varchar(40) NOT NULL,
  `product_id` varchar(40) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `price`, `quantity`, `created_at`) VALUES
('1b7cc18c-b66d-11ef-aacc-93c52050320c', '1b7c436a-b66d-11ef-aacc-93c52050320c', '1b7af1a4-b66d-11ef-aacc-93c52050320c', 18000000, 1, '2024-12-10'),
('1b7ce3c4-b66d-11ef-aacc-93c52050320c', '1b7c4b9e-b66d-11ef-aacc-93c52050320c', '1b7b4b18-b66d-11ef-aacc-93c52050320c', 14000000, 2, '2024-12-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` varchar(40) NOT NULL,
  `parent_category` varchar(40) DEFAULT NULL,
  `slug` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent_category`, `slug`, `name`, `picture`, `description`, `tags`, `created_at`, `updated_at`) VALUES
('1794b646-96d4-4d', NULL, 'Asus', 'Asus', 'images\\2024-10-28T10-39-06.362Z-Asus_logo.png', 'Asus', NULL, NULL, NULL),
('34a053fa-b557-4e', NULL, 'dell', 'Dell', 'images\\2024-10-28T10-39-57.465Z-Dell_logo_2016.svg.png', 'Dell', NULL, NULL, NULL),
('37b80614-3f26-43', NULL, 'Lenovo', 'Lenovo', 'images\\2024-10-28T10-39-06.362Z-Lenovo_logo.png', 'Lenovo', NULL, NULL, NULL),
('71890af4-12b9-42', NULL, 'MacBook', 'MacBook', 'images\\2024-10-28T10-39-06.362Z-Macbook_logo.png', 'MacBook', NULL, NULL, NULL),
('a10d76af-b6fe-45', NULL, 'HP', 'HP', 'images\\2024-10-28T10-39-06.362Z-HP_logo.png', 'HP', NULL, NULL, NULL),
('ca6afd09-fbf1-42', NULL, 'Acer', 'Acer', 'images\\2024-10-28T10-39-06.362Z-Acer_logo.png', 'Acer', NULL, NULL, NULL),
('f9dd4328-295d-41', NULL, 'MSI', 'MSI', 'images\\2024-10-28T10-39-06.362Z-MSI_logo.png', 'MSI', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `credentials`
--

CREATE TABLE `credentials` (
  `provider_id` varchar(40) NOT NULL,
  `provider_key` varchar(20) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL,
  `hasher` varchar(10) NOT NULL,
  `password_hash` varchar(200) NOT NULL,
  `password_salt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `credentials`
--

INSERT INTO `credentials` (`provider_id`, `provider_key`, `user_id`, `hasher`, `password_hash`, `password_salt`) VALUES
('85cadaf1-3e2a-4485-a30c-a369f8c04068', NULL, '5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6', '10', '$2a$12$iHFXjc.egn01EQrw4bJheeZ1Lvz6SpAgOf9.KG1LIf0r1moMkJ3Bm', '10'),
('8a06390f-206f-426c-a671-64b308d6e600', NULL, '633cebc4-6ec5-4d7b-b094-77dc8c0df5db', '10', '$2a$12$ROMuW9KU7DjkWLCPna2m0eDvW9ew1D7qQkTkm9WXf4Pj7wgMgCMUq', '10'),
('ac7492c8-8a56-426d-ac75-e77be0ee73e1', NULL, 'a3e98d65-78e0-4d98-9338-dbf5fc95b3db', '10', '$2a$12$dpiYpn4ywtp1wg5CbTbJcOb/V2HYhv1c35mTwlfMRIho1sDiojU8i', '10'),
('b986b154-4801-497a-a0e6-34da0944255c', NULL, '1c658c2a-14a1-4522-9943-24a13a56f249', '10', '$2a$12$xaRFU052DXjRwxFevBH1QOmxlPe2SQfoHgrXoBFil0y9qqTFCiqwC', '10'),
('d3ee7bd6-181c-449a-88fa-ed4307aca6db', NULL, 'c85d0e47-018c-45c7-8340-3deff366bd9a', '10', '$2a$12$v2gdxyH.PCjUEtrmR6S9cOqFfcetpo6W0L5lBwmyvRwLsK17fhf0y', '10'),
('dc82182e-b66c-11ef-aacc-93c52050320c', 'local', 'user1', 'bcrypt', '$2a$12$examplehash1', 'salt1'),
('dc82238c-b66c-11ef-aacc-93c52050320c', 'local', 'user2', 'bcrypt', '$2a$12$examplehash2', 'salt2'),
('e58ada65-ef05-48f5-889f-3ce48abf06d3', NULL, '6ddae864-4995-4cbe-9cdd-49ebe9c28be0', '10', '$2a$12$zZFxca2Hw2p8hjp6yyuCuuyEVJUvM5B0JcaxyIOAnzl/VhZlMmzmq', '10'),
('e925f02d-054c-470f-9ce3-db1dfd9a0028', NULL, 'a03ef9d0-320d-4a08-a289-75fbb8221f73', '10', '$2a$12$TiQ0oi3S1fgfzYS1VsYhJ.XKfGeuNducHV1TziQU8FixGZV.2rwpu', '10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivers`
--

CREATE TABLE `delivers` (
  `id` varchar(40) NOT NULL,
  `order_id` varchar(40) NOT NULL,
  `status` bigint(20) DEFAULT NULL,
  `deliver_by` varchar(40) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `created_at`, `is_deleted`, `status`, `reason`) VALUES
('9f141191-8371-4941-8210-2a6f57e36871', '633cebc4-6ec5-4d7b-b094-77dc8c0df5db', 'Nguyen Xuan Phuc (0355772132) \nTanAn, IaSa0, IaGrai, Gia Lai', '2024-12-12 20:00:14', b'0', 6, NULL),
('e686c652-d1d9-4236-92e7-48672e78c546', '633cebc4-6ec5-4d7b-b094-77dc8c0df5db', 'Trung (0832501305) \nGia lai', '2024-12-12 12:20:34', b'0', 6, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_lines`
--

CREATE TABLE `order_lines` (
  `id` varchar(40) NOT NULL,
  `order_id` varchar(40) NOT NULL,
  `product_id` varchar(40) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_lines`
--

INSERT INTO `order_lines` (`id`, `order_id`, `product_id`, `price`, `quantity`, `status`) VALUES
('32f86430-48b9-4289-8f3c-ca541e250840', '9f141191-8371-4941-8210-2a6f57e36871', '7605438b-8520-4f', 22490000, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(40) NOT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(20) NOT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `discount_type` varchar(20) DEFAULT NULL,
  `discount_value` bigint(20) DEFAULT NULL,
  `sales` bigint(20) DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_by` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `slug`, `picture`, `summary`, `description`, `price`, `discount_type`, `discount_value`, `sales`, `tags`, `created_at`, `updated_at`, `created_by`) VALUES
('0349b865-d7bb-42', '1794b646-96d4-4d', 'Laptop Asus TUF Gaming A15', 'Asus', 'images\\2024-11-05T19-03-47.434Z-Laptop Asus TUF Gaming A15.jpg', 'Asus', 'Một mẫu laptop chiến game đến từ thương hiệu Asus vừa được lên kệ tại Thế Giới Di Động, sở hữu những thông số cấu hình vượt trội với AMD Ryzen 5 dòng HS mạnh mẽ, card rời RTX 2050 và có một mức giá cân đối.\nBộ vi xử lý AMD Ryzen 5 7535HS cùng card đồ họa ', 16990000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('11b222a7-03b0-49', 'a10d76af-b6fe-45', 'Laptop HP 240 G9 i5', 'HP', 'images\\2024-11-05T18-42-20.996Z-Laptop HP 240 G9 i5.jpg', 'HP', 'Nếu bạn đang tìm kiếm một chiếc laptop có thể đồng hành cùng quá trình học tập và làm việc văn phòng, vừa có ngoại hình hiện đại, vừa có mức giá phải chăng, laptop HP 240 G9 i5 1235U  chính là lựa chọn lý tưởng.\n Laptop học tập - văn phòng này được trang ', 14120000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('20d79fe5-a769-43', '34a053fa-b557-4e', 'Laptop Dell Vostro 3530 i5', 'Dell1', 'images\\2024-11-05T18-04-36.531Z-Laptop Dell Vostro 3530 i5.jpg', 'Dell1', 'Laptop Dell Vostro 3530 i5 1335U  được định hình thiết kế riêng biệt cho dân văn phòng và sinh viên trong phân khúc giá tầm trung. \nLaptop Dell Vostro được trang bị bộ vi xử lý Intel Core i5 1335U thế hệ thứ 13, tích hợp GPU Intel Iris Xe Graphics, RAM 16', 14120000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('3dbb2210-8181-48', '37b80614-3f26-43', 'Laptop Lenovo Legion5 i7', 'Lenovo2', 'images\\2024-11-05T19-09-49.972Z-Laptop Lenovo Gaming Legion 5 16IRX9 i7.jpg', 'Lenovo2', 'Laptop Lenovo Legion 5 16IRX9 i7 14650HX (83DG0051VN) là một sản phẩm đỉnh cao dành cho game thủ và những người yêu thích công nghệ, mang đến sự kết hợp hoàn hảo giữa hiệu suất mạnh mẽ và thiết kế độc đáo.\nĐược trang bị bộ vi xử lý Intel Core i7 14650HX v', 32990000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('5e83b468-d1bb-4a', 'f9dd4328-295d-41', 'Laptop MSI Gaming GF63', 'MSI', 'images\\2024-11-05T18-56-58.176Z-Laptop MSI Gaming GF63 Thin 12VE i5 12450H (460VN).png', 'MSI', 'Laptop gaming \"quốc dân\" đã quá quen thuộc với anh em học sinh, sinh viên bởi mức giá thành hợp lý cùng khả năng đa nhiệm được nhiều công việc khác nhau. Laptop MSI Gaming GF63 Thin 12VE i5 12450H (460VN) nay càng được cải tiến thêm về cấu hình. CPU Intel', 18990000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('6f1ba6ff-5af1-4c', 'ca6afd09-fbf1-42', 'Acer Chromebook Spin 713', 'Acer', 'images\\2024-11-05T18-53-24.964Z-Acer Chromebook Spin 713.png', 'Acer', 'Acer Chromebook Spin 713 là mẫu máy kế nhiệm cho phiên bản Chromebook 2018 của Acer. Phiên bản này đã được cải tiến rất nhiều về vẻ bề ngoài.\nBộ vi xử lý i5-1135G7 (2.4 GHz-4.2 Ghz, 8MB Cache, 4 nhân 8 luồng), RAM: 8GB DDR4, ổ cứng: 256GB SSD, pin: 3 cell', 19000000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('7605438b-8520-4f', '34a053fa-b557-4e', 'Laptop Dell Inspiron 15 3530 i7', 'Dell', 'images\\2024-11-05T17-22-09.264Z-Dell1.jpg', 'Dell', 'Laptop Dell Inspiron 15 3530 i7 1355U là một sự lựa chọn tuyệt vời cho những ai đang tìm kiếm một chiếc máy tính xách tay mạnh mẽ và linh hoạt cho cả công việc và giải trí \nLaptop Dell Inspiron được trang bị bộ vi xử lý Intel Core i7 Raptor Lake - 1355U m', 22490000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('7a23359e-5bb7-44', '71890af4-12b9-42', 'Macbook Air M2 13inch', 'Macbook', 'images\\2024-11-05T18-46-10.981Z-Macbook Air M2 13inch.png', 'Macbook', 'Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier\nĐa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc\nMàn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits\nÂm thanh số', 20390000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('8db21170-8fab-49', '71890af4-12b9-42', 'MacBook Pro M4 14inch', 'Macbook2', 'images\\2024-11-05T18-49-23.135Z-MacBook Pro M4 14inch.jpg', 'Macbook2', 'Apple M4 10 lõi với 4 lõi hiệu năng và 6 lõi tiết kiệm điện, 16GB, 1TB, màn hình Liquid Retina XDR XDR (Extreme Dynamic Range) Độ sáng XDR: 1.000 nit ở chế độ toàn màn hình, độ sáng đỉnh 1.600 nit (chỉ nội dung HDR) 1 tỷ màu Dải màu rộng (P3) Công nghệ Tr', 43990000, NULL, NULL, 10000, NULL, NULL, NULL, NULL),
('f88b27ab-b664-44', '37b80614-3f26-43', 'Laptop Lenovo LOQ 15IAX9 i5', 'Lenovo', 'images\\2024-11-05T19-06-31.085Z-Laptop Lenovo Gaming LOQ 15IAX9 i5.jpg', 'Lenovo', 'Laptop Lenovo LOQ Gaming 15IAX9 i5 12450HX  mang dáng dấp kiểu mẫu từ những chiếc laptop gaming nhà Lenovo, đưa đến một phiên bản hoàn toàn mới, đầy thời thượng.\nLaptop Lenovo thiết kế video nhờ CPU Intel Core i5 12450HX và card rời NVIDIA GeForce RTX 305', 22490000, NULL, NULL, 10000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `category_id`, `product_id`, `rating`, `comment`, `created_at`) VALUES
('a62110f3-63ea-4fa6-9bec-a3c143ebfc4a', '633cebc4-6ec5-4d7b-b094-77dc8c0df5db', NULL, '0349b865-d7bb-42', 4, 'tot', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_profiles`
--

CREATE TABLE `social_profiles` (
  `user_id` varchar(40) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `platform_user` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `social_profiles`
--

INSERT INTO `social_profiles` (`user_id`, `platform`, `platform_user`, `created_at`) VALUES
('user1', 'facebook', 'nguyenvana.fb', '2024-12-10'),
('user2', 'twitter', 'lethib.tw', '2024-12-10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(40) NOT NULL,
  `slug` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `locale` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`locale`)),
  `email` varchar(100) NOT NULL,
  `role` varchar(10) DEFAULT 'user',
  `age` int(11) DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `gender` enum('Nam','Nữ','Khác') DEFAULT 'Khác',
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `slug`, `name`, `avatar`, `locale`, `email`, `role`, `age`, `created_at`, `updated_at`, `bio`, `address`, `phoneNumber`, `company`, `is_active`, `is_deleted`, `gender`, `date_of_birth`) VALUES
('1c658c2a-14a1-4522-9943-24a13a56f249', NULL, 'Nguyễn', 'https://firebasestorage.googleapis.com/v0/b/sale-laptop.firebasestorage.app/o/uploads%2F1733828426539.jpg?alt=media&token=2e65d3cc-bb73-44ff-9254-d6143471c604', NULL, 'abcd@gmail.com', 'user', 0, NULL, NULL, NULL, NULL, '0328965827', NULL, b'1', b'0', 'Nam', '2002-12-09'),
('633cebc4-6ec5-4d7b-b094-77dc8c0df5db', NULL, 'NguyenPhucXuan', NULL, NULL, 'phucdep15@gmail.com', 'user', 0, NULL, NULL, NULL, NULL, '0355772132', NULL, b'1', b'0', 'Khác', '2021-01-01'),
('c85d0e47-018c-45c7-8340-3deff366bd9a', NULL, 'Trung', NULL, NULL, 'khactrungcc18@gmail.com', 'admin', 0, NULL, NULL, NULL, NULL, '0832501305', NULL, b'1', b'0', 'Khác', NULL),
('dc82f456-b66c-11ef-aacc-93c52050320c', 'nguyen-van-a', 'Nguyễn Văn A', 'https://vi.pngtree.com/freepng/hello-summer-sale-banner_5386111.html', '{\"language\": \"vi\", \"timezone\": \"GMT+7\"}', 'nguyenvana@example.com', 'admin', 30, '2024-12-10', '2024-12-10', 'Quản lý cửa hàng', '123 Đường A, Hà Nội', '+84901234567', 'Công ty ABC', b'1', b'0', 'Khác', NULL),
('dc830fa4-b66c-11ef-aacc-93c52050320c', 'le-thi-b', 'Lê Thị B', 'https://vi.pngtree.com/freepng/3d-minimalist-beach-summer-promotion-banner_6263719.html', '{\"language\": \"vi\", \"timezone\": \"GMT+7\"}', 'lethib@example.com', 'user', 25, '2024-12-10', '2024-12-10', 'Nhân viên bán hàng', '456 Đường B, TP.HCM', '+84987654321', 'Công ty XYZ', b'1', b'0', 'Khác', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`provider_id`);

--
-- Chỉ mục cho bảng `delivers`
--
ALTER TABLE `delivers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_lines`
--
ALTER TABLE `order_lines`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `social_profiles`
--
ALTER TABLE `social_profiles`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
