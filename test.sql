-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2024 at 12:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `surname` varchar(127) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Pracownik','Kierownik','Administrator') NOT NULL DEFAULT 'Pracownik',
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `password`, `role`, `active`) VALUES
(1, 'Jannoweeee', 'Kowalski', 'jan@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$ekJoMy5GS0hnaVZ6UWR3UA$ggFwh1FV5TJrOnzKOa0rJaZJVo69UY11VnNHJDrwglg', 'Administrator', 0),
(2, '', '', '', '$2y$10$Q8/ckn4FCp2dk0GRn3f9gu3Uf6jD23eeHhi9Q/N9m0Kcvi//SMTAq', '', 0),
(3, 'Piotr', 'Piotrowiczek', 'piotr@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$VzdpUWhOVVl6bnRKZWZUQg$1WOnLdvdP+2dXxXC9LxxDn+CiZH+0BHOxqcm8XA8m5c', 'Pracownik', 0),
(6, 'Testowicz', 'Testowiak', 'testowy@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$WTQzaC9CamFvRmVLQnpKMg$e7MKeHVoR6fgJOWPv/WAAdGSkkqfFv/b+qR171O9ECk', 'Kierownik', 0),
(7, 'testo', 'Wironik', 'testowiak@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$RTlQeWNLWXNkd0QzYmRUOA$ubQsTw+cxNIQcZ64i3gu1wZVClacC50/WBLM2/ClU5Q', 'Pracownik', 0),
(8, 'Test', 'test', 'test@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$TzNBT0lvQmFjZXVCRS5tVg$0qS5xlF5m4wFIVs+/Jsoa/bL4XgV51kCtoeigMbXYcA', 'Administrator', 0),
(11, 'Testpracownik', 'Prrrrrrrrr', 'Testpracownik@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$a0dVYWxoSUdZTXZWMkhnZg$d0dxuNclxzgU5vzZe7MgAo3WhZIQMT7yPeYJ7jOTihM', 'Pracownik', 0),
(12, 'Testkierownikee', 'Kierownik', 'Testkierownik@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$TERVQlM2Z2hRRTVhalVhaQ$Us+fjYcBDTYWujN4DIUxyGApBCw8OdU9xDDbKAQmhM8', 'Kierownik', 0),
(13, 'TestAdmin', 'Adminiski', 'Testadmin@02.pl', '$argon2id$v=19$m=65536,t=4,p=1$Lnk5RnJPaHpRYzBrMm9pNQ$mhRIppK4wNWqOTH2VYJtdEzSXxnfPmLj4p3/gsJESwM', 'Administrator', 0),
(14, 'testsesji', 'sejssw', 'sesja@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$cHdxdnNJUGhiUllNaHY2cQ$zcOwM8CeG0uuB+1ZZAMB8Jn7DVohtHMwg8CW9Wp2gmo', 'Pracownik', 0),
(15, 'Tomasz', 'lisek', 'lisek@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$cm44UEdBN29JUGVXSGNpQg$GrtiscPRGeZTPmHTiRYdxUOxxTU3n+3mBKPpniVS0xU', 'Kierownik', 0),
(16, 'nowyadmin', 'adadadadad', 'Testadmin1@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$LjhVS3k1S3pYNnVjOVIzYg$X1QD0cWc+DW20k8/n4Y+CsWbDJ3uNsLv46PTzDCWNmY', 'Administrator', 0),
(17, 'adadadad', 'adadadadad', 'admin12@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$OGY2alB3Rkx0VlR5RDRveA$ThWftGhzUoAGBmxCAj4bl4HVra9aB3znUUWPHnZX6gg', 'Administrator', 0),
(18, 'adadadadadad', 'adadsadasd', 'eee@o2.pl', '$argon2id$v=19$m=65536,t=4,p=1$OVlnVUtZN3dCNDhucU8ybw$MWNlxD6iuJtMD6lpb6g/oP+KgFlqkrzX0XWGJatoPOQ', 'Administrator', 0),
(19, 'adadadad', 'adadadasd', 'wp@wp.pl', '$argon2id$v=19$m=65536,t=4,p=1$eXU5QWVaTVpkY1h2SjZGZQ$lHdRrA7lH0n+hhjOXzY2AAQxeUMtN1IxxjBR6gNkm3M', 'Kierownik', 0);

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `id` int(11) NOT NULL,
  `calendar` date NOT NULL,
  `year` smallint(6) NOT NULL,
  `month` smallint(6) NOT NULL,
  `day` smallint(6) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `hours` tinyint(4) NOT NULL,
  `comment_user` text DEFAULT NULL,
  `comment_superviser` text DEFAULT NULL,
  `comment_admin` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `calendar`, `year`, `month`, `day`, `id_worker`, `hours`, `comment_user`, `comment_superviser`, `comment_admin`) VALUES
(1, '2024-06-04', 2024, 6, 4, 5, 21, '', 'yyyyyyyyyyyyyyyyy', ''),
(2, '2024-06-06', 2024, 6, 6, 4, 7, 'komentarz usera', 'komentarz kirasa', 'komentarz admina'),
(3, '2024-06-11', 2024, 6, 0, 1, 22, '', 'aaaaaaaaaaaaaaaaaaaaaa', 'adadadadada'),
(11, '2024-06-22', 2024, 6, 22, 15, 5, '', 'taki normlany dzien', ''),
(12, '2024-06-23', 2024, 6, 23, 11, 5, 'adkaodkakd', 'a', 'e'),
(5, '2024-06-27', 2024, 6, 7, 0, 0, '', 'jjjjjjjjjjjjjjjkkjkjkjjk', 'eaesssss'),
(6, '2024-06-27', 2024, 6, 27, 1, 8, '', 'njinijnibubuivyv', ''),
(7, '2024-06-27', 2024, 6, 0, 2, 2, '', 'ttttttttttttttttttttttttttttttttt', ''),
(8, '2024-06-29', 2024, 6, 29, 1, 12, '', '123123', ''),
(9, '2024-11-28', 2024, 11, 28, 2, 2, '', 'afafafafafaf', '1234555'),
(10, '2024-12-12', 2024, 2, 12, 3, 9, '', 'ibibbuuguuyuy', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_email` (`email`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`calendar`,`id_worker`),
  ADD UNIQUE KEY `nibyglowny` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
