

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pardavimai`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `ikelimo_data` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pardavimo_id` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `biudzetas`
--

CREATE TABLE `biudzetas` (
  `id` bigint NOT NULL,
  `faktiskai_uzaktuota_sumafms` float NOT NULL,
  `menesio_biudzetas_ukio` float NOT NULL,
  `menuo` varchar(255) DEFAULT NULL,
  `metai` varchar(255) DEFAULT NULL,
  `businessunit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `businessunit`
--

CREATE TABLE `businessunit` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `businessunit`
--

INSERT INTO `businessunit` (`id`, `name`) VALUES
(1, 'Ukis 1'),
(2, 'Ukis 2'),
(3, 'Ukis 3'),
(4, 'Ukis 4'),
(5, 'Ukis 5'),
(6, 'Ukis 6'),
(7, 'Ukis 7'),
(8, 'Ukis 8');

-- --------------------------------------------------------

--
-- Table structure for table `komentarai`
--

CREATE TABLE `komentarai` (
  `id` bigint NOT NULL,
  `komentaras` varchar(255) DEFAULT NULL,
  `komentaro_data` varchar(255) DEFAULT NULL,
  `pardavimo_id` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `menesioplanas`
--

CREATE TABLE `menesioplanas` (
  `id` bigint NOT NULL,
  `planas_elektra` float NOT NULL,
  `planas_menuo` int DEFAULT NULL,
  `planas_metai` int DEFAULT NULL,
  `planas_santechnika` float NOT NULL,
  `planas_statyba` float NOT NULL,
  `businessunit_id` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `planas_kiti` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `pardavimailent`
--

CREATE TABLE `pardavimailent` (
  `id` int NOT NULL,
  `darbu_pavadinimas` varchar(255) DEFAULT NULL,
  `darbu_tipas` varchar(255) DEFAULT NULL,
  `ketvirtis` varchar(255) DEFAULT NULL,
  `metai` varchar(255) DEFAULT NULL,
  `objekto_pavadinimas` varchar(255) DEFAULT NULL,
  `pagrindas_patvirtintas` varchar(255) DEFAULT NULL,
  `pasirinktas_rangovas` varchar(255) DEFAULT NULL,
  `planuojama_atlikimo_data` varchar(255) DEFAULT NULL,
  `pristatomu_darbu_kaina_preliminari` float NOT NULL,
  `sprendimo_priemimo_budas` varchar(255) DEFAULT NULL,
  `sprendimo_priemimo_data` varchar(255) DEFAULT NULL,
  `sutartine_suma_tiksli` float NOT NULL,
  `ticketfmsid` int DEFAULT NULL,
  `useris_id` bigint DEFAULT NULL,
  `planuojama_atlikimo_data2` varchar(255) DEFAULT NULL,
  `sutartine_suma_tiksli2` float NOT NULL,
  `ticketfmsid2` int DEFAULT NULL,
  `bunitas_id` int DEFAULT NULL,
  `planuojama_atlikimo_data3` varchar(255) DEFAULT NULL,
  `planuojama_atlikimo_data4` varchar(255) DEFAULT NULL,
  `sutartine_suma` float NOT NULL,
  `sutartine_suma_tiksli3` float NOT NULL,
  `sutartine_suma_tiksli4` float NOT NULL,
  `ticketfmsid3` int DEFAULT NULL,
  `ticketfmsid4` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responsekoment`
--

CREATE TABLE `responsekoment` (
  `id` bigint NOT NULL,
  `komentaras` varchar(255) DEFAULT NULL,
  `komentaro_data` varchar(255) DEFAULT NULL,
  `komentarofor_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER'),
(3, 'ROLE_SUPERUSER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `active` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pavarde` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `vardas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `active`, `password`, `pavarde`, `username`, `vardas`) VALUES
(8, b'0', '$2a$10$rCapGWlwVd5KzYeU1Feiu.LQ9MXDcIlL.ayRd7xzHQjiMjathjSC.', 'Petrauskas', 'jonasjonas', 'Jonas'); -- password "jonajonas"

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `users_id` bigint NOT NULL,
  `roles_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`users_id`, `roles_id`) VALUES
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_unitas`
--

CREATE TABLE `user_unitas` (
  `user1_id` bigint NOT NULL,
  `unitas_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_unitas`
--

INSERT INTO `user_unitas` (`user1_id`, `unitas_id`) VALUES
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpmfprnchcd3fj2yvxv37k4coc` (`pardavimo_id`),
  ADD KEY `FKpmyahjnron626vxiu3ji2a5pt` (`user_id`);

--
-- Indexes for table `biudzetas`
--
ALTER TABLE `biudzetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnrn9cxnoojhfiatrqo1dskwns` (`businessunit_id`);

--
-- Indexes for table `businessunit`
--
ALTER TABLE `businessunit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq6hu3ujewe9trqjnmvjgoqvqn` (`pardavimo_id`),
  ADD KEY `FK1ion5ncf4hhqwfmmpgwl4hxpy` (`user_id`);

--
-- Indexes for table `menesioplanas`
--
ALTER TABLE `menesioplanas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp5mqa62cjskigbjpkfk1d9qpj` (`businessunit_id`),
  ADD KEY `FKexq13h8jwa7ryt2gi4skujy0c` (`user_id`);

--
-- Indexes for table `pardavimailent`
--
ALTER TABLE `pardavimailent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2o3heuu4dpjgg2u8y56ysd020` (`useris_id`),
  ADD KEY `FK1jhsumg0wnypp8ua9u31c61b1` (`bunitas_id`);

--
-- Indexes for table `responsekoment`
--
ALTER TABLE `responsekoment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgvqdkcah34yw27w89ctyjdtxy` (`komentarofor_id`),
  ADD KEY `FKrult3qcsgfbbbuxg4240h7eji` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`users_id`,`roles_id`),
  ADD KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`);

--
-- Indexes for table `user_unitas`
--
ALTER TABLE `user_unitas`
  ADD PRIMARY KEY (`user1_id`,`unitas_id`),
  ADD KEY `FK7fbl1rd4aiyi2f2r4ytkeepn6` (`unitas_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `biudzetas`
