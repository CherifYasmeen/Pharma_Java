-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 23, 2024 at 03:10 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parapharmacie`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Content` text COLLATE utf8mb4_general_ci,
  `FeaturedImage` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PublicationDate` date DEFAULT NULL,
  `LastUpdatedDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `Title`, `Content`, `FeaturedImage`, `PublicationDate`, `LastUpdatedDate`) VALUES
(1, 'The Benefits of Vitamin C for Skin Health', 'Learn how Vitamin C can improve your skin health and fight aging signs.', 'https://example.com/images/vitamin-c-skin.jpg', '2024-04-20', '2024-04-20'),
(2, '10 Tips for Healthy Hair', 'Discover 10 effective tips to maintain healthy and beautiful hair naturally.', 'https://example.com/images/healthy-hair-tips.jpg', '2024-04-19', '2024-04-19'),
(3, 'The Power of Green Tea in Skincaref', 'Explore how green tea can benefit your skin and enhance your beauty regimen.', 'https://example.com/images/green-tea-skincare.jpg', '2024-04-02', '2024-04-05'),
(4, 'Essential Oils for Relaxation and Stress Relie', 'Discover the best essential oils for relaxation and relieving stress after a long day.', 'https://example.com/images/essential-oils-relaxation.jpg', '2024-03-11', '2024-03-27'),
(7, 'The Benefits of Meditation for Mental Health', 'Learn about the positive impact of meditation on mental health and stress reduction.', 'https://example.com/images/meditation-mental-health.jpg', '2024-04-18', '2024-04-18'),
(8, '5 Easy Recipes for Quick Breakfast', 'Discover simple and nutritious breakfast recipes for busy mornings.', 'https://example.com/images/quick-breakfast-recipes.jpg', '2024-04-17', '2024-04-17'),
(9, 'The Importance of Regular Exercise', 'Explore the health benefits of regular exercise and its impact on overall well-being.', 'https://example.com/images/importance-of-exercise.jpg', '2024-04-15', '2024-04-22'),
(10, '8 Must-Visit Travel Destinations for Nature Lovers', 'Explore breathtaking natural landscapes and destinations around the world for nature enthusiasts.', 'https://example.com/images/nature-travel-destinations.jpg', '2024-04-12', '2024-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `panier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `pani_id` int DEFAULT NULL,
  `sent` tinyint(1) DEFAULT NULL,
  `totale` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6EEAA67DF77D927C` (`panier_id`),
  KEY `IDX_6EEAA67DA76ED395` (`user_id`),
  KEY `IDX_6EEAA67D4B80BE2D` (`pani_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `prenom`, `email`, `telephone`, `ville`) VALUES
(1, 'Hichri', 'Khalil ', 'hichri.khalil@gmail.com', 50306543, 'Hammamet'),
(3, 'Ben Salah', 'Mohsen', 'mohsenbensalah@gmail.com', 52416258, 'Sousse'),
(4, 'Gadhrib', 'Ahmed', 'ahmedgadhrib@gmail.com', 25146352, 'Aryannah');

-- --------------------------------------------------------

--
-- Table structure for table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE IF NOT EXISTS `historique` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `totale` int NOT NULL,
  `ref_commande` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_EDBFD5ECA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_id` int DEFAULT NULL,
  `matricule_id` int DEFAULT NULL,
  `roles_id` int DEFAULT NULL,
  `date_liv` date DEFAULT NULL,
  `adresse_liv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A60C9F1F1645DEA9` (`reference_id`),
  UNIQUE KEY `UNIQ_A60C9F1F9AAADC05` (`matricule_id`),
  KEY `IDX_A60C9F1F38C751C4` (`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categorys_id` int DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` int NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29A5EC27A96778EC` (`categorys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit_panier`
--

DROP TABLE IF EXISTS `produit_panier`;
CREATE TABLE IF NOT EXISTS `produit_panier` (
  `produit_id` int NOT NULL,
  `panier_id` int NOT NULL,
  PRIMARY KEY (`produit_id`,`panier_id`),
  KEY `IDX_D39EC6C8F347EFB` (`produit_id`),
  KEY `IDX_D39EC6C8F77D927C` (`panier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_r` date DEFAULT NULL,
  `description_r` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_r` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idrec_id` int DEFAULT NULL,
  `reponse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5FB6DEC772D41C37` (`idrec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fournisseur_id` int DEFAULT NULL,
  `nom_produit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` int DEFAULT NULL,
  `prix` float NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4B365660670C757F` (`fournisseur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `fournisseur_id`, `nom_produit`, `type`, `quantite`, `prix`, `date`) VALUES
(1, 1, 'SUN SECURE Crème SPF50+', 'Visage', 500, 51.5, '2024-02-19'),
(2, 0, 'GEL MOUSSANT PURIFIANT 400 ML', 'Corps', 120, 73.029, '2024-03-12'),
(3, 4, 'HYFAC MOUSSE A RASER 150ML', 'Homme', 250, 32.684, '2024-04-10'),
(5, 3, 'ROGE CAVAILLES', 'Hygiene', 85, 28, '2024-04-21'),
(14, 3, 'LOREAL Paris Elvive Dream Long Shampooing', 'Cheveux', 155, 15.75, '2024-04-21'),
(15, 4, 'MUSTELA Bébé Crème pour le Change 1-2-3', 'Bebe', 200, 18.5, '2024-04-23'),
(16, 1, 'GILLETTE Mach3 Rasoir Jetable', 'Homme', 156, 35.99, '2024-04-21'),
(30, NULL, 'aaaaaaaa', 'aaaaaaaa', 4, 4, '2024-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE IF NOT EXISTS `transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roles_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anneefab` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66AB212E38C751C4` (`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
