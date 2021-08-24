CREATE TABLE `chats` (
  `util1` int(11) NOT NULL,
  `util2` int(11) NOT NULL,
  `chat` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `chats` (`util1`, `util2`, `chat`) VALUES
(35, 36, ''),
(34, 35, 0x7b226d65737361676573223a5b5d7d),
(34, 36, ''),
(37, 34, 0x7b226d65737361676573223a5b5d7d);

CREATE TABLE `files` (
  `fileId` int(11) NOT NULL,
  `fileName` varchar(100) COLLATE utf8_bin NOT NULL,
  `mimeType` varchar(50) COLLATE utf8_bin NOT NULL,
  `file` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `userChatbot` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `userChatbot` (`id`, `nombre`, `email`) VALUES (34, 'Utilisateur1', 'util1@email.com');
INSERT INTO `userChatbot` (`id`, `nombre`, `email`) VALUES (35, 'Utilisateur2', 'util2@email.com');
INSERT INTO `userChatbot` (`id`, `nombre`, `email`) VALUES (36, 'Util1', 'util11@email.com');
INSERT INTO `userChatbot` (`id`, `nombre`, `email`) VALUES (37, 'Util2', 'util@email.com');

ALTER TABLE `chats`
  ADD KEY `foreign key` (`util1`),
  ADD KEY `foreign key2` (`util2`);

ALTER TABLE `files`
  ADD PRIMARY KEY (`fileId`);

ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`) USING HASH,
  ADD UNIQUE KEY `nom_unique` (`nom`) USING HASH;

ALTER TABLE `files`
  MODIFY `fileId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

ALTER TABLE `chats`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`util1`) REFERENCES `utilisateurs` (`id`),
  ADD CONSTRAINT `foreign key2` FOREIGN KEY (`util2`) REFERENCES `utilisateurs` (`id`);
COMMIT;