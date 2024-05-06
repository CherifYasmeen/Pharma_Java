-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2024 at 01:38 AM
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
-- Database: `parapharmacieeee`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `FeaturedImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
(10, '8 Must-Visit Travel Destinations for Nature Lovers', 'Explore breathtaking natural landscapes and destinations around the world for nature enthusiasts.', 'https://example.com/images/nature-travel-destinations.jpg', '2024-04-12', '2024-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `libelle`) VALUES
(1, 'crèmes et écrans solaires'),
(2, 'Yeux et lèvres'),
(3, 'Démaquillants, nettoyants visage'),
(4, 'Douche & bain'),
(5, 'Soins après-soleil'),
(6, 'Orthopédie');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `panier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `sent` tinyint(1) DEFAULT NULL,
  `totale` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `pani_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6EEAA67DF77D927C` (`panier_id`),
  KEY `IDX_6EEAA67DA76ED395` (`user_id`),
  KEY `IDX_6EEAA67D4B80BE2D` (`pani_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id`, `panier_id`, `user_id`, `sent`, `totale`, `created_at`, `pani_id`) VALUES
(1, 1, 3, 1, 65, '2024-02-27 18:32:05', NULL),
(3, NULL, 15, 1, 65, '2024-03-02 19:38:26', 2),
(4, NULL, 17, 1, 39, '2024-03-02 22:30:11', 3),
(6, NULL, 17, 1, 98, '2024-03-04 02:06:35', 3),
(7, NULL, 19, 1, 69, '2024-03-04 10:55:40', 4);

-- --------------------------------------------------------

