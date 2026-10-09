-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql-messal-guillaume.alwaysdata.net
-- Generation Time: Oct 09, 2026 at 08:46 AM
-- Server version: 10.11.18-MariaDB
-- PHP Version: 8.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Accorde absolument tous les privilèges globaux à votre utilisateur (depuis n'importe quel conteneur)
GRANT ALL PRIVILEGES ON *.* TO 'messal-guillaume'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `messal-guillaume_cinema`
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

--
-- Dumping data for table `afficheur`
--

INSERT INTO `afficheur` (`ID`, `modele`, `taille_pixels`, `couleur`, `defilement`, `id_salle`) VALUES
(1, 'Top shine série B', '54x10', 'Couleur', 'Défilant', 6),
(2, 'Vevor 100x20cm', '100x20', 'Noir & Blanc', 'Fixe', 4),
(3, 'Vevor 100x20cm', '100x20', 'Noir & Blanc', 'Défilant', 8);

-- --------------------------------------------------------

--
-- Table structure for table `capteur`
--

CREATE TABLE `capteur` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Nom` int(11) NOT NULL,
  `ID_Salle` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `capteur`
--

INSERT INTO `capteur` (`ID`, `Nom`, `ID_Salle`) VALUES
(1, 206, 1),
(2, 202, 2),
(3, 209, 3),
(4, 1044, 1);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `ID` int(11) UNSIGNED NOT NULL,
  `titre` varchar(20) NOT NULL,
  `resume` text NOT NULL,
  `duree` float NOT NULL,
  `interdit_moins_16_ans` tinyint(1) NOT NULL,
  `langue` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`ID`, `titre`, `resume`, `duree`, `interdit_moins_16_ans`, `langue`) VALUES
(1, 'Smile 2', 'À l’aube d’une nouvelle tournée mondiale, la star de la pop Skye Riley se met à vivre des événements aussi terrifiants qu’inexplicables. Submergée par la pression de la célébrité et devant un quotidien qui bascule de plus en plus dans l’horreur, Skye est forcée de se confronter à son passé obscur pour tenter de reprendre le contrôle de sa vie avant qu’il ne soit trop tard.', 132, 1, 'anglais'),
(2, 'Croquette le chat me', 'C’est bien connu, les chats ont plusieurs vies ! Croquette vient de gâcher celle de trop et il ferait tout pour retrouver Rose, sa maîtresse adorée. On lui accorde une dernière chance, cependant une règle a changé : Croquette peut revenir, mais à un détail près... Désormais transformé en cheval, chien, perroquet ou poisson, l’aventure ne fait que commencer !', 87, 0, 'français'),
(3, 'Lee Miller', 'L’incroyable vie de LEE MILLER, ex-modèle pour Vogue et muse de Man Ray devenue l’une des premières femmes photographes de guerre. Partie sur le front et prête à tout pour témoigner des horreurs de la Seconde Guerre, elle a, par son courage et son refus des conventions, changé la façon de voir le monde.', 117, 0, 'anglais');

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

--
-- Dumping data for table `mesures`
--

INSERT INTO `mesures` (`ID`, `temperature`, `humidite`, `co2`, `ID_capteur`, `date`) VALUES
(1, 23.1, 42.81, 1094.23, 1, '2026-09-11 09:30:08'),
(2, 26.96, 38.88, 647.65, 1, '2026-09-11 09:30:10'),
(3, 23.64, 62.11, 677.2, 3, '2026-09-11 09:31:09'),
(4, 27.34, 10.29, 571.86, 1, '2026-09-11 09:31:10'),
(5, 15.86, 26.29, 1396.57, 1, '2026-09-11 09:31:12'),
(6, 23.36, 64.01, 750.26, 1, '2026-09-11 09:31:16'),
(7, 15.43, 22.54, 2332.84, 2, '2026-09-11 09:31:20'),
(8, 28.62, 13.18, 2745.37, 3, '2026-09-11 09:31:20'),
(9, 28.28, 36.94, 1156.34, 2, '2026-09-11 09:31:22'),
(10, 24.59, 30.21, 1937.4, 2, '2026-09-11 09:31:25'),
(11, 17.3, 82.61, 1212.7, 1, '2026-09-11 09:31:26'),
(12, 21.31, 71.1, 2195.21, 1, '2026-09-11 09:31:28'),
(13, 15.51, 40.34, 2474.35, 4, '2026-09-11 09:31:29'),
(14, 21.06, 85.66, 1257.66, 2, '2026-09-11 09:31:30'),
(15, 24.36, 22.93, 2982.71, 3, '2026-09-11 09:31:32'),
(16, 21.01, 42.55, 2820.97, 3, '2026-09-11 09:31:37'),
(17, 24.59, 48.9, 2414.27, 4, '2026-09-11 09:31:39'),
(18, 26.6, 45.61, 865.57, 4, '2026-09-11 09:31:41'),
(19, 21.94, 42.22, 2678.13, 3, '2026-09-11 09:31:44'),
(20, 18.83, 69.95, 2566.22, 3, '2026-09-11 09:33:12'),
(21, 21.11, 50.45, 2691.39, 1, '2026-09-11 11:42:32'),
(22, 17.5, 76.49, 1146.08, 1, '2026-09-11 11:46:28'),
(23, 27.63, 91.65, 735.11, 1, '2026-09-11 11:48:34'),
(24, 22.15, 42.93, 2241.97, 1, '2026-09-11 11:48:39'),
(25, 26.39, 85.13, 2772.39, 1, '2026-09-18 08:52:10'),
(26, 19.94, 27.25, 2555.15, 1, '2026-09-18 09:11:20'),
(27, 28.34, 79.4, 1181.02, 1, '2026-09-18 09:25:14'),
(28, 21.74, 46.27, 1674.99, 1, '2026-09-18 09:25:14'),
(29, 16.93, 35.5, 2636.14, 1, '2026-09-18 09:25:51'),
(30, 22.26, 76.91, 1852.98, 1, '2026-09-18 09:33:47'),
(31, 21.58, 38.61, 2496.85, 1, '2026-09-18 09:33:47'),
(32, 20.49, 43.27, 1230.61, 1, '2026-09-18 09:40:21'),
(33, 24.79, 16.74, 451.17, 1, '2026-09-18 10:46:20'),
(34, 16.1, 57.22, 1735.92, 1, '2026-09-18 10:48:52'),
(35, 24.05, 25.66, 2418.19, 1, '2026-09-18 10:50:08'),
(36, 27.92, 62.86, 1899.84, 1, '2026-09-18 10:50:51'),
(37, 23.88, 61.58, 1891.76, 1, '2026-09-18 11:32:53'),
(38, 28.96, 55.69, 2838.44, 1, '2026-09-18 11:37:06');

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

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`ID`, `Nom`, `num`, `nb_fauteuils`, `nb_fauteuils_roulant`, `taille_ecran`, `amenagements`, `technologies`) VALUES
(1, 'Salle 1', 1, 113, 4, '4.60m x 11.00m', 'Place PMR', ''),
(2, 'Salle 2', 2, 97, 4, '4.60m x 11.00m', 'Place PMR', ''),
(3, 'Salle 3', 3, 97, 4, '4.60m x 11.00m', 'Place PMR', ''),
(4, 'Salle 4', 4, 112, 4, '4.60m x 11.00m', 'Place PMR', ''),
(5, 'Salle 5', 5, 150, 5, '5.15m x 12.30m', 'Place PMR, Espace Co', ''),
(6, 'Salle 6', 6, 150, 5, '5.15m x 12.30m', 'Place PMR, Espace Co', 'ScreenX'),
(7, 'Salle 7', 7, 265, 7, '6.95m x 16.60m', 'Place PMR, Espace Co', 'Laser Ultra'),
(8, 'Salle ICE', 8, 139, 4, '5.15m x 12.30m', 'Place PMR', ''),
(9, 'Salle 9', 9, 125, 7, '6.95m x 16.60m', 'Place PMR, Espace Co', 'Laser Ultra'),
(10, 'Salle 10', 10, 112, 4, '5.15m x 12.30m', 'Place PMR', ''),
(11, 'Salle 11', 11, 158, 7, '6.95m x 16.60m', 'Place PMR, Espace Co', 'Laser Ultra'),
(12, 'Salle 12', 12, 156, 4, '5.15m x 12.30m', 'Place PMR', '');

-- --------------------------------------------------------

--
-- Table structure for table `seances`
--

CREATE TABLE `seances` (
  `ID` int(11) UNSIGNED NOT NULL,
  `heure_date` date NOT NULL,
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
  ADD PRIMARY KEY (`ID`);

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
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mesures`
--
ALTER TABLE `mesures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  ADD CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`ID`),
  ADD CONSTRAINT `seances_ibfk_2` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
