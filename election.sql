-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2023 at 06:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `election`
--

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `uid` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp_code` int(11) NOT NULL,
  `otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `uid`, `email`, `otp_code`, `otp`) VALUES
(201, 124629, 'ashish.181406@ncit.edu.np', 487828, 487828),
(202, 1, 'sanisamhrzn@gmail.com', 890708, 890708),
(203, 2, 'aryanashish223@gmail.com', 299417, 299417),
(204, 2, 'aryanashish223@gmail.com', 600510, 0),
(205, 2, 'aryanashish223@gmail.com', 599815, 599815);

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `sid` int(15) NOT NULL,
  `rid` int(10) NOT NULL,
  `status` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`sid`, `rid`, `status`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role` varchar(25) NOT NULL,
  `rid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role`, `rid`) VALUES
('admin', 1),
('user', 2),
('candidate', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` double NOT NULL,
  `gender` varchar(255) NOT NULL,
  `faculty` varchar(25) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `agenda` varchar(255) DEFAULT NULL,
  `vote` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `rid`, `name`, `email`, `phone`, `gender`, `faculty`, `image`, `agenda`, `vote`) VALUES
(1, 1, 'Sanisa Maharjan', 'sanisamhrzn@gmail.com', 9860663574, 'Female', 'BEIT', 'images/9860663574.jpg', NULL, 0),
(2, 1, 'Ashish Sapkota', 'aryanashish223@gmail.com', 9840066162, 'Male', 'BEIT', 'images/9840066162.jpg', NULL, 0),
(124626, 2, 'Sanisha Maharjan', 'sanishamaharjan36@gmail.com', 9808429418, 'Female', 'BEIT', 'images/9808429418.jpg', '', 0),
(124627, 2, 'Preeti Acharya', 'sanishamaharjan1@gmail.com', 9852346454, 'Female', 'BCA', 'images/9852346454.jpg', '', 0),
(124628, 2, 'Seokjin Kim', 'sanisha.181436@ncit.edu.np', 9852364198, 'Male', 'BEIT', 'images/9852364198.jpg', '', 0),
(124629, 3, 'Ashish Sapkota', 'ashish.181406@ncit.edu.np', 9841748195, 'Male', 'BEIT', 'images/9841748195.jpg', 'Every voice will be heard', 1),
(124630, 3, 'Sadika Kasaju', 'sadhika.181432@ncit.edu.np', 9852348406, 'Female', 'Civil', 'images/9852348406.jpg', 'lets work together', 0),
(124631, 3, 'Sarita Subedi', 'sarita@gmail.comm', 9852679451, 'Female', 'Software', 'images/9852679451.jpg', 'work smarter not harder', 0),
(124632, 3, 'Bipul Chaudharyy', 'bipul@gmail.comm', 9861854248, 'Male', 'BCA', 'images/9861854248.jpg', 'lets work together towards success', 0),
(124633, 2, 'Rajan Chaudhary', 'rajan.181428@ncit.edu.np', 9854364546, 'Male', 'Civil', 'images/9854364546.jpg', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `vote_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id`, `uid`, `name`, `vote_count`) VALUES
(19, 124629, 'Ashish Sapkota', 1),
(20, 124630, 'Sadika Kasaju', 0),
(21, 124631, 'Sarita Subedi', 0),
(22, 124632, 'Bipul Chaudharyy', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD UNIQUE KEY `rid` (`rid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `rid_2` (`rid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124635;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