--
-- Table structure for table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
CREATE TABLE IF NOT EXISTS `commande_produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produit_id` int DEFAULT NULL,
  `commande_id` int DEFAULT NULL,
  `quantite_produit` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DF1E9E87F347EFB` (`produit_id`),
  KEY `IDX_DF1E9E8782EA2E54` (`commande_id`)
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

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240227165651', '2024-02-27 17:58:25', 1017),
('DoctrineMigrations\\Version20240227180442', '2024-02-27 19:04:49', 344),
('DoctrineMigrations\\Version20240302184043', '2024-03-02 19:40:46', 364),
('DoctrineMigrations\\Version20240302195234', '2024-03-02 20:52:37', 110),
('DoctrineMigrations\\Version20240303215337', '2024-03-03 22:53:53', 57),
('DoctrineMigrations\\Version20240303220529', '2024-03-03 23:05:33', 100),
('DoctrineMigrations\\Version20240303222330', '2024-03-03 23:23:35', 23);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `ville` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `prenom`, `email`, `telephone`, `ville`) VALUES
(1, 'Hichri', 'Khalil ', 'khalilochri99@gmail.com', 50306543, 'Hammamet'),
(3, 'Ben Salah', 'Mohsen', 'aenemy95@gmail.com', 52416258, 'Sousse'),
(4, 'Gadhrib', 'Ahmed', 'gadhribhela@gmail.com', 25146352, 'Aryannah');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `historique`
--

INSERT INTO `historique` (`id`, `user_id`, `totale`, `ref_commande`, `created_at`) VALUES
(1, 3, 65, 1, '2024-02-27 18:32:05'),
(2, 15, 65, 3, '2024-03-02 19:38:26'),
(3, 17, 39, 4, '2024-03-02 22:30:11'),
(4, 17, 50, 5, '2024-03-02 22:30:24'),
(5, 17, 98, 6, '2024-03-04 02:06:35'),
(6, 19, 69, 7, '2024-03-04 10:55:40');

-- --------------------------------------------------------

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_id` int DEFAULT NULL,
  `matricule_id` int DEFAULT NULL,
  `nom_id` int DEFAULT NULL,
  `date_liv` date DEFAULT NULL,
  `adresse_liv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `livreur_id` int NOT NULL,
  `sent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A60C9F1F1645DEA9` (`reference_id`),
  UNIQUE KEY `UNIQ_A60C9F1F9AAADC05` (`matricule_id`),
  KEY `IDX_A60C9F1FC8121CE9` (`nom_id`),
  KEY `IDX_A60C9F1FF8646701` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `livraison`
--

INSERT INTO `livraison` (`id`, `reference_id`, `matricule_id`, `nom_id`, `date_liv`, `adresse_liv`, `description`, `etat`, `livreur_id`, `sent`) VALUES
(8, 6, 6, NULL, '2024-03-04', 'avenue indepce', 'Déposez le colis à la porte d\'entrée', 'en-livraison', 19, NULL),
(9, 7, 7, NULL, '2024-03-04', 'avenue independence', 'Manipuler avec soin', 'en-livraison', 19, NULL),
(10, 4, NULL, NULL, '2024-04-10', 'jnkkjn', 'Déposez le colis à la porte d\'entrée', 'en-livraison', 14, NULL),
(12, 3, NULL, NULL, '2024-05-23', 'iuflyiyu', 'Signature requise', 'yjtrxy', 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_tel` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `histoire_liv` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_24CC0DF27E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panier`
--

INSERT INTO `panier` (`id`, `owner_id`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL);

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
  `rate` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29A5EC27A96778EC` (`categorys_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `categorys_id`, `nom`, `description`, `quantite`, `prix`, `image`, `rate`) VALUES
(3, 1, 'CLARENIA HB5 SERUM HYDRA REPULPANT', 'Clarenia HB5 sérum intense hydra est un sérum de soin de la peau qui contient de l\'acide hyaluronique et de la vitamine B5.\r\n\r\nL\'acide hyaluronique aide à hydrater la peau en retenant l\'eau, ce qui peut améliorer l\'apparence de la peau sèche et ridée.', 30, 69.862, 'clarenia-hb5-serum-hydra-repulpant-30ml-65e3918ee1d20.jpg', NULL),
(4, 4, 'NUBIANCE ACT5 SOIN INTENSE ANTI-IMPERFECTIONS', 'ACT-5 est un soin anti-imperfections qui n’assèche pas la peau et qui corrige les taches causées par les boutons d’acné', 30, 72.885, 'nubiance-act5-soin-intense-30ml-65e392cb1c762.jpg', NULL),
(5, 1, 'SVR SEBIACLEAR GEL MOUSSANT', 'Gel moussant Sébiaclear de SVR, le soin quotidien pour nettoyer les peaux sensibles mixtes à grasses du visage', 400, 39.82, 'sebiaclear-gel-moussant-recharge-400ml-65e392f54ecb9.jpg', NULL),
(6, 5, 'CERAVE CREME LAVANTE HYDRATANTE', 'CeraVe Crème Lavante Hydratante 473 ml est une crème lavante qui permet de nettoyer et hydrater la peau (visage et corps) sans altérer la barrière protectrice de la peau', 473, 50.979, 'cerave-creme-lavante-hydratante-236-ml-65e395d57c6d5.jpg', 2),
(7, 4, 'jvhkjb', 'kjl b', 87, 98.245, 'moiz-65e51e2aba8cc.jpg', 4);

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
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(2, 1, 'GEL MOUSSANT PURIFIANT 400 ML', 'Corps', 12, 73.029, '2024-05-06'),
(3, 4, 'HYFAC MOUSSE A RASER 150ML', 'Homme', 250, 32.684, '2024-04-10'),
(5, 3, 'ROGE CAVAILLES', 'Hygiene', 150, 28, '2024-05-04'),
(14, 3, 'LOREAL Paris Elvive Dream Long Shampooing', 'Cheveux', 280, 15.75, '2024-05-06'),
(15, 4, 'MUSTELA Bébé Crème pour le Change 1-2-3', 'Bebe', 200, 18.5, '2024-04-23'),
(16, 1, 'GILLETTE Mach3 Rasoir Jetable', 'Homme', 156, 35.99, '2024-04-21');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE IF NOT EXISTS `transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matricule` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anneefab` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `livreur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66AB212EF8646701` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`id`, `type`, `etat`, `marque`, `matricule`, `anneefab`, `livreur_id`) VALUES
(5, 'SUV/4X4', 'En Réparation', 'Hyundai', '210-TUN-9642', '2023-06-08 00:00:00', 17),
(6, 'Monospace', 'Hors Service', 'Isuzu', '165-TUN-8754', '2018-10-17 00:00:00', 17),
(7, 'SUV/4X4', 'Opérationnel', 'HYUNDAI', '235-TUN-1389', '2021-06-01 00:00:00', 19),
(8, 'SUV/4X4', 'Opérationnel', 'Hyundai', '185-TUN-7846', '2018-03-01 00:00:00', 22),
(9, 'Utilitaire', 'Opérationnel', 'Kia', '200-TUN-7946', '2019-10-03 00:00:00', 22),
(11, 'Pick up', 'En réparation', 'Isuzu', '205-TUN-1345', '2020-06-17 00:00:00', 22),
(12, 'Camion frigorifique', 'Hors service', 'Volkswagen', '210-TUN-3692', '2021-08-04 00:00:00', 22),
(13, 'Camion frigorifique', 'Opérationnel', 'Toyota', '200-TUN-4368', '2020-07-15 00:00:00', 17),
(14, 'Pick up', 'Opérationnel', 'Peugeot', '220-TUN-1268', '2023-11-30 00:00:00', 17),
(15, 'Camion frigorifique', 'En réparation', 'Peugeot', '206-TUN-7468', '2021-05-20 00:00:00', 19),
(16, 'Pick up', 'Hors service', 'Volkswagen', '200-TUN-5896', '2021-02-17 00:00:00', 19),
(17, 'Monospace', 'Opérationnel', 'Suzuki', '201-TUN-2473', '2020-10-13 00:00:00', 14);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `panier_id` int DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  UNIQUE KEY `UNIQ_8D93D649F77D927C` (`panier_id`)
) ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `panier_id`, `email`, `roles`, `password`, `name`, `prename`, `birthday`, `adress`, `phone`) VALUES
(3, 1, 'ahmed.boudali@gmail.com', '[\"ROLE_USER\"]', '$2y$13$KtWSh2lq1/4p/kkU0N1OO.N2.ztWaek3eF9XKpwXMrByLZHj5QHrG', 'ahmed', 'boudali', '2001-06-05', 'rue malasin', 94571645),
(5, NULL, 'moatez.ghoul@gmail.com', '[\"ROLE_USER\"]', '$2y$13$XVFDgjOLB21Xitoc3YvhmusV5md0RZMsnCAyMvtCw48V2mz.Dswuu', 'moatezz', 'ghoul', '2002-05-07', 'rue nasr', 50214579),
(6, NULL, 'mo.ghoul@gmail.com', '[\"ROLE_ADMIN\"]', 'GHOUL', 'taz', 'ghoul', '2019-01-01', 'rue', 94521545),
(7, NULL, 'm.ghoul@gmail.com', '[\"ROLE_USER\"]', '$2y$13$b28APLSN4Wcl7RtDTSNAze92fA83r4b7o1j3TQEWL4u43/UHMVNLW', 'Mootaz', 'ghoul', '2002-10-17', 'avenue martyr', 41703090),
(8, NULL, 'lmail@mail.tn', '[\"ROLE_USER\"]', '$2y$13$sKsghRxcA6FjSoR1O.deCeS2WkxJQIKydUThBn.3ZJ1r7AQ43f6ma', 'ghoul', 'moatez', '2000-05-11', 'rue', 98467521),
(9, NULL, 'ez8@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$fIeWzyVJBKfyCJRERwjcLOVgBmP31DtCguw7SzwZOeTyIuGGolNkO', 'tez', 'gh', '2003-03-04', 'Ruee', 26458138),
(10, NULL, 'm@gmail.tn', '[\"ROLE_USER\"]', '$2y$13$8pvrs00vv/0V/3aT9zwKrOoOofKz9CPCCeiXwQKvKxE69/fgQRC9C', 'ujki', 'olmp', '2020-09-07', 'avenuee', 56412897),
(11, NULL, 'azerty@gmail.tn', '[\"ROLE_ADMIN\"]', '$2y$13$bjxB0CNJc/znmW2Vl5A44e9A/C5BheIFVrRxVWDLYfF.wNBFLb5iK', 'aq', 'qa', '2019-02-12', 'pol', 76482413),
(12, NULL, 'lfvd@gmail.com', '[\"ROLE_ADMIN\"]', '179346', 'aze', 'rty', '2019-02-16', 'nbhh', 45219786),
(13, NULL, 'erty@gmail.tn', '[\"ROLE_ADMIN\"]', '$2y$13$AhfdFKWhdrhGHqFJG.xtdeekKfStYu4OE...YSDUqQEzvzJa8pPc.', 'az', 'er', '2000-02-01', 'jfzebn', 98645345),
(14, NULL, 'gre@gmail.tn', '[\"ROLE_LIVREUR\"]', '$2y$13$wwIMxvjmt6.WsxWIi90TnOOzN0PwUl3Sb9iUpidZ.N/xPP6/HxYIy', 'moatez', 'veve', '2019-02-15', 'av martyr', 26458747),
(15, 2, 'qwerty@gmail.tn', '[\"ROLE_USER\"]', '$2y$13$9cuVD0HYZKgVMHHYxokPnOk5htEK0dv.CjcUUsHESlNK2P/b3Lyjm', 'ggvf', 'dfb', '2001-02-01', 'avenuee', 54876912),
(16, NULL, 'bdfb@gmail.com', '[\"ROLE_LIVREUR\"]', '147258369', 'ahmed', 'frz', '2019-01-01', 'fezfez', 21547698),
(17, 3, 'ghoul@outlook.tn', '[\"ROLE_LIVREUR\"]', '01234', 'mohamed', 'ezvce', '2020-08-15', 'street', 96345812),
(18, NULL, 'noom@gmail.com', '[\"ROLE_USER\"]', '$2y$13$t/MleMZc2FoJAxLmpKEtWObIFcjDxS97z18rToo3xEHuXN/OcVDQm', 'noom', 'moon', '1999-09-02', 'streeet', 49865712),
(19, 4, 'plpok@email.tn', '[\"ROLE_LIVREUR\"]', '$2y$13$XLDWV/ayQDTq0NaHdNQ1IOJuY6nOGBUhRzFcprrjd4rSJrpqNTI1W', 'lol', 'kik', '2019-01-01', 'avvvv', 21457862),
(20, NULL, 'briki.mayar@gmail.com', '[\"ROLE_USER\"]', '$2y$13$VcoJyDHLL6t6PlxA1kaXk.rrAeszqMuds1U8kSnQhkXrzFQIg3Ewi', 'mayar', 'briki', '2001-02-26', 'rue de tunis', 26273722),
(21, NULL, 'lol@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$R5wOCFedRFreGUA0VV7Bo.hDZ3lpNbIFeP7.bdQIdmDekCYbLdmwK', 'lmao', 'aqzsx', '2024-03-08', 'rueeeeeee', 52436789),
(22, NULL, 'lool@gmail.com', '[\"ROLE_LIVREUR\"]', '876543210', 'aoml', 'zsxwqa', '2019-01-01', 'av martyrrrr', 96485312),
(23, NULL, 'aze@gmail.com', '[\"ROLE_LIVREUR\"]', '$2y$13$WSviqG.1Ny1/.52KMAxjNufMFilvi4a.7eSkiE4ZGGQ85ZoOFm9lu', 'fnyuffgk', 'nkfgkuyk', '2024-05-09', 'knyufnky', 89461015);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D4B80BE2D` FOREIGN KEY (`pani_id`) REFERENCES `panier` (`id`),
  ADD CONSTRAINT `FK_6EEAA67DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_6EEAA67DF77D927C` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`);

--
-- Constraints for table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `FK_DF1E9E8782EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DF1E9E87F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `FK_EDBFD5ECA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `FK_A60C9F1F1645DEA9` FOREIGN KEY (`reference_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FK_A60C9F1F9AAADC05` FOREIGN KEY (`matricule_id`) REFERENCES `transport` (`id`),
  ADD CONSTRAINT `FK_A60C9F1FC8121CE9` FOREIGN KEY (`nom_id`) REFERENCES `livreur` (`id`),
  ADD CONSTRAINT `FK_A60C9F1FF8646701` FOREIGN KEY (`livreur_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `FK_24CC0DF27E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27A96778EC` FOREIGN KEY (`categorys_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `produit_panier`
--
ALTER TABLE `produit_panier`
  ADD CONSTRAINT `FK_D39EC6C8F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D39EC6C8F77D927C` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FK_5FB6DEC772D41C37` FOREIGN KEY (`idrec_id`) REFERENCES `reclamation` (`id`);

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `FK_66AB212EF8646701` FOREIGN KEY (`livreur_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649F77D927C` FOREIGN KEY (`panier_id`) REFERENCES `panier` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
