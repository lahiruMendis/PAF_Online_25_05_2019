-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2019 at 06:54 PM
-- Server version: 5.7.21-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `paf_n3b_g4`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `address` varchar(300) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`addressId`, `username`, `address`) VALUES
(1, 'LakkanaDolapihilla', '82/2,Katugastota'),
(2, 'BanukaSandeepa', 'Sample Address'),
(3, 'DhanushkaDolapihilla', '23/2/1/1, Mirihana');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE IF NOT EXISTS `inquiry` (
  `name` varchar(50) NOT NULL,
  `contactNo` varchar(10) DEFAULT NULL,
  `inquiry` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`name`, `contactNo`, `inquiry`) VALUES
('aa', '1111111111', 'xddddd'),
('Amal', '0714525887', 'sssss'),
('errt', '1144477788', 'xxxx'),
('kasun', '0779719218', 'gshshsd'),
('Mendis', '0710646242', 'goo goo'),
('Sandun Perera', '0178855226', 'Not Working');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `productId` int(11) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  PRIMARY KEY (`productId`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ordereditems`
--

CREATE TABLE IF NOT EXISTS `ordereditems` (
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`productId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `buyer` varchar(255) NOT NULL,
  `orderDate` datetime NOT NULL,
  `orderTotal` decimal(13,2) NOT NULL,
  PRIMARY KEY (`orderId`),
  KEY `buyer` (`buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productImage` mediumblob,
  `productDescription` varchar(255) DEFAULT NULL,
  `productPrice` decimal(13,2) NOT NULL,
  `productCount` int(11) NOT NULL,
  PRIMARY KEY (`productId`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `creator`, `productName`, `productImage`, `productDescription`, `productPrice`, `productCount`) VALUES
(1, 'DhanushkaDolapihilla', 'watch', 0x61, 'yfvyvuf', '500.00', 5),
(2, 'DhanushkaDolapihilla', 'laptop', 0x62, 'kycuiwyu', '100000.00', 2),
(3, 'DhanushkaDolapihilla', 'phone', 0x63, 'vtfuwt', '50000.50', 7);

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE IF NOT EXISTS `shipment` (
  `shipmentId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `seller` varchar(255) NOT NULL,
  `buyer` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`shipmentId`),
  KEY `seller` (`seller`),
  KEY `buyer` (`buyer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(255) NOT NULL,
  `contactNo` varchar(12) DEFAULT NULL,
  `userType` varchar(10) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `profilePicture` mediumblob,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `contactNo`, `userType`, `passwordHash`, `email`, `profilePicture`, `isActive`) VALUES
('BanukaSandeepa', '0775996008', 'Buyer', '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8', 'busdbubg', 0x62, NULL),
('DhanushkaDolapihilla', '0777812418', 'Seller', '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8', 'gfuiygyug', 0x63, NULL),
('LakkanaDolapihilla', '0776712741', 'Admin', '5E884898DA28047151D0E56F8DC6292773603D0D6AABBDD62A11EF721D1542D8', 'lakkanad@gmail.com', 0x61, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `keywords_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`);

--
-- Constraints for table `ordereditems`
--
ALTER TABLE `ordereditems`
  ADD CONSTRAINT `ordereditems_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `ordereditems_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `users` (`username`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`username`);

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`buyer`) REFERENCES `users` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
