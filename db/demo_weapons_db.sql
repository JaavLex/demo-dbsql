-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 09, 2021 at 12:20 PM
-- Server version: 8.0.23
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_weapons_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Owners`
--

CREATE TABLE `Owners` (
  `Id` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Owners`
--

INSERT INTO `Owners` (`Id`, `Name`) VALUES
(1, 'Alex'),
(2, 'Jean'),
(3, 'Jimmy'),
(4, 'Matthew'),
(5, 'Bernard'),
(6, 'John'),
(7, 'Donald'),
(8, 'Nobert'),
(9, 'Dwight'),
(10, 'Andrew'),
(11, 'Bill'),
(12, 'Arthur'),
(13, 'Jack'),
(14, 'Homer'),
(15, 'Joe'),
(16, 'Jane'),
(17, 'Skyler'),
(18, 'Jessica'),
(19, 'Kimberly'),
(20, 'Stacy');

-- --------------------------------------------------------

--
-- Table structure for table `OwnerWeapons`
--

CREATE TABLE `OwnerWeapons` (
  `Id` int NOT NULL,
  `WeaponId` int NOT NULL,
  `OwnerId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `OwnerWeapons`
--

INSERT INTO `OwnerWeapons` (`Id`, `WeaponId`, `OwnerId`) VALUES
(1, 2, 11),
(2, 16, 1),
(3, 2, 7),
(4, 15, 11),
(5, 11, 16),
(6, 3, 12),
(7, 3, 9),
(8, 7, 11),
(9, 19, 20),
(10, 17, 3),
(11, 10, 10),
(12, 5, 5),
(13, 18, 2),
(14, 20, 15),
(15, 8, 14),
(16, 9, 12),
(17, 6, 13),
(18, 12, 19),
(19, 13, 15),
(20, 14, 19);

-- --------------------------------------------------------

--
-- Table structure for table `Types`
--

CREATE TABLE `Types` (
  `Id` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Types`
--

INSERT INTO `Types` (`Id`, `Name`) VALUES
(1, 'Semi-automatic Handgun'),
(2, 'Revolver'),
(3, 'Submachine-Gun'),
(4, 'Personnal Defense Weapon'),
(5, 'Semi-Automatic Rifle'),
(6, 'Assault Rifle'),
(7, 'Battle Rifle'),
(8, 'Marksman Rifle'),
(9, 'Bolt-Action Rifle'),
(10, '12 Gauge Shotgun');

-- --------------------------------------------------------

--
-- Table structure for table `Weapons`
--

CREATE TABLE `Weapons` (
  `Id` int NOT NULL,
  `TypeId` int NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Weapons`
--

INSERT INTO `Weapons` (`Id`, `TypeId`, `Name`) VALUES
(1, 10, 'Remington 870'),
(2, 6, 'AK-74m'),
(3, 6, 'Colt M16A1'),
(4, 7, 'H&K G3A3'),
(5, 8, 'M110'),
(6, 2, 'Smith & Wesson Model 10'),
(7, 9, 'Mossberg Nightforce II'),
(8, 5, 'Smith & Wesson AR-15'),
(9, 3, 'H&K MP5'),
(10, 4, 'FN P90'),
(11, 9, 'Mosin Nagant 1942'),
(12, 7, 'M1 Garand'),
(13, 3, 'M1 Thompson'),
(14, 1, 'Colt M1911'),
(15, 6, 'FAMAS'),
(16, 7, 'FASS 57'),
(17, 6, 'FASS 90'),
(18, 9, 'K31 Suisse'),
(19, 1, 'SIG P226'),
(20, 10, 'Franchi SPAS-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Owners`
--
ALTER TABLE `Owners`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `OwnerWeapons`
--
ALTER TABLE `OwnerWeapons`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_ownerid` (`OwnerId`),
  ADD KEY `fk_weaponid` (`WeaponId`);

--
-- Indexes for table `Types`
--
ALTER TABLE `Types`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Weapons`
--
ALTER TABLE `Weapons`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_typeid` (`TypeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Owners`
--
ALTER TABLE `Owners`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `OwnerWeapons`
--
ALTER TABLE `OwnerWeapons`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Types`
--
ALTER TABLE `Types`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Weapons`
--
ALTER TABLE `Weapons`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OwnerWeapons`
--
ALTER TABLE `OwnerWeapons`
  ADD CONSTRAINT `fk_ownerid` FOREIGN KEY (`OwnerId`) REFERENCES `Owners` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_weaponid` FOREIGN KEY (`WeaponId`) REFERENCES `Weapons` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Weapons`
--
ALTER TABLE `Weapons`
  ADD CONSTRAINT `fk_typeid` FOREIGN KEY (`TypeId`) REFERENCES `Types` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
