-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 05, 2016 at 01:54 PM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

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
  `sequenceId` int(11) NOT NULL,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `objectifFormateur` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectifApprenant` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `temps` int(11) NOT NULL,
  `demarche` tinyint(4) NOT NULL,
  `evaluation` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ActiviteDeFormation`
--

INSERT INTO `ActiviteDeFormation` (`id`, `sequenceId`, `intitule`, `code`, `description`, `objectifFormateur`, `objectifApprenant`, `temps`, `demarche`, `evaluation`) VALUES
(1, 1, 'Petit Déjeuner de bienvenue', 'SOC00-01', 'Petit Déjeuner de bienvenue', 'Découverte des apprenants', 'Découverte de leurs environnement', 1, 0, ''),
(2, 1, 'Ice Breaker : 3 Vérités et 1 Mensonge', 'SOC00-02', 'Les apprenants doivent à tour de rôle, citer 3 vérités et un mensonge les concernants. Les autres apprenants doivent deviner lequel est faux.\r\n\r\nLe formateur peut participer à l''ice breaker', 'Découverte d''autrui', 'Découverte d''autrui', 1, 0, ''),
(3, 1, 'Définition d''une charte commune', 'SOC00-03', 'Une charte est à définir lors de la prairie.\r\nCette charte définie par les apprenants doit définir les règles acceptées par tous. \r\n\r\nCertaines thématiques doivent être abordées : \r\n * Horaires\r\n * Retards\r\n * Ranger ses affaires en fin de journée', 'Impliquer les apprenants à leur formation', 'Accepter les règles communes', 1, 2, 'Redaction et impression de la charte'),
(4, 1, 'Ice Breaker : Tri', 'SOC00-04', 'Les apprenants doivent se ranger à la queue leu leu en fonction : \r\n- De leur taille\r\n- Du nombre de couleurs sur leurs vêtements\r\n- Sur le nombre de réalisations faites sur internet (n''importe quoi tant que leur nom y est référencé)\r\n- Du nombre de pays visité (durée > 1 semaine)\r\n- Du nombre de langages de programmation qu''ils ont déjà utilisé (avant formation)\r\n- Du nombre de langues orales parlées', 'Découverte d''autrui', 'Découverte d''autrui', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `linkProgrammeModule`
--

DROP TABLE IF EXISTS `linkProgrammeModule`;
CREATE TABLE IF NOT EXISTS `linkProgrammeModule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programmeId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `linkProgrammeModule`
--

INSERT INTO `linkProgrammeModule` (`id`, `programmeId`, `moduleId`) VALUES
(1, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ProgrammeDeFormation`
--

INSERT INTO `ProgrammeDeFormation` (`id`, `intitule`, `objectif`) VALUES
(1, 'Rennes - Prairie Promo 01', '');

-- --------------------------------------------------------

--
-- Table structure for table `SequenceDeFormation`
--

DROP TABLE IF EXISTS `SequenceDeFormation`;
CREATE TABLE IF NOT EXISTS `SequenceDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleId` int(11) NOT NULL,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `evaluation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SequenceDeFormation`
--

INSERT INTO `SequenceDeFormation` (`id`, `moduleId`, `intitule`, `description`, `code`, `objectif`, `evaluation`) VALUES
(1, 1, 'Identifier les autres aprenants de la formation', 'Cette séquence, essentiellement destinée à la phase de prairie permet aux apprenants à se connaître.\r\n\r\nPermettant par la suite de pouvoir bénéficier de la dynamique de groupe.', 'SOC00', 'Identifier les autres aprenants de la formation', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
