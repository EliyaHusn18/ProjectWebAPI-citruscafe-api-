-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2026 at 02:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcitruscafe_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `receipt_no` varchar(20) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `items` text NOT NULL,
  `order_type` varchar(20) NOT NULL,
  `table_number` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `receipt_no`, `customer_name`, `items`, `order_type`, `table_number`, `payment_method`, `payment_status`, `total_amount`, `order_status`, `created_at`, `email`) VALUES
(1, 'RC1001', 'Aina', 'Fresh Orange Juice x2,', 'Take Away', NULL, 'E-Wallet', 'Complete', 20.00, 'Confirmed', '2026-04-02 03:51:16', 'aisya@gmail.com'),
(2, 'RC1002', 'Haziq', 'Mixed Yakult Juice x1', 'Dine In', '5', 'Cash', 'Pending', 12.90, 'Confirmed', '2026-04-02 03:51:16', 'haziq12@gmail.com'),
(3, 'RC1003', 'Sarah', 'Sparkling Orange Juice x1', 'Take Away', NULL, 'Online Banking', 'Complete', 12.90, 'Confirmed', '2026-04-02 03:51:16', 'sara56@gmail.com'),
(4, 'RC3001', 'Test User', 'Fresh Orange Juice x2', 'Take Away', NULL, 'E-Wallet', 'Complete', 20.00, 'Confirmed', '2026-04-02 04:51:47', NULL),
(5, 'RC3001', 'Test User', 'Fresh Orange Juice x2', 'Take Away', NULL, 'E-Wallet', 'Complete', 20.00, 'Confirmed', '2026-04-03 15:29:54', NULL),
(6, 'RC4001', 'Aina', 'Fresh Orange Juice x2, Mixed Yakult Juice x1', 'Dine In', '5', 'Cash', 'Pending', 32.90, 'Confirmed', '2026-04-04 12:50:09', NULL),
(7, 'RC4001', 'Aina', 'Fresh Orange Juice x2, Mixed Yakult Juice x1', 'Dine In', '5', 'Cash', 'Pending', 32.90, 'Confirmed', '2026-04-04 14:46:21', NULL),
(8, 'RC1008', 'qylla', 'Mixed Yakult Juice x1 (RM 12.9)', 'Dine In', NULL, 'Online Banking', 'Complete', 12.90, 'Confirmed', '2026-04-04 17:08:34', 'nraqielahh56@gmail.com'),
(9, 'RC1009', 'alia', 'Sparkling Orange Juice x1 (RM 13.90), Fish and Chips x1 (RM 17.90)', 'Take Away', NULL, 'Cash', 'Pending', 31.80, 'Confirmed', '2026-04-05 06:04:05', 'nraqielahh56@gmail.com'),
(10, 'RC1010', 'siti', 'Chocolate Chip Soft Cookies  x1 (RM 12.50), Red Velvet Soft Cookies x1 (RM 12.50)', 'Dine In', NULL, 'Cash', 'Pending', 25.00, 'Confirmed', '2026-04-05 06:08:16', 'nraqielahh56@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `subtotal`) VALUES
(1, 6, 1, 'Fresh Orange Juice', 2, 10.00, 20.00),
(2, 6, 2, 'Mixed Yakult Juice', 1, 12.90, 12.90),
(3, 7, 1, 'Fresh Orange Juice', 2, 10.00, 20.00),
(4, 7, 2, 'Mixed Yakult Juice', 1, 12.90, 12.90),
(5, 9, 2, 'Sparkling Orange Juice\r\n', 1, 13.90, 13.90),
(6, 9, 8, 'Fish and Chips', 1, 17.90, 17.90),
(7, 10, 5, 'Chocolate Chip Soft Cookies ', 1, 12.50, 12.50),
(8, 10, 6, 'Red Velvet Soft Cookies', 1, 12.50, 12.50);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `payment_status`, `amount`, `created_at`) VALUES
(1, 55, 'Online Banking', 'Complete', 16.90, '2026-04-04 14:34:42'),
(2, 56, 'Online Banking', 'Complete', 16.90, '2026-04-04 15:02:52'),
(3, 8, 'Online Banking', 'Complete', 12.90, '2026-04-04 17:08:34'),
(4, 9, 'Cash', 'Pending', 31.80, '2026-04-05 06:04:05'),
(5, 10, 'Cash', 'Pending', 25.00, '2026-04-05 06:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `stock_quantity`, `status`, `image`) VALUES
(1, 'Mixed Yakult Juice', 'Orange mixed with yakult', 12.90, 15, 'Available', 'air2.jpg'),
(2, 'Sparkling Orange Juice', 'Updated desc', 13.90, 12, 'Available', 'air1.jpg'),
(3, 'Fresh Orange Juice', '100% natural freshly squeezed juice', 10.00, 20, 'Available', 'air3.jpg'),
(4, 'Tiramisu OG Soft Cookies ', 'Rich tiramisu flavour with soft texture', 12.50, 10, 'Available', 'cookiesTiramisu.jpg'),
(5, 'Chocolate Chip Soft Cookies ', 'Classic chocolate chip with soft center', 12.50, 19, 'Available', 'cookiesChocolatechip.jpg'),
(6, 'Red Velvet Soft Cookies', 'Soft baked cookies with creamy filling', 12.50, 10, 'Available', 'cookiesRedvelvet.jpg'),
(7, 'Chicken Cordon Bleu', 'Crispy chicken stuffed withh ham and cheese', 22.90, 11, 'Available', 'GordonBleu.png'),
(8, 'Fish and Chips', 'Golden fried fish served with fries', 17.90, 10, 'Available', 'FishNchip.png'),
(9, 'Beef Lasagna', 'Classic baked lasagna with rich beef sauce', 16.90, 15, 'Available', 'BeefChicLasagna.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `password`, `birthday`, `role`, `created_at`) VALUES
(1, 'Eliya Husna', 'eliya17@gmail.com', '0123456789', '$2y$10$B5j/E.eoclXDRYeAS7VzU.waRtEir1W4ScCczyUtbD35sDrmkyvo6', NULL, 'user', '2026-04-01 04:30:01'),
(2, 'Nur Aqilah', 'aqilah55@gmail.com', '01133647519', '$2y$10$8IWv7RXlIOjVuzVSt0mLFeO72ga6Sfn3jassrSuigvCs6bY2K59Ba', '2003-02-27', 'user', '2026-04-01 04:37:29'),
(3, 'Nur Atira', 'nratyra@gmail.com', '01127337090', '$2y$10$HdUehd7bH5sCuuOgggQPpu7LVlHjK/mkQPSaFOCuWkVbw7sP8EQf6', '2003-04-05', 'user', '2026-04-01 15:25:07'),
(4, 'Admin', 'admin@gmail.com', '0123456789', 'admin123', NULL, 'admin', '2026-04-01 15:30:20'),
(5, 'mark', 'minhyung@gmail.com', '012745698', '$2y$10$Nc9oh3IaPx2ojA8pzoiUtO6F4ggaxG1QB1t247hUNh1RFiqI7ZZoS', NULL, 'user', '2026-04-03 15:32:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
