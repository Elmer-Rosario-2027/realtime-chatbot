-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 03 juil. 2021 à 13:57
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `webchat`
--

-- --------------------------------------------------------

--
-- Structure de la table `chats`
--

CREATE TABLE `chats` (
  `util1` int(11) NOT NULL,
  `util2` int(11) NOT NULL,
  `chat` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chats`
--

INSERT INTO `chats` (`util1`, `util2`, `chat`) VALUES
(35, 36, ''),
(34, 35, 0x7b226d65737361676573223a5b5d7d),
(34, 36, ''),
(37, 34, 0x7b226d65737361676573223a5b5d7d);

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

CREATE TABLE `files` (
  `fileId` int(11) NOT NULL,
  `fileName` varchar(100) COLLATE utf8_bin NOT NULL,
  `mimeType` varchar(50) COLLATE utf8_bin NOT NULL,
  `file` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `email` text NOT NULL,
  `mdp` text NOT NULL,
  `mimeType` varchar(50) NOT NULL,
  `photo` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `mdp`, `mimeType`, `photo`) VALUES
(34, 'Utilisateur1', 'util1@email.com', '215e277e242514063aa2de8a78a2bb2c3e2009693b0e3e8a936bde7dd2f5a7fb8aef008b546694473d40370d9c4e46f5efac48eee3e1d9c110032b1b84486ecc', 'image/png', 0000780000004e94382);
INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `mdp`, `mimeType`, `photo`) VALUES
(35, 'Utilisateur2', 'util2@email.com', '375f8cdebcd06011bb000b5657b5babecce4801765a90a480265a9740cbc5aa27478c2738619d8eeda8a9f2fd255e81c6897cc16b6ef4309e2286ba837e6ad3f', '', ''),
(36, 'Util1', 'util11@email.com', '375f8cdebcd06011bb000b5657b5babecce4801765a90a480265a9740cbc5aa27478c2738619d8eeda8a9f2fd255e81c6897cc16b6ef4309e2286ba837e6ad3f', '', ''),
(37, 'Util2', 'util@email.com', '315fdbbe01fa48d213a896a53cbc0846710d43472326b5cbac2d7abecf8bbf5c696e8515ea1eac61a2d0b3230062559b1c8719a3b64d75e222468a74a788c07d', '', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chats`
--
ALTER TABLE `chats`
  ADD KEY `foreign key` (`util1`),
  ADD KEY `foreign key2` (`util2`);

--
-- Index pour la table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`fileId`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`) USING HASH,
  ADD UNIQUE KEY `nom_unique` (`nom`) USING HASH;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `files`
--
ALTER TABLE `files`
  MODIFY `fileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`util1`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `foreign key2` FOREIGN KEY (`util2`) REFERENCES `utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
