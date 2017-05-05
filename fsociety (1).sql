-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 Mai 2017 la 12:05
-- Versiune server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fsociety`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `acte`
--

CREATE TABLE `acte` (
  `id_act` int(11) NOT NULL,
  `tip` varchar(256) NOT NULL,
  `file` varchar(100) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `contract`
--

CREATE TABLE `contract` (
  `id_contract` int(11) NOT NULL,
  `data_angajarii` date NOT NULL,
  `ore` int(13) NOT NULL,
  `salar` int(11) NOT NULL,
  `id_user_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `levels`
--

CREATE TABLE `levels` (
  `id_level` int(11) NOT NULL,
  `level` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `logs`
--

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `id_user_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) NOT NULL,
  `nume` varchar(256) NOT NULL,
  `passwd` varchar(128) NOT NULL,
  `telefon` varchar(32) NOT NULL,
  `cnp` varchar(13) NOT NULL,
  `id_level_fk` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users_acte`
--

CREATE TABLE `users_acte` (
  `id_istoric` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_act` int(11) NOT NULL,
  `data_cerere` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acte`
--
ALTER TABLE `acte`
  ADD PRIMARY KEY (`id_act`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id_contract`),
  ADD KEY `id_user_fk2` (`id_user_fk`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user_fk` (`id_user_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level_fk` (`id_level_fk`);

--
-- Indexes for table `users_acte`
--
ALTER TABLE `users_acte`
  ADD PRIMARY KEY (`id_istoric`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_act` (`id_act`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acte`
--
ALTER TABLE `acte`
  MODIFY `id_act` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `id_user_fk2` FOREIGN KEY (`id_user_fk`) REFERENCES `users` (`id_user`);

--
-- Restrictii pentru tabele `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `id_user_fk` FOREIGN KEY (`id_user_fk`) REFERENCES `users` (`id_user`);

--
-- Restrictii pentru tabele `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `id_level_fk` FOREIGN KEY (`id_level_fk`) REFERENCES `levels` (`id_level`);

--
-- Restrictii pentru tabele `users_acte`
--
ALTER TABLE `users_acte`
  ADD CONSTRAINT `users_acte_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_acte_ibfk_2` FOREIGN KEY (`id_act`) REFERENCES `acte` (`id_act`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
