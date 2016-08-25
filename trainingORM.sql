-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 25, 2016 at 11:51 AM
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
  `code` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `objectifFormateur` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectifApprenant` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `temps` int(11) NOT NULL,
  `demarche` tinyint(4) NOT NULL,
  `evaluation` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `sequenceId` (`sequenceId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=261 ;

--
-- Dumping data for table `ActiviteDeFormation`
--

INSERT INTO `ActiviteDeFormation` (`id`, `sequenceId`, `intitule`, `code`, `description`, `objectifFormateur`, `objectifApprenant`, `temps`, `demarche`, `evaluation`, `pos`) VALUES
(1, 1, 'Petit Déjeuner de bienvenue', 'SOC00-01', 'Petit Déjeuner de bienvenue', 'Découverte des apprenants', 'Découverte de leurs environnement', 1, 0, '', 1),
(2, 1, 'Ice Breaker : 3 Vérités et 1 Mensonge', 'SOC00-02', 'Les apprenants doivent à tour de rôle, citer 3 vérités et un mensonge les concernants. Les autres apprenants doivent deviner lequel est faux.\r\n\r\nLe formateur peut participer à l''ice breaker', 'Découverte d''autrui', 'Découverte d''autrui', 1, 0, '', 1),
(3, 16, 'Définition d''une charte commune', 'SOC10-01', 'Une charte est à définir lors de la prairie.\r\nCette charte définie par les apprenants doit définir les règles acceptées par tous. \r\n\r\nCertaines thématiques doivent être abordées : \r\n * Horaires\r\n * Retards\r\n * Ranger ses affaires en fin de journée', 'Impliquer les apprenants à leur formation', 'Accepter les règles communes', 1, 1, '', 1),
(4, 23, 'Ice Breaker : Tri', 'SOC00-04', 'Les apprenants doivent se ranger à la queue leu leu en fonction : \r\n- De leur taille\r\n- Du nombre de couleurs sur leurs vêtements\r\n- Sur le nombre de réalisations faites sur internet (n''importe quoi tant que leur nom y est référencé)\r\n- Du nombre de pays visité (durée > 1 semaine)\r\n- Du nombre de langages de programmation qu''ils ont déjà utilisé (avant formation)\r\n- Du nombre de langues orales parlées', 'Découverte d''autrui', 'Découverte d''autrui', 1, 0, '', 1),
(7, 6, 'Installation de Linux', 'LIN00-01', 'Pour alléger le réseau, il est préférable de préparer des clés de boot en amont. Les apprenants découvrent par eux même comment insaller l''OS sur leur système. Et commencent à partager', 'Démystification de l''OS', 'Pratique manuelle et débug d''une install d''OS', 4, 0, '', 1),
(14, 16, 'Election d''un délégué', 'SOC10-02', 'Plusieurs personnes peuvent se présenter pour les élections. Vu qu''aucun ne se connait. Le vote final peut se réaliser au shifumi', 'Définir un single point of contact', 'Accepter d''avoir un vecteur de communication clairement défini', 1, 1, 'ponctuelle', 1),
(15, 6, 'Découverte du terminal', 'LIN00-02', 'Terminus du MIT.\r\nDécouverte de : cd, .., ls, mkdir, ps, rm, mv', 'Faire découvrir la puissance du terminal', 'Découverte et expérimentation', 4, 0, 'auto_eval', 1),
(16, 6, 'Découverte de l''editeur VIM', 'LIN00-03', '>Après avoir un peu pratiqué les tutoriels, les apprenants doivent utiliser vim pour leur premier projet.', 'Voir l''aisance des apprenants pour l''auto apprentissage', 'Auto apprentissage', 2, 0, 'auto_eval', 1),
(17, 6, 'Découverte de GIT et GITHub', 'GIT00-01', 'Création d''un compte github. \r\n						Découverte de git init/add/commit/pull/push/clone', 'Donner les bonne pratiques', 'Découverte de git', 4, 0, 'auto_eval', 1),
(18, 17, 'Initiation au HTML / CSS', 'HTML00-01', 'OpenClassroom. W3School. AlsaCreation. Projet http://prod.simplon.co/divers/challenges/briefing-challenge-2.zip', 'Découverte du HTML', 'Découverte du HTML', 4, 0, 'auto_eval', 1),
(19, 17, 'Projet : Pro Create', 'HTML00-02', 'Création de binomes de projets pour le WE. http://prod.simplon.co/divers/challenges/briefing-challenge-1.zip. Résultat attendu sur GitHub.', 'Premier projet', 'Premier projet', 2, 0, 'ponctuelle', 1),
(20, 17, 'Projet : No Images', 'HTML00-03', 'Par groupes définis. Développez un site web HTML + CSS sur une thématique libre. Nous vous rajoutons une simple contrainte. N''utilisez aucune image externe.', 'Découverte du HTML et mockup', 'Travailler en groupe', 8, 0, 'auto_eval', 1),
(21, 18, 'Coding Dojo : FizzBuzz', 'JS00-01', 'Réparti sur deux jours consécutifs, réalisation d''un FizzBuzz en coding dojo. Attention, en fonction du nombre de participants, il peut s''avérer plus efficace de scinder les apprenants en deux groupes. src : https://github.com/bu7ch-learn1ng/fizzbuzz-js', 'Initiation à l''algorithmie', 'Découverte du JS', 6, 0, 'auto_eval', 1),
(22, 19, 'Pratique de requêtes SQL', 'SQL00-01', 'Sur http://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all \r\nRéalisez les requêtes suivantes : \r\n1) La liste des ContactName de la table Customer\r\n2) La liste des ProductName qui ont la CaterogyID 1 dans la table Product\r\n3)  Dans la table Product, au lieu d''avoir les ID  (pour categoryID et SupplierID), qu''on voie les noms des catégories et des fournisseurs , tout celà en une seule requête (edited)\r\n4) Créez une table utilisateur semblable à celle qu enous pouvons trouver au sein d''un réseau social. Réflechissez aux champs nécessaires et à la structure.\r\n5) Quels champs seront répetitifs? Est-il possible d''en générer des tables en 1,n . Et/Ou que suis-je en train de vous demander  de faire ?', 'Initiation à la BDD', 'Pratique de requêtes SQL', 4, 0, 'auto_eval', 1),
(23, 20, 'Pratique de PHP', 'PHP00-01', 'Vous aurez accès à l''API de PHP sur PHP.net  : http://php.net/manual/fr/ \r\nFaites vos exercices sur : http://sandbox.onlinephpfunctions.com/ \r\n0) Comprendre le code affiché par défaut sur cette page par le biais de la doc ci-dessus\r\n1) Afficher  tous les éléments d''un tableau\r\n2) Counter le nombre d''éléments dans un table. De deux façons.\r\n3) Chercher un élément dans un table.\r\n4) Ordonner un tableau en utilisant une methode existante\r\n5) Ordonner un table en utilisant un tri que vous aurez vous-même développe', 'Initiation au PHP', 'Découverte du PHP', 4, 0, 'auto_eval', 1),
(24, 21, 'Découverte du Ruby', 'RUB00-01', 'Installer le package ruby\r\nUtilisez la commande irb ou ruby\r\n1) Calculer 23456³\r\n2) Créer une fonction entrant en paramètre une chaine de texte, et qui vous la retourne ainsi que le même texte inversé :\r\n		Ex : maFctQuiCloneEtInverse("Eh ca va la vache") doit me retourner => "Eh ca va la vache ehcav al av ac hE"\r\n3) Créer un tableau [0 => "Pomme", 1=>"Banane", 2=>"Poire", 3=>"Kiwi", 4=>"Wapiti", 5=>"Clémentine",6=>"Fraise", 7=>"Peche"]\r\n4) Trouver l''intrus :slightly_smiling_face:\r\n5) Afficher  tous les éléments d''un tableau\r\n6) Compter le nombre d''éléments dans un tableau. De deux façons.\r\n7) Chercher un élément dans un table.\r\n8) Ordonner un tableau en utilisant une methode existante\r\n9) Ordonner un table en utilisant un tri que vous aurez vous-même développé', 'Initiation au Ruby', 'Découverte du ruby', 4, 0, 'auto_eval', 1),
(25, 22, 'Brainstorming sur les langages de développement', 'CUL00-01', 'Quels sont les langages Web ? HTML, CSS, JS, PHP, Ruby, ASP, Java, Applet, CoffeeScript, JSON, YAML, SQL, Flash, Go, Dart, XML..', 'Titiller les apprenants sur la découverte des langages', 'Creuser et chercher à quoi servent tous ces langages', 1, 0, 'continue', 1),
(26, 22, 'Initiation aux méthodologies SCRUM', 'CUL00-02', 'http://www.lego4scrum.com/', 'Découvrir les leaders', 'Découverte du SCRUM', 4, 1, 'continue', 1),
(27, 22, 'Initiation à la veille technologique', 'CUL00-03', 'Présentation aux apprenants de l''importance de la veille, et des différentes méthodes pour veiller', 'Explication de la veille', 'Ecoute', 1, 1, 'ponctuelle', 1),
(28, 22, 'Video : La femme dans le monde du numérique', 'CUL00-04', 'https://vimeo.com/156415566 Code : Demander à Simplon', 'repos', 'Ecoute et regarde', 2, 0, 'auto_eval', 1),
(29, 22, 'Débat autour des différentes méthodes de rémunération de sites internet', 'CUL00-05', 'Débat autour des différentes méthodes de rémunération de sites internet', 'Mêne le débat', 'Ecoute et participe', 1, 0, 'auto_eval', 1),
(30, 56, 'Découverte et utilisation de Vim', 'OUT-001-01', 'Découverte et utilisation de Vim', 'N/A', 'N/A', 1, 1, 'auto_eval', 1),
(31, 56, 'Mise en valeur d’outils frugaux', 'OUT-001-02', 'Mise en valeur d’outils frugaux', 'Mise en valeur d’outils frugaux', 'Mise en valeur d’outils frugaux', 1, 1, 'auto_eval', 1),
(32, 56, 'Perfectionnement à l’usage du terminal', 'OUT-001-03', 'Perfectionnement à l’usage du terminal', 'Perfectionnement à l’usage du terminal', 'Perfectionnement à l’usage du terminal', 1, 1, 'continue', 1),
(33, 57, 'S''initier aux méthodes agiles (Scrum, Kanban)', 'GEST-001-01', 'S''initier aux méthodes agiles (Scrum, Kanban)', 'S''initier aux méthodes agiles (Scrum, Kanban)', 'S''initier aux méthodes agiles (Scrum, Kanban)', 1, 1, 'auto_eval', 1),
(34, 57, 'Planifier le travail', 'GEST-001-02', 'Planifier le travail', 'Planifier le travail', 'Planifier le travail', 1, 1, 'auto_eval', 1),
(35, 57, 'Optimiser sa productivité (technique Pomodoro)', 'GEST-001-03', 'Optimiser sa productivité (technique Pomodoro)', 'Optimiser sa productivité (technique Pomodoro)', 'Optimiser sa productivité (technique Pomodoro)', 2, 1, 'continue', 1),
(36, 57, 'Gérer un projet de manière efficiente', 'GEST-001-04', 'Gérer un projet de manière efficiente', 'Gérer un projet de manière efficiente', 'Gérer un projet de manière efficiente', 2, 1, 'continue', 1),
(37, 57, 'S''organiser personnellement, en group', 'GEST-001-05', 'S''organiser personnellement, en group', 'S''organiser personnellement, en group', 'S''organiser personnellement, en group', 2, 1, 'auto_eval', 1),
(38, 57, 'Maîtriser les outils utiles (Trello, Basecamp)', 'GEST-001-06', 'Maîtriser les outils utiles (Trello, Basecamp)', 'Maîtriser les outils utiles (Trello, Basecamp)', 'Maîtriser les outils utiles (Trello, Basecamp)', 1, 1, 'auto_eval', 1),
(39, 59, 'Compréhension de l’architecture d’un site Web', 'WEB-001-01', 'Compréhension de l’architecture d’un site Web', 'Compréhension de l’architecture d’un site Web', 'Compréhension de l’architecture d’un site Web', 1, 1, 'auto_eval', 1),
(40, 59, 'Maîtrise du langage HTML5', 'WEB-001-02', 'Maîtrise du langage HTML5', 'Maîtrise du langage HTML5', 'Maîtrise du langage HTML5', 1, 1, 'ponctuelle', 1),
(41, 59, 'Maîtrise de CSS et découverte des possibilités de CSS3', 'WEB-001-03', 'Maîtrise de CSS et découverte des possibilités de CSS3', 'Maîtrise de CSS et découverte des possibilités de CSS3', 'Maîtrise de CSS et découverte des possibilités de CSS3', 1, 1, 'continue', 1),
(42, 60, 'Comprendre le Web sémantique introduit par HTML5', 'WEB-002-01', 'Comprendre le Web sémantique introduit par HTML5', 'Comprendre le Web sémantique introduit par HTML5', 'Comprendre le Web sémantique introduit par HTML5', 1, 1, 'auto_eval', 1),
(43, 60, 'Consolider la maîtrise de HTML5 et les bonnes pratiques', 'WEB-002-02', 'Consolider la maîtrise de HTML5 et les bonnes pratiques', 'Consolider la maîtrise de HTML5 et les bonnes pratiques', 'Consolider la maîtrise de HTML5 et les bonnes pratiques', 1, 1, 'auto_eval', 1),
(44, 60, 'Apprendre les bases des techniques du SEO', 'WEB-002-03', 'Apprendre les bases des techniques du SEO', 'Apprendre les bases des techniques du SEO', 'Apprendre les bases des techniques du SEO', 1, 1, 'continue', 1),
(45, 61, 'Mettre en place rapidement des interfaces graphiques attrayantes', 'WEB-003-01', 'Mettre en place rapidement des interfaces graphiques attrayantes', 'Mettre en place rapidement des interfaces graphiques attrayantes', 'Mettre en place rapidement des interfaces graphiques attrayantes', 1, 1, 'continue', 1),
(46, 61, 'Base de design et concept de “grille”', 'WEB-003-02', 'Base de design et concept de “grille”', 'Base de design et concept de “grille”', 'Base de design et concept de “grille”', 1, 1, 'auto_eval', 1),
(47, 61, 'Comprendre et mettre en application des versions responsive', 'WEB-003-03', 'Comprendre et mettre en application des versions responsive', 'Comprendre et mettre en application des versions responsive', 'Comprendre et mettre en application des versions responsive', 1, 1, 'continue', 1),
(48, 62, 'Compréhension du “versioning”', 'OUT-002-01', 'Compréhension du “versioning”', 'Compréhension du “versioning”', 'Compréhension du “versioning”', 1, 1, 'auto_eval', 1),
(49, 62, 'Maîtrise de Git', 'OUT-002-02', 'Maîtrise de Git', 'Maîtrise de Git', 'Maîtrise de Git', 1, 1, 'continue', 1),
(50, 62, 'Création d’un compte GitHub', 'OUT-002-03', 'Création d’un compte GitHub', 'Création d’un compte GitHub', 'Création d’un compte GitHub', 1, 1, 'continue', 1),
(51, 63, 'Comprendre les enjeux des licences', 'CUL-003-01', 'Comprendre les enjeux des licences', 'Comprendre les enjeux des licences', 'Comprendre les enjeux des licences', 1, 1, 'auto_eval', 1),
(52, 63, 'Savoir quelle licence utiliser pour ses projets', 'CUL-003-02', 'Savoir quelle licence utiliser pour ses projets', 'Savoir quelle licence utiliser pour ses projets', 'Savoir quelle licence utiliser pour ses projets', 1, 1, 'auto_eval', 1),
(53, 64, 'Apprendre les principes de bases de la programmation', 'WEB-004-01', 'Apprendre les principes de bases de la programmation', 'Apprendre les principes de bases de la programmation', 'Apprendre les principes de bases de la programmation', 1, 1, 'auto_eval', 1),
(54, 64, 'Comprendre les structures de données', 'WEB-004-02', 'Comprendre les structures de données', 'Comprendre les structures de données', 'Comprendre les structures de données', 1, 1, 'continue', 1),
(55, 64, 'Apprendre le JavaScript', 'WEB-004-03', 'Apprendre le JavaScript', 'Apprendre le JavaScript', 'Apprendre le JavaScript', 1, 1, 'continue', 1),
(56, 64, 'Dynamiser l''interface d''un site Web', 'WEB-004-04', 'Dynamiser l''interface d''un site Web', 'Dynamiser l''interface d''un site Web', 'Dynamiser l''interface d''un site Web', 1, 1, 'auto_eval', 1),
(57, 65, 'Connaître les bonnes pratiques de qualité', 'WEB-005-01', 'Connaître les bonnes pratiques de qualité', 'Connaître les bonnes pratiques de qualité', 'Connaître les bonnes pratiques de qualité', 1, 1, 'auto_eval', 1),
(58, 65, 'Comprendre   la   problématique   de   l’accessibilité   numérique   pour   les   personnes   handicapées', 'WEB-005-02', 'Comprendre   la   problématique   de   l’accessibilité   numérique   pour   les   personnes  \r\nhandicapées', 'Comprendre   la   problématique   de   l’accessibilité   numérique   pour   les   personnes   handicapées', 'Comprendre   la   problématique   de   l’accessibilité   numérique   pour   les   personnes   handicapées', 1, 1, 'auto_eval', 1),
(59, 65, 'Détecter les points forts et les points faibles d’un site', 'WEB-005-03', 'Détecter les points forts et les points faibles d’un site', 'Détecter les points forts et les points faibles d’un site', 'Détecter les points forts et les points faibles d’un site', 1, 1, 'auto_eval', 1),
(60, 65, 'Acquérir   une   maîtrise   opérationnelle   des   problématiques   liées   à   l’accessibilité   du   web', 'WEB-005-04', 'Acquérir   une   maîtrise   opérationnelle   des   problématiques   liées   à   l’accessibilité   du  \r\nweb', 'Acquérir   une   maîtrise   opérationnelle   des   problématiques   liées   à   l’accessibilité   du   web', 'Acquérir   une   maîtrise   opérationnelle   des   problématiques   liées   à   l’accessibilité   du   web', 1, 1, 'auto_eval', 1),
(61, 65, 'Savoir utiliser et comprendre les référentiels basés sur WCAG 2.0', 'WEB-005-05', 'Savoir utiliser et comprendre les référentiels basés sur WCAG 2.0', 'Savoir utiliser et comprendre les référentiels basés sur WCAG 2.0', 'Savoir utiliser et comprendre les référentiels basés sur WCAG 2.0', 1, 1, 'auto_eval', 1),
(62, 65, 'Mettre un site en conformité', 'WEB-005-06', 'Mettre un site en conformité', 'Mettre un site en conformité', 'Mettre un site en conformité', 1, 1, 'auto_eval', 1),
(63, 65, 'Savoir communiquer et vendre la démarche', 'WEB-005-07', 'Savoir communiquer et vendre la démarche', 'Savoir communiquer et vendre la démarche Savoir communiquer et vendre la démarche', 'Savoir communiquer et vendre la démarche', 1, 1, 'auto_eval', 1),
(64, 66, 'Reprendre les bases de l’algorithmique classique : parcours, tri, recherche', 'ALGO-001-01', 'Reprendre les bases de l’algorithmique classique : parcours, tri, recherche', 'Reprendre les bases de l’algorithmique classique : parcours, tri, recherche', 'Reprendre les bases de l’algorithmique classique : parcours, tri, recherche', 1, 1, 'auto_eval', 1),
(65, 66, 'Comprendre l’utilité de l’algorithmique dans le développement Web', 'ALGO-001-02', 'Comprendre l’utilité de l’algorithmique dans le développement Web', 'Comprendre l’utilité de l’algorithmique dans le développement Web', 'Comprendre l’utilité de l’algorithmique dans le développement Web', 1, 1, 'auto_eval', 1),
(66, 66, 'Développer sa logique', 'ALGO-001-03', 'Développer sa logique', 'Développer sa logique', 'Développer sa logique', 1, 1, 'continue', 1),
(67, 66, 'Se perfectionner en JavaScript', 'ALGO-001-04', 'Se perfectionner en JavaScript', 'Se perfectionner en JavaScript', 'Se perfectionner en JavaScript', 1, 1, 'auto_eval', 1),
(68, 67, 'Comprendre l’architecture client / serveur', 'OUT-003-01', 'Comprendre l’architecture client / serveur', 'Comprendre l’architecture client / serveur', 'Comprendre l’architecture client / serveur', 1, 1, 'continue', 1),
(69, 67, 'Découvrir le protocole HTTP', 'OUT-003-02', 'Découvrir le protocole HTTP', 'Découvrir le protocole HTTP', 'Découvrir le protocole HTTP', 1, 1, 'auto_eval', 1),
(70, 67, 'Maîtriser son environnement Web loca', 'OUT-003-003', 'Maîtriser son environnement Web loca', 'Maîtriser son environnement Web loca', 'Maîtriser son environnement Web loca', 1, 1, 'continue', 1),
(71, 68, 'Perfectionner son apprentissage en JavaScript', 'WEB-006-01', 'Perfectionner son apprentissage en JavaScript', 'Perfectionner son apprentissage en JavaScript', 'Perfectionner son apprentissage en JavaScript', 1, 1, 'auto_eval', 1),
(72, 68, 'Mettre en place une animation via l’objet Canvas', 'WEB-006-02', 'Mettre en place une animation via l’objet Canvas', 'Mettre en place une animation via l’objet Canvas', 'Mettre en place une animation via l’objet Canvas', 1, 1, 'auto_eval', 1),
(73, 68, 'Appréhender l''asynchronisme', 'WEB-006-03', 'Appréhender l''asynchronisme', 'Appréhender l''asynchronisme', 'Appréhender l''asynchronisme', 1, 1, 'auto_eval', 1),
(74, 68, 'Interagir avec des API en JavaScript', 'WEB-006-04', 'Interagir avec des API en JavaScript', 'Interagir avec des API en JavaScript', 'Interagir avec des API en JavaScript', 1, 1, 'auto_eval', 1),
(75, 69, 'Pouvoir sécuriser son site Web', 'SCT-001-01', 'Pouvoir sécuriser son site Web', 'Pouvoir sécuriser son site Web', 'Pouvoir sécuriser son site Web', 1, 1, 'auto_eval', 1),
(76, 69, 'Proposer un service en phase avec les réglementations en vigueur', 'SCT-001-02', 'Proposer un service en phase avec les réglementations en vigueur', 'Proposer un service en phase avec les réglementations en vigueur', 'Proposer un service en phase avec les réglementations en vigueur', 1, 1, 'continue', 1),
(77, 70, 'Comprendre les enjeux de l’Internet des Objets', 'IOT-001-01', 'Comprendre les enjeux de l’Internet des Objets', 'Comprendre les enjeux de l’Internet des Objets', 'Comprendre les enjeux de l’Internet des Objets', 1, 1, 'auto_eval', 1),
(78, 70, 'Découvrir Arduino et le language C', 'IOT-001-02', 'Découvrir Arduino et le language C', 'Découvrir Arduino et le language C', 'Découvrir Arduino et le language C', 1, 1, 'continue', 1),
(79, 70, 'Perfectionner sa logique algorithmique et imprimer des objets 3D avec OpenScad', 'IOT-001-03', 'Perfectionner sa logique algorithmique et imprimer des objets 3D avec OpenScad', 'Perfectionner sa logique algorithmique et imprimer des objets 3D avec OpenScad', 'Perfectionner sa logique algorithmique et imprimer des objets 3D avec OpenScad', -1, 1, 'continue', 1),
(80, 53, 'Découverte de l’environnement Simplon', 'CUL-001-01', 'Découverte de l’environnement Simplon', 'Découverte de l’environnement Simplon', 'Découverte de l’environnement Simplon', 1, 1, 'auto_eval', 1),
(81, 53, 'Présentation de la maquette et du cursus dans son ensemble', 'CUL-001-02', 'Présentation de la maquette et du cursus dans son ensemble', 'Présentation de la maquette et du cursus dans son ensemble', 'Présentation de la maquette et du cursus dans son ensemble', 1, 1, 'auto_eval', 1),
(82, 53, 'Mise en avant des méthodes et des valeurs de la formation', 'CUL-001-03', 'Mise en avant des méthodes et des valeurs de la formation', 'Mise en avant des méthodes et des valeurs de la formation', 'Mise en avant des méthodes et des valeurs de la formation', 1, 1, 'auto_eval', 1),
(83, 54, 'Avoir   une   bonne   culture   générale   du   futur   environnement   de   travail   des   apprenant.e.s', 'CUL-002-01', 'Avoir   une   bonne   culture   générale   du   futur   environnement   de   travail   des  \r\napprenant.e.s', 'Avoir   une   bonne   culture   générale   du   futur   environnement   de   travail   des   apprenant.e.s', 'Avoir   une   bonne   culture   générale   du   futur   environnement   de   travail   des   apprenant.e.s', 1, 1, 'continue', 1),
(84, 54, 'Appréhender l’environnement de travail et du numérique', 'CUL-002-02', 'Appréhender l’environnement de travail et du numérique', 'Appréhender l’environnement de travail et du numérique', 'Appréhender l’environnement de travail et du numérique', 1, 1, 'auto_eval', 1),
(85, 54, 'Attiser la curiosité et comprendre les enjeux du numérique aujourd’hui', 'CUL-002-03', 'Attiser la curiosité et comprendre les enjeux du numérique aujourd’hui', 'Attiser la curiosité et comprendre les enjeux du numérique aujourd’hui', 'Attiser la curiosité et comprendre les enjeux du numérique aujourd’hui', 1, 1, 'auto_eval', 1),
(86, 54, 'Contrôler ses données personnelles', 'CUL-002-04', 'Contrôler ses données personnelles', 'Contrôler ses données personnelles', 'Contrôler ses données personnelles', 1, 1, 'continue', 1),
(87, 55, 'Installer d’Ubuntu', 'LIN-001-01', 'Installer d’Ubuntu', 'Installer d’Ubuntu', 'Installer d’Ubuntu', 1, 1, 'continue', 1),
(88, 55, 'Découvrir et comprendre Unix', 'LIN-001-02', 'Découvrir et comprendre Unix', 'Découvrir et comprendre Unix', 'Découvrir et comprendre Unix', 1, 1, 'auto_eval', 1),
(89, 55, 'Maîtriser son environnement de travail', 'LIN-001-03', 'Maîtriser son environnement de travail', 'Maîtriser son environnement de travail', 'Maîtriser son environnement de travail', 1, 1, 'continue', 1),
(90, 58, 'Cultiver sa curiosité', 'VEIL-001-01', 'Cultiver sa curiosité', 'Cultiver sa curiosité', 'Cultiver sa curiosité', 1, 1, 'auto_eval', 1),
(91, 58, 'Rechercher et organiser des informations', 'VEIL-001-02', 'Rechercher et organiser des informations', 'Rechercher et organiser des informations', 'Rechercher et organiser des informations', 1, 1, 'continue', 1),
(92, 58, 'Organiser sa veille et maîtriser les outils utiles (Pinboard, Pocket, Feedly, etc.)', 'VEIL-001-03', 'Organiser sa veille et maîtriser les outils utiles (Pinboard, Pocket, Feedly, etc.)', 'Organiser sa veille et maîtriser les outils utiles (Pinboard, Pocket, Feedly, etc.)', 'Organiser sa veille et maîtriser les outils utiles (Pinboard, Pocket, Feedly, etc.)', 1, 1, 'auto_eval', 1),
(93, 58, 'Organiser sa veille à travers les réseaux sociaux (Hootsuite)', 'VEIL-001-04', 'Organiser sa veille à travers les réseaux sociaux (Hootsuite)', 'Organiser sa veille à travers les réseaux sociaux (Hootsuite)', 'Organiser sa veille à travers les réseaux sociaux (Hootsuite)', 1, 1, 'auto_eval', 1),
(94, 71, 'Maîtriser l’ensemble des concepts web', 'WEB2-007-01', 'Ce   framework,   extensible,  \r\npousse   vers   un   développement   structuré,   en   couches.   Différents   concepts   seront   abordés  \r\ntels   que   MVC   (Modèle­Vue­Contrôleur),   le   data­binding   bidirectionnel,   l’injection   de  \r\ndépendances, le routing et les tests.', 'Maîtriser l’ensemble des concepts web', 'Maîtriser l’ensemble des concepts web', 1, 1, 'continue', 1),
(95, 71, 'Tester son code', 'WEB2-007-02', 'Tester son code', 'Tester son code', 'Tester son code', 1, 1, 'continue', 1),
(96, 71, 'Structurer son code', 'WEB2-007-03', 'Structurer son code', 'Structurer son code', 'Structurer son code', 1, 1, 'continue', 1),
(97, 71, 'S’imposer une architecture', 'WEB2-007-04', 'S’imposer une architecture', 'S’imposer une architecture', 'S’imposer une architecture', 1, 1, 'auto_eval', 1),
(98, 72, 'Développer sa logique', 'ALGO-002-01', 'Développer sa logique', 'Développer sa logique', 'Développer sa logique', 1, 1, 'auto_eval', 1),
(99, 72, 'Comprendre et utiliser les algorithmes classiques plus avancé', 'ALGO-002-02', 'Comprendre et utiliser les algorithmes classiques plus avancé', 'Comprendre et utiliser les algorithmes classiques plus avancé', 'Comprendre et utiliser les algorithmes classiques plus avancé', 1, 1, 'continue', 1),
(100, 72, 'Créer des algorithmes plus complexes', 'ALGO-002-03', 'Créer des algorithmes plus complexes', 'Créer des algorithmes plus complexes', 'Créer des algorithmes plus complexes', 2, 1, 'continue', 1),
(101, 72, 'Comprendre les problématiques de complexité et d’optimisations.', 'ALGO-002-04', 'Comprendre les problématiques de complexité et d’optimisations.', 'Comprendre les problématiques de complexité et d’optimisations.', 'Comprendre les problématiques de complexité et d’optimisations.', 1, 1, 'ponctuelle', 1),
(102, 73, 'Représenter graphiquement les besoins des utilisateurs', 'OUT-004-01', 'Représenter graphiquement les besoins des utilisateurs', 'Représenter graphiquement les besoins des utilisateurs', 'Représenter graphiquement les besoins des utilisateurs', 1, 1, 'auto_eval', 1),
(103, 73, 'Comprendre l’approche objet et ses principes fondamentau', 'OUT-004-02', 'Comprendre l’approche objet et ses principes fondamentau', 'Comprendre l’approche objet et ses principes fondamentau', 'Comprendre l’approche objet et ses principes fondamentau', 1, 1, 'auto_eval', 1),
(104, 73, 'S’inscrire dans une démarche itérative et incrémentale', 'OUT-004-03', 'S’inscrire dans une démarche itérative et incrémentale', 'S’inscrire dans une démarche itérative et incrémentale', 'S’inscrire dans une démarche itérative et incrémentale', 1, 1, 'auto_eval', 1),
(105, 73, 'S’inscrire dans une démarche itérative et incrémentale', 'OUT-004-04', 'S’inscrire dans une démarche itérative et incrémentale', 'S’inscrire dans une démarche itérative et incrémentale', 'S’inscrire dans une démarche itérative et incrémentale', 1, 1, 'auto_eval', 1),
(106, 74, 'Apprendre un langage coté serveur', 'DEV-001-01', 'Apprendre un langage coté serveur', 'Apprendre un langage coté serveur', 'Apprendre un langage coté serveur', 1, 1, 'auto_eval', 1),
(107, 74, 'Apprendre la programmation orienté objet', 'DEV-001-02', 'Apprendre la programmation orienté objet', 'Apprendre la programmation orienté objet', 'Apprendre la programmation orienté objet', 1, 1, 'auto_eval', 1),
(108, 74, 'Réaliser des scripts à exécuter dans un terminal', 'DEV-001-03', 'Réaliser des scripts à exécuter dans un terminal', 'Réaliser des scripts à exécuter dans un terminal', 'Réaliser des scripts à exécuter dans un terminal', 1, 1, 'continue', 1),
(109, 74, 'Utiliser un gestionnaire de dépendances', 'DEV-001-04', 'Utiliser un gestionnaire de dépendances', 'Utiliser un gestionnaire de dépendances', 'Utiliser un gestionnaire de dépendances', 1, 1, 'auto_eval', 1),
(110, 74, 'Ecrire manuellement un serveur HTTP minimaliste', 'DEV-001-05', 'Ecrire manuellement un serveur HTTP minimaliste', 'Ecrire manuellement un serveur HTTP minimaliste', 'Ecrire manuellement un serveur HTTP minimaliste', 1, 1, 'continue', 1),
(111, 75, 'Apprendre à développer un site à l’aide d’un framework', 'DEV-002-01', 'Apprendre à développer un site à l’aide d’un framework', 'Apprendre à développer un site à l’aide d’un framework', 'Apprendre à développer un site à l’aide d’un framework', 1, 1, 'auto_eval', 1),
(112, 75, 'Comprendre le pattern MVC', 'DEV-002-02', 'Comprendre le pattern MVC', 'Comprendre le pattern MVC', 'Comprendre le pattern MVC', 1, 1, 'auto_eval', 1),
(113, 75, 'Comprendre la compilation des assets', 'DEV-002-03', 'Comprendre la compilation des assets', 'Comprendre la compilation des assets', 'Comprendre la compilation des assets', 1, 1, 'auto_eval', 1),
(114, 75, 'Comprendre l’intérêt d’un ORM', 'DEV-002-04', 'Comprendre l’intérêt d’un ORM', 'Comprendre l’intérêt d’un ORM', 'Comprendre l’intérêt d’un ORM', 1, 1, 'continue', 1),
(115, 75, 'Comprendre différents design pattern (helper, concern...)', 'DEV-002-05', 'Comprendre différents design pattern (helper, concern...)', 'Comprendre différents design pattern (helper, concern...)', 'Comprendre différents design pattern (helper, concern...)', 1, 1, 'continue', 1),
(116, 75, 'Sécuriser une application avec de l’authentification et de l’autorisation', 'DEV-002-06', 'Sécuriser une application avec de l’authentification et de l’autorisation', 'Sécuriser une application avec de l’authentification et de l’autorisation', 'Sécuriser une application avec de l’authentification et de l’autorisation', 1, 1, 'auto_eval', 1),
(117, 76, 'Créer une base de données avec ses tables', 'BDD-001-01', 'Créer une base de données avec ses tables', 'Créer une base de données avec ses tables', 'Créer une base de données avec ses tables', 1, 1, 'auto_eval', 1),
(118, 76, 'Insérer, modifier, supprimer et requêter des données', 'BDD-001-02', 'Insérer, modifier, supprimer et requêter des données', 'Insérer, modifier, supprimer et requêter des données', 'Insérer, modifier, supprimer et requêter des données', 1, 1, 'auto_eval', 1),
(119, 76, 'Effectuer des jointures de données', 'BDD-001-03', 'Effectuer des jointures de données', 'Effectuer des jointures de données', 'Effectuer des jointures de données', 1, 1, 'auto_eval', 1),
(120, 76, 'Comprendre les index et les questions de performance', 'BDD-001-04', 'Comprendre les index et les questions de performance', 'Comprendre les index et les questions de performance', 'Comprendre les index et les questions de performance', 1, 1, 'auto_eval', 1),
(121, 77, 'Cerner les grands principes des systèmes NoSQL', 'BDD-02-01', 'Cerner les grands principes des systèmes NoSQL', 'Cerner les grands principes des systèmes NoSQL', 'Cerner les grands principes des systèmes NoSQL', 1, 1, 'auto_eval', 1),
(122, 77, 'Comprendre la typologie des bases de données NoSQL', 'BDD-02-02', 'Comprendre la typologie des bases de données NoSQL', 'Comprendre la typologie des bases de données NoSQL', 'Comprendre la typologie des bases de données NoSQL', 1, 1, 'continue', 1),
(123, 77, 'Introduire quelques systèmes NoSQL', 'BDD-02-03', 'Introduire quelques systèmes NoSQL', 'Introduire quelques systèmes NoSQL', 'Introduire quelques systèmes NoSQL', 1, 1, 'continue', 1),
(124, 77, 'Découvrir   les   fondements   de   ces   systèmes   :   Sharding,   Consistent   hashing,   MapReduce, MVCC,  Vector ­ clock', 'BDD-02-04', 'Découvrir   les   fondements   de   ces   systèmes   :   Sharding,   Consistent   hashing,  \r\nMapReduce, MVCC,  Vector ­ clock', 'Découvrir   les   fondements   de   ces   systèmes   :   Sharding,   Consistent   hashing,   MapReduce, MVCC,  Vector ­ clock', 'Découvrir   les   fondements   de   ces   systèmes   :   Sharding,   Consistent   hashing,   MapReduce, MVCC,  Vector ­ clock', 1, 1, 'auto_eval', 1),
(125, 78, 'Comprendre la notion d’environnement', 'OUT-005-01', 'Comprendre la notion d’environnement', 'Comprendre la notion d’environnement', 'Comprendre la notion d’environnement', 1, 1, 'continue', 1),
(126, 78, 'Configurer un reverse proxy avec Nginx ou Apache2', 'OUT-005-02', 'Configurer un reverse proxy avec Nginx ou Apache2', 'Configurer un reverse proxy avec Nginx ou Apache2', 'Configurer un reverse proxy avec Nginx ou Apache2', 1, 1, 'continue', 1),
(127, 78, 'Configurer les zones DNS', 'OUT-005-03', 'Configurer les zones DNS', 'Configurer les zones DNS', 'Configurer les zones DNS', 1, 1, 'continue', 1),
(128, 78, 'Travailler sur un serveur distant avec SSH', 'OUT-005-04', 'Travailler sur un serveur distant avec SSH', 'Travailler sur un serveur distant avec SSH', 'Travailler sur un serveur distant avec SSH', 1, 1, 'continue', 1),
(129, 78, 'Comprendre le cloud', 'OUT-005-05', 'Comprendre le cloud', 'Comprendre le cloud', 'Comprendre le cloud', 1, 1, 'continue', 1),
(130, 78, 'Mettre en production une application Web', 'OUT-005-06', 'Mettre en production une application Web', 'Mettre en production une application Web', 'Mettre en production une application Web', 1, 1, 'continue', 1),
(131, 79, 'Écrire des tests unitaires', 'DEV-003-01', 'Écrire des tests unitaires', 'Écrire des tests unitaires', 'Écrire des tests unitaires', 1, 1, 'continue', 1),
(132, 79, 'Écrire une démo Given When Then (GWT)', 'DEV-003-02', 'Écrire une démo Given When Then (GWT)', 'Écrire une démo Given When Then (GWT)', 'Écrire une démo Given When Then (GWT)', 1, 1, 'auto_eval', 1),
(133, 79, 'Écrire un test d’intégration répondant à une démo GWT', 'DEV-003-03', 'Écrire un test d’intégration répondant à une démo GWT', 'Écrire un test d’intégration répondant à une démo GWT', 'Écrire un test d’intégration répondant à une démo GWT', 1, 1, 'auto_eval', 1),
(134, 79, 'Être capable de constater le bon fonctionnement d’une fonctionnalité', 'DEV-003-04', 'Être capable de constater le bon fonctionnement d’une fonctionnalité', 'Être capable de constater le bon fonctionnement d’une fonctionnalité', 'Être capable de constater le bon fonctionnement d’une fonctionnalité', 1, 1, 'auto_eval', 1),
(135, 80, 'Comprendre les problèmes de l’injection SQL, les failles XSS, etc.', 'SCT-002-01', 'Comprendre les problèmes de l’injection SQL, les failles XSS, etc.', 'Comprendre les problèmes de l’injection SQL, les failles XSS, etc.', 'Comprendre les problèmes de l’injection SQL, les failles XSS, etc.', 1, 1, 'continue', 1),
(136, 81, 'Structurer ses idées et les rendre captivantes', 'OUT-006-01', 'Structurer ses idées et les rendre captivantes', 'Structurer ses idées et les rendre captivantes', 'Structurer ses idées et les rendre captivantes', 1, 1, 'auto_eval', 1),
(137, 81, 'Préparer une présentation', 'OUT-006-02', 'Préparer une présentation', 'Préparer une présentation', 'Préparer une présentation', 1, 1, 'auto_eval', 1),
(138, 81, 'Designer une présentation', 'OUT-006-03', 'Designer une présentation', 'Designer une présentation', 'Designer une présentation', 1, 1, 'auto_eval', 1),
(139, 81, 'Maîtriser divers outils de création de présentation (Prezi, Impress.js, Reveal.js)', 'OUT-006-04', 'Maîtriser divers outils de création de présentation (Prezi, Impress.js, Reveal.js)', 'Maîtriser divers outils de création de présentation (Prezi, Impress.js, Reveal.js)', 'Maîtriser divers outils de création de présentation (Prezi, Impress.js, Reveal.js)', 1, 1, 'auto_eval', 1),
(140, 82, 'Installer WordPress chez un hébergeur/sur un serveur', 'WDP-001-01', 'Installer WordPress chez un hébergeur/sur un serveur', 'Installer WordPress chez un hébergeur/sur un serveur', 'Installer WordPress chez un hébergeur/sur un serveur', 1, 1, 'auto_eval', 1),
(141, 82, 'Administrer un site', 'WDP-001-02', 'Administrer un site', 'Administrer un site', 'Administrer un site', 1, 1, 'auto_eval', 1),
(142, 82, 'Maîtriser   les   fonctionnalités   essentielles   (gestion   d''articles,   de   pages,   de   menus,   mise en forme du contenu et gestion des médias, gestion des commentaires, etc.)', 'WDP-001-03', 'Maîtriser   les   fonctionnalités   essentielles   (gestion   d''articles,   de   pages,   de   menus,  \r\nmise en forme du contenu et gestion des médias, gestion des commentaires, etc.)', 'Maîtriser   les   fonctionnalités   essentielles   (gestion   d''articles,   de   pages,   de   menus,   mise en forme du contenu et gestion des médias, gestion des commentaires, etc.)', 'Maîtriser   les   fonctionnalités   essentielles   (gestion   d''articles,   de   pages,   de   menus,   mise en forme du contenu et gestion des médias, gestion des commentaires, etc.)', 1, 1, 'continue', 1),
(143, 82, 'Ajouter et gérer des extentions', 'WDP-001-04', 'Ajouter et gérer des extentions', 'Ajouter et gérer des extentions', 'Ajouter et gérer des extentions', 1, 1, 'continue', 1),
(144, 82, 'Personnaliser un thème existant', 'WDP-001-05', 'Personnaliser un thème existant', 'Personnaliser un thème existant', 'Personnaliser un thème existant', 1, 1, 'auto_eval', 1),
(145, 82, 'Créer et modifier un thème', 'WDP-001-06', 'Créer et modifier un thème', 'Créer et modifier un thème', 'Créer et modifier un thème', 1, 1, 'auto_eval', 1),
(146, 82, 'Créer des contenus personnalisés', 'WDP-001-07', 'Créer des contenus personnalisés', 'Créer des contenus personnalisés', 'Créer des contenus personnalisés', 1, 1, 'auto_eval', 1),
(147, 82, 'Utiliser les champs personnalisés', 'WDP-001-08', 'Utiliser les champs personnalisés', 'Utiliser les champs personnalisés', 'Utiliser les champs personnalisés', 1, 1, 'auto_eval', 1),
(148, 82, 'Créer des extensions / plugins (avec PHP et MySQL)', 'WDP-001-09', 'Créer des extensions / plugins (avec PHP et MySQL)', 'Créer des extensions / plugins (avec PHP et MySQL)', 'Créer des extensions / plugins (avec PHP et MySQL)', 1, 1, 'continue', 1),
(149, 83, 'Maîtriser les bases de PHP et SQL', 'PMS-001-01', 'Maîtriser les bases de PHP et SQL', 'Maîtriser les bases de PHP et SQL', 'Maîtriser les bases de PHP et SQL', 1, 1, 'auto_eval', 1),
(150, 83, 'Utiliser à bon escient ces langages', 'PMS-001-02', 'Utiliser à bon escient ces langages', 'Utiliser à bon escient ces langages', 'Utiliser à bon escient ces langages', 1, 1, 'auto_eval', 1),
(151, 83, 'Administrer une base de données avec PHPMyAdmin', 'PMS-001-03', 'Administrer une base de données avec PHPMyAdmin', 'Administrer une base de données avec PHPMyAdmin', 'Administrer une base de données avec PHPMyAdmin', 1, 1, 'auto_eval', 1),
(152, 83, 'Créer des extensions / plugins pour WordPress', 'PMS-001-04', 'Créer des extensions / plugins pour WordPress', 'Créer des extensions / plugins pour WordPress', 'Créer des extensions / plugins pour WordPress', 1, 1, 'continue', 1),
(153, 84, 'Travailler en équipe', 'WDP-002-01', 'Travailler en équipe', 'Travailler en équipe', 'Travailler en équipe', 1, 1, 'auto_eval', 1),
(154, 84, 'Gérer un projet de A à Z', 'WDP-002-02', 'Gérer un projet de A à Z', 'Gérer un projet de A à Z', 'Gérer un projet de A à Z', 1, 1, 'auto_eval', 1),
(155, 84, 'Planifier et organiser les tâches', 'WDP-002-03', 'Planifier et organiser les tâches', 'Planifier et organiser les tâches', 'Planifier et organiser les tâches', 1, 1, 'auto_eval', 1),
(156, 84, 'Gérer les imprévus', 'WDP-002-04', 'Gérer les imprévus', 'Gérer les imprévus', 'Gérer les imprévus', 1, 1, 'auto_eval', 1),
(157, 84, 'Créer un site complexe avec WordPress', 'WDP-002-05', 'Créer un site complexe avec WordPress', 'Créer un site complexe avec WordPress', 'Créer un site complexe avec WordPress', 1, 1, 'auto_eval', 1),
(158, 85, 'Administrer un site e­commerce', 'ECM-001-01', 'Administrer un site e­commerce', 'Administrer un site e­commerce', 'Administrer un site e­commerce', 1, 1, 'continue', 1),
(159, 85, 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce', 'ECM-001-02', 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce   (gestion   des   produits,  \r\ndes modes livraison, des paiements, des ventes, etc.)', 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce', 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce', 1, 1, 'auto_eval', 1),
(160, 85, 'Personnaliser un thème', 'ECM-001-03', 'Personnaliser un thème', 'Personnaliser un thème', 'Personnaliser un thème', 1, 1, 'auto_eval', 1),
(161, 86, 'Acquérir une culture design', 'OUT-007-01', 'Acquérir une culture design', 'Acquérir une culture design', 'Acquérir une culture design', 1, 1, 'auto_eval', 1),
(162, 86, 'Maîtriser les fondements et les outils essentiels de Pixlr', 'OUT-007-02', 'Maîtriser les fondements et les outils essentiels de Pixlr', 'Maîtriser les fondements et les outils essentiels de Pixlr', 'Maîtriser les fondements et les outils essentiels de Pixlr', 1, 1, 'auto_eval', 1),
(163, 87, 'Créer et gérer une campagne d''e­mailing', 'NWL-001-01', 'Créer et gérer une campagne d''e­mailing', 'Créer et gérer une campagne d''e­mailing', 'Créer et gérer une campagne d''e­mailing', 1, 1, 'auto_eval', 1),
(164, 87, 'Intégrer une newsletter', 'NWL-001-02', 'Intégrer une newsletter', 'Intégrer une newsletter', 'Intégrer une newsletter', 1, 1, 'auto_eval', 1),
(165, 87, 'Maîtriser des outils d''e­mailing', 'NWL-001-03', 'Maîtriser des outils d''e­mailing (Mailchimp)', 'Maîtriser des outils d''e­mailing (Mailchimp)', 'Maîtriser des outils d''e­mailing (Mailchimp)', 1, 1, 'auto_eval', 1),
(166, 87, 'Lier un outil d''e­mailing à WordPress', 'NWL-001-04', 'Lier un outil d''e­mailing à WordPress (Mailchimp)', 'Lier un outil d''e­mailing à WordPress', 'Lier un outil d''e­mailing à WordPress', 1, 1, 'auto_eval', 1),
(167, 88, 'Comprendre ce qu''est une API et apprendre à s''en servir à bon escient', 'OUT-008-01', 'Comprendre ce qu''est une API et apprendre à s''en servir à bon escient', 'Comprendre ce qu''est une API et apprendre à s''en servir à bon escient', 'Comprendre ce qu''est une API et apprendre à s''en servir à bon escient', 1, 1, 'auto_eval', 1),
(168, 88, 'Mettre en place un workflow', 'OUT-008-02', 'Mettre en place un workflow', 'Mettre en place un workflow', 'Mettre en place un workflow', 1, 1, 'continue', 1),
(169, 88, 'Automatiser certaines tâches', 'OUT-008-03', 'Automatiser certaines tâches', 'Automatiser certaines tâches', 'Automatiser certaines tâches', 1, 1, 'auto_eval', 1),
(170, 88, 'Maîtriser des outils d''automatisation de tâches (Zapier, IFTTT)', 'OUT-008-04', 'Maîtriser des outils d''automatisation de tâches (Zapier, IFTTT)', 'Maîtriser des outils d''automatisation de tâches (Zapier, IFTTT)', 'Maîtriser des outils d''automatisation de tâches (Zapier, IFTTT)', 1, 1, 'auto_eval', 1),
(171, 89, 'S''initier au wireframing', 'WFN-001-01', 'S''initier au wireframing', 'S''initier au wireframing', 'S''initier au wireframing', 1, 1, 'auto_eval', 1),
(172, 89, 'Créer une maquette', 'WFN-001-02', 'Créer une maquette', 'Créer une maquette', 'Créer une maquette', 1, 1, 'continue', 1),
(173, 89, 'Maîtriser des outils de wireframing (Balsamiq)', 'WFN-001-03', 'Maîtriser des outils de wireframing (Balsamiq)', 'Maîtriser des outils de wireframing (Balsamiq)', 'Maîtriser des outils de wireframing (Balsamiq)', 1, 1, 'ponctuelle', 1),
(174, 90, 'Découvrir un nouvel outil de création', 'BBS-001-01', 'Découvrir un nouvel outil de création', 'Découvrir un nouvel outil de création', 'Découvrir un nouvel outil de création', 1, 1, 'auto_eval', 1),
(175, 90, 'Améliorer sa logique de développement', 'BBS-001-02', 'Améliorer sa logique de développement', 'Améliorer sa logique de développement', 'Améliorer sa logique de développement', 1, 1, 'auto_eval', 1),
(176, 91, 'Pouvoir sensibiliser un groupe de personnes à la sécurité informatique', 'SCT-003-01', 'Pouvoir sensibiliser un groupe de personnes à la sécurité informatique', 'Pouvoir sensibiliser un groupe de personnes à la sécurité informatique', 'Pouvoir sensibiliser un groupe de personnes à la sécurité informatique', 1, 1, 'auto_eval', 1),
(177, 91, 'Donner les grands principes de sécurité personnelle', 'SCT-003-02', 'Donner les grands principes de sécurité personnelle', 'Donner les grands principes de sécurité personnelle', 'Donner les grands principes de sécurité personnelle', 1, 1, 'auto_eval', 1),
(178, 91, 'Transmettre les outils et bonnes pratiques', 'SCT-003-03', 'Transmettre les outils et bonnes pratiques', 'Transmettre les outils et bonnes pratiques', 'Transmettre les outils et bonnes pratiques', 1, 1, 'auto_eval', 1),
(179, 92, 'Travailler en équipe', 'PF-001-01', 'Travailler en équipe', 'Travailler en équipe', 'Travailler en équipe', 1, 1, 'auto_eval', 1),
(180, 92, 'Gérer un projet de A à Z', 'PF-001-02', 'Gérer un projet de A à Z', 'Gérer un projet de A à Z', 'Gérer un projet de A à Z', 1, 1, 'auto_eval', 1),
(181, 92, 'Planifier et organiser les tâches', 'PF-001-03', 'Planifier et organiser les tâches', 'Planifier et organiser les tâches', 'Planifier et organiser les tâches', 1, 1, 'continue', 1),
(182, 92, 'Gérer les imprévus', 'PF-001-04', 'Gérer les imprévus', 'Gérer les imprévus', 'Gérer les imprévus', 1, 1, 'auto_eval', 1),
(183, 92, 'Gérer plusieurs projets simultanément', 'PF-001-05', 'Gérer plusieurs projets simultanément', 'Gérer plusieurs projets simultanément', 'Gérer plusieurs projets simultanément', 1, 1, 'continue', 1),
(184, 93, 'Découverte de l''XML', 'WEB-XML-01', 'Découverte de l''XML.\r\n\r\nAfin qu''ils comprennent l''utilisation de l''XML, le formateur doit présenter diverses structures existantes. Par exemple un fichier kml agrémenté de http://display-kml.appspot.com/', 'Apprendre à lire de la documentation', 'Lecture et compréhension', 2, 0, 'auto_eval', 1),
(185, 93, 'Définition du DTD d''un CV', 'WEB-XML-02', 'Par groupes de 4, les apprenants définissent un DTD commun pour leurs CV.', 'Gestion de projet', 'Travail en équipe, Définition de spécifications', 4, 0, 'auto_eval', 1),
(186, 93, 'Rédaction d''un CV en XML / CSS', 'WEB-XML-03', 'Une fois que vous aurez défini votre XML et une première structure XML, validez le avec votre DTD.', 'Rédaction d''un CV', 'Rédaction d''un fichier XML + CSS', 4, 0, 'auto_eval', 1),
(187, 93, 'Rédaction d''un XSLT pour exporter le CV en HTML', 'WEB-XML-04', 'Manipulez le XSLT afin d''avoir un rendu HTML de votre XML. \r\n						Vous pouvez également utiliser le XSLT pour exporter vers un autre XML (ayant un autre DTD)!', 'Compréhension de l’interet du respect du DTD', 'Rédaction d''un fichier XSLT', 4, 0, 'auto_eval', 1),
(188, 94, 'Cours Théorique sur le HTML', 'WEB-HTML-01', 'Structure HTML : HEAD / BODY/ Footer\r\n							Le Doctype et le DTD associé\r\n							La balise meta\r\n							-- http://www.alsacreations.com/article/lire/628-balises-meta.html#incontournables\r\n							Les balises principales HTML\r\n							-- http://www.w3schools.com/tags/default.asp</', 'Cours', 'Ecoute', 1, 1, 'continue', 1),
(189, 94, 'Projet : Pastime', 'WEB-HTML-02', 'https://github.com/ErwannFace/Challenge_2', 'Assistance', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(190, 94, 'Projet Origami', 'WEB-HTML-03', 'http://prod.simplon.co/divers/challenges/briefing-challenge-2.zip', 'Assistance', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(191, 94, 'Projet : No images', 'WEB-HTML-04', '>Continuez les projets initiés lors de la prairie. Mêmes équipes mais scindés en deux sous groupes, voire 3 pour le groupe de 6.', 'Assistance', 'Prise de conscience de l''importance de specs', 4, 0, 'auto_eval', 1),
(192, 94, 'Projet : Divs à gogo', 'WEB-HTML-05', 'Reproduisez, sur un site la page suivante : http://simplonline.co/uploads/images/Front_End/zuliegarnier/exoDivs.jpg', 'Prise de conscience de l''importance de s''organiser avant de coder', 'Manipulation de divs', 4, 0, 'auto_eval', 1),
(193, 94, 'Créer un formulaire Web', 'WEB-HTML-06', 'Créez un formulaire contenant au minimum: \r\n						- Un champ nom\r\n						- Un champ prénom\r\n						- Un champ mail\r\n						- Un champ de type liste de choix\r\n						- Un champ description', 'Découverte des formulaires', 'Découverte des formulaires', 4, 0, 'auto_eval', 1),
(194, 94, 'Challenge du Mercredi', 'WEB-HTML-07', 'Chaque mercredi, un challenge est donné aux apprenants. Ce dernier est assigné à des binomes. Et est à rendre pour le mardi suivant.\r\n\r\n						https://github.com/ErwannFace/Challenge_1\r\n						https://github.com/ErwannFace/Challenge_2\r\n						https://github.com/ErwannFace/Challenge_4', 'Apprentissage du HTML+CSS', 'Travailler en équipe', 4, 0, 'auto_eval', 1),
(195, 95, 'Projet: Faites une fiche résumé de Bootstrap', 'WEB-CSS-03', 'En suivant des phases de pomodoro:\r\n						Exercice 1 : Réalisez un fichier HTML récapitulatif des divers éléments proposés par bootstrap\r\n						Exercice 2 : http://www.pairuptocode.com/exercises/bootstrap.html', 'Apprendre à lire de la documentation', 'Découverte du framework bootstrap', 4, 0, 'auto_eval', 1),
(196, 94, 'Apprentissage du CSS3', 'WEB-CSS-01', 'http://fr.learnlayout.com/', 'Apprendre à lire de la documentation', 'Lecture, Code et compréhension', 2, 0, 'auto_eval', 1),
(197, 94, 'Cours théorique CSS: Selecteurs et pseudo classes', 'WEB-CSS-02', 'Cours réalisé en parcourant la documentation w3school et alsacreation', 'Cours', 'Ecoute', 1, 1, 'auto_eval', 1),
(198, 95, 'Projet : Divs à gogo - bootstrap', 'WEB-CSS-04', 'Après avoir lu la documentation bootstrap. Essayez de refaire les divs à gogo.', 'Compréhension de l''utilité de bootstrap', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(199, 96, 'Initiation au WireFraming', 'GES-01-01', 'http://simplonline.co/ressources/ress-methodo/104-les-bonnes-pratiques-mockups-et-rough\r\n\r\n						https://www.mockflow.com/\r\n\r\n						https://cacoo.com/lang/en/home', 'Organisation', 'Découverte du wireframe', 4, 0, 'auto_eval', 1),
(200, 97, 'Découverte de la méthode pomodoro', 'GES-02-01', 'Lecture du site : http://pomodorotechnique.com/', 'Estimer son temps', 'Découverte de la méthode pomodoro', 1, 0, 'auto_eval', 1);
INSERT INTO `ActiviteDeFormation` (`id`, `sequenceId`, `intitule`, `code`, `description`, `objectifFormateur`, `objectifApprenant`, `temps`, `demarche`, `evaluation`, `pos`) VALUES
(201, 97, 'Pratique de pomodoro', 'GES-02-02', 'Utilisez la méthode de pomodorro deux fois d''affilée, afin de réaliser qu''on ne réaliser pa la même quantité de travail chaque fois. Qu''il est nécessaire de le pratiuqer régulièrement afin de pouvoir voir un véritable aperçu du temps véritablement nécessaire pour un développement.', 'Pratique de pomodoro', 'Pratique de pomodoro', 2, 0, 'auto_eval', 1),
(202, 98, 'Pose toi une question', 'CUL-01-01', 'Chaque semaine les apprenants définissent des thématiques à rechercher.\r\n						Chaque semaine, un apprenant sélectionné au hasard présente son axe de recherche', 'Titiller la curiosité', 'Se poser une question. Puis y répondre.', 1, 0, 'auto_eval', 1),
(203, 99, 'Exposés sur les personnages célèbres de l''informatique', 'CUL-02-01', 'Réalisez de recherches sur l''un des personnages suivants pendant 2 heures en groupes de 5 personnes. Vous devrez par la suite réaliser une présentation de ces personnes et de leurs travaux. L''idée n''étant pas de raconter leurs vies privées mais plutôt d''investiguer leurs créations. \r\n						Linus Torvalds\r\n						Aaron Swartz\r\n    					Vint Cerf\r\n    					Bill Gates\r\n    					Steve Jobs\r\n    					Larry Page\r\n    					Tim Berners-Lee\r\n    					Richard Stallman', 'S''exprimer face au public', 'Recherche et exposé', 4, 0, 'auto_eval', 1),
(204, 99, 'Exposés sur diverses thématiques actuelles', 'CUL-02-02', 'Divers sujets ont été abordés dans les journaux dernièrement. Choisissez un sujet vous interessant. Dans 3 jours, vous aurez 5 à 10 minutes par groupes pour présenter le sujet. Sujets possibles à aborder :\r\n						1) La loi de Turing et intelligence artificielle\r\n						2) La polémique londonienne sur la tenue des femmes au travail (une histoire de talon)\r\n						3) Les emojiis et le consortium qui les valident\r\n						4) Wi-fi et super Wi-fi\r\n						5) HD, UHD, UHD HDR... Un petit point sur le fonctionnement et la résolution des écrans\r\n						6) kilooctets, megaoctets, gigaoctets, teraoctets... Un petit rappel sur les tailles des fichiers et une présentation des mesures utilisées pour le BIG DATA', 'S''exprimer face au public', 'Recherche et exposé', 4, 0, 'auto_eval', 1),
(205, 99, 'Les règles existantes dans le graphisme', 'CUL-02-03', 'Les apprenants ayant des bases en graphisme présentent leurs savoir aux autres apprenants', 'Partage de connaissances', 'Partage de connaissances', 2, 0, 'auto_eval', 1),
(206, 101, 'Approfondissement de GIT', 'OUT-GIT-01', '1) Réaliser une gitpage\r\n						2) Approfondir git avec https://github.com/git-tips/tips\r\n						3) http://jnthn.net/training/git/exercises.pdf\r\n						4) http://gitimmersion.com/', 'Meilleur compréhension de GIT', 'Ecoute , Partage', 4, 0, 'auto_eval', 1),
(207, 102, 'Découverte du référencement', 'CUL-03-01', 'Présentation des apprenants sur le référencement. Et les outils existants', 'Prise de conscience du SEO', 'Découverte du référencement.', 1, 1, 'auto_eval', 1),
(208, 103, 'Comment rédiger un CV', 'INS-PRO-01', 'Comment rédiger un CV', 'Comment rédiger un CV', 'Comment rédiger un CV', 8, 1, 'auto_eval', 1),
(209, 103, 'Comment rédiger une LM', 'INS-PRO-02', 'Comment rédiger une LM', 'Comment rédiger une LM', 'Comment rédiger une LM', 8, 1, 'continue', 1),
(210, 104, 'Programmer avec les fondamentaux du JavaScript', 'WEB-JS-01', 'https://openclassrooms.com/courses/dynamisez-vos-sites-web-avec-javascript/introduction-au-javascript\r\n\r\nExercices associés :\r\nhttps://github.com/ErwannFace/JS_Exercice-01\r\nhttps://github.com/ErwannFace/JS_Exercice-01-Bonus\r\nhttp://www.grappa.univ-lille3.fr/~torre/Enseignement/TPs/JavaScript/', 'Découverte du langage', 'Lecture, Code et compréhension', 16, 0, 'auto_eval', 1),
(211, 104, 'Approfondir les fondamentaux du JavaScript', 'WEB-JS-02', 'https://github.com/ErwannFace/JS_Exercice-02\r\nhttps://github.com/ErwannFace/JS_Exercice-03					\r\nVideo explicative : https://www.grafikart.fr/tutoriels/javascript/sommaire-dynamique-667', 'Approfondir le JS', 'Lecture, Code et compréhension', 16, 0, 'auto_eval', 1),
(212, 104, 'Projet Cookie clicker', 'WEB-JS-03', 'Challenge à réaliser en solo : http://simplonline.co/ressources/19-defis/147-exercice-du-cookie-clicker', 'Intégrer du JS dans une page web', 'Lecture, Code et compréhension', 2, 0, 'ponctuelle', 1),
(213, 105, 'Code Combat', 'GES-03-01', 'http://simplonline.co/ressources/ress-culturegeek/220-comment-expliquer-la-programmation-aux-enfants', 'Représentation de la promo', 'Apprendre à parler code avec des enfants', 16, 0, 'auto_eval', 1),
(214, 106, 'Brainstorming sur le droit à l''informatique', 'CUL-04-01', 'Brainstorming sur le droit à l''informatique', 'Brainstorming', 'Echanges', 1, 1, 'auto_eval', 1),
(215, 104, 'Amusement park in Algobox', 'ALGO-01-01', 'Sur Algobox : \r\nhttp://www.methodemaths.fr/exoalgo/#partiedecimale', 'Apprentissage de l''algo', 'Initiation à l''algo', 4, 0, 'auto_eval', 1),
(216, 104, 'Pratiquer l''algorithmie', 'ALGO-01-02', 'Avec uniquement un papier et un crayon, réaliser les algorithmes suivants : \r\n						- Plus Grand / Plus Petit\r\n						- Convertir une heure du AM/PM format au format militaire sur 24h. Sachant que 12AM = 12h00 et 12PM = 0h00\r\n						- Créer une fonction réalisant la somme de N chiffres\r\n						- Créer une fonction trouvant le plus petit élément d''un tableau', 'Disense les exercices', 'Travail sa logique', 4, 0, 'auto_eval', 1),
(217, 104, 'Approfondir l''algo avec le JS', 'WEB-JS-04', 'L''algorithmie est une logique difficile à acquérir. Afin de pouvoir le comprendre il est nécessaire de beuacoup le pratiquer. \r\n\r\nCette activité a donc pour but de faire faire de nombreux exercices.', 'Corrections ponctuelles', 'Travaille sa logique', 8, 0, 'auto_eval', 1),
(218, 108, 'Projet Profesionel', 'GES-04-', 'Des vrais clients réalisent une demande à FACE pour implémenter leurs sites web. \r\n\r\nCes sites accompagnent les apprenants tout au long de leurs apprentissage. Dès le début.', 'Implication et compréhension de la nécessité de rigueur', 'Lecture, Code et compréhension', 150, 0, 'continue', 1),
(219, 104, 'Initiation à jQuery', 'WEB-JS-05', 'Lecture de la documentation de jQuery\r\n\r\nVideo Initiation à JQuery	\r\nVideo La méthode pour manipuler les attributs HTML avec le Framework jQuery\r\nVideo JQuery : Centrer une div', 'N/A', 'Lecture, Code et compréhension', 1, 0, 'auto_eval', 1),
(220, 104, 'Concevoir une application Pomodoro en jQuery', 'WEB-JS-06', 'Exercices_JQuery_Pomodoro', 'N/A', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(221, 104, 'Concevoir une application Tic Tac Toe en jQuery', 'WEB-JS-07', 'sur github ErwannFace : Exercices_JQuery_tic-tac-toe', 'N/A', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(222, 104, 'Cours théoriqe : la POO', 'WEB-JS-08', 'Cours rédigé par Erwann.', 'Cours', 'Ecoute et échange', 1, 1, 'continue', 1),
(223, 104, 'Projet Anagram / Pangram', 'WEB-JS-09', 'Sur le compte git d''ErwannFace', 'Recherche de logique', 'Perfectionner sa logique algorithmique', 2, 0, 'auto_eval', 1),
(224, 104, 'Projet : Bruteforce', 'WEB-JS-10', 'Sur le compte github d''ErwannFace', 'Chercher et comprendre la documentation soit meme', 'Lecture, Code et compréhension', 2, 0, 'auto_eval', 1),
(225, 109, 'Intervention sur l''UI/UX', 'CUL-05-01', 'Intervention d''Annaelle sur l''UI / UX. Un exercice papier est réalisé. Où les apprenants doivent répondre à diverses questions à se poser en amont d''une la mise en place du site.', 'Comprendre l''importance de la réflexion en amont', 'Se poser des questions', 2, 0, 'auto_eval', 1),
(226, 110, 'L''importance de LinkedIn et Twitter', 'INS-INT-01', 'Intervention de F. Letourneur.\r\n\r\nL''importance de LinkedIn et Twitter', 'Cours', 'Ecoute et partage', 2, 1, 'auto_eval', 1),
(227, 103, 'Comment réaliser son entretien d''embauche', 'INS-PRO-03', 'Comment réaliser son entretien d''embauche', 'N/A', 'N/A', 8, 1, 'auto_eval', 1),
(228, 111, 'Recherches sur les specs fonctionelles', 'GES-05-01', 'Réaliser des recherches sur internet, afin de voir les critères indispensables à présenter au sein de specs fonctionelles', 'N/A', 'Lecture et compréhension', 4, 0, 'auto_eval', 1),
(229, 111, 'Différencier une spec fonctionelle et technique', 'GES-05-02', 'Différencier une spec fonctionelle et technique', 'N/A', 'Lecture et compréhension', 2, 0, 'auto_eval', 1),
(230, 112, 'Brainstorming sur les sites de veille', 'VEI-01-01', 'Brainstorming sur les sites de veille', 'Brainstorming', 'Echanges', 1, 0, 'auto_eval', 1),
(231, 112, 'Organisation de sa veille', 'VEI-01-02', 'Définition de dashboards via feedly, hootsuite ou encore usepanda', 'Assistance', 'Découverte et pratique', 3, 0, 'auto_eval', 1),
(232, 113, 'Installation d''un AS', 'WEB-CMS-01', 'Au choix, les apprenants décident d''installer apache ou nginx', 'N/A', 'Apprendre à lire des fichiers de conf', 1, 0, 'auto_eval', 1),
(233, 113, 'Installation de wordpress', 'WEB-CMS-02', 'Les apprenants découvrent par eux même comment installer Wordpress', 'N/A', 'Lecture et compréhension', 3, 0, 'auto_eval', 1),
(234, 113, 'Découverte de Wordpress', 'WEB-CMS-03', 'Faites un site qui vous tient à coeur. Type blog', 'N/A', 'Lecture et compréhension', 4, 0, 'auto_eval', 1),
(235, 114, 'Hello World', 'WEB-PHP-01', 'https://github.com/simplonco/php-hello-world', 'Découverte du langage', 'Lecture, Code et compréhension', 2, 0, 'auto_eval', 1),
(236, 114, 'Introduction au PHP', 'WEB-PHP-02', 'https://github.com/simplonco/php-introduction', 'N/A', 'Lecture, Code et compréhension', 8, 0, 'auto_eval', 1),
(237, 114, 'Lire et parcourir des données en PHP', 'WEB-PHP-03', 'Par le biais de divers exercices l''apprenants apprends :\r\n - La lecture de fichier\r\n - La manipulation de données\r\n - L''algorithmie\r\n\r\nhttps://github.com/simplonco/php-cooking-data', 'N/A', 'Lecture, Code et compréhension', 8, 0, 'auto_eval', 1),
(238, 114, 'Activité Pair programming : Le pangram', 'WEB-PHP-04', '1) https://github.com/simplonco/php-pangram', 'Travailler en équipe', 'Comprendre la logique', 2, 0, 'auto_eval', 1),
(239, 114, 'Challenge du Mercredi', 'WEB-PHP-05', '1 - https://github.com/simplonco/php-gigasecond\r\n2 - https://github.com/simplonco/portfolio/', 'N/A', 'Lecture, Code et compréhension', 8, 0, 'auto_eval', 1),
(240, 98, 'Découverte d''une techno de son choix', 'CUL-01-02', 'Pendant les vacances, choisissez un framework ou une bibliothèque. Si vous manquez d''inspiration, recherchez des offres d''emploi. \r\n\r\nPuis lisez la documentation associée , et réalisez un premier projet. \r\nLors de votre retour en classe, vous devrez être capable d''en parler , et d''expliquer à quoi elle sert et comment on peut l''utiliser.', 'Inciter à la curiosité', 'Lecture, Code et compréhension', 1, 0, 'auto_eval', 1),
(241, 114, 'Envoi d''email via formulaire', 'WEB-PHP-06', 'https://github.com/simplonco/php-send-mail-form', 'N/A', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(242, 143, 'Définir le diagramme UML de pokemons', 'OUT-01-01', 'https://github.com/simplonco/pokemon-uml', 'Modelisation d''objets', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(243, 114, 'Sessions, Coockies et pasages de paramètres', 'WEB-PHP-07', 'https://github.com/Simplon-Noyon/Exercices-PHP-partie-8', 'N/A', 'Lecture, Code et compréhension', 8, 0, 'auto_eval', 1),
(244, 116, 'Découverte du SASS', 'WEB-01-01', 'http://trysass.com/\r\nhttp://www.grafikart.fr/formations/sass-compass', 'N/A', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(245, 116, 'Découverte du LESS', 'WEB-01-02', 'http://less2css.org/', 'N/A', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(246, 120, 'Initiation au Coffee Script', 'WEB-04-01', 'http://coffeescript.org/', 'N/A', 'Lecture, Code et compréhension', 4, 0, 'auto_eval', 1),
(247, 117, 'Initiation à AngularJS', 'WEB-02-01', 'Lecture et visionage de la documentation et tutoriaux disponibles sur le site de grafikart. \r\n\r\nIl en de semblables sur le site d''angular directement.', 'Initiation à AngularJS', 'Initiation à AngularJS', 8, 0, 'auto_eval', 1),
(248, 159, 'Écrire des tests unitaires', 'WEB-11-01', 'PHP Unit', 'Comprendre l''interet des tests unitaires', 'Lecture, Code et compréhension', 8, 0, 'auto_eval', 1),
(249, 159, 'Écrire une démo Given When Then (GWT)', 'WEB-11-02', 'Gerkhin', 'Comprendre l''interet des tests fonctionels', 'Lecture, Code et compréhension', 8, 0, 'auto_eval', 1),
(252, 95, 'Lecture de la documentation bootstrap', 'WEB-CSS-05', 'Lecture de la documentation bootstrap', 'Apprendre à lire de la documentation', 'Lecture, Code et compréhension', 2, 0, 'auto_eval', 1),
(253, 106, 'Connaitre le BA.B.A sur les différentes licences', 'CUL-04-02', 'GPL, Creative Commons, MPL, Apache, MIT', 'Respecter les licences existantes', 'Apprendre et Appliquer', 1, 0, 'auto_eval', 1),
(254, 162, 'Lecture des règles WCAG 2.0', 'CUL-06-01', 'http://simplonline.co/uploads/images/Front_End/zuliegarnier/Web_accessibility_fr.png\r\n\r\nhttps://www.w3.org/WAI/References/QuickTips/qt-fr.htm\r\n\r\nhttps://www.w3.org/WAI/WCAG20/quickref/', 'Acquérir les bases du WCAG', 'Lecture et compréhension', 1, 0, 'auto_eval', 1),
(255, 109, 'Lecture d''un article sur l''ergonomie d''un site web', 'CUL-05-02', 'Il est important pour les apprenants de bien comprendre l''interet d''une bonne ergonomie. Comprendre que nous ne faisons rien pour rien. \r\n\r\nDivers articles sur internet abordent cette thématique.', 'Comprendre l''importance de l''UI', 'Lecture et compréhension', 1, 0, 'auto_eval', 1),
(256, 131, 'Comprendre l''interet des Design Patterns', 'OUT-02-01', 'Cours réalisé par le formateur afin de présenter des cas de figure classiques impliquant la mise en place de designe patterns.', 'Dispense le cours', 'Ecoute et Comprends', 2, 0, 'auto_eval', 1),
(257, 131, 'Appliquer le design pattern Factory', 'WEB-09c-01', 'Appliquer le design pattern Factory', 'Appliquer le design pattern Factory', 'Appliquer le design pattern Factory', 4, 0, 'auto_eval', 1),
(258, 155, 'Questions sur le MVC', 'WEB-07-01', 'Au sein de diverses présentations effectuées par les apprenants, le terme MVC a été abordé à plusieurs reprises. Voire même expliqué. Mais avant d''aborder des développement plus poussés un rappel est nécessaire. \r\n\r\nFaire un croquis sur le tableau présentant le concept :\r\n\r\nhttp://www.cyblance.com/wp-content/uploads/2013/06/ash-mvc-architecture11.gif', 'Présente', 'Ecoute', 1, 1, 'ponctuelle', 1),
(259, 156, 'Cours théorique du concept objet ( réalisé par un apprenant )', 'WEB-08-01', 'Un des apprenants ayant déjà compris par divers exercices annexes les objets présente aux autres, avec ses mots de débutant le concept objet. Avec quelques rectifications du formateur.', 'Corrige', 'Enseigne et/ou comprends', 1, 0, 'ponctuelle', 1),
(260, 147, 'Se documenter sur la syntaxe SQL', 'BDD-04-01', 'Lecture de documentations sur le SQL', 'N/A', 'Lecture et compréhension', 1, 0, 'auto_eval', 1);

-- --------------------------------------------------------

--
-- Table structure for table `linkActiviteOutil`
--

DROP TABLE IF EXISTS `linkActiviteOutil`;
CREATE TABLE IF NOT EXISTS `linkActiviteOutil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activiteId` int(11) NOT NULL,
  `outilId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `linkActiviteOutil_ibfk_2` (`activiteId`),
  KEY `linkActiviteOutil_ibfk_1` (`outilId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=20 ;

--
-- Dumping data for table `linkActiviteOutil`
--

INSERT INTO `linkActiviteOutil` (`id`, `activiteId`, `outilId`) VALUES
(1, 1, 1),
(12, 2, 3),
(13, 2, 3),
(14, 1, 1),
(18, 7, 3),
(19, 25, 2);

-- --------------------------------------------------------

--
-- Table structure for table `linkProgrammeModule`
--

DROP TABLE IF EXISTS `linkProgrammeModule`;
CREATE TABLE IF NOT EXISTS `linkProgrammeModule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programmeId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moduleId` (`moduleId`),
  KEY `programmeId` (`programmeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=53 ;

--
-- Dumping data for table `linkProgrammeModule`
--

INSERT INTO `linkProgrammeModule` (`id`, `programmeId`, `moduleId`) VALUES
(1, 1, 1),
(6, 1, 9),
(15, 5, 18),
(16, 5, 19),
(17, 5, 20),
(18, 5, 21),
(19, 5, 22),
(20, 5, 23),
(21, 5, 24),
(22, 5, 25),
(23, 5, 26),
(24, 6, 27),
(25, 6, 28),
(26, 6, 29),
(27, 6, 30),
(28, 6, 31),
(29, 7, 32),
(30, 7, 33),
(32, 7, 35),
(33, 7, 36),
(34, 3, 37),
(35, 3, 38),
(36, 3, 39),
(37, 3, 40),
(38, 3, 41),
(40, 3, 43),
(41, 8, 44),
(42, 9, 45),
(43, 8, 46),
(44, 8, 47),
(45, 9, 48),
(46, 10, 49),
(48, 8, 51),
(49, 9, 52),
(50, 9, 53),
(51, 8, 54),
(52, 9, 55);

-- --------------------------------------------------------

--
-- Table structure for table `ModuleDeFormation`
--

DROP TABLE IF EXISTS `ModuleDeFormation`;
CREATE TABLE IF NOT EXISTS `ModuleDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) NOT NULL DEFAULT '1',
  `code` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `PreRequis` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=56 ;

--
-- Dumping data for table `ModuleDeFormation`
--

INSERT INTO `ModuleDeFormation` (`id`, `pos`, `code`, `intitule`, `objectif`, `description`, `PreRequis`) VALUES
(1, 1, 'PRAIRIE-00', 'Compréhender et accepter les thématiques abordées lors de la formation', 'Implication au sein de la formation dispensée', 'Ce module, dispensé dans le cadre de la prairie, a pour objectif d''impliquer les apprenants au sein de la formation. \r\n\r\nQu''ils comprennent l''ensemble des enjeux ainsi qu''ils aient une visibilité sur la méthodologie qui sera appliquée tout au long de la formation.', 'Etre inscrit à la formation'),
(9, 1, 'PRAIRIE-10', 'Accepter et s''intégrer au sein du groupe', 'Accepter et s''intégrer au sein du groupe', 'Les apprenants doivent accepter les règles communes du groupe. Ainsi que participer activement à la vie du groupe', 'Etre inscrit à la formation'),
(18, 1, 'CUL', 'Culture Générale d''un dev web', 'Culture Générale d''un dev web', 'Culture Générale d''un dev web', 'N/A'),
(19, 1, 'LIN', 'Environnement Unix', 'Environnement Unix', 'Environnement Unix', 'N/A'),
(20, 1, 'OUT', 'Utiliser les outils  d''un dev web', 'Découverte des Outils  d''un dev web', 'Découverte des Outils  d''un dev web', 'N/A'),
(21, 1, 'GES', 'Gestion de Projet', 'Initiation à la gestion de projet', 'Initiation à la gestion de projet', 'N/A'),
(22, 1, 'VEI', 'Veille technologique', 'Veille technologique', 'Veille technologique', 'N/A'),
(23, 1, 'WEB', 'Développer dans le web', 'Développer dans le web', 'Développer dans le web', 'N/A'),
(24, 1, 'ALGO', 'Pratiquer l''algorithmie', 'Pratiquer l''algorithmie', 'Pratiquer l''algorithmie', 'N/A'),
(25, 1, 'SCT', 'Connaissance de la Sécurité informatique', 'Connaissance de la Sécurité informatique', 'Connaissance de la Sécurité informatique', 'N/A'),
(26, 1, 'IOT', 'Découverte des objets connectés', 'Découverte des objets connectés', 'Découverte des objets connectés', 'N/A'),
(27, 1, 'WEB', 'Approfondissement du développement web', 'Approfondissement du développement web', 'Approfondissement du développement web', 'TC'),
(28, 1, 'ALGO', 'Algorithmique avancée', 'Algorithmique avancée', 'Algorithmique avancée', 'TC'),
(29, 1, 'OUT', 'Utiliser les outils avancés  d''un dev web', 'Utiliser les outils avancés  d''un dev web', 'Utiliser les outils avancés  d''un dev web', 'TC'),
(30, 1, 'BDD', 'Utiliser des bases de données', 'Utiliser des bases de données', 'Utiliser des bases de données', 'TC'),
(31, 1, 'SCT', 'Connaissance de la Sécurité informatique', 'Connaissance de la Sécurité informatique', 'Connaissance de la Sécurité informatique', 'Tc'),
(32, 1, 'OUT', 'Utiliser les outils d''un dev web', 'Utiliser les outils d''un dev web', 'Utiliser les outils d''un dev web', 'TC'),
(33, 1, 'WDP', 'Utiliser un CMS', 'Utiliser un CMS', 'Utiliser un CMS', 'TC'),
(35, 1, 'SCT', 'Connaissance de la Sécurité informatique', 'Connaissance de la Sécurité informatique', 'Connaissance de la Sécurité informatique', 'N/A'),
(36, 1, 'PF', 'Projet Final', 'Projet Final', 'Projet Final', 'TC'),
(37, 1, 'CUL', 'Avoir la culture générale d''un developpeur web junior', 'Culture Générale d''un dev web', 'Culture Générale d''un dev web', 'N/A'),
(38, 1, 'WEB', 'Développer dans des langages web', 'Développer dans des langages web', 'HTML\r\nCSS\r\nJS\r\nPHP\r\nXML', 'N/A'),
(39, 1, 'GES', 'Compréhender les besoins nécessaires pour un chef de projet', 'Découverte de la gestion de projet', 'Découverte de la gestion de projet', 'N/A'),
(40, 1, 'OUT', 'Utiliser les outils d''un dev web', 'Découverte des Outils d''un dev web', 'Découverte des Outils d''un dev web', 'N/A'),
(41, 1, 'INS', 'Avoir les bons gestes pour une insertion professionelle', 'Avoir les bons gestes pour une insertion professionelle', 'Insertion Pro', 'N/A'),
(43, 1, 'VEI', 'Réaliser de la veille technologique', 'Réaliser de la veille technologique', 'Veille technologique', 'Réaliser de la veille technologique'),
(44, 0, 'OUT', 'Avoir conscience de concepts avancés  d''un developpeur back end', 'Avoir conscience de concepts avancés  d''un developpeur back end', 'Avoir conscience de concepts avancés  d''un developpeur back end', 'TC'),
(45, 1, 'WEB', 'Utiliser des concepts JS avancés', 'Utiliser des concepts JS avancés', 'Utiliser des concepts JS avancés', 'TC'),
(46, 1, 'WEB', 'Développer une application via un framework PHP', 'Développer une application via un framework PHP', 'A partir d''un dossier de conception technique contenant la maquette de l''application à développer et à l''aide du language orienté objet PHP, développer, tester, documenter et installer les composants logiciels requis, formulaires et états, dans le respect des bonnes pratiques, afin d''assurer la collecte et la restitution des informations numériques relatives aux besoins du métier de l''utilisateur.', 'TC'),
(47, 1, 'SQL', 'Concevoir des bases de données SQL', 'Concevoir des bases de données SQL', 'A partir du cahier des charges relatif à une application informatique, établir un schéma entité association des données à informatiser et définir le schéma physique de la base de données, afin de permettre l''élaboration d''une base de données normalisée. Dans le cas d''une demande d''évolution applicative et à partir d''une base de données existante, déduire le schéma entité association des données de la base à faire évoluer.', 'TC'),
(48, 1, 'WDP', 'Adapter un CMS', 'Adapter un CMS', 'WordPress   donne   la   possibilité   de   concevoir,   à   bas   coût   mais   avec   une   finalité  \r\nprofessionnelle,   un   site   vitrine,   un   blog...   et   de   les   gérer.   En   plus   d’être   gratuit,   libre   et   très  \r\nsimple   d’utilisation,   il   est   considéré   comme   le   meilleur   CMS   (content   management   system).  \r\nIntégrant   une   technologie   responsive,   de   nombreux   thèmes,   et   extensions   sont   disponibles,  \r\nil est également possible de personnaliser le modèle.  \r\nDe   plus,   étant   très   répandu,   la   documentation   support   /   d’aide   de   ce   CMS   est   très   facilement  \r\naccessible. \r\nUne   meilleure   prise   en   main   de   Wordpress   est   possible   avec   l’utilisation   de   balises   et   des  \r\nextensions SEO.', 'TC'),
(49, 1, 'GES', 'Gérer un projet web', 'Gérer un projet web', 'Gérer un projet web', 'TC'),
(51, 1, 'SCT', 'Connaitre les bases de la sécurité Web', 'Connaitre les bases de la sécurité Web', 'Connaitre les bases de la sécurité Web', 'TC'),
(52, 1, 'CSS', 'Utiliser des concepts CSS avancés', 'Utiliser des concepts CSS avancés', 'Utiliser des concepts CSS avancés', 'TC'),
(53, 1, 'PHP', 'Connaitres les bases du développement PHP', 'Connaitres les bases du développement PHP', 'Connaitres les bases du développement PHP', 'TC'),
(54, 1, 'BDD', 'Mettre en place une base de données', 'Mettre en place une base de données', 'A partir  du schéma physique de la base de données et d''un système de gestion de base de données relationnel, écrire et exécuter le script de création de la base de données, afin de mettre en place la base avec les contraintes sur les données énoncées à partir des règles de gestion. A partir du dossier de conception technique, insérer les données de test, définir les droits d''utilisatino et prévoir les procédures de sauvegarde et de restauration de la base de données de test.', 'TC'),
(55, 1, 'WOO', 'METTRE EN OEUVRE D''UNE SOLUTION E­COMMERCE', 'MISE EN OEUVRE D''UNE SOLUTION E­COMMERCE', 'Création   et   gestion   d''un   site   e­commerce   avec   WooCommerce,   une   extension   pour  \r\nWordPress   permettant   de   créer   une   boutique   en   ligne.   WooCommerce   permet   de   gérer   tous  \r\nles   aspects   d’un   site   de   e­commerce   tels   que   la   gestion   des   produits,   la   configuration   des  \r\nmodes de paiement et des livraisons, et le suivi des commandes des clients.', 'WDP');

-- --------------------------------------------------------

--
-- Table structure for table `OutilDeFormation`
--

DROP TABLE IF EXISTS `OutilDeFormation`;
CREATE TABLE IF NOT EXISTS `OutilDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=4 ;

--
-- Dumping data for table `OutilDeFormation`
--

INSERT INTO `OutilDeFormation` (`id`, `nom`) VALUES
(1, 'Video Projecteur'),
(2, 'Paper Board'),
(3, 'Clé USB de boot Ubuntu 16.04');

-- --------------------------------------------------------

--
-- Table structure for table `ProgrammeDeFormation`
--

DROP TABLE IF EXISTS `ProgrammeDeFormation`;
CREATE TABLE IF NOT EXISTS `ProgrammeDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ProgrammeDeFormation`
--

INSERT INTO `ProgrammeDeFormation` (`id`, `intitule`, `objectif`, `pos`) VALUES
(1, 'Rennes01 - Prairie', 'Prairie Promo 01', 1),
(3, 'Rennes01 - Tronc Commun', 'Acquisition des connaissances communes pour devenir un intervenant dans le monde des développeurs web', 1),
(5, 'Simplon - Tronc Commun', 'Simplon - Tronc Commun', 1),
(6, 'Simplon - Développement Web', 'Simplon - Développement Web', 1),
(7, 'Simplon - Chargé Projet Numérique', 'Simplon - Chargé Projet Numérique', 1),
(8, 'Rennes01 - Back End PHP', 'Rennes01 - Back End PHP', 1),
(9, 'Rennes01 - Front End', 'Rennes01 - Front End', 1),
(10, 'Rennes01 - Chargé Projet Numérique', 'Rennes01 - Chargé Projet Numérique', 1);

-- --------------------------------------------------------

--
-- Table structure for table `SequenceDeFormation`
--

DROP TABLE IF EXISTS `SequenceDeFormation`;
CREATE TABLE IF NOT EXISTS `SequenceDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) NOT NULL DEFAULT '1',
  `moduleId` int(11) NOT NULL,
  `intitule` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `objectif` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `evaluation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `moduleId` (`moduleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=171 ;

--
-- Dumping data for table `SequenceDeFormation`
--

INSERT INTO `SequenceDeFormation` (`id`, `pos`, `moduleId`, `intitule`, `description`, `code`, `objectif`, `evaluation`) VALUES
(1, 1, 9, 'Identifier les autres aprenants de la formation', 'Cette séquence, essentiellement destinée à la phase de prairie permet aux apprenants à se connaître.\r\n\r\nPermettant par la suite de pouvoir bénéficier de la dynamique de groupe.', 'SOC00', 'Identifier les autres aprenants de la formation', 0),
(6, 1, 1, 'Découvrir et Configurer le poste de travail de l''apprenant', 'Découvrir et Configurer le poste de travail de l''apprenant', 'OS00', 'Découvrir et Configurer le poste de travail de l''apprenant', 0),
(16, 1, 9, 'Définir le groupe', 'Afin de maximiser les échanges lors de la formation , et de bénéficier de la dynamique de groupe, ce dernier doit être correctement défini.', 'SOC10', 'Définition du groupe', 0),
(17, 1, 1, 'Initiation au HTML', 'Initiation aux langages de programmation', 'HTML00', 'Découverte du HTML', 0),
(18, 1, 1, 'Initiation au JavaScipt', 'Initiation au JavaScipt', 'JS00', 'Initiation au JavaScipt', 0),
(19, 1, 1, 'Initiation au SQL', 'Initiation au SQL', 'SQL00', 'Initiation au SQL', 0),
(20, 1, 1, 'Initiation au PHP', 'Initiation au PHP', 'PHP00', 'Initiation au PHP', 0),
(21, 1, 1, 'Initiation au Ruby', 'Initiation au Ruby', 'RUB00', 'Initiation au Ruby', 0),
(22, 1, 1, 'Découvrir la culture liée au développement web', 'Découvrir la culture liée au développement web', 'CUL00', 'Découvrir la culture liée au développement web', 0),
(23, 1, 9, 'S''identifier face au groupe', 'Les apprenants ont besoin d''être rassurés. Et doivent voir qu''ils ont des compétences complémentaires avec les autres apprenants.', 'SOC20', 'S''identifier face au groupe', 0),
(53, 1, 18, 'Introduction générale', 'L’introduction   générale   a   deux   buts.   D’une   part   présenter   l’environnement   Simplon  \r\n(partenaires,   ESS,   locaux,   organisation...)   ,   d’autre   part   de   présenter   la   philosophie  \r\n“Simplon”   et   les   concepts   qui   font   sa   pédagogie   :   l’apprentissage   par   la   pratique,   apprendre  \r\nà apprendre, la programmation en binôme et l’apprentissage par l’enseignement.', 'CUL-001', 'Introduction générale', 0),
(54, 1, 18, 'Introduction aux éco­systèmes et cultures numériques', 'Introduction   aux   éco­systèmes   numériques   (comprendre   l’Internet,   les   périphériques,  \r\nl’utilisation   des   données,   traces   laissées   sur   Internet,   systèmes   d’exploitation...),   à   la  \r\ncyberculture   (histoire   de   l''informatique,   du   Web,   de   la   programmation,   hacker,   maker,  \r\nmouvement   type   Anonymous...),   écosystème   des   logiciels   libres   et   open   source   (4   libertés  \r\nessentielles, valeurs, fonctionnement, contribution), sécurité sur les données personnelles.', 'CUL-002', 'Introduction aux éco­systèmes et cultures numériques', 0),
(55, 1, 19, 'Ubuntu : système d''exploitation libre', 'Maîtrise   de   l’environnement   de   travail   avec   le   système   d’exploitation   open   source   Ubuntu   et  \r\ndécouverte   des   grands   principes   des   systèmes   Unix,   qui   est   aujourd’hui   très   présent   dans   le  \r\nmilieu   professionnel,   grâce   à   sa   grande   stabilité,   son   niveau   de   sécurité   élevé   et   le   respect  \r\ndes   grands   standards,   notamment   en   matière   de   réseau.   Découverte   des   outils   (terminal,  \r\nligne de commande, éditeur de texte), des commandes de base.', 'LIN-001', 'Ubuntu : système d''exploitation libre', 0),
(56, 1, 20, 'Vim : éditeur de texte avancé', 'Découverte   et   utilisation   de   l’éditeur   de   texte   Vim,   difficile   à   prendre   en   main,   mais   très  \r\npuissant,   largement   répandu   et   généralement   disponible   par   défaut   sur   la   plupart   des   OS  \r\nbasés   sur   Unix,   comme   Linux.   Pour   une   meilleure   mise   en   pratique,   les   apprenant.e.s  \r\nl’utiliseront dans le cadre de mini­projets, pour que son utilisation devienne instinctive.  \r\n \r\nVim   est   un   exemple   d’outil   frugal   qui   donne   la   priorité   au   code   et   à   l’efficacité.   Il   sert   ici   de  \r\nmoyen   pour   amener   les   apprenant.e.s   vers   la   ligne   de   commande   et   des   outils  \r\nindispensables tels que sed, awk ou encore wget.', 'OUT-001', 'Vim : éditeur de texte avancé', 0),
(57, 1, 21, 'Gestion de projet, méthodes agiles et organisation personnelle', 'Connaissance   et   mise   en   pratique   des   processus   de   gestion   de   projets   modernes   et   des  \r\nprocessus d''organisation personnelle', 'GEST-001', 'Connaissance   et   mise   en   pratique   des   processus   de   gestion   de   projets   modernes   et   des   processus d''organisation personnelle', 0),
(58, 1, 22, 'Initiation à la veille technologique', 'La   veille   technologique   consiste   à   s''informer   de   manière   systématique   sur   les   techniques   et  \r\ntechnologies   les   plus   récentes   et   leur   mise   à   disposition   commerciale.   Cette   activité   met   en  \r\nœuvre   des   techniques   d''acquisition,   de   stockage   et   d''analyse   d''informations   à   la   manière  \r\nd''une revue de presse.', 'VEIL-001', 'Initiation à la veille technologique', 0),
(59, 1, 23, 'HTML et CSS : créer l''aspect visuel d''un site', 'Apprentissage   de   la   couche   “présentation”   du   Web   à   travers   les   langages   HTML   et   CSS.  \r\nCet   apprentissage   se   fera   à   travers   une   mise   en   application   de   multiples   projets   de   création  \r\nde sites Web statiques en HTML5 et CSS3  “pur”.', 'WEB-001', 'HTML et CSS : créer l''aspect visuel d''un site', 0),
(60, 1, 23, 'SEO : introduction à l’optimisation pour les moteurs de recherche', 'Ce   module   de   SEO   (​\r\nsearch   engine   optimization)   ​\r\nou   optimisation   pour   les   moteurs   de  \r\nrecherche   donne   la   possibilité   de   rentrer   plus   en   profondeur   dans   la   structure   d’un   site   Web,  \r\nen   étudiant   la   manière   dont   les   moteurs   de   recherche   parcourent   les   sites.   Cela   permet  \r\nnotamment d’optimiser la visibilité d’un site Web. \r\n \r\nLes   apprenant.e.s   seront   amené.e.s   à   utiliser   les   balises   HTML   pour   rendre   une   page   plus  \r\nsémantique,   améliorer   son   ergonomie,   générer   des   sitemaps   XML   et   découvrir   des   outils   en  \r\nlignes tels que Google Webmaster Tools.', 'WEB-002', 'SEO : introduction à l’optimisation pour les moteurs de recherche', 0),
(61, 1, 23, 'Twitter Bootstrap : framework CSS', 'Afin   d''accélérer   la   mise   en   place   d’interface   Web   attrayante,   le   framework   CSS   Bootstrap  \r\nest   mis   en   pratique   dans   plusieurs   projets   de   sites   Web   répondant   à   des   problématiques  \r\ndifférentes   (blog,   dashboard...).   Les   bases   du   responsive   design   (ou   site   Web   adapatif)   sont  \r\nétudiées à cette occasion.', 'WEB-003', 'Twitter Bootstrap : framework CSS', 0),
(62, 1, 20, 'Git et Github Pages : versionner son code', 'La   maîtrise   de   Git   et   la   compréhension   du   concept   de   “versioning”   de   code   source   est   un  \r\npré­requis   indispensable   pour   le   travail   dans   une   équipe   de   développement.   Ce   module  \r\nexplique   les   différents   concepts   afférents   (versions,   branches,   synchronisation,   etc.)   avec  \r\nune mise en pratique utilisant la plateforme GitHub.', 'OUT-002', 'Git et Github Pages : versionner son code', 0),
(63, 1, 18, 'Licences : présentation de quelques licences', 'Ce   module   revient   sur   les   licences   libres   et   open   source   les   plus   courantes   et   explique   plus  \r\nen   détails   les   caractéristiques   de   chaque   licence   :   GPL   (General   Public   License),   Creative  \r\nCommons, MPL (Mozilla Public License), Apache, MIT, etc... \r\nIl   s’agit   de   discerner   celles   qui   sont   compatibles   entre­elles,   d’évaluer   leur   degré   de  \r\nproximité et de vérifier sous quelle licence un composant  a été publié par son auteur.', 'CUL-003', 'Licences : présentation de quelques licences', 0),
(64, 1, 23, 'JavaScript : ajouter de l''interaction à son site', 'Découverte   des   grandes   bases   de   la   programmation   impérative   avec   JavaScript   puis  \r\napplication   au   Web   au   travers   de   projets   de   mini­jeux   ainsi   que   pour   la   dynamisation  \r\nd’interface.', 'WEB-004', 'JavaScript : ajouter de l''interaction à son site', 0),
(65, 1, 23, 'Qualité et accessibilité web', 'Pouvoir   réaliser   un   site   internet   c''est   une   chose,   mais   cela   ne   signifie   pas   pour   autant   savoir  \r\nconcevoir   un   site   qui   réponde   à   toutes   les   exigences   de   qualité,   d''accessibilité,   de  \r\nperformance et d''ergonomie favorisant son utilisation optimale.', 'WEB-005', 'Qualité et accessibilité web', 0),
(66, 1, 24, 'Introduction à l’algorithmique', 'Après   une   entrée   concrète   dans   la   programmation,   il   s’agit   de   poser   les   bases   de  \r\nl’algorithmique,   d’abord   en   pseudo­code,   puis   appliqué   en   Javascript   à   des   exercices  \r\nclassiques.', 'ALGO-001', 'Introduction à l’algorithmique', 0),
(67, 1, 20, 'Serveur et stacks Web : mise en ligne d’un site', 'Prise   en   main   des   services   locaux   d’une   machine   Linux   et   en   particulier   l’installation   /   la  \r\nconfiguration   des   serveurs   Web   Apache   et   Nginx   pour   accéder   à   un   environnement   Web  \r\nlocal. Présentation des concepts d’architecture client / serveur et de stacks Web.', 'OUT-003', 'Serveur et stacks Web : mise en ligne d’un site', 0),
(68, 1, 23, 'Canvas et jQuery : JavaScript avancé', 'L’utilisation   de   frameworks   JavaScript   permet   le   développement   d’applications   front­end  \r\navancées   et   la   création   d’interactions   poussées   au   niveau   utilisateur.   La   mise   en   pratique  \r\ndans   des   projets   de   l’objet   “Canvas”   augmente   les   possibilités   en   terme   d’animation   et   de  \r\ncréation   de   petits   jeux.   L’utilisation   des   fonctionnalités   XHR   via   jQuery.Ajax   donne   la  \r\ndernière   brique   pour   la   création   d''applications   Web   dynamiques   et   modernes   dans   le  \r\nnavigateur.', 'WEB-006', 'Canvas et jQuery : JavaScript avancé', 0),
(69, 1, 25, 'Sensibilisation à la sécurité', 'Il   s’agit   de   sensibiliser   aux   problématiques   de   sécurité   d''un   site   Web   et   de   transmettre   les  \r\nbonnes   pratiques   pour   se   prémunir   d''une   attaque,   des   méthodes   de   chiffrement   des   mots   de  \r\npasse   des   utilisateurs   stockés   dans   la   base   de   données,   etc.)   et   de   mieux   appréhender   les  \r\nréglementations d''utilisation des données personnelles des utilisateurs (CNIL).', 'SCT-001', 'Sensibilisation à la sécurité', 0),
(70, 1, 26, 'Introduction aux objets connectés et impression 3D (optionnel)', 'Découverte   des   objets   connectés   au   travers   de   projets   concrets   sur   Arduino   et   utilisant  \r\ndifférents   capteurs   /   composants.   Initiation   à   l’impression   3D   et   à   la   modélisation   en   utilisant  \r\nOpenScad pour réaliser un petit objet à imprimer', 'IOT-001', 'Introduction aux objets connectés et impression 3D (optionnel)', 0),
(71, 1, 27, 'AngularJS : augmenter son efficacité avec JavaScript', 'AngularJS   est   un   framework   JavaScript   qui   étend   le   HTML   pour   le   rendre   dynamique,   et  \r\npermet   de   développer   ses   propres   balises   et   attributs   HTML.   Ce   framework,   extensible,  \r\npousse   vers   un   développement   structuré,   en   couches.   Différents   concepts   seront   abordés  \r\ntels   que   MVC   (Modèle­Vue­Contrôleur),   le   data­binding   bidirectionnel,   l’injection   de  \r\ndépendances, le routing et les tests.', 'WEB-007', 'AngularJS : augmenter son efficacité avec JavaScript', 0),
(72, 1, 28, 'Algorithmique avancée', 'Il s''agit de poursuivre l''apprentissage de l''algorithmique en explorant des algorithmes \r\nclassiques plus avancés (théorie des graphes, méthodes de tri avancés...) et d''introduire les \r\nnotions de complexité et d''optimisation d''un algorithme.', 'ALGO-002', 'Algorithmique avancée', 0),
(73, 1, 29, 'UML', 'UML   ou   “langage   de   modélisation   unifié”   est   l’une   des   notations   les   plus   utilisées  \r\naujourd’hui.   Il   s’agit   ici   de   découvrir   ce   langage   visuel,   d’utiliser   (par   type)   et   de   décrypter   les  \r\ndiagrammes   fournis   par   ce   langage   pour   analyser   son   fonctionnement,   sa   mise   en   route   et  \r\nles actions susceptibles d’être effectuées.', 'OUT-004', 'UML', 0),
(74, 1, 27, 'Programmation avancée (Ruby / PHP / Python)', 'Il   est   temps   d''apprendre   à   maîtriser   un   langage   orienté   objet,   qui   s''exécute   côté   serveur,   et  \r\npermet   notamment   de   communiquer   avec   une   base   de   données,   et   de   s''initier   aux   outils  \r\nutiles   dans   la   phase   de   développement.   C''est   ce   langage   qui   permettra   de   concevoir   ensuite  \r\nun site Web dynamique ou une application Web complète.', 'DEV-001', 'Programmation avancée (Ruby / PHP / Python)', 0),
(75, 1, 27, 'Développement d’un site / d''une application Web (Rails / Symfony /  Django)', 'Lorsqu''on   développe   un   site   ou   une   application   Web,   on   se   sert   généralement   d''un  \r\nframework   qui   offre   de   nombreux   outils   et   composants   logiciels   pour   faciliter   le  \r\ndéveloppement.   Les   frameworks   sont   conçus   et   utilisés   pour   modeler   l''architecture   d''un   site  \r\nou d''une application Web.', 'DEV-002', 'Développement d’un site / d''une application Web (Rails / Symfony /  Django)', 0),
(76, 1, 30, 'Conception et administration d''une base de données SQL', 'Concevoir,   mettre   en   oeuvre   et   utiliser   les   bases   de   données   relationnelles,   en   particulier  \r\nsavoir   définir   un   schéma   relationnel   à   partir   d''une   modélisation   conceptuelle   des   données   et  \r\nmaîtriser le langage SQL.', 'BDD-001', 'Conception et administration d''une base de données SQL', 0),
(77, 1, 30, 'Initiation au NoSQL (optionnel)', 'Ce   module   concerne   principalement   le   langage   Python,   ce   dernier   étant   très   utilisé   pour   les  \r\nBig   Data   des   bases   de   données   de   type   NoSQL   (ex:   mongoDB).   Il   s’agit   de   voir   comment  \r\nmaintenir   et   superviser   un   base   de   données   NoSQL,   sachant   que   les   moteurs   NoSQL,   en  \r\nstockant   des   données   moins   structurées,   peuvent   utiliser   de   la   distribution   sur   plusieurs  \r\nserveurs.', 'BDD-02', 'Initiation au NoSQL', 0),
(78, 1, 29, 'Déploiement d''un site / d''une application Web', 'Après avoir conçu un site ou une application Web, il faut l''héberger sur un serveur pour \r\npouvoir le/la rendre publique et utilisable. Ce module a donc pour but d''apprendre à \r\nmaîtriser les outils nécessaires pour configurer et administrer un serveur, et mettre en \r\nproduction un site ou une application Web.', 'OUT-005', 'Déploiement d''un site / d''une application Web', 0),
(79, 1, 27, 'Tester son site / application Web', 'Il   s’agit   ici   de   tester!   Les   apprenant.e.s   devront   spécifier   des   tests   d’intégration   et   des  \r\nparcours   utilisateurs.   L''écriture   des   tests   unitaires   sera   mise   en   application   via   la   méthode  \r\nTDD.', 'DEV-003', 'Tester son site / application Web', 0),
(80, 1, 31, 'Sécurité appliquée à la programmation', 'l s’agit ici d’aborder les failles permettant l’injection de code. Cette partie sera \r\nprincipalement basée sur deux exemples : les injections SQL basiques et avancées, ainsi \r\nque les failles XSS (appelée Cross­Site Scripting) avec les injections de code HTML ou \r\nJavaScript.', 'SCT-002', 'Sécurité appliquée à la programmation', 0),
(81, 1, 32, 'Présentations et outils', 'Les   présentations   sont   un   excellent   moyen   pour   convaincre.   Elles   constituent   une   vraie  \r\nopportunité   de   se   faire   comprendre,   de   simplifier   des   sujets   complexes,   de   susciter   l’intérêt,  \r\nd’engager des discussions et d’être plus incisif dans ses propos.', 'OUT-006', 'Présentations et outils', 0),
(82, 1, 33, 'Wordpress', 'WordPress   donne   la   possibilité   de   concevoir,   à   bas   coût   mais   avec   une   finalité  \r\nprofessionnelle,   un   site   vitrine,   un   e­commerce,   un   blog...   et   de   les   gérer.   En   plus   d’être  \r\ngratuit,   libre   et   très   simple   d’utilisation,   il   est   considéré   comme   le   meilleur   CMS   (content  \r\nmanagement   system).   Intégrant   une   technologie   responsive,   de   nombreux   thèmes,   et  \r\nextensions sont disponibles, il est également possible de personnaliser le modèle.  \r\nDe   plus,   étant   très   répandu,   la   documentation   support   /   d’aide   de   ce   CMS   est   très   facilement  \r\naccessible. \r\nUne   meilleure   prise   en   main   de   Wordpress   est   possible   avec   l’utilisation   de   balises   et   des  \r\nextensions SEO.', 'WDP-001', 'Utiliser et Customiser Wordpress', 0),
(83, 1, 33, 'PHP / MySQL orienté WordPress', 'Une   connaissance   basique   du   langage   PHP   et   du   moteur   de   base   de   données   relationnelles  \r\nSQL   permettront   une   meilleure   prise   en   main   des   CMS,   tel   que   WordPress,   ainsi   que   de  \r\ncréer des extensions et des plugins pour WordPress.', 'PMS-001', 'PHP / MySQL orienté WordPress', 0),
(84, 1, 33, 'WordPress : projet', 'Mise   en   application   directe   dans   un   projet   concret   de   toutes   les   connaissances   acquises  \r\nprécédemment. Le projet WordPress se déroulera en d''équipe et s’étalera sur une semaine.', 'WDP-002', 'WordPress : projet', 0),
(85, 1, 33, 'E­-Commerce', 'Création   et   gestion   d''un   site   e­commerce   avec   WooCommerce,   une   extension   pour  \r\nWordPress   permettant   de   créer   une   boutique   en   ligne.   WooCommerce   permet   de   gérer   tous  \r\nles   aspects   d’un   site   de   e­commerce   tels   que   la   gestion   des   produits,   la   configuration   des  \r\nmodes de paiement et des livraisons, et le suivi des commandes des clients.', 'ECM-001', 'E­-Commerce', 0),
(86, 1, 32, 'Initiation au Web design et outils', 'Découvrir   les   notions   essentielles   de   Web   design   avec   une   initiation   aux   outils   et   aux  \r\ntechniques   de   découpage   de   maquette   et   traitements   basiques   d''images   (redimensionner,  \r\nrecadrer, transparence, etc.)', 'OUT-007', 'Initiation au Web design et outils', 0),
(87, 1, 32, 'Newsletter', 'Il   s’agit   de   déployer   des   campagnes   de   communication   numérique   simplement   et  \r\nrapidement   en   utilisant   un   outil   performant   qui   permet   de   créer   des   newsletters   à   l’aide   de  \r\ntemplates,   d’automatiser   des   envois,   d’intégrer   les   contenus   sur   les   réseaux   sociaux,   mais  \r\naussi de gérer des fichiers de contacts et de faire des suivis statistiques de vos campagnes.', 'NWL-001', 'Newsletter', 0),
(88, 1, 32, 'Outils d’automatisation', 'Certaines   tâches   peuvent   être   automatisées.   Il   peut   être   utile   de   mettre   en   place   toute   une  \r\nsérie   de   règles   (un   workflow)   pour   gagner   du   temps   et   être   plus   efficace   en   connectant  \r\nplusieurs services en ligne entre eux pour créer des tâches et de la valeur.', 'OUT-008', 'Outils d’automatisation', 0),
(89, 1, 32, 'Wireframing', 'Le   wireframe   est   une   maquette   fonctionnelle   /   un   schéma   utilisé   lors   de   la   conception   d''une  \r\ninterface   pour   définir   les   zones   et   composants   qu''elle   doit   contenir.   La   démarche   de   recourir  \r\nà   des   wireframes   s''inscrit   dans   une   recherche   d''ergonomie.   Elle   est   surtout   utilisée   dans   le  \r\ncadre du développement logiciel et des sites et applications Web.', 'WFN-001', 'Wireframing', 0),
(90, 1, 32, 'Bubble.is', 'Bubble.is   est   un   service   permettant   de   créer   des   applications   Web   et   mobile   sans   coder.   Le  \r\nworkflow   imposé   demande   tout   de   même   de   réfléchir   et   d''avoir   une   logique   de  \r\ndéveloppement.', 'BBS-001', 'Bubble.is', 0),
(91, 1, 35, 'Formation en sécurité', 'L’objectif   de   ce   module   est   de   former   les   apprenant.e.s   à   initier   d''autres   personnes   aux  \r\nproblématiques   de   sécurité   informatique   et   personnelle   telles   que   :   mot   de   passe   sécurisé,  \r\nfonctionnement   d’Internet,   prendre   conscience   du   traquage   et   pouvoir   le   limiter,  \r\nfonctionnement de la publicité ciblée, du cloud, de l''univers du Big Data...', 'SCT-003', 'Formation en sécurité', 0),
(92, 1, 36, 'Projet Final', 'Mise   en   application   directe   dans   un   projet   concret   de   toutes   les   connaissances   acquises   au  \r\ncours   de   la   formation.   Le   projet   final   est   un   travail   d''équipe   d''une   durée   de   deux   semaines  \r\nqui contient potentiellement plusieurs sous­projets.', 'PF-001', 'Projet Final', 0),
(93, 1, 38, 'Manipuler et concevoir un XML', 'L''XML est utilisé par de nombreuses applications. Par le biais de cette séquence, les apprenants découvrent l''interet de dissocier la structure du graphisme, mais comprennent également l''interet des spécifications lors de la définition d''un DTD en équipe.', 'WEB-XML', 'Comprendre l''interet de dissocier le contenu du graphisme. Savoir ce qu''est un DTD et XHTML. Savoir ce qu''est le XML.', 0),
(94, 1, 38, 'Développer un site web en HTML5/CSS3', 'A la fin de ce module, les apprenants doivent savoir développer un site web en HTML5. \r\n\r\nDOCTYPE/META\r\nHTML/HEAD/BODY\r\nHEADER/FOOTER/ASIDE', 'WEB-HTML', 'Connaitre l''essentiel des éléments du HTML5', 1),
(95, 1, 38, 'Développer un site web avec Bootstrap', 'écouverte de Bootstrap', 'WEB-CSS', 'Développer un site web avec Bootstrap', 0),
(96, 1, 39, 'Réaliser le mockup d''un site internet', 'Réaliser le mockup d''un site internet', 'GES-01', 'Réaliser le mockup d''un site internet', 0),
(97, 1, 39, 'Estimer son temps de développement', 'Estimer son temps', 'GES-02', 'Estimer son temps de développement', 0),
(98, 1, 37, 'Devenir curieux sur des technologies', 'Devenir curieux sur des technologies', 'CUL-01', 'Devenir curieux sur des technologies', 0),
(99, 1, 37, 'Connaître le monde de l''informatique', 'Culture Générale en informatique', 'CUL-02', 'Culture Générale en informatique', 0),
(101, 1, 40, 'Approfondissement de GIT', 'Approfondissement de GIT', 'OUT-GIT', 'Meilleur compréhension de GIT', 0),
(102, 1, 37, 'Connaître ce qu''est le SEO', 'Explication et partage autour du référencement.', 'CUL-03', 'Découverte du référencement', 0),
(103, 1, 41, 'Insertion Pro FACE', 'Insertion Pro FACE', 'INS-PRO', 'Insertion Pro FACE', 0),
(104, 1, 38, 'Utiliser le JavaScript dans un site web', 'Développer un site web en JavaScript', 'WEB-JS', 'Développer un site web en JavaScript', 0),
(105, 1, 39, 'Communiquer avec un client', 'Communiquer avec un client', 'GES-03', 'Communiquer avec un client', 0),
(106, 1, 37, 'Connaître le droit à l''informatique', 'Le droit de l''informatique', 'CUL-04', 'Le droit de l''informatique', 0),
(108, 1, 39, 'Travailler pour un client', 'Travailler pour un client', 'GES-04', 'Travailler pour un client', 0),
(109, 1, 37, 'Savoir ce qu''est l''UI/UX', 'L''UI / UX', 'CUL-05', 'L''UI/UX', 0),
(110, 1, 41, 'Interventions exterieurs', 'Interventions exterieurs', 'INS-INT', 'Interventions exterieurs', 0),
(111, 1, 39, 'Ecrire des spécifications fonctionelles', 'Connaitre les tenants et aboutissants pour la rédaction de spécifications', 'GES-05', 'Les spécifications fonctionelles', 0),
(112, 1, 43, 'Organiser sa veille technologique', 'Initiation à la veille technologique', 'VEI-01', 'Initiation à la veille technologique', 0),
(113, 1, 38, 'Utiliser un CMS tel que Wordpress', 'Initiation à Wordpress', 'WEB-CMS', 'Initiation à Wordpress', 0),
(114, 1, 38, 'Développer un site web en PHP', 'Développer un site web en PHP', 'WEB-PHP', 'Développer un site web en PHP', 0),
(116, 1, 52, 'Découverte du BEM, SMACSS, SASS', 'Découverte du BEM, SMACSS', 'WEB-01', 'Découverte du BEM, SMACSS', 0),
(117, 1, 45, 'AngularJS : augmenter son efficacité avec JavaScript', 'AngularJS   est   un   framework   JavaScript   qui   étend   le   HTML   pour   le   rendre   dynamique,   et  \r\npermet   de   développer   ses   propres   balises   et   attributs   HTML.   Ce   framework,   extensible,  \r\npousse   vers   un   développement   structuré,   en   couches.   Différents   concepts   seront   abordés  \r\ntels   que   MVC   (Modèle­Vue­Contrôleur),   le   data­binding   bidirectionnel,   l’injection   de  \r\ndépendances, le routing et les tests.', 'WEB-02', 'AngularJS : augmenter son efficacité avec JavaScript', 0),
(120, 1, 45, 'Découverte du Coffee Script', 'Découverte du Coffee Script', 'WEB-04', 'Découverte du Coffee Script', 0),
(123, 1, 48, 'Utiliser la partie admin d''un Wordpress', 'Utiliser la partie admin d''un wordpress', 'WDP-03', 'Utiliser la partie admin d''un wordpress', 0),
(124, 1, 48, 'Créer un thème wordpress', 'Créer un thème wordpress', 'WDP-07', 'Créer un thème wordpress', 0),
(125, 1, 49, 'Définir des spécifications fonctionelles', 'Définir des spécifications fonctionelles', 'GES-06', 'Définir des spécifications fonctionelles', 0),
(126, 1, 49, 'Planifier et organiser les tâches', 'Planifier et organiser les tâches', 'GES-07', 'Planifier et organiser les tâches', 0),
(127, 1, 49, 'Définir des tests fonctionnels', 'Définir des tests fonctionnels', 'GES-08', 'Définir des tests fonctionnels', 0),
(128, 1, 49, 'Communiquer avec un client', 'Communiquer avec un client', 'GES-09', 'Communiquer avec un client', 0),
(129, 1, 40, 'Utiliser et customiser son IDE', 'Utiliser et customiser son IDE', 'OUT-IDE', 'Utiliser et customiser son IDE', 0),
(131, 1, 46, 'Utiliser des Design Pattern', 'Utiliser des Design Pattern', 'WEB-09c', 'Utiliser des Design Pattern', 0),
(132, 2, 44, 'Déployer un site web en production', 'concepts', 'OUT-03', 'concepts', 0),
(133, 1, 51, 'Savoir éviter les injections SQL basiques et avancées', 'Savoir éviter les injections SQL basiques et avancées', 'SCT-04', 'Savoir éviter les injections SQL basiques et avancées', 0),
(134, 1, 51, 'Savoir éviter les failles XSS', 'Savoir éviter les failles XSS', 'SCT-05', 'Savoir éviter les failles XSS', 0),
(135, 1, 51, 'Savoir encrypter des mots de passe', 'Savoir encrypter des mots de passe', 'SCT-06', 'Savoir encrypter des mots de passe', 0),
(136, 1, 53, 'Savoir comment fonctionne le CRUD', 'Savoir comment fonctionne le CRUD', 'PHP-01', 'Savoir comment fonctionne le CRUD', 0),
(137, 1, 53, 'Savoir comment fonctionne la gestion des comptes utilisateurs', 'Savoir comment fonctionne la gestion des comptes utilisateurs', 'PHP-02', 'Savoir comment fonctionne la gestion des comptes utilisateurs', 0),
(138, 1, 47, 'Connaissance des concepts du modèle entité association', 'Connaissance des concepts du modèle entité association', 'SQL-01', 'Connaissance des concepts du modèle entité association', 0),
(139, 1, 47, 'Connaissance du modèle relationnel', 'Connaissance du modèle relationnel', 'SQL-02', 'Connaissance du modèle relationnel', 0),
(140, 1, 47, 'Connaissance des règles de passage du modèle entité association vers le modèle physique', 'Connaissance des règles de passage du modèle entité association vers le modèle physique', 'SQL-03', 'Connaissance des règles de passage du modèle entité association vers le modèle physique', 0),
(141, 1, 47, 'Connaissance d''un outil de conception entité association de type atelier de génie logiciel', 'Connaissance d''un outil de conception entité association de type atelier de génie logiciel', 'SQL-04', 'Connaissance d''un outil de conception entité association de type atelier de génie logiciel', 0),
(142, 1, 47, 'Recenser les informations d''un domaine étudié', 'Recenser les informations d''un domaine étudié', 'SQL-05', 'Recenser les informations d''un domaine étudié', 0),
(143, 1, 47, 'Construire le schéma entité association', 'Construire le schéma entité association', 'SQL-06', 'Construire le schéma entité association', 0),
(144, 1, 47, 'Construire le schéma physique des données', 'Construire le schéma physique des données', 'SQL-07', 'Construire le schéma physique des données', 0),
(145, 1, 44, 'Utiliser des bases de données NoSQL', 'Utiliser des bases de données NoSQL', 'OUT-04', 'Utiliser des bases de données NoSQL', 0),
(146, 1, 54, 'Connaissance du système de gestion de la base de données relationnelle', 'Connaissance du système de gestion de la base de données relationnelle', 'BDD-03', 'Connaissance du système de gestion de la base de données relationnelle', 0),
(147, 1, 54, 'Connaissance du langage de requête structurée SQL', 'Connaissance du langage de requête structurée SQL', 'BDD-04', 'Connaissance du langage de requête structurée SQL', 0),
(148, 1, 54, 'Connaissance des diffférents types de codage de données', 'Connaissance des diffférents types de codage de données', 'BDD-05', 'Connaissance des diffférents types de codage de données', 0),
(149, 1, 54, 'Mettre en oeuvre les instructions SQL de CRUD de tables et de vues', 'Mettre en oeuvre les instructions SQL de CRUD de tables et de vues', 'BDD-06', 'Mettre en oeuvre les instructions SQL de CRUD de tables et de vues', 0),
(150, 1, 54, 'Mettre en oeuvre les instructions SQL pour implémenter les contraintes et optimisations des accès', 'Mettre en oeuvre les instructions SQL pour implémenter les contraintes et optimisations des accès', 'BDD-07', 'Mettre en oeuvre les instructions SQL pour implémenter les contraintes et optimisations des accès', 0),
(151, 1, 54, 'Mettre en oeuvre la gestion des droits des utilisateurs et les rôles', 'Mettre en oeuvre la gestion des droits des utilisateurs et les rôles', 'BDD-08', 'Mettre en oeuvre la gestion des droits des utilisateurs et les rôles', 0),
(152, 1, 54, 'Ecrire et executer un script de création de base de données à l''aide de l''environnement integré de développement', 'Ecrire et executer un script de création de base de données à l''aide de l''environnement integré de développement', 'BDD-09', 'Ecrire et executer un script de création de base de données à l''aide de l''environnement integré de développement', 0),
(153, 1, 54, 'Elaborer des scripts d''alimentation de la base de test', 'Elaborer des scripts d''alimentation de la base de test', 'BDD-10', 'Elaborer des scripts d''alimentation de la base de test', 0),
(154, 1, 54, 'Mettre en oeuvre les utilitaires de sauvegarde et restauration système de gestion de la base de données', 'Mettre en oeuvre les utilitaires de sauvegarde et restauration système de gestion de la base de données', 'BDD-11', 'Mettre en oeuvre les utilitaires de sauvegarde et restauration système de gestion de la base de données', 0),
(155, 1, 46, 'Connaissance du modèle MVC', 'Connaissance du modèle MVC', 'WEB-07', 'Connaissance du modèle MVC', 0),
(156, 1, 46, 'Connaissance des concepts de programmation orienté objet', 'Connaissance des concepts de programmation orienté objet', 'WEB-08', 'Connaissance des concepts de programmation orienté objet', 0),
(157, 1, 46, 'Utiliser les normes de codage et auto-documenter le code', 'Utiliser les normes de codage et auto-documenter le code', 'WEB-09b', 'Utiliser les normes de codage et auto-documenter le code', 0),
(158, 1, 46, 'Gérer de façon complète les erreurs et les exceptions', 'Gérer de façon complète les erreurs et les exceptions', 'WEB-10', 'Gérer de façon complète les erreurs et les exceptions', 0),
(159, 1, 46, 'Réaliser un jeu de tests unitaires avec un outil de test', 'Réaliser un jeu de tests unitaires avec un outil de test', 'WEB-11', 'Réaliser un jeu de tests unitaires avec un outil de test', 0),
(160, 1, 46, 'Documenter les composants', 'Par le biais de générateurs de documentations, Documenter les composants', 'WEB-12', 'Annoter les composants', 0),
(161, 1, 46, 'Développer une application en PHP', 'Développer une application en PHP', 'WEB-09a', 'Développer une application en PHP', 0),
(162, 1, 37, 'Connaitre les principes de l''accessibilité web', 'Accesibilité Web, WCAG et autres', 'CUL-06', 'Connaitre les principes de l''accessibilité web', 0),
(163, 1, 52, 'SASS ET COMPASS: PRE­PROCESSEUR CSS', 'Grâce   à   Sass   et   à   son   framework   Compass,   les   intégrateurs   et   développeurs   web  \r\nconfrontés   à   des   impératifs   de   productivité   et   de   maintenabilité   disposent   d''outils   pour   écrire  \r\nde   façon   cohérente   leurs   feuilles   de   styles   CSS.   Le   préprocesseur   Sass   offre   un   arsenal   de  \r\nfonctions   pour   la   productivité   du   développeur   front­end   :   code   CSS   allégé   et   simplifié   lors   de  \r\nla   phase   de   développement,   variables,   mixins,   fonctions,   placeholders,   concaténation,  \r\nvalidation de code à la volée...', 'CSS-01', 'Savoir utiliser Sass et Compass', 0),
(164, 1, 45, 'REACT : CRÉER UNE INTERFACE UTILISATEUR AVANCÉ', 'React est une librairie JavaScript open source maintenue par Facebook / Instagram créée \r\nen 2011. Elle permet la création d''interface utilisateur graphique (GUI) riche. React privilégie \r\nun sens unique et prévisible de la propagation des données et facilite la coopération entre \r\ncomposants autonomes.', 'WEB-13', 'Connaitre et savoir utiliser REACT', 0),
(165, 1, 48, 'Maitriser l''administration d''un site Wordpress', 'Maîtriser   les   fonctionnalités   essentielles   (gestion   d''articles,   de   pages,   de   menus,  \r\nmise en forme du contenu et gestion des médias, gestion des commentaires, etc.)', 'WDP-05', 'Maitriser l''administration d''un site Wordpress', 0),
(166, 1, 48, 'Personnaliser un thème existant', 'Personnaliser un thème existant', 'WDP-06', 'Personnaliser un thème existant', 0),
(167, 1, 48, 'Créer des contenus personnalisés', 'Créer des contenus personnalisés', 'WDP-08', 'Créer des contenus personnalisés', 0),
(168, 1, 48, 'Utiliser les champs personnalisés', 'Utiliser les champs personnalisés', 'WDP-09', 'Utiliser les champs personnalisés', 0),
(169, 1, 55, 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce', 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce', 'WOO-01', 'Maîtriser   les   fonctionnalités   essentielles   de   WooCommerce', 0),
(170, 1, 55, 'Administrer un site e­commerce', 'Administrer un site e­commerce', 'WOO-02', 'Administrer un site e­commerce', 0);

-- --------------------------------------------------------

--
-- Table structure for table `UrlDeFormation`
--

DROP TABLE IF EXISTS `UrlDeFormation`;
CREATE TABLE IF NOT EXISTS `UrlDeFormation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) NOT NULL DEFAULT '1',
  `activityId` int(11) NOT NULL,
  `url` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=19 ;

--
-- Dumping data for table `UrlDeFormation`
--

INSERT INTO `UrlDeFormation` (`id`, `pos`, `activityId`, `url`) VALUES
(1, 1, 255, 'http://www.commentcamarche.net/contents/1255-ergonomie-d-un-site-web'),
(2, 1, 217, 'http://kta1.rxla.bz/#'),
(3, 1, 217, 'https://github.com/simplonco/js-recall'),
(4, 1, 260, 'http://docusland.fr/dropbox/public/face/sql-cheat-sheet.png'),
(5, 1, 256, 'http://docusland.fr/dropbox/public/face/Carte%20design%20pattern.pdf'),
(6, 1, 236, 'https://github.com/simplonco/php-introduction'),
(7, 1, 239, 'https://github.com/ErwannFace/php_challenge1_send_mail'),
(8, 1, 239, 'https://github.com/simplonco/portfolio/'),
(9, 1, 202, 'http://raspberrypi.local/PosesToiUneQuestion/'),
(10, 1, 186, 'https://github.com/ErwannFace/Challenge_3'),
(11, 1, 186, 'http://www.xmlvalidation.com/'),
(12, 1, 222, 'https://www.grafikart.fr/tutoriels/javascript/poo-javascript-object-466'),
(13, 1, 222, 'http://simplonline.co/ressources/13-ressources/152-exercice-javascript-les-objets'),
(14, 1, 219, 'https://www.grafikart.fr/tutoriels/jquery/initiation-jquery-84'),
(15, 1, 219, 'https://www.youtube.com/watch?v=7l2x-1nPzUk'),
(16, 1, 219, 'https://www.grafikart.fr/tutoriels/jquery/centrer-div-294'),
(17, 1, 220, 'https://github.com/ErwannFace/Jquery_Pomodoro'),
(18, 1, 247, 'http://www.grafikart.fr/formations/angularjs');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ActiviteDeFormation`
--
ALTER TABLE `ActiviteDeFormation`
  ADD CONSTRAINT `ActiviteDeFormation_ibfk_1` FOREIGN KEY (`sequenceId`) REFERENCES `SequenceDeFormation` (`id`);

--
-- Constraints for table `linkActiviteOutil`
--
ALTER TABLE `linkActiviteOutil`
  ADD CONSTRAINT `linkActiviteOutil_ibfk_1` FOREIGN KEY (`outilId`) REFERENCES `OutilDeFormation` (`id`),
  ADD CONSTRAINT `linkActiviteOutil_ibfk_2` FOREIGN KEY (`activiteId`) REFERENCES `ActiviteDeFormation` (`id`);

--
-- Constraints for table `linkProgrammeModule`
--
ALTER TABLE `linkProgrammeModule`
  ADD CONSTRAINT `linkProgrammeModule_ibfk_1` FOREIGN KEY (`moduleId`) REFERENCES `ModuleDeFormation` (`id`),
  ADD CONSTRAINT `linkProgrammeModule_ibfk_2` FOREIGN KEY (`programmeId`) REFERENCES `ProgrammeDeFormation` (`id`);

--
-- Constraints for table `SequenceDeFormation`
--
ALTER TABLE `SequenceDeFormation`
  ADD CONSTRAINT `SequenceDeFormation_ibfk_1` FOREIGN KEY (`moduleId`) REFERENCES `ModuleDeFormation` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
