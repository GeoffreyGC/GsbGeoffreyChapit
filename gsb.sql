-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 23 déc. 2021 à 22:51
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `historiqueconnexion`
--

DROP TABLE IF EXISTS `historiqueconnexion`;
CREATE TABLE IF NOT EXISTS `historiqueconnexion` (
  `idMedecin` int(11) NOT NULL,
  `dateDebutLog` datetime NOT NULL,
  `dateFinLog` datetime DEFAULT NULL,
  PRIMARY KEY (`idMedecin`,`dateDebutLog`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `historiqueconnexion`
--

INSERT INTO `historiqueconnexion` (`idMedecin`, `dateDebutLog`, `dateFinLog`) VALUES
(1, '2021-12-22 11:56:44', '2021-12-22 11:57:09'),
(16, '2021-12-22 11:59:13', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `historiqueconnexionarchive`
--

DROP TABLE IF EXISTS `historiqueconnexionarchive`;
CREATE TABLE IF NOT EXISTS `historiqueconnexionarchive` (
  `id` int(11) NOT NULL,
  `dateDebutLog` datetime NOT NULL,
  `dateFinLog` datetime NOT NULL,
  PRIMARY KEY (`id`,`dateDebutLog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `historiqueconnexionarchive`
--

INSERT INTO `historiqueconnexionarchive` (`id`, `dateDebutLog`, `dateFinLog`) VALUES
(1, '2021-11-10 23:49:07', '2021-11-10 23:49:10'),
(1, '2021-11-10 23:49:19', '2021-11-10 23:49:21'),
(1, '2021-11-10 23:49:30', '2021-11-10 23:49:52');

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE IF NOT EXISTS `maintenance` (
  `Etat` int(1) NOT NULL,
  PRIMARY KEY (`Etat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `maintenance`
--

INSERT INTO `maintenance` (`Etat`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `dateNaissance` year(4) DEFAULT NULL,
  `motDePasse` varchar(500) DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `rpps` varchar(10) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `dateDiplome` year(4) DEFAULT NULL,
  `dateConsentement` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id`, `nom`, `prenom`, `mail`, `dateNaissance`, `motDePasse`, `dateCreation`, `rpps`, `token`, `dateDiplome`, `dateConsentement`) VALUES
(1, '', 'admin', 'l?j]??eG,#1Xa[D?6-???-^?', NULL, '$2y$10$a3gsPj3/cjefmgEmTJU.9.Y6T.tYohXLL517RLYRtBZFgE0OQPBRa', '2021-12-22 11:54:33', NULL, NULL, NULL, '2021-12-22'),
(16, 'Chapit', 'Geoffrey', '??,?hB??i?th??j]E?>0/???bM??2DJ?T?<&', NULL, '$2y$10$W/cQE6tuLMcwqo1f2/LrLOJtgoRIsCI8m/Fjnn73mv87JrgBKVOl6', '2021-12-22 11:58:12', NULL, NULL, NULL, '2021-12-22');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `medecinaeffacer`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `medecinaeffacer`;
CREATE TABLE IF NOT EXISTS `medecinaeffacer` (
`idMedecin` int(11)
,`dateDebutLog` datetime
,`dateFinLog` datetime
);

-- --------------------------------------------------------

--
-- Structure de la table `medecinarchive`
--

DROP TABLE IF EXISTS `medecinarchive`;
CREATE TABLE IF NOT EXISTS `medecinarchive` (
  `idMedecin` int(11) NOT NULL AUTO_INCREMENT,
  `dateNaiss` year(4) NOT NULL,
  `dateCreationCompte` date NOT NULL,
  PRIMARY KEY (`idMedecin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecinarchive`
--

INSERT INTO `medecinarchive` (`idMedecin`, `dateNaiss`, `dateCreationCompte`) VALUES
(1, 1976, '2021-11-10'),
(3, 1998, '2021-11-12');

-- --------------------------------------------------------

--
-- Structure de la table `medecinproduit`
--

DROP TABLE IF EXISTS `medecinproduit`;
CREATE TABLE IF NOT EXISTS `medecinproduit` (
  `idMedecin` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Heure` time NOT NULL,
  PRIMARY KEY (`idMedecin`,`idProduit`,`Date`,`Heure`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medecinproduitarchive`
--

DROP TABLE IF EXISTS `medecinproduitarchive`;
CREATE TABLE IF NOT EXISTS `medecinproduitarchive` (
  `idMedecin` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time(6) NOT NULL,
  PRIMARY KEY (`idMedecin`,`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecinproduitarchive`
--

INSERT INTO `medecinproduitarchive` (`idMedecin`, `idProduit`, `date`, `heure`) VALUES
(1, 6, '2021-11-10', '23:47:21.000000'),
(1, 8, '2021-11-02', '23:47:00.000000'),
(3, 5, '2021-11-02', '23:34:06.000000'),
(3, 6, '2018-08-15', '16:08:58.000000');

-- --------------------------------------------------------

--
-- Structure de la table `medecinvisio`
--

DROP TABLE IF EXISTS `medecinvisio`;
CREATE TABLE IF NOT EXISTS `medecinvisio` (
  `idMedecin` int(11) NOT NULL,
  `idVisio` int(11) NOT NULL,
  `dateInscription` date NOT NULL,
  PRIMARY KEY (`idMedecin`,`idVisio`),
  KEY `idVisio` (`idVisio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `medecinvisioarchive`
--

DROP TABLE IF EXISTS `medecinvisioarchive`;
CREATE TABLE IF NOT EXISTS `medecinvisioarchive` (
  `idMedecin` int(11) NOT NULL,
  `idVisio` int(11) NOT NULL,
  `dateInscription` date NOT NULL,
  PRIMARY KEY (`idMedecin`,`idVisio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecinvisioarchive`
--

INSERT INTO `medecinvisioarchive` (`idMedecin`, `idVisio`, `dateInscription`) VALUES
(1, 1, '2021-11-09'),
(1, 2, '2021-11-08'),
(3, 1, '2021-11-08'),
(3, 2, '2018-12-18');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `objectif` mediumtext NOT NULL,
  `information` mediumtext NOT NULL,
  `effetIndesirable` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `objectif`, `information`, `effetIndesirable`) VALUES
(4, 'doliprane', 'douleur et fievre', 'cachet', 'Mal'),
(5, 'smecta', 'diahrée', 'cachet', 'mal de crane'),
(6, 'Antibiotique', 'éliminer les bactérie ', 'cachet', 'fievre'),
(7, 'coucous', 'nourrir/guerrir', 'nourriture', 'riche en cholesterol'),
(8, 'produit magique', 'guérit tout ', 'cachet', 'aucun');

-- --------------------------------------------------------

--
-- Structure de la table `visioconference`
--

DROP TABLE IF EXISTS `visioconference`;
CREATE TABLE IF NOT EXISTS `visioconference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomVisio` varchar(100) DEFAULT NULL,
  `objectif` text,
  `url` varchar(100) DEFAULT NULL,
  `dateVisio` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visioconference`
--

INSERT INTO `visioconference` (`id`, `nomVisio`, `objectif`, `url`, `dateVisio`) VALUES
(1, 'dkjwfhwdfh', 'hfbyvihdqwfiyub', 'qrujgiuqhiuh', '2018-11-15'),
(2, 'rfhtrh', 'svvsvb', 'dqfgrt', '2021-11-24');

-- --------------------------------------------------------

--
-- Structure de la vue `medecinaeffacer`
--
DROP TABLE IF EXISTS `medecinaeffacer`;

DROP VIEW IF EXISTS `medecinaeffacer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`gsbExtraNet`@`%` SQL SECURITY DEFINER VIEW `medecinaeffacer`  AS  select `historiqueconnexion`.`idMedecin` AS `idMedecin`,`historiqueconnexion`.`dateDebutLog` AS `dateDebutLog`,`historiqueconnexion`.`dateFinLog` AS `dateFinLog` from `historiqueconnexion` group by `historiqueconnexion`.`idMedecin` having (timestampdiff(YEAR,max(`historiqueconnexion`.`dateDebutLog`),now()) >= 3) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `historiqueconnexion`
--
ALTER TABLE `historiqueconnexion`
  ADD CONSTRAINT `historiqueconnexion_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`);

--
-- Contraintes pour la table `historiqueconnexionarchive`
--
ALTER TABLE `historiqueconnexionarchive`
  ADD CONSTRAINT `fk_idmedecin` FOREIGN KEY (`id`) REFERENCES `medecinarchive` (`idMedecin`);

--
-- Contraintes pour la table `medecinproduit`
--
ALTER TABLE `medecinproduit`
  ADD CONSTRAINT `medecinproduit_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `medecinproduit_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `medecinproduitarchive`
--
ALTER TABLE `medecinproduitarchive`
  ADD CONSTRAINT `fk_medecinproduit` FOREIGN KEY (`idMedecin`) REFERENCES `medecinarchive` (`idMedecin`);

--
-- Contraintes pour la table `medecinvisio`
--
ALTER TABLE `medecinvisio`
  ADD CONSTRAINT `medecinvisio_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `medecinvisio_ibfk_2` FOREIGN KEY (`idVisio`) REFERENCES `visioconference` (`id`);

--
-- Contraintes pour la table `medecinvisioarchive`
--
ALTER TABLE `medecinvisioarchive`
  ADD CONSTRAINT `fk_medecinvisio` FOREIGN KEY (`idMedecin`) REFERENCES `medecinarchive` (`idMedecin`);

DELIMITER $$
--
-- Évènements
--
DROP EVENT `Medecin a effacer`$$
CREATE DEFINER=`gsbExtraNet`@`%` EVENT `Medecin a effacer` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-10-08 16:40:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

DELETE FROM medecinproduit WHERE idMedecin IN(SELECT idMedecin FROM medecinaeffacer);

DELETE FROM medecinvisio WHERE idMedecin IN(SELECT idMedecin FROM medecinaeffacer);

CREATE TABLE Temporaire SELECT * FROM medecinaeffacer;

DELETE FROM historiqueconnexion WHERE idMedecin IN(SELECT idMedecin FROM medecinaeffacer);

DELETE FROM medecin WHERE id IN(SELECT idMedecin FROM Temporaire);

DROP TABLE Temporaire;

END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
