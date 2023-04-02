-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : Dim 02 avr. 2023 à 19:06
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Esalaf`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pwd` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `user`, `pwd`) VALUES
(1, 'root', 0);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `telephone`) VALUES
(1, 'Laadaili', 'Aya', '0608824150'),
(2, 'Dahiry', 'Badr', '0608824150'),
(3, 'Aissatene', 'Nouhaila', '0618345678'),
(4, 'Ibrahimi', 'Nour', '0662774539'),
(5, 'zert', NULL, '345'),
(25, 'rima', 'hhhh', '0606060606'),
(30, 'nassima', 'ayoubi', '123456789'),
(31, 'nihal', 'eghiss', '1010101010');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_credit` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `montant_total` double NOT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `id_client`, `id_prod`, `id_credit`, `date_commande`, `montant_total`, `statut`) VALUES
(2, 2, 3, 5, '2022-02-15', 60.5, 'Expédiée'),
(3, 3, 3, 3, '2023-03-20', 345, 'Anullée'),
(4, 4, 5, 2, '2022-04-05', 22.75, 'En cours'),
(11, 25, 105, 105, '2022-03-20', 345.89, 'Payée'),
(12, 1, 1, 1, '2023-06-19', 345.87, 'Payée'),
(19, 31, 11, 11, '2012-02-03', 234, 'Livrée');

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE `credit` (
  `id_credit` int(11) NOT NULL,
  `montant` double DEFAULT NULL,
  `date_echeance` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `credit`
--

INSERT INTO `credit` (`id_credit`, `montant`, `date_echeance`) VALUES
(1, 15.99, '2022-07-01'),
(2, 30.5, '2022-08-15'),
(3, 5.99, '2022-09-10'),
(4, 30.56, '2003-05-16'),
(5, 25, '2022-11-20'),
(7, 345, '2013-04-26'),
(11, 234, '2022-12-05');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_prod` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` double NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_prod`, `nom`, `description`, `prix`, `stock`) VALUES
(1, 'Produit 1', 'Description du produit 1', 10.99, 50),
(2, 'Produit x', 'Description du produit x', 12.45, 3),
(3, 'produit3', 'description du produit 3', 34, 5667),
(4, 'Produit 4', 'Description du produit 4', 8.75, 75),
(5, 'Produit 5', 'Description du produit 5', 15, 30),
(11, 'Produit 11', 'Description du produit 11', 120.45, 332);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_credit` (`id_credit`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_prod` (`id_prod`) USING BTREE;

--
-- Index pour la table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id_credit`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_prod`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(45) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `credit`
--
ALTER TABLE `credit`
  MODIFY `id_credit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
