-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2017 at 01:38 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_jb`
--

-- --------------------------------------------------------

--
-- Table structure for table `main_posts`
--

CREATE TABLE `main_posts` (
  `id` bigint(25) NOT NULL,
  `wdyw` int(11) NOT NULL,
  `url` varchar(225) NOT NULL,
  `cat` varchar(225) DEFAULT NULL,
  `data` longtext NOT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_posts`
--

INSERT INTO `main_posts` (`id`, `wdyw`, `url`, `cat`, `data`, `views`, `date`) VALUES
(1, 1, 'blog-baru-rubi-jihantoro', 'programming', 'Blog baru rubi jihantoro(`,`)ini adalah blog baru rubi jihantoro, semoga dapet itu, amin dah,  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo. Duis aute irure dolor in reprehenderit in voluptate velit esse dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, sunt in culpa qui officia deserunt mollit anim id est laborum.(`,`)blogbaru.jpg', 14, '2017-07-10 02:02:22'),
(2, 2, 'blog-baru-rubi-jihantoro', '', 'Rubi(`,`)yasssss, this is awesome(`,`)jihantoro8@gmail.com', 0, '2017-07-10 01:19:56'),
(3, 2, 'blog-baru-rubi-jihantoro', NULL, 'Rubi(`,`)terimakaish(`,`)jihantoro8&#64;gmail.com', 0, '2017-07-10 01:36:40'),
(4, 2, 'blog-baru-rubi-jihantoro', NULL, 'jojo(`,`)etdah(`,`)jojo&#64;fa.fa', 0, '2017-07-10 01:38:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `main_posts`
--
ALTER TABLE `main_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `main_posts`
--
ALTER TABLE `main_posts`
  MODIFY `id` bigint(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
