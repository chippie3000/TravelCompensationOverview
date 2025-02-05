-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 24, 2021 at 08:45 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `companydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` bigint(20) NOT NULL,
  `workdays` double(2,1) NOT NULL,
  `transport_option` bigint(20) NOT NULL,
  `travel_distance` int(5) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `lastname`, `firstname`, `role`, `workdays`, `transport_option`, `travel_distance`) VALUES
(1, 'Palm', 'Arthur', 1, 5.0, 3, 3),
(2, 'Garcia', 'Rens', 5, 5.0, 1, 12),
(3, 'Johnson', 'Paul', 2, 5.0, 1, 40),
(4, 'Bakker', 'Martin', 4, 4.0, 3, 8),
(5, 'Visser', 'Jeroen', 3, 5.0, 3, 9),
(6, 'de Jong', 'Tineke', 4, 3.0, 3, 4),
(7, 'van den Berg', 'Amout', 2, 5.0, 4, 30),
(8, 'Janssen', 'Matthijs', 5, 4.5, 3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `title`) VALUES
(1, 'Back-end Engineer'),
(2, 'Data Engineer'),
(3, 'Data Scientist'),
(4, 'Software Engineer'),
(5, 'Front-end Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `transport_options`
--

DROP TABLE IF EXISTS `transport_options`;
CREATE TABLE IF NOT EXISTS `transport_options` (
  `transport_option_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transport_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transport_options`
--

INSERT INTO `transport_options` (`transport_option_id`, `name`) VALUES
(1, 'Car'),
(2, 'Bus'),
(3, 'Bike'),
(4, 'Train');

-- --------------------------------------------------------

--
-- Table structure for table `travel_compensation_history`
--

DROP TABLE IF EXISTS `travel_compensation_history`;
CREATE TABLE IF NOT EXISTS `travel_compensation_history` (
  `transport_compensation_history_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee` bigint(20) NOT NULL,
  `transport_option` bigint(20) NOT NULL,
  `compensation` double(10,2) NOT NULL,
  `process_date` date NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`transport_compensation_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `travel_compensation_history`
--

INSERT INTO `travel_compensation_history` (`transport_compensation_history_id`, `employee`, `transport_option`, `compensation`, `process_date`, `payment_date`) VALUES
(252, 3, 1, 160.00, '2020-03-01', '2020-03-03'),
(251, 2, 1, 48.00, '2020-03-01', '2020-03-03'),
(250, 1, 3, 60.00, '2020-03-01', '2020-03-03'),
(54, 5, 3, 360.00, '2018-02-01', '2018-02-03'),
(53, 4, 2, 64.00, '2018-02-01', '2018-02-03'),
(52, 3, 1, 240.00, '2018-02-01', '2018-02-03'),
(51, 2, 1, 48.00, '2018-02-01', '2018-02-03'),
(50, 1, 3, 60.00, '2018-02-01', '2018-02-03'),
(231, 6, 3, 48.00, '2019-12-01', '2019-12-03'),
(120, 7, 4, 230.00, '2018-10-01', '2018-10-03'),
(119, 6, 3, 48.00, '2018-10-01', '2018-10-03'),
(118, 5, 3, 360.00, '2018-10-01', '2018-10-03'),
(117, 4, 2, 64.00, '2018-10-01', '2018-10-03'),
(116, 3, 1, 240.00, '2018-10-01', '2018-10-03'),
(115, 2, 1, 48.00, '2018-10-01', '2018-10-03'),
(114, 1, 3, 60.00, '2018-10-01', '2018-10-03'),
(58, 1, 3, 60.00, '2018-03-01', '2018-03-03'),
(59, 2, 1, 48.00, '2018-03-01', '2018-03-03'),
(60, 3, 1, 240.00, '2018-03-01', '2018-03-03'),
(61, 4, 2, 64.00, '2018-03-01', '2018-03-03'),
(62, 5, 3, 360.00, '2018-03-01', '2018-03-03'),
(258, 1, 3, 60.00, '2020-04-01', '2020-04-03'),
(248, 7, 4, 300.00, '2020-02-01', '2020-02-03'),
(65, 8, 3, 396.00, '2018-03-01', '2018-03-03'),
(66, 1, 3, 60.00, '2018-04-01', '2018-04-03'),
(67, 2, 1, 48.00, '2018-04-01', '2018-04-03'),
(68, 3, 1, 240.00, '2018-04-01', '2018-04-03'),
(69, 4, 2, 64.00, '2018-04-01', '2018-04-03'),
(70, 5, 3, 360.00, '2018-04-01', '2018-04-03'),
(247, 6, 3, 48.00, '2020-02-01', '2020-02-03'),
(246, 5, 3, 360.00, '2020-02-01', '2020-02-03'),
(245, 4, 3, 256.00, '2020-02-01', '2020-02-03'),
(74, 1, 3, 60.00, '2018-05-01', '2018-05-03'),
(75, 2, 1, 48.00, '2018-05-01', '2018-05-03'),
(76, 3, 1, 240.00, '2018-05-01', '2018-05-03'),
(77, 4, 2, 64.00, '2018-05-01', '2018-05-03'),
(78, 5, 3, 360.00, '2018-05-01', '2018-05-03'),
(244, 3, 1, 160.00, '2020-02-01', '2020-02-03'),
(234, 1, 3, 60.00, '2020-01-01', '2020-01-03'),
(224, 7, 4, 300.00, '2019-11-01', '2019-11-03'),
(82, 1, 3, 60.00, '2018-06-01', '2018-06-03'),
(83, 2, 1, 48.00, '2018-06-01', '2018-06-03'),
(84, 3, 1, 240.00, '2018-06-01', '2018-06-03'),
(85, 4, 2, 64.00, '2018-06-01', '2018-06-03'),
(86, 5, 3, 360.00, '2018-06-01', '2018-06-03'),
(223, 6, 3, 48.00, '2019-11-01', '2019-11-03'),
(222, 5, 3, 360.00, '2019-11-01', '2019-11-03'),
(221, 4, 3, 256.00, '2019-11-01', '2019-11-03'),
(90, 1, 3, 60.00, '2018-07-01', '2018-07-02'),
(91, 2, 1, 48.00, '2018-07-01', '2018-07-02'),
(92, 3, 1, 240.00, '2018-07-01', '2018-07-02'),
(93, 4, 2, 64.00, '2018-07-01', '2018-07-02'),
(94, 5, 3, 360.00, '2018-07-01', '2018-07-02'),
(220, 3, 1, 160.00, '2019-11-01', '2019-11-03'),
(219, 2, 1, 48.00, '2019-11-01', '2019-11-03'),
(218, 1, 3, 60.00, '2019-11-01', '2019-11-03'),
(98, 1, 3, 60.00, '2018-08-01', '2018-08-03'),
(99, 2, 1, 48.00, '2018-08-01', '2018-08-03'),
(100, 3, 1, 240.00, '2018-08-01', '2018-08-03'),
(101, 4, 2, 64.00, '2018-08-01', '2018-08-03'),
(102, 5, 3, 360.00, '2018-08-01', '2018-08-03'),
(103, 6, 3, 48.00, '2018-08-01', '2018-08-03'),
(104, 7, 4, 230.00, '2018-08-01', '2018-08-03'),
(243, 2, 1, 48.00, '2020-02-01', '2020-02-03'),
(106, 1, 3, 60.00, '2018-09-01', '2018-09-03'),
(107, 2, 1, 48.00, '2018-09-01', '2018-09-03'),
(108, 3, 1, 240.00, '2018-09-01', '2018-09-03'),
(109, 4, 2, 64.00, '2018-09-01', '2018-09-03'),
(110, 5, 3, 360.00, '2018-09-01', '2018-09-03'),
(111, 6, 3, 48.00, '2018-09-01', '2018-09-03'),
(112, 7, 4, 230.00, '2018-09-01', '2018-09-03'),
(232, 7, 4, 300.00, '2019-12-01', '2019-12-03'),
(122, 1, 3, 60.00, '2018-11-01', '2018-11-03'),
(123, 2, 1, 48.00, '2018-11-01', '2018-11-03'),
(124, 3, 1, 240.00, '2018-11-01', '2018-11-03'),
(125, 4, 2, 64.00, '2018-11-01', '2018-11-03'),
(126, 5, 3, 360.00, '2018-11-01', '2018-11-03'),
(127, 6, 3, 48.00, '2018-11-01', '2018-11-03'),
(128, 7, 4, 230.00, '2018-11-01', '2018-11-03'),
(230, 5, 3, 360.00, '2019-12-01', '2019-12-03'),
(130, 1, 3, 60.00, '2018-12-01', '2018-12-03'),
(131, 2, 1, 48.00, '2018-12-01', '2018-12-03'),
(132, 3, 1, 240.00, '2018-12-01', '2018-12-03'),
(133, 4, 2, 64.00, '2018-12-01', '2018-12-03'),
(134, 5, 3, 360.00, '2018-12-01', '2018-12-03'),
(135, 6, 3, 48.00, '2018-12-01', '2018-12-03'),
(136, 7, 4, 230.00, '2018-12-01', '2018-12-03'),
(229, 4, 3, 256.00, '2019-12-01', '2019-12-03'),
(138, 1, 3, 60.00, '2019-01-01', '2019-01-03'),
(139, 2, 1, 48.00, '2019-01-01', '2019-01-03'),
(140, 3, 1, 240.00, '2019-01-01', '2019-01-03'),
(141, 4, 2, 64.00, '2019-01-01', '2019-01-03'),
(142, 5, 3, 360.00, '2019-01-01', '2019-01-03'),
(143, 6, 3, 48.00, '2019-01-01', '2019-01-03'),
(144, 7, 4, 230.00, '2019-01-01', '2019-01-03'),
(228, 3, 1, 160.00, '2019-12-01', '2019-12-03'),
(146, 1, 3, 60.00, '2019-02-01', '2019-02-03'),
(147, 2, 1, 48.00, '2019-02-01', '2019-02-03'),
(148, 3, 1, 160.00, '2019-02-01', '2019-02-03'),
(149, 4, 2, 64.00, '2019-02-01', '2019-02-03'),
(150, 5, 3, 360.00, '2019-02-01', '2019-02-03'),
(151, 6, 3, 48.00, '2019-02-01', '2019-02-03'),
(152, 7, 4, 300.00, '2019-02-01', '2019-02-03'),
(227, 2, 1, 48.00, '2019-12-01', '2019-12-03'),
(154, 1, 3, 60.00, '2019-03-01', '2019-03-03'),
(155, 2, 1, 48.00, '2019-03-01', '2019-03-03'),
(156, 3, 1, 160.00, '2019-03-01', '2019-03-03'),
(157, 4, 3, 256.00, '2019-03-01', '2019-03-03'),
(158, 5, 3, 360.00, '2019-03-01', '2019-03-03'),
(159, 6, 3, 48.00, '2019-03-01', '2019-03-03'),
(160, 7, 4, 300.00, '2019-03-01', '2019-03-03'),
(226, 1, 3, 60.00, '2019-12-01', '2019-12-03'),
(162, 1, 3, 60.00, '2019-04-01', '2019-04-03'),
(163, 2, 1, 48.00, '2019-04-01', '2019-04-03'),
(164, 3, 1, 160.00, '2019-04-01', '2019-04-03'),
(165, 4, 3, 256.00, '2019-04-01', '2019-04-03'),
(166, 5, 3, 360.00, '2019-04-01', '2019-04-03'),
(167, 6, 3, 48.00, '2019-04-01', '2019-04-03'),
(168, 7, 4, 300.00, '2019-04-01', '2019-04-03'),
(242, 1, 3, 60.00, '2020-02-01', '2020-02-03'),
(170, 1, 3, 60.00, '2019-05-01', '2019-05-03'),
(171, 2, 1, 48.00, '2019-05-01', '2019-05-03'),
(172, 3, 1, 160.00, '2019-05-01', '2019-05-03'),
(173, 4, 3, 256.00, '2019-05-01', '2019-05-03'),
(174, 5, 3, 360.00, '2019-05-01', '2019-05-03'),
(175, 6, 3, 48.00, '2019-05-01', '2019-05-03'),
(176, 7, 4, 300.00, '2019-05-01', '2019-05-03'),
(240, 7, 4, 300.00, '2020-01-01', '2020-01-03'),
(178, 1, 3, 60.00, '2019-06-01', '2019-06-03'),
(179, 2, 1, 48.00, '2019-06-01', '2019-06-03'),
(180, 3, 1, 160.00, '2019-06-01', '2019-06-03'),
(181, 4, 3, 256.00, '2019-06-01', '2019-06-03'),
(182, 5, 3, 360.00, '2019-06-01', '2019-06-03'),
(183, 6, 3, 48.00, '2019-06-01', '2019-06-03'),
(184, 7, 4, 300.00, '2019-06-01', '2019-06-03'),
(239, 6, 3, 48.00, '2020-01-01', '2020-01-03'),
(186, 1, 3, 60.00, '2019-07-01', '2019-07-03'),
(187, 2, 1, 48.00, '2019-07-01', '2019-07-03'),
(188, 3, 1, 160.00, '2019-07-01', '2019-07-03'),
(189, 4, 3, 256.00, '2019-07-01', '2019-07-03'),
(190, 5, 3, 360.00, '2019-07-01', '2019-07-03'),
(191, 6, 3, 48.00, '2019-07-01', '2019-07-03'),
(192, 7, 4, 300.00, '2019-07-01', '2019-07-03'),
(238, 5, 3, 360.00, '2020-01-01', '2020-01-03'),
(194, 1, 3, 60.00, '2019-08-01', '2019-08-03'),
(195, 2, 1, 48.00, '2019-08-01', '2019-08-03'),
(196, 3, 1, 160.00, '2019-08-01', '2019-08-03'),
(197, 4, 3, 256.00, '2019-08-01', '2019-08-03'),
(198, 5, 3, 360.00, '2019-08-01', '2019-08-03'),
(199, 6, 3, 48.00, '2019-08-01', '2019-08-03'),
(200, 7, 4, 300.00, '2019-08-01', '2019-08-03'),
(237, 4, 3, 256.00, '2020-01-01', '2020-01-03'),
(202, 1, 3, 60.00, '2019-09-01', '2019-09-03'),
(203, 2, 1, 48.00, '2019-09-01', '2019-09-03'),
(204, 3, 1, 160.00, '2019-09-01', '2019-09-03'),
(205, 4, 3, 256.00, '2019-09-01', '2019-09-03'),
(206, 5, 3, 360.00, '2019-09-01', '2019-09-03'),
(207, 6, 3, 48.00, '2019-09-01', '2019-09-03'),
(208, 7, 4, 300.00, '2019-09-01', '2019-09-03'),
(236, 3, 1, 160.00, '2020-01-01', '2020-01-03'),
(210, 1, 3, 60.00, '2019-10-01', '2019-10-03'),
(211, 2, 1, 48.00, '2019-10-01', '2019-10-03'),
(212, 3, 1, 160.00, '2019-10-01', '2019-10-03'),
(213, 4, 3, 256.00, '2019-10-01', '2019-10-03'),
(214, 5, 3, 360.00, '2019-10-01', '2019-10-03'),
(215, 6, 3, 48.00, '2019-10-01', '2019-10-03'),
(216, 7, 4, 300.00, '2019-10-01', '2019-10-03'),
(235, 2, 1, 48.00, '2020-01-01', '2020-01-03'),
(253, 4, 3, 256.00, '2020-03-01', '2020-03-03'),
(254, 5, 3, 360.00, '2020-03-01', '2020-03-03'),
(255, 6, 3, 48.00, '2020-03-01', '2020-03-03'),
(256, 7, 4, 300.00, '2020-03-01', '2020-03-03'),
(257, 8, 3, 396.00, '2020-03-01', '2020-03-03'),
(259, 2, 1, 48.00, '2020-04-01', '2020-04-03'),
(260, 3, 1, 160.00, '2020-04-01', '2020-04-03'),
(261, 4, 3, 256.00, '2020-04-01', '2020-04-03'),
(262, 5, 3, 360.00, '2020-04-01', '2020-04-03'),
(263, 6, 3, 48.00, '2020-04-01', '2020-04-03'),
(264, 7, 4, 300.00, '2020-04-01', '2020-04-03'),
(265, 8, 3, 396.00, '2020-04-01', '2020-04-03'),
(266, 1, 3, 60.00, '2020-05-01', '2020-05-03'),
(267, 2, 1, 48.00, '2020-05-01', '2020-05-03'),
(268, 3, 1, 160.00, '2020-05-01', '2020-05-03'),
(269, 4, 3, 256.00, '2020-05-01', '2020-05-03'),
(270, 5, 3, 360.00, '2020-05-01', '2020-05-03'),
(271, 6, 3, 48.00, '2020-05-01', '2020-05-03'),
(272, 7, 4, 300.00, '2020-05-01', '2020-05-03'),
(273, 8, 3, 396.00, '2020-05-01', '2020-05-03'),
(274, 1, 3, 60.00, '2020-06-01', '2020-06-03'),
(275, 2, 1, 48.00, '2020-06-01', '2020-06-03'),
(276, 3, 1, 160.00, '2020-06-01', '2020-06-03'),
(277, 4, 3, 256.00, '2020-06-01', '2020-06-03'),
(278, 5, 3, 360.00, '2020-06-01', '2020-06-03'),
(279, 6, 3, 48.00, '2020-06-01', '2020-06-03'),
(280, 7, 4, 300.00, '2020-06-01', '2020-06-03'),
(281, 8, 3, 396.00, '2020-06-01', '2020-06-03'),
(282, 1, 3, 60.00, '2020-07-01', '2020-07-03'),
(283, 2, 1, 48.00, '2020-07-01', '2020-07-03'),
(284, 3, 1, 160.00, '2020-07-01', '2020-07-03'),
(285, 4, 3, 256.00, '2020-07-01', '2020-07-03'),
(286, 5, 3, 360.00, '2020-07-01', '2020-07-03'),
(287, 6, 3, 48.00, '2020-07-01', '2020-07-03'),
(288, 7, 4, 300.00, '2020-07-01', '2020-07-03'),
(289, 8, 3, 396.00, '2020-07-01', '2020-07-03'),
(290, 1, 3, 60.00, '2020-08-01', '2020-08-03'),
(291, 2, 1, 48.00, '2020-08-01', '2020-08-03'),
(292, 3, 1, 160.00, '2020-08-01', '2020-08-03'),
(293, 4, 3, 256.00, '2020-08-01', '2020-08-03'),
(294, 5, 3, 360.00, '2020-08-01', '2020-08-03'),
(295, 6, 3, 48.00, '2020-08-01', '2020-08-03'),
(296, 7, 4, 300.00, '2020-08-01', '2020-08-03'),
(297, 8, 3, 396.00, '2020-08-01', '2020-08-03'),
(298, 1, 3, 60.00, '2020-09-01', '2020-09-03'),
(299, 2, 1, 48.00, '2020-09-01', '2020-09-03'),
(300, 3, 1, 160.00, '2020-09-01', '2020-09-03'),
(301, 4, 3, 256.00, '2020-09-01', '2020-09-03'),
(302, 5, 3, 360.00, '2020-09-01', '2020-09-03'),
(303, 6, 3, 48.00, '2020-09-01', '2020-09-03'),
(304, 7, 4, 300.00, '2020-09-01', '2020-09-03'),
(305, 8, 3, 396.00, '2020-09-01', '2020-09-03'),
(306, 1, 3, 60.00, '2020-10-01', '2020-10-03'),
(307, 2, 1, 48.00, '2020-10-01', '2020-10-03'),
(308, 3, 1, 160.00, '2020-10-01', '2020-10-03'),
(309, 4, 3, 256.00, '2020-10-01', '2020-10-03'),
(310, 5, 3, 360.00, '2020-10-01', '2020-10-03'),
(311, 6, 3, 48.00, '2020-10-01', '2020-10-03'),
(312, 7, 4, 300.00, '2020-10-01', '2020-10-03'),
(313, 8, 3, 396.00, '2020-10-01', '2020-10-03'),
(314, 1, 3, 60.00, '2020-11-01', '2020-11-03'),
(315, 2, 1, 48.00, '2020-11-01', '2020-11-03'),
(316, 3, 1, 160.00, '2020-11-01', '2020-11-03'),
(317, 4, 3, 256.00, '2020-11-01', '2020-11-03'),
(318, 5, 3, 360.00, '2020-11-01', '2020-11-03'),
(319, 6, 3, 48.00, '2020-11-01', '2020-11-03'),
(320, 7, 4, 300.00, '2020-11-01', '2020-11-03'),
(321, 8, 3, 396.00, '2020-11-01', '2020-11-03'),
(322, 1, 3, 60.00, '2020-12-01', '2020-12-03'),
(323, 2, 1, 48.00, '2020-12-01', '2020-12-03'),
(324, 3, 1, 160.00, '2020-12-01', '2020-12-03'),
(325, 4, 3, 256.00, '2020-12-01', '2020-12-03'),
(326, 5, 3, 360.00, '2020-12-01', '2020-12-03'),
(327, 6, 3, 48.00, '2020-12-01', '2020-12-03'),
(328, 7, 4, 300.00, '2020-12-01', '2020-12-03'),
(329, 8, 3, 396.00, '2020-12-01', '2020-12-03'),
(330, 1, 3, 60.00, '2021-01-01', '2021-01-03'),
(331, 2, 1, 48.00, '2021-01-01', '2021-01-03'),
(332, 3, 1, 160.00, '2021-01-01', '2021-01-03'),
(333, 4, 3, 256.00, '2021-01-01', '2021-01-03'),
(334, 5, 3, 360.00, '2021-01-01', '2021-01-03'),
(335, 6, 3, 48.00, '2021-01-01', '2021-01-03'),
(336, 7, 4, 300.00, '2021-01-01', '2021-01-03'),
(337, 8, 3, 396.00, '2021-01-01', '2021-01-03'),
(338, 1, 3, 60.00, '2021-02-01', '2021-02-03'),
(339, 2, 1, 48.00, '2021-02-01', '2021-02-03'),
(340, 3, 1, 160.00, '2021-02-01', '2021-02-03'),
(341, 4, 3, 256.00, '2021-02-01', '2021-02-03'),
(342, 5, 3, 360.00, '2021-02-01', '2021-02-03'),
(343, 6, 3, 48.00, '2021-02-01', '2021-02-03'),
(344, 7, 4, 300.00, '2021-02-01', '2021-02-03'),
(345, 8, 3, 396.00, '2021-02-01', '2021-02-03'),
(346, 1, 3, 60.00, '2021-03-01', '2021-03-03'),
(347, 2, 1, 48.00, '2021-03-01', '2021-03-03'),
(348, 3, 1, 160.00, '2021-03-01', '2021-03-03'),
(349, 4, 3, 256.00, '2021-03-01', '2021-03-03'),
(350, 5, 3, 360.00, '2021-03-01', '2021-03-03'),
(351, 6, 3, 48.00, '2021-03-01', '2021-03-03'),
(352, 7, 4, 300.00, '2021-03-01', '2021-03-03'),
(353, 8, 3, 396.00, '2021-03-01', '2021-03-03');

DELIMITER $$
--
-- Events
--
DROP EVENT `loadDummyDataCompensationHistoryTable`$$
CREATE DEFINER=`root`@`localhost` EVENT `loadDummyDataCompensationHistoryTable` ON SCHEDULE EVERY 1 MONTH STARTS '2021-04-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO travel_compensation_history(`transport_compensation_history_id`,`employee`, `transport_option`,`process_date`,`compensation`, `payment_date`)
SELECT NULL,`comp_vals`.`employee_id`, `comp_vals`.`transport_option`, `comp_vals`.`dateprocess`, `comp_vals`.compensation, DATE_ADD(`comp_vals`.`dateprocess`, INTERVAL 2 DAY)
FROM (SELECT `employee_id`, `transport_option`,
	(SELECT 
    	(CASE 
          WHEN COUNT(DISTINCT `process_date`) = 0 THEN "2018-01-01" 
          ELSE DATE_ADD((SELECT `process_date` FROM `travel_compensation_history` ORDER BY `process_date` DESC LIMIT 1), INTERVAL 1 MONTH)
    	END) AS date_now
	FROM `travel_compensation_history`) AS dateprocess,
	(CASE 
       WHEN `transport_option` = 1 THEN (`travel_distance` * 2 * `workdays` * 4 * 0.1)  
       WHEN `transport_option` = 2 or `transport_option` = 4 THEN (`travel_distance` * 2 * `workdays` * 4 * 0.25)  
       WHEN `transport_option` = 3 AND `travel_distance` < 5.0 THEN (`travel_distance` * 2 * `workdays` * 4 * 0.5) 
       WHEN `transport_option` = 3 AND `travel_distance` >= 5.0 THEN (`travel_distance` * 2 * `workdays` * 4 * (0.5*2))  
       ELSE 0.0
     END) AS compensation
FROM `employees`) AS comp_vals$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
