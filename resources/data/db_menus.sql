-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2020 at 03:06 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_menus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_items`
--

CREATE TABLE `tb_items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_description` varchar(50) DEFAULT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_category` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_item_categories`
--

CREATE TABLE `tb_item_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_operators`
--

CREATE TABLE `tb_operators` (
  `operator_id` int(11) NOT NULL,
  `operator_name` varchar(50) NOT NULL,
  `operator_address` varchar(50) NOT NULL,
  `operator_email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_resources`
--

CREATE TABLE `tb_resources` (
  `resource_id` int(11) NOT NULL,
  `resource_url` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_items`
--
ALTER TABLE `tb_items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_name` (`item_name`),
  ADD KEY `fk_category_id` (`item_category`),
  ADD KEY `fk_resource_id` (`image_id`);

--
-- Indexes for table `tb_item_categories`
--
ALTER TABLE `tb_item_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `unique_category_name_operator_id` (`category_name`,`operator_id`),
  ADD KEY `fk_operator_id` (`operator_id`);

--
-- Indexes for table `tb_operators`
--
ALTER TABLE `tb_operators`
  ADD PRIMARY KEY (`operator_id`),
  ADD UNIQUE KEY `operator_email` (`operator_email`),
  ADD UNIQUE KEY `unique_operator_name_address` (`operator_name`,`operator_address`);

--
-- Indexes for table `tb_resources`
--
ALTER TABLE `tb_resources`
  ADD PRIMARY KEY (`resource_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_items`
--
ALTER TABLE `tb_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_item_categories`
--
ALTER TABLE `tb_item_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_operators`
--
ALTER TABLE `tb_operators`
  MODIFY `operator_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_resources`
--
ALTER TABLE `tb_resources`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_items`
--
ALTER TABLE `tb_items`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`item_category`) REFERENCES `tb_item_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_resource_id` FOREIGN KEY (`image_id`) REFERENCES `tb_resources` (`resource_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `tb_item_categories`
--
ALTER TABLE `tb_item_categories`
  ADD CONSTRAINT `fk_operator_id` FOREIGN KEY (`operator_id`) REFERENCES `tb_operators` (`operator_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
