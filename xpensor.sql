-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2017 at 09:18 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xpensor`
--

-- --------------------------------------------------------

--
-- Table structure for table `group_gen`
--

CREATE TABLE `group_gen` (
  `gid` int(30) NOT NULL,
  `uid` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_gen`
--

INSERT INTO `group_gen` (`gid`, `uid`) VALUES
(2, 8),
(15, 8),
(3, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(16, 9),
(17, 9),
(18, 9),
(19, 9),
(20, 9),
(21, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `group_name`
--

CREATE TABLE `group_name` (
  `gid` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_name`
--

INSERT INTO `group_name` (`gid`, `name`, `created_by`, `created_on`) VALUES
(10, 'matheran', 'viraj', '2017-08-30 06:32:12'),
(11, 'matheran', 'viraj', '2017-08-30 06:33:08'),
(12, 'matheran', 'viraj', '2017-08-30 06:35:02'),
(13, 'matheran', 'viraj', '2017-08-30 06:36:17'),
(14, 'matheran', 'viraj', '2017-08-30 06:43:45'),
(15, 'matunga fries', 'riya', '2017-08-30 06:45:11'),
(16, 'matheran', 'viraj', '2017-08-30 23:24:12'),
(17, 'matheran', 'viraj', '2017-08-30 23:24:21'),
(18, 'matheran', 'viraj', '2017-08-30 23:25:09'),
(19, 'matheran', 'viraj', '2017-08-30 23:26:12'),
(20, 'matheran', 'viraj', '2017-08-30 23:27:57'),
(21, 'matheran', 'viraj', '2017-08-30 23:37:51');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `uid` int(30) NOT NULL,
  `gid` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `iou` int(30) NOT NULL,
  `uome` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_gen`
--

CREATE TABLE `personal_gen` (
  `pid` int(30) NOT NULL,
  `uid` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_gen`
--

INSERT INTO `personal_gen` (`pid`, `uid`) VALUES
(1, 2),
(27, 6),
(28, 6),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(16, 9),
(17, 9),
(18, 9),
(19, 9),
(20, 9),
(21, 9),
(22, 9),
(23, 9),
(24, 9),
(25, 9),
(26, 9),
(29, 9),
(30, 9),
(31, 9),
(32, 9),
(33, 9),
(34, 9),
(35, 9),
(36, 9),
(37, 9),
(38, 9),
(39, 9),
(40, 9);

-- --------------------------------------------------------

--
-- Table structure for table `personal_name`
--

CREATE TABLE `personal_name` (
  `pid` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `with_whom` varchar(50) NOT NULL,
  `status_cd` enum('Credit','Debit') NOT NULL,
  `status_sn` enum('Settled','Not Settled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_name`
--

INSERT INTO `personal_name` (`pid`, `name`, `created_on`, `amount`, `description`, `with_whom`, `status_cd`, `status_sn`) VALUES
(1, 'Vada Pav', '2017-08-25 14:23:58', 100, 'very tasty', 'jay', 'Credit', 'Not Settled'),
(3, 'Bday Party', '2017-08-30 20:15:11', 1500, 'Expenditure for moms birthday', 'Rutu', 'Debit', 'Not Settled'),
(6, 'Bday Party', '2017-09-02 19:59:17', 1500, 'Expenditure for moms birthday', 'Rutu', 'Debit', 'Not Settled'),
(7, 'Bday Party', '2017-09-02 21:06:11', 1500, 'Expenditure for moms birthday', 'Rutu', 'Debit', 'Not Settled'),
(8, 'hzhsh', '2017-09-02 21:06:54', 173, 'jzhxb', 'nxhdb', 'Credit', 'Not Settled'),
(9, 'Bday Party', '2017-09-02 21:11:07', 1500, 'Expenditure for moms birthday', 'Rutu', 'Debit', 'Not Settled'),
(10, 'sjjszjj', '2017-09-02 21:26:37', 234, 'jsjsnzn', 'jsjsn', 'Credit', 'Not Settled'),
(11, 'we tried gog', '2017-09-02 21:51:21', 454, 'ifivig', 'ifivic', 'Credit', 'Not Settled'),
(12, 'ccc', '2017-09-02 23:30:09', 133, 'nn', 'cc', 'Credit', 'Not Settled'),
(13, 'hznzkz', '2017-09-02 23:31:05', 24, 'kvkj', 'jznsh', 'Credit', 'Not Settled'),
(14, 'jJjzb', '2017-09-02 23:39:16', 344, 'hdhxj', 'hdndj', 'Credit', 'Not Settled'),
(15, 'Pizza', '2017-09-02 23:39:41', 500, 'tasty', 'Viraj', 'Credit', 'Not Settled'),
(16, '', '2017-09-02 23:40:18', 0, '', '', 'Credit', 'Not Settled'),
(17, '', '2017-09-02 23:40:22', 0, '', '', 'Credit', 'Not Settled'),
(18, 'Bday Party', '2017-09-03 00:18:58', 1500, 'Expenditure for moms birthday', 'Rutu', 'Debit', 'Not Settled'),
(19, 'Bday Party', '2017-09-03 00:21:56', 1500, 'Expenditure for moms birthday', 'Rutu', '', 'Not Settled'),
(20, 'Bday Party', '2017-09-03 00:34:53', 1500, 'Expenditure for moms birthday', 'Rutu', 'Credit', 'Not Settled'),
(21, 'vevsbdb', '2017-09-03 00:48:21', 114, 'dbdbeb', 'kymymyn', 'Debit', 'Not Settled'),
(22, 'bdndjdj', '2017-09-03 00:48:52', 45, 'hdjdn', 'zjdndn', 'Debit', 'Not Settled'),
(23, 'krjdj', '2017-09-03 01:17:15', 765, 'dbshshs', 'adqgab', 'Debit', 'Not Settled'),
(24, 'jsjskdk', '2017-09-03 03:07:53', 24, 'jdjxnn', 'jdjdndk', 'Debit', 'Not Settled'),
(25, 'jsnskzkkdbd', '2017-09-03 03:08:43', 766, 'kdndmck', 'kxhdnmdk', 'Credit', 'Not Settled'),
(26, '', '2017-09-03 03:16:41', 0, '', '', 'Credit', 'Not Settled'),
(29, '', '2017-09-03 03:20:07', 0, '', '', 'Debit', 'Not Settled'),
(28, '', '2017-09-03 03:20:21', 0, '', '', '', ''),
(28, '', '2017-09-03 03:20:28', 0, '', '', '', ''),
(30, 'jdjdjd', '2017-09-03 22:59:51', 23, 'kdkdkd', 'kskdkdk', 'Debit', 'Not Settled'),
(31, 'vadapav', '2017-09-04 05:47:50', 34, 'jdjdjd', 'jdjdjd', 'Credit', 'Not Settled'),
(32, 'pizza', '2017-09-04 05:49:46', 200, 'tasty', 'viraj', 'Credit', 'Not Settled'),
(33, 'c f f f ', '2017-09-04 06:44:31', 0, 'd d d ', 'f fbfb', 'Credit', 'Not Settled'),
(34, 'fofog', '2017-09-04 06:51:26', 54, 'lglg', 'lgphlg', 'Credit', 'Not Settled'),
(35, '', '2017-09-04 06:59:31', 0, '', '', 'Credit', 'Not Settled'),
(36, '', '2017-09-04 06:59:34', 0, '', '', 'Credit', 'Not Settled'),
(37, 'hdkxndj', '2017-09-08 03:57:49', 34, 'kdhdbdj', 'jdjdj', 'Debit', 'Not Settled'),
(38, 'dffdgdfgdfg', '2017-09-21 07:56:18', 34, 'sdfsdf', 'sdfsdfsdf', 'Credit', 'Not Settled'),
(39, 'dffdgdfgdfg', '2017-09-21 07:56:18', 34, 'sdfsdf', 'sdfsdfsdf', 'Credit', 'Not Settled'),
(40, 'yyyyyyyyyy', '2017-09-21 08:10:30', 56, 'hhhhhhh', 'rrrrrr', 'Debit', 'Not Settled');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tid` int(30) NOT NULL,
  `gid` int(30) NOT NULL,
  `uid` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` int(30) NOT NULL,
  `status` enum('Settled','Not Settled') NOT NULL,
  `with_me` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `retypepass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `email`, `phone`, `password`, `retypepass`) VALUES
(1, 'jay', 'jay.h@somaiya.edu', '9930955866', 'user', 'user'),
(2, 'viraj', 'shah.vp@somaiya.edu', '9821548766', 'www', 'www'),
(4, 'Jay Haria', 'jayharia@gmail.com', '9920955866', 'jayharia', 'jayharia'),
(5, 'riya', 'riapatil1997@gmail.com', '8108871671', 'user11', 'user11'),
(6, 'Jay', 'hariajay@gmail.com', '9876543210', 'hariajay123', 'hariajay123'),
(9, 'rfvdfvfdvdfv', '', '', '', ''),
(10, 'jdjabx', 'jdkanfm', '987371840', 'jay123', 'jay123'),
(11, 'risk', 'risk.me.at@gmail.com', '12345678', 'hotaf', 'hotaf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `group_gen`
--
ALTER TABLE `group_gen`
  ADD PRIMARY KEY (`gid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `group_name`
--
ALTER TABLE `group_name`
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD KEY `uid` (`uid`,`gid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `personal_gen`
--
ALTER TABLE `personal_gen`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `personal_name`
--
ALTER TABLE `personal_name`
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`,`gid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `group_gen`
--
ALTER TABLE `group_gen`
  MODIFY `gid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `personal_gen`
--
ALTER TABLE `personal_gen`
  MODIFY `pid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tid` int(30) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_gen`
--
ALTER TABLE `group_gen`
  ADD CONSTRAINT `group_gen_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `group_name`
--
ALTER TABLE `group_name`
  ADD CONSTRAINT `group_name_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `group_gen` (`gid`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `group_gen` (`gid`);

--
-- Constraints for table `personal_gen`
--
ALTER TABLE `personal_gen`
  ADD CONSTRAINT `personal_gen_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `personal_name`
--
ALTER TABLE `personal_name`
  ADD CONSTRAINT `personal_name_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `personal_gen` (`pid`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`gid`) REFERENCES `group_gen` (`gid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
