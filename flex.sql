-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 12:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flex`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `BatchID` int(11) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`BatchID`, `StartTime`, `EndTime`) VALUES
(1, '05:00:00', '06:00:00'),
(2, '06:00:00', '07:00:00'),
(3, '07:30:00', '08:00:00'),
(4, '17:00:00', '18:00:00'),
(5, '18:00:00', '19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(36) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `DateOfPayment` date DEFAULT NULL,
  `TimeOfPayment` time DEFAULT NULL,
  `BatchID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `UserID`, `Amount`, `DateOfPayment`, `TimeOfPayment`, `BatchID`) VALUES
('aa87003d-4f8b-4b92-aed7-98ff02fc0c08', 2, 500.00, '2023-11-10', '15:27:17', 3),
('a3326949-eb22-451d-bd17-d5bf36fd4caa', 4, 500.00, '2023-12-21', '16:00:06', 2),
('d6fa5881-a64f-433f-ad27-ccd0b2ac038f', 3, 500.00, '2023-11-15', '16:25:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`, `DateOfBirth`, `PasswordHash`, `Email`) VALUES
(2, 'manoj', '2002-12-23', '$2b$10$FEi65uNXC2/7fNp89xAh5.5BAPohUr2vlhLfA22ZELk/EerFYWosC', 'manoj@gmail.com'),
(3, 'nithin', '2002-04-17', '$2b$10$VNzL0/eo2T2T6qT4LpXDG.tjnm13KO4iQRMPfeRRvWPpb0O.uRiYW', 'nithin@gmail.com'),
(4, 'sat', '2002-04-17', '$2b$10$ve9OXCVrqumqlkO5Ge3hyOzLK8CJr5nfRZywNep0uSyrIehWIztDu', 'sat@gmail.com'),
(5, 'jeevan', '2002-01-10', '$2b$10$1qrFiLHIOFFf/5ktASvTq.1Mf7tQ6G3vNagCi.yUPDwx7OMKVtaOG', 'jeevan@gmail.com'),
(6, 'ravi', '2012-01-10', '$2b$10$MRxYg7Ix8aZSC3V.Um64WukpDtqgCMdEJUoYbvMDMJeh5JQnabgJK', 'ravi@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`BatchID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `fk_payment_batch` (`BatchID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_batch` FOREIGN KEY (`BatchID`) REFERENCES `batch` (`BatchID`),
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
