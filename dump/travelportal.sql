-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2018 at 09:10 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travelportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `person_title` varchar(5) NOT NULL,
  `person_name` varchar(200) NOT NULL,
  `person_nasionality` varchar(50) NOT NULL,
  `ticket` int(11) NOT NULL,
  `cabin_type` varchar(50) NOT NULL,
  `buyer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country`, `city`) VALUES
(2, 'Indonesia', 'Pontianak'),
(3, 'Indonesia', 'Jakarta'),
(4, 'Indonesia', 'Pekanbaru'),
(5, 'Indonesia', 'Bandung'),
(6, 'Indonesia', 'Papua');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `airline` varchar(100) NOT NULL,
  `from_city` int(11) NOT NULL,
  `to_city` int(11) NOT NULL,
  `price_economy` int(11) NOT NULL,
  `price_business` int(11) NOT NULL,
  `available` int(11) NOT NULL DEFAULT '0',
  `depature_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `airline`, `from_city`, `to_city`, `price_economy`, `price_business`, `available`, `depature_date`) VALUES
(1, 'Garuda Indonesia', 2, 3, 980000, 1200000, 35, '2019-01-20'),
(3, 'Garuda Indonesia', 2, 5, 1200000, 1350000, 25, '2018-12-30'),
(5, 'Sriwijaya Air', 2, 3, 835000, 1100000, 35, '2019-01-20'),
(6, 'Lion Air', 2, 3, 970000, 1350000, 25, '2019-01-20'),
(7, 'Batik Air', 2, 3, 1530000, 1680000, 40, '2019-01-20'),
(8, 'City Link', 2, 3, 880000, 1000000, 19, '2019-01-20');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `buyer` int(11) NOT NULL,
  `invoice_number` varchar(150) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `date`, `buyer`, `invoice_number`, `status`) VALUES
(1, '2018-12-19', 1, 'INV/20181219/1545200713651', 'Approved'),
(12, '2018-12-19', 1, 'INV/20181219/1545201668836', 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `person_title` varchar(5) NOT NULL,
  `person_name` varchar(200) NOT NULL,
  `person_nasionality` varchar(50) NOT NULL,
  `ticket` int(11) NOT NULL,
  `ticket_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_id`, `person_title`, `person_name`, `person_nasionality`, `ticket`, `ticket_type`) VALUES
(2, 1, 'Mr', 'Steven Martin', 'Indonesia', 6, 'business'),
(3, 1, 'Mrs', 'Angela Irena Andriati', 'Indonesia', 6, 'business'),
(23, 12, 'Mr', 'Samuel Budiman', 'Indonesia', 8, 'economy'),
(24, 12, 'Mr', 'Steven Chu', 'Indonesia', 8, 'economy');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(25) NOT NULL DEFAULT 'Member',
  `gender` varchar(10) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `gender`, `point`) VALUES
(1, 'Fredrick Widjaya', 'fwidjaya20@travel.dev', '123123', 'Admin', 'Male', 0),
(2, 'Jeffrey Widjaya', 'jwidjaya@travel.dev', '123123', 'Member', 'Male', 0),
(3, 'Steven Martin', 'smarin@travel.dev', '123123', 'Member', 'Male', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_ticket` (`ticket`),
  ADD KEY `buyer_information` (`buyer`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_city` (`from_city`),
  ADD KEY `to_city` (`to_city`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_buyer` (`buyer`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_parent` (`transaction_id`),
  ADD KEY `transaction_ticket` (`ticket`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `buyer_information` FOREIGN KEY (`buyer`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ticket` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `from_city` FOREIGN KEY (`from_city`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_city` FOREIGN KEY (`to_city`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transaction_buyer` FOREIGN KEY (`buyer`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_parent` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ticket` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
