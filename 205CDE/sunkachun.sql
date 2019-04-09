-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2019 at 06:20 AM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sunkachun`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `artid` int(11) NOT NULL,
  `content` text NOT NULL,
  `userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`artid`, `content`, `userid`) VALUES
(1, 'Hello world!Hello world!', 3);

-- --------------------------------------------------------

--
-- Table structure for table `bookcomment`
--

CREATE TABLE `bookcomment` (
  `commentid` int(200) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `bookid` int(10) NOT NULL,
  `userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookcomment`
--

INSERT INTO `bookcomment` (`commentid`, `comment`, `bookid`, `userid`) VALUES
(15, 'love', 7, 3),
(16, 'now don\'t like', 7, 3),
(17, ':((((((', 5, 4),
(18, 'love', 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bookif`
--

CREATE TABLE `bookif` (
  `bookid` int(200) NOT NULL,
  `bookname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookif`
--

INSERT INTO `bookif` (`bookid`, `bookname`) VALUES
(1, 'Artemis'),
(2, 'Aurora'),
(3, 'Before Mars'),
(4, 'Hyperion'),
(5, 'Provenance'),
(6, 'Red Moon'),
(7, 'Superman'),
(8, 'The Martian'),
(9, 'The book and the sward'),
(10, 'Cats Lair'),
(11, 'The combat codes'),
(12, 'Knuckle down'),
(13, 'Secret of the martial art master'),
(14, 'Seishinshuyo'),
(15, 'Tombyards butterflies'),
(16, 'Weight training'),
(17, 'The Empty Box and Zeroth Maria'),
(18, 'moonlight'),
(19, 'Student Council Discretion'),
(20, 'The niece of time'),
(21, 'The Melancholy of Haruhi Suzumiya'),
(22, 'Haganai'),
(23, 'Oreshura'),
(24, 'My Youth Romantic Comedy Is Wrong');

-- --------------------------------------------------------

--
-- Table structure for table `signin`
--

CREATE TABLE `signin` (
  `userid` int(10) NOT NULL,
  `email` text NOT NULL,
  `userpassword` text NOT NULL,
  `username` text NOT NULL,
  `age` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signin`
--

INSERT INTO `signin` (`userid`, `email`, `userpassword`, `username`, `age`) VALUES
(1, 'a', 'b', 'c', 'd'),
(2, '123', '123', '123', '123'),
(3, '123@123.com', '123', '123', '12'),
(4, '1234@123.com', '123', '123', '12'),
(5, '12345@123.com', '123', '123', '12'),
(6, '', '', '', ''),
(7, '1234567@123.com', '123', '1', '10'),
(8, '123456789@123.com', '123', '1', '10'),
(9, '123456789@123.com', '123', '1', '10'),
(10, '123456789@123.com', '123', '1', '10'),
(11, '1234567891@123.com', '123', '1', '10'),
(12, 'sdfsd123@asfasf.com', '123', '1', '10'),
(13, 'sdfsd123@asfasf.com', '123', '1', '10'),
(14, 'sdfsd123@asfasf.com', '123', '1', '10'),
(15, 'sdfsd123@asfasf.com', '1234', '1', '10'),
(16, 'sdfsd123@asfasf.com', '1234', '1', '10'),
(17, '144@123.com', '123', '144', '14'),
(18, '1234577@123.com', '123', '123', '12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`artid`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `bookcomment`
--
ALTER TABLE `bookcomment`
  ADD PRIMARY KEY (`commentid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `bookid_4` (`bookid`,`userid`),
  ADD KEY `bookid_5` (`bookid`),
  ADD KEY `bookid_6` (`bookid`,`userid`);

--
-- Indexes for table `bookif`
--
ALTER TABLE `bookif`
  ADD PRIMARY KEY (`bookid`);

--
-- Indexes for table `signin`
--
ALTER TABLE `signin`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `artid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bookcomment`
--
ALTER TABLE `bookcomment`
  MODIFY `commentid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `bookif`
--
ALTER TABLE `bookif`
  MODIFY `bookid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `signin`
--
ALTER TABLE `signin`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `signin` (`userid`);

--
-- Constraints for table `bookcomment`
--
ALTER TABLE `bookcomment`
  ADD CONSTRAINT `bookcomment_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `bookif` (`bookid`),
  ADD CONSTRAINT `bookcomment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `signin` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
