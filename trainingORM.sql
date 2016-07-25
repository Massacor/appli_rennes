-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2016 at 03:04 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `trainingORM`
--
CREATE DATABASE IF NOT EXISTS `trainingORM` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `trainingORM`;

-- --------------------------------------------------------

--
-- Table structure for table `ActiviteDeFormation`
--

DROP TABLE IF EXISTS `ActiviteDeFormation`;
CREATE TABLE IF NOT EXISTS `ActiviteDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `objectifFormateur` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectifApprenant` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `temps` int(11) NOT NULL,
  `demarche` tinyint(4) NOT NULL,
  `evaluation` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ModuleDeFormation`
--

DROP TABLE IF EXISTS `ModuleDeFormation`;
CREATE TABLE IF NOT EXISTS `ModuleDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `PreRequis` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ModuleDeFormation`
--

INSERT INTO `ModuleDeFormation` (`id`, `intitule`, `objectif`, `code`, `description`, `PreRequis`) VALUES
(1, 'Compréhender et accepter les thématiques abordées lors de la formation', 'Implication au sein de la formation dispensée', 'PRAIRIE-00', 'Ce module, dispensé dans le cadre de la prairie, a pour objectif d''impliquer les apprenants au sein de la formation. \r\n\r\nQu''ils comprennent l''ensemble des enjeux ainsi qu''ils aient une visibilité sur la méthodologie qui sera appliquée tout au long de la formation.', 'Etre inscrit à la formation');

-- --------------------------------------------------------

--
-- Table structure for table `OutilDeFormation`
--

DROP TABLE IF EXISTS `OutilDeFormation`;
CREATE TABLE IF NOT EXISTS `OutilDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ProgrammeDeFormation`
--

DROP TABLE IF EXISTS `ProgrammeDeFormation`;
CREATE TABLE IF NOT EXISTS `ProgrammeDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SequenceDeFormation`
--

DROP TABLE IF EXISTS `SequenceDeFormation`;
CREATE TABLE IF NOT EXISTS `SequenceDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `evaluation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
