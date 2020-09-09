-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2020 at 08:59 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xshoes`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idCat` int(11) NOT NULL,
  `catname` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idCat`, `catname`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Kids'),
(4, 'Parent'),
(5, 'Grand Parent');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `seriesname` varchar(20) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `varian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`varian`)),
  `stock` int(11) NOT NULL,
  `size` varchar(25) NOT NULL,
  `idCat` int(11) DEFAULT NULL,
  `isnew` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `brand`, `seriesname`, `detail`, `varian`, `stock`, `size`, `idCat`, `isnew`) VALUES
(1, 'NIKE', 'AIRMAX Verona', 'Pass on the good vibes in the Nike Air Max Verona.', '[\r\n  {\r\n    \"varian\": \"Orange\",\r\n    \"imageUrl\": \"air-max-verona2.png\",\r\n    \"price\": \"167\"\r\n  },{\r\n    \"varian\": \"Blue\",\r\n    \"imageUrl\": \"air-max-verona1.png\",\r\n    \"price\": \"167\"\r\n  }\r\n]', 15, '38,39,40,42,43,44,45,47,4', 2, 0),
(2, 'NIKE', 'Air Max Dia', 'Designed specifically for a woman\'s foot, the Nike', '[\r\n  {\r\n    \"varian\": \"White pollen\",\r\n    \"imageUrl\": \"air-max-dia1.png\",\r\n    \"price\": \"120\"\r\n  },{\r\n    \"varian\": \"Light Violet\",\r\n    \"imageUrl\": \"air-max-dia2.png\",\r\n    \"price\": \"120\"\r\n  }\r\n]', 10, '40,41,42,43,46,47', 2, 1),
(5, 'NIKE', 'x Undercover Air Max', 'The Nike x Undercover Air Max 720 brings Jun Takah', '[\r\n  {\r\n    \"varian\": \"University Red\",\r\n    \"imageUrl\": \"undercover-air-max-720-3.png\",\r\n    \"price\": \"150\"\r\n  },{\r\n    \"varian\": \"Black\",\r\n    \"imageUrl\": \"undercover-air-max-720-1.png\",\r\n    \"price\": \"150\"\r\n  },{\r\n    \"varian\": \" Bright Citron\",\r\n    \"imageUrl\": \"undercover-air-max-720-2.png\",\r\n    \"price\": \"150\"\r\n  }\r\n\r\n]', 5, '38,39,40,42,43,44,45,47,4', 1, 1),
(6, 'NIKE', 'VaporMax Flyknit 3', 'Be bouncy and buoyant in the Nike Air VaporMax Fly', '[\r\n  {\r\n    \"varian\": \" Vast Grey\",\r\n    \"imageUrl\": \"air-vapormax-flyknit-3.png\",\r\n    \"price\": \"170\"\r\n  },{\r\n    \"varian\": \"Particle Grey\",\r\n    \"imageUrl\": \"air-vapormax-flyknit-3-1.png\",\r\n    \"price\": \"170\"\r\n  },{\r\n    \"varian\": \"Metallic Silver\",\r\n    \"imageUrl\": \"air-vapormax-flyknit-3-2.png\",\r\n    \"price\": \"170\"\r\n  }\r\n\r\n]', 5, '40,41,42,43,46,47', 1, 0),
(7, 'NIKE', 'Air VaporMax 2020', 'Add some pep to your step in the Nike Air VaporMax', '[\r\n  {\r\n    \"varian\": \"Pure Platinum\",\r\n    \"imageUrl\": \"air-vapormax-2020-older.png\",\r\n    \"price\": \"165\"\r\n  }\r\n]', 3, '29,30,31,32,33', 3, 0),
(8, 'NIKE', 'Air Zoom Pegasus 37', 'The iconic Nike Air Zoom Pegasus 37 returns with t', '[\r\n  {\r\n    \"varian\": \"Black\",\r\n    \"imageUrl\": \"air-zoom-pegasus-37-older-3.png\",\r\n    \"price\": \"150\"\r\n  },{\r\n    \"varian\": \"White\",\r\n    \"imageUrl\": \"air-zoom-pegasus-37-older-2.png\",\r\n    \"price\": \"150\"\r\n  },{\r\n    \"varian\": \"Smoke Gray\",\r\n    \"imageUrl\": \"air-zoom-pegasus-37-older.png\",\r\n    \"price\": \"150\"\r\n  }\r\n]', 10, '29,30,31,32,33', 3, 0),
(9, 'NIKE', 'React Vision', 'The Nike React Vision stands out whether you\'re at', '[\r\n  {\r\n    \"varian\": \"Summit White\",\r\n    \"imageUrl\": \"react-vision-older1.png\",\r\n    \"price\": \"145\"\r\n  },{\r\n    \"varian\": \"Photo Blue\",\r\n    \"imageUrl\": \"react-vision-older2.png\",\r\n    \"price\": \"145\"\r\n  }\r\n]', 5, '29,30,32,33', 3, 1),
(10, 'JORDAN', 'Air Max 200 XX', 'With design inspiration taken from the iconic AJ8,', '[\r\n  {\r\n    \"varian\": \"White\",\r\n    \"imageUrl\": \"jordan-air-max-200.png\",\r\n    \"price\": \"180\"\r\n  },{\r\n    \"varian\": \"Chutney\",\r\n    \"imageUrl\": \"jordan-air-max-200-2.png\",\r\n    \"price\": \"180\"\r\n  }\r\n]', 5, '39,40,41,42', 2, 0),
(11, 'NIKE', 'SB Nyjah Free 2', 'The Nike SB Nyjah Free 2 is a sequel worthy of its', '[{\r\n    \"varian\": \"Dark Obsidian\",\r\n    \"imageUrl\": \"sb-nyjah-free-2.png\",\r\n    \"price\": \"140\"\r\n  }\r\n]', 11, '39,40,41,42,43,44', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `email`, `fullname`, `password`) VALUES
(1, 'shaki@mail.com', 'shak', 'c9dfab0ce996d20ad1477a1ee4a58a4e91bd3850'),
(2, 'sh@mail.com', 'shamal', 'e2b98325e39318c3819acc27fc81cccd784b7e9a'),
(3, 'shan@mail.com', 'shan', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(4, 'sk@mail.com', 'sk', '7c4a8d09ca3762af61e59520943dc26494f8941b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCat`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCat` (`idCat`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `category` (`idCat`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
