-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql-messal-guillaume.alwaysdata.net
-- Generation Time: Nov 24, 2026 at 11:25 AM
-- Server version: 10.11.18-MariaDB
-- PHP Version: 8.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `messal-guillaume_cinema_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `afficheur`
--

CREATE TABLE `afficheur` (
  `ID` int(11) UNSIGNED NOT NULL,
  `modele` varchar(20) NOT NULL,
  `taille_pixels` varchar(20) NOT NULL,
  `couleur` enum('Couleur','Noir & Blanc') NOT NULL,
  `defilement` enum('Défilant','Fixe') NOT NULL,
  `id_salle` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capteur`
--

CREATE TABLE `capteur` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Nom` int(11) NOT NULL,
  `ID_Salle` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) UNSIGNED NOT NULL,
  `titre` varchar(100) NOT NULL,
  `resume` text NOT NULL,
  `duree` int(11) NOT NULL,
  `interdit_moins_16_ans` tinyint(1) NOT NULL,
  `langue` varchar(20) NOT NULL,
  `affiche` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mesures`
--

CREATE TABLE `mesures` (
  `ID` int(11) NOT NULL,
  `temperature` float DEFAULT NULL,
  `humidite` float UNSIGNED DEFAULT NULL,
  `co2` float UNSIGNED DEFAULT NULL,
  `ID_capteur` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `num` int(11) NOT NULL,
  `nb_fauteuils` int(11) UNSIGNED NOT NULL,
  `nb_fauteuils_roulant` int(11) UNSIGNED NOT NULL,
  `taille_ecran` varchar(20) NOT NULL,
  `amenagements` varchar(20) DEFAULT NULL,
  `technologies` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seances`
--

CREATE TABLE `seances` (
  `ID` int(11) UNSIGNED NOT NULL,
  `heure_date` datetime NOT NULL,
  `id_salle` int(11) UNSIGNED NOT NULL,
  `id_film` int(11) UNSIGNED NOT NULL,
  `version_langue` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `afficheur`
--
ALTER TABLE `afficheur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_salle` (`id_salle`);

--
-- Indexes for table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Salle` (`ID_Salle`) USING BTREE;

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mesures`
--
ALTER TABLE `mesures`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_capteur` (`ID_capteur`) USING BTREE;

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `seances`
--
ALTER TABLE `seances`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_salle` (`id_salle`),
  ADD KEY `id_film` (`id_film`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `afficheur`
--
ALTER TABLE `afficheur`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mesures`
--
ALTER TABLE `mesures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seances`
--
ALTER TABLE `seances`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `afficheur`
--
ALTER TABLE `afficheur`
  ADD CONSTRAINT `afficheur_ibfk_1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`ID`);

--
-- Constraints for table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `capteur_ibfk_1` FOREIGN KEY (`ID_Salle`) REFERENCES `salle` (`ID`);

--
-- Constraints for table `mesures`
--
ALTER TABLE `mesures`
  ADD CONSTRAINT `mesures_ibfk_1` FOREIGN KEY (`ID_capteur`) REFERENCES `capteur` (`ID`);

--
-- Constraints for table `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `seances_ibfk_2` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