--
ALTER TABLE `biudzetas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `businessunit`
--
ALTER TABLE `businessunit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `komentarai`
--
ALTER TABLE `komentarai`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menesioplanas`
--
ALTER TABLE `menesioplanas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pardavimailent`
--
ALTER TABLE `pardavimailent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `responsekoment`
--
ALTER TABLE `responsekoment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `FKpmfprnchcd3fj2yvxv37k4coc` FOREIGN KEY (`pardavimo_id`) REFERENCES `pardavimailent` (`id`),
  ADD CONSTRAINT `FKpmyahjnron626vxiu3ji2a5pt` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `biudzetas`
--
ALTER TABLE `biudzetas`
  ADD CONSTRAINT `FKnrn9cxnoojhfiatrqo1dskwns` FOREIGN KEY (`businessunit_id`) REFERENCES `businessunit` (`id`);

--
-- Constraints for table `komentarai`
--
ALTER TABLE `komentarai`
  ADD CONSTRAINT `FK1ion5ncf4hhqwfmmpgwl4hxpy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKq6hu3ujewe9trqjnmvjgoqvqn` FOREIGN KEY (`pardavimo_id`) REFERENCES `pardavimailent` (`id`);

--
-- Constraints for table `menesioplanas`
--
ALTER TABLE `menesioplanas`
  ADD CONSTRAINT `FKexq13h8jwa7ryt2gi4skujy0c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKp5mqa62cjskigbjpkfk1d9qpj` FOREIGN KEY (`businessunit_id`) REFERENCES `businessunit` (`id`);

--
-- Constraints for table `pardavimailent`
--
ALTER TABLE `pardavimailent`
  ADD CONSTRAINT `FK1jhsumg0wnypp8ua9u31c61b1` FOREIGN KEY (`bunitas_id`) REFERENCES `businessunit` (`id`),
  ADD CONSTRAINT `FK2o3heuu4dpjgg2u8y56ysd020` FOREIGN KEY (`useris_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `responsekoment`
--
ALTER TABLE `responsekoment`
  ADD CONSTRAINT `FKgvqdkcah34yw27w89ctyjdtxy` FOREIGN KEY (`komentarofor_id`) REFERENCES `komentarai` (`id`),
  ADD CONSTRAINT `FKrult3qcsgfbbbuxg4240h7eji` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK7ecyobaa59vxkxckg6t355l86` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKj9553ass9uctjrmh0gkqsmv0d` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_unitas`
--
ALTER TABLE `user_unitas`
  ADD CONSTRAINT `FK3ouqvx73jwvvcxhfgvtoj2ogo` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK7fbl1rd4aiyi2f2r4ytkeepn6` FOREIGN KEY (`unitas_id`) REFERENCES `businessunit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
