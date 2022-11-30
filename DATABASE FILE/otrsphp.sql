-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2022 at 02:19 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otrsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(10) NOT NULL,
  `first_fee` float NOT NULL,
  `second_fee` float NOT NULL,
  `free` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `archive`
--

INSERT INTO `archive` (`id`, `train_id`, `route_id`, `date`, `time`, `first_fee`, `second_fee`, `free`) VALUES
(303, 2, 4, '30-11-2022', '13:47', 123, 123, 0);

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `class` varchar(10) NOT NULL DEFAULT 'second',
  `no` int(11) NOT NULL DEFAULT '1',
  `seat` varchar(30) NOT NULL,
  `date` varchar(40) NOT NULL,
  `cancel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `payment_id`, `user_id`, `code`, `class`, `no`, `seat`, `date`, `cancel`) VALUES
(21, 18, 19, 1, '2020/018/1671', 'first', 8, 'F01 -F08', 'Tue, 11-Aug-2020 04:10:29 PM', 0),
(22, 20, 20, 5, '2020/020/126', 'first', 30, 'F01 - F30', 'Mon, 31-Aug-2020 11:36:57 PM', 0),
(23, 20, 21, 6, '2020/020/31816', 'first', 2, 'F31 - F32', 'Fri, 06-Nov-2020 10:10:44 PM', 0),
(24, 22, 22, 6, '2020/022/1176', 'second', 1, 'S001', 'Sun, 08-Nov-2020 02:08:07 PM', 0),
(25, 24, 23, 2, '2020/024/197', 'second', 2, 'S001 - S002', 'Sun, 15-Nov-2020 02:25:27 PM', 0),
(26, 26, 24, 8, '2021/026/1183', 'first', 4, 'F01 - F04', 'Fri, 17-Sep-2021 04:25:09 PM', 0),
(27, 98, 25, 7, '2021/098/198', 'first', 2, 'F001 - F002', 'Wed, 13-Oct-2021 05:17:54 AM', 0),
(28, 99, 26, 7, '2021/099/157', 'second', 1, 'S001', 'Wed, 13-Oct-2021 05:28:54 AM', 0),
(29, 100, 27, 7, '2021/0100/1134', 'second', 1, 'S001', 'Wed, 13-Oct-2021 05:39:18 AM', 0),
(30, 101, 39, 7, '2021/0101/1116', 'second', 1, 'S001', 'Wed, 13-Oct-2021 06:15:30 AM', 0),
(31, 102, 40, 7, '2021/0102/1502', 'first', 1, 'F001', 'Wed, 13-Oct-2021 06:18:10 AM', 0),
(32, 103, 43, 7, '2021/0103/1792', 'second', 2, 'S001 - S002', 'Wed, 13-Oct-2021 11:02:56 AM', 0),
(33, 103, 44, 8, '2021/0103/3809', 'second', 1, 'S003', 'Wed, 13-Oct-2021 02:21:40 PM', 0),
(34, 104, 45, 8, '2021/0104/1526', 'first', 2, 'F001 - F002', 'Wed, 13-Oct-2021 05:22:15 PM', 0),
(35, 132, 46, 8, '2022/0132/1419', 'first', 1, 'F01', 'Sun, 27-Nov-2022 06:16:22 PM', 1),
(36, 150, 48, 8, '2022/0133/1307', 'first', 1, 'F01', 'Sun, 27-Nov-2022 07:11:26 PM', 1),
(37, 136, 52, 8, '2022/0136/1187', 'first', 1, 'F01', 'Sun, 27-Nov-2022 07:21:37 PM', 1),
(38, 137, 54, 8, '2022/0137/147', 'first', 1, 'F01', 'Mon, 28-Nov-2022 06:34:35 AM', 0),
(39, 134, 56, 8, '2022/0134/1164', 'second', 1, 'S001', 'Mon, 28-Nov-2022 07:46:27 AM', 1),
(40, 141, 58, 8, '2022/0141/1128', 'first', 1, 'F01', 'Mon, 28-Nov-2022 07:51:59 AM', 1),
(41, 140, 59, 8, '2022/0140/1395', 'first', 1, 'F01', 'Mon, 28-Nov-2022 07:53:14 AM', 1),
(42, 146, 61, 8, '2022/0146/1731', 'first', 1, 'F01', 'Mon, 28-Nov-2022 07:55:19 AM', 0),
(43, 139, 63, 8, '2022/0139/1400', 'first', 1, 'F01', 'Mon, 28-Nov-2022 07:56:30 AM', 0),
(44, 289, 64, 8, '2022/0289/1587', 'first', 1, 'F01', 'Tue, 29-Nov-2022 02:59:06 PM', 0),
(45, 291, 65, 8, '2022/0291/1752', 'first', 23, 'F01 - F23', 'Tue, 29-Nov-2022 02:59:32 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(400) NOT NULL,
  `response` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `message`, `response`) VALUES
(1, 3, 'This is a demo test.', NULL),
(3, 6, 'Demo Test - 2', 'Are you sure that this is another test? '),
(8, 4, 'This is a feedback text', NULL),
(9, 6, 'Test Test Test Test Test', NULL),
(11, 8, 'This is a demo test for feedback sections!!!', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `loc` varchar(40) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`id`, `name`, `email`, `password`, `phone`, `address`, `loc`, `status`) VALUES
(1, 'Passenger One', 'pas1o@mail.com', '1f87051e29a6927b2e6651dfb9b66387', '0780100000', 'No. 20 Aiyeteju Street', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(2, 'Adelabu Simbiat', 'jobowonubi@otrs.com', '1526755d438e395e551f229a484f8a1d', '3000002000', 'No. 30 Tanke Ilorin', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(3, 'Passenger Two', 'pass2@mail.com', 'c3a19571f1271af5f27a9582377b7d4a', '1400000020', 'abrahamjasmine', 'f3fc8566140434f0a3f47303c62d5146.jpg', 0),
(4, 'Passenger Three', 'pass3@mail.com', '1dd76b458af8df200a097c5b061df9b1', '9000001000', 'No. 589 Ilorin', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(5, 'Passenger Four', 'pass4@mail.com', 'd780455a563c7c5dbfb74a51785ad949', '0000010020', 'Shagamu', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(6, 'Test Passenger', 'testpass@mail.com', 'abe1bcf64eb68c39847b962e8caadadf', '0000002000', 'Ilorin', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(7, 'Liam Moore', 'liamoore@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '7000000000', '7014 Allace Road', 'f3fc8566140434f0a3f47303c62d5146.jpg', 1),
(8, 'Demo Account', 'demoaccount@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '7800000000', '100 Demo Address', '404a6378027a553d980b99162a5b4ce8.png', 1),
(9, 'hakdoggimanhehe', 'ciceyi8382@probdd.com', '5f4dcc3b5aa765d61d8327deb882cf99', '09213981287', 'bulacant', '59749744354d6aab5e76692ed92c4909.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `date` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `passenger_id`, `schedule_id`, `amount`, `ref`, `date`) VALUES
(12, 4, 5, '520', 'oyki20masb', 'Tue, 11-Aug-2020 11:52:19 AM'),
(14, 4, 6, '23', 'oyki20masb', 'Tue, 11-Aug-2020 11:52:19 AM'),
(15, 3, 5, '1860', '5gtnjnzclw', 'Tue, 11-Aug-2020 12:48:38 PM'),
(16, 3, 6, '680', 'dzwl1488r0', 'Tue, 11-Aug-2020 01:08:20 PM'),
(18, 4, 8, '8080', 'hja9zvtmgk', 'Tue, 11-Aug-2020 01:12:58 PM'),
(19, 1, 18, '1080', '3TVSHVBQII', 'Tue, 11-Aug-2020 04:10:29 PM'),
(20, 5, 20, '120', '84JP4U5LKZ', 'Mon, 31-Aug-2020 11:36:57 PM'),
(21, 6, 20, '8080', 'VXIZSCHMOG', 'Fri, 06-Nov-2020 10:10:44 PM'),
(22, 6, 22, '1410', 'TDHRBZTZOH', 'Sun, 08-Nov-2020 02:08:07 PM'),
(23, 2, 24, '5050', '4TRM9FIFEV', 'Sun, 15-Nov-2020 02:25:27 PM'),
(24, 8, 26, '5260', '1QXPYSUTOI', 'Fri, 17-Sep-2021 04:25:09 PM'),
(25, 7, 98, '303', 'FIPJBLU5LC', 'Wed, 13-Oct-2021 05:17:54 AM'),
(26, 7, 99, '80', 'NKMGVH44QG', 'Wed, 13-Oct-2021 05:28:54 AM'),
(27, 7, 100, '51', 'NS5IEEK1HS', 'Wed, 13-Oct-2021 05:39:18 AM'),
(39, 7, 101, '56', 'OEPPIM6X9H', 'Wed, 13-Oct-2021 06:15:30 AM'),
(40, 7, 102, '107', 'M07FP4QTOV', 'Wed, 13-Oct-2021 06:18:10 AM'),
(43, 7, 103, '152', 'RITK5E5GDM', 'Wed, 13-Oct-2021 11:02:56 AM'),
(44, 8, 103, '76', 'H6CMTHBJUU', 'Wed, 13-Oct-2021 02:21:40 PM'),
(45, 8, 104, '324', 'KH70GOC8KO', 'Wed, 13-Oct-2021 05:22:15 PM'),
(46, 8, 132, '125', '56208IOLLC', 'Sun, 27-Nov-2022 06:16:22 PM'),
(48, 8, 133, '125', '4ULPBGO209', 'Sun, 27-Nov-2022 07:11:26 PM'),
(52, 8, 136, '125', 'OA7WZONDSC', 'Sun, 27-Nov-2022 07:21:37 PM'),
(54, 8, 137, '125', 'JPES49L769', 'Mon, 28-Nov-2022 06:34:35 AM'),
(56, 8, 134, '125', '6V16G98LKN', 'Mon, 28-Nov-2022 07:46:27 AM'),
(58, 8, 141, '125', 'UQ8UK7MC7R', 'Mon, 28-Nov-2022 07:51:59 AM'),
(59, 8, 140, '125', 'L3GOSGAVXL', 'Mon, 28-Nov-2022 07:53:14 AM'),
(61, 8, 146, '125', '5K2S17FN14', 'Mon, 28-Nov-2022 07:55:19 AM'),
(63, 8, 139, '125', 'EN1JXJ0FCG', 'Mon, 28-Nov-2022 07:56:30 AM'),
(64, 8, 289, '125', 'KGGE30HVMW', 'Tue, 29-Nov-2022 02:59:06 PM'),
(65, 8, 291, '4902', 'U6QIBW9OMO', 'Tue, 29-Nov-2022 02:59:32 PM');

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

CREATE TABLE `policy` (
  `id` int(20) NOT NULL,
  `entry` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `policy`
--

INSERT INTO `policy` (`id`, `entry`, `description`) VALUES
(9, 'Get your body temperature checked.', 'Upon entry, all passengers are subject to a body temperature check. Passengers with a temperature higher than 37.5 ï¿½C may be refused entry.'),
(10, 'Fill out the Health Declaration Form.', 'A health declaration form will be given to all passengers. Fill out all information completely and honestly.'),
(11, 'Board the ferry in an orderly manner.', 'Our Ferry Station will be boarding passengers by batch. There will be 20 passengers per batch. Long waiting time at the boarding gate is also discouraged. Port buses will be on standby to take you to the ship immediately.'),
(18, 'qqqqqqqqqq', 'asdaa'),
(19, 'qqqqqqqqqq', 'asdaa'),
(20, 'qqqqqqqqqq', 'asdaa'),
(21, 'asd', '2312312312313');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `start` varchar(100) NOT NULL,
  `stop` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `start`, `stop`) VALUES
(3, 'St Bawle', 'San Ghammea'),
(4, 'Hurstcracombe', 'Treeblooms'),
(5, 'Cape Onbac', 'Ringkya'),
(6, 'Treeblooms', 'Bridghamgascon'),
(7, 'Fort Hammits', 'Aux Cursbur'),
(8, 'Addersfield', 'Glenarm'),
(9, 'Peterbrugh', 'Ffestiniog'),
(10, 'Dawsbury', 'Blencathra'),
(11, 'Rutherglen', 'Tylwaerdreath'),
(12, 'Cirencester', 'Bournemouth'),
(13, 'Laencaster', 'Fournemouth'),
(14, 'Urmkirkey', 'Longdale'),
(15, 'Vlinginia', 'Onaginia'),
(16, 'Onaginia', 'Epleburgh'),
(17, 'Epleburgh', 'Kapwood'),
(18, 'Vlinginia', 'Oroville'),
(19, 'Vlinginia', 'Inaschester');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(10) NOT NULL,
  `first_fee` float NOT NULL,
  `second_fee` float NOT NULL,
  `free` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `first_seat` int(11) NOT NULL,
  `second_seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`id`, `name`, `first_seat`, `second_seat`) VALUES
(1, 'Kano Rails', 30, 800),
(2, 'British Railways', 20, 900),
(3, 'Wester Railways', 10, 600),
(7, 'Lagos Rails', 400, 1000),
(8, 'Marble Railways', 395, 780),
(9, 'Renfee R', 400, 850),
(10, 'Venice Express', 500, 1200),
(11, 'Orient Express', 200, 500),
(12, 'Phantom Express', 250, 600),
(13, 'Marshland Express', 300, 500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', 'D00F5D5217896FB7FD601412CB890830');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `schedule_id` (`schedule_id`,`user_id`,`payment_id`) USING BTREE,
  ADD KEY `schedule_id_2` (`schedule_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passenger_id` (`passenger_id`,`schedule_id`),
  ADD KEY `passenger_id_2` (`passenger_id`) USING BTREE,
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `train_id` (`train_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `policy`
--
ALTER TABLE `policy`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train`
--
ALTER TABLE `train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `archive`
--
ALTER TABLE `archive`
  ADD CONSTRAINT `archive_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `archive_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
