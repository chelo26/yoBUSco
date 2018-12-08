-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Домаћин: fdb5.biz.nf
-- Време креирања: 24. May 2015. у 09:56
-- Верзија сервера: 5.5.38
-- верзија PHP-a: 5.3.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База података: `1463364_nemtajo`
--
CREATE DATABASE `1463364_nemtajo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `1463364_nemtajo`;

-- --------------------------------------------------------

--
-- Структура табеле `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `user_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`auth_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Приказ података табеле `authority`
--

INSERT INTO `authority` (`auth_id`, `username`, `phone_number`, `user_type`) VALUES
(4, 'nemtajo', '+381640722803', 'E'),
(5, 'vatrogasacSam', '+385981909808', 'F'),
(6, 'auth2', '+385981909808', 'E'),
(8, 'mirjam3', '+385981909808', 'P'),
(9, 'batman', '+38162208675', 'P');

-- --------------------------------------------------------

--
-- Структура табеле `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_event` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Приказ података табеле `comment`
--

INSERT INTO `comment` (`id`, `id_event`, `username`, `comment_date`, `comment_text`) VALUES
(1, 15, 'milica13629', '2015-04-07 14:23:11', 'jel ugasen?'),
(2, 24, 'milica13629', '2015-04-07 19:38:29', 'gdjdkkd'),
(3, 24, 'milica13629', '2015-04-07 23:52:26', 'who died?'),
(4, 61, 'milisko', '2015-04-08 14:25:59', 'wowww'),
(5, 24, 'milisko', '2015-04-09 19:54:31', 'my dog :p'),
(6, 24, 'milisko', '2015-04-09 19:57:46', 'not cooll man!'),
(7, 95, 'milisko', '2015-04-09 20:17:09', 'what happened? ??'),
(8, 96, 'milisko', '2015-04-09 21:05:26', 'what happened? '),
(9, 96, 'milisko', '2015-04-09 21:05:26', 'something'),
(10, 28, 'milisko', '2015-04-16 18:14:16', 'dyjc'),
(11, 93, 'mirjam03', '2015-04-19 22:36:50', 'nekakav komentar'),
(12, 93, 'mirjam03', '2015-04-19 22:36:50', 'kakav vam je ovo descr'),
(13, 93, 'mirjam03', '2015-04-20 00:03:22', 'jos\njezan\nkomengar'),
(14, 120, 'mirjam03', '2015-04-20 00:22:19', 'kimenta'),
(15, 121, 'milisko', '2015-04-21 11:40:39', 'fhkc'),
(16, 121, 'milisko', '2015-04-21 11:40:39', 'fhkc');

-- --------------------------------------------------------

--
-- Структура табеле `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `description` varchar(160) DEFAULT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location_acc` float DEFAULT NULL,
  `type_of_event` char(1) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=186 ;

--
-- Приказ података табеле `event`
--

INSERT INTO `event` (`event_id`, `lat`, `lng`, `description`, `event_time`, `location_acc`, `type_of_event`, `user_phone`, `anonymous`, `address`) VALUES
(11, 45.4786, 9.22797, 'pozar', '2015-03-24 15:39:59', 30, 'F', '3899604951', 0, 'Politecnico di Milano, Milan'),
(13, 45.4788, 9.22799, 'pljacka', '2015-03-24 00:00:00', 30, 'P', '3899604951', 0, 'Politecnico di Milano, Milan'),
(14, 45.4788, 9.22799, 'suicide', '2015-03-24 00:00:00', 30, 'E', '3899604951', 0, 'Politecnico di Milano, Milan'),
(15, 45.4945, 9.21051, 'dhdh', '2015-03-24 00:00:00', 30, 'F', '3899604951', 0, 'Via Luciano Zuccoli, Milan, Province of Milan, Ita'),
(16, 45.4735, 9.23229, 'car accident', '2015-03-24 00:00:00', 30, 'P', '3899604951', 0, 'Via Gaetano Strambio, Milan, Province of Milan, It'),
(18, 45.4845, 9.22725, 'car accident', '2015-03-24 00:00:00', 30, 'E', '3899604951', 0, 'Via Vallazze, 20131 Milano, Italy'),
(19, 45.4788, 9.22798, '', '2015-03-24 00:00:00', 30, 'P', '3899604951', 0, 'Politecnico di Milano, Milan'),
(20, 45.2523, 8.73864, 'car accident', '2015-03-24 00:00:00', 54, 'P', '', 0, 'Contrada San Lorenzo, 27036 Mortara PV, Italy'),
(21, 45.474, 9.23345, 'umeessagr', '2015-03-25 00:00:00', 30, 'F', '', 0, 'Via Giacomo Venezian, 19-21, Milan'),
(22, 45.4798, 9.22643, 'vatra', '2015-03-29 00:00:00', 20, 'F', '3899604951', 0, 'Via Andrea Maria Ampère, 3, Milan'),
(23, 45.474, 9.23334, 'hhhfff', '2015-03-30 00:00:00', 29.363, 'E', '098', 0, 'Via Gaetano Strambio, 23, Milan'),
(24, 45.4954, 9.20788, 'heart attack', '2015-03-30 00:00:00', 54.966, 'E', '3899604951', 1, 'Via Luciano Zuccoli, 19-21, Milan'),
(25, 45.489, 9.20013, 'heart attack', '2015-03-30 00:00:00', 54.966, 'E', '3899604951', 1, 'Via Melchiorre Gioia, Milano, Italy'),
(26, 45.4845, 9.22725, 'car accident', '2015-03-30 00:00:00', 54.966, 'P', '3899604951', 1, 'Via Vallazze, 20131 Milano, Italy'),
(27, 45.4802, 9.21076, 'pozar', '2015-03-30 00:00:00', 579, 'F', '3899604951', 0, 'Corso Buenos Aires, Milano, Italy'),
(28, 45.4819, 9.23202, 'pljacka', '2015-03-30 00:00:00', 48.341, 'P', '3899604951', 1, 'Piazza Donegani Carlo, 4, Milan'),
(29, 45.4641, 9.19193, 'that cat became alive', '2015-03-31 00:00:00', 41.826, 'E', '3899604951', 0, 'Piazza del Duomo, Milano, Italy'),
(30, 0.576892, 35.3039, '', '2015-04-01 00:00:00', 2211, 'P', '+254720258369', 0, 'Uasin Gishu, null'),
(31, 0.576892, 35.3039, '', '2015-04-01 00:00:00', 2211, 'P', '+254720258369', 0, 'Uasin Gishu, null'),
(32, 0.576892, 35.3039, 'yyh', '2015-04-01 00:00:00', 2211, 'P', '+254720258369', 1, 'Uasin Gishu, null'),
(33, 44.9968, 9.01776, 'fuj', '2015-04-02 00:00:00', 1760, 'E', '3899604951', 1, 'Via Giovanni Amendola, 19, Voghera'),
(34, 45.7901, 15.9537, 'nesti nedtk', '2015-04-05 00:00:00', 28.884, 'F', '981909808', 1, 'Ulica ?ire Truhelke, 10000, Zagreb, Croatia'),
(35, 45.7898, 15.953, 'nesti nedtk', '2015-04-05 00:00:00', 28.884, 'F', '981909808', 1, 'Ulica Alberta Bazale 6, Zagreb'),
(36, 45.7898, 15.953, 'nesti nedtk', '2015-04-05 00:00:00', 28.884, 'F', '981909808', 1, 'Ulica Alberta Bazale 6, Zagreb'),
(37, 45.7898, 15.953, 'nesti nedtk', '2015-04-05 00:00:00', 28.884, 'F', '981909808', 0, 'Ulica Alberta Bazale 6, Zagreb'),
(38, 45.7898, 15.953, 'nesti nedtk', '2015-04-05 00:00:00', 28.884, 'F', '981909808', 0, 'Ulica Alberta Bazale 6, Zagreb'),
(39, 45.7898, 15.953, 'nesti nedtk', '2015-04-05 00:00:00', 28.884, 'F', '981909808', 0, 'Ulica Alberta Bazale 6, Zagreb'),
(40, 45.7901, 15.9537, '', '2015-04-06 00:00:00', 36.031, 'F', '+385981909808', 0, 'Ulica ?ire Truhelke, 10000, Zagreb, Croatia'),
(41, 45.7898, 15.9531, '', '2015-04-06 00:00:00', 36.031, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(42, 45.4737, 9.23334, 'gh', '2015-04-06 00:00:00', 36.031, 'E', '+385981909808', 0, 'Via Gaetano Strambio, 23, 20133 Milano, Italy'),
(43, 45.7989, 15.9542, '', '2015-04-06 00:00:00', 36.031, 'F', '+385981909808', 0, 'Zvorni?ka ulica, 10000, Zagreb, Croatia'),
(44, 45.4802, 9.21076, 'robbery', '2015-04-06 23:47:34', 40.5, 'E', '3899604951', 0, 'Corso Buenos Aires, Milano, Italy'),
(45, 45.7898, 15.953, '', '2015-04-06 00:00:00', 36.659, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(46, 45.7898, 15.953, '', '2015-04-06 00:00:00', 36.659, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(47, 45.8128, 15.9775, ' jjj', '2015-04-07 00:00:00', 10, 'F', '+385981909808', 0, 'Trg bana Josipa Jela?i?a, 10000, Zagreb, Croatia'),
(48, 45.7898, 15.9531, 'lilo', '2015-04-07 00:00:00', 34.342, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(49, 45.8228, 15.9389, 't', '2015-04-07 00:00:00', 10, 'F', '+385981909808', 0, 'Ulica Sveti Duh, 10000, Zagreb, Croatia'),
(50, 45.8228, 15.9389, 't', '2015-04-07 00:00:00', 10, 'F', '+385981909808', 0, 'Ulica Sveti Duh, 10000, Zagreb, Croatia'),
(51, 45.8228, 15.9389, 't', '2015-04-07 00:00:00', 10, 'F', '+385981909808', 0, 'Ulica Sveti Duh, 10000, Zagreb, Croatia'),
(52, 45.7898, 15.953, 'test', '2015-04-07 14:01:49', 0, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(53, 45.7898, 15.9531, 'ludi', '2015-04-07 14:06:00', 34.856, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(54, 45.7898, 15.9531, 'ludi', '2015-04-07 14:07:18', 35.073, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(55, 45.8647, 15.8021, 'hh', '2015-04-07 14:09:54', 10, 'F', '+385981909808', 0, 'Ulica bana Josipa Jela?i?a, 10290, Zapreši?, Croat'),
(56, 45.7898, 15.953, 'hbs ', '2015-04-07 14:12:57', 28.603, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(57, 45.7898, 15.953, 'cvv', '2015-04-07 15:21:02', 28.158, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(58, 45.4808, 9.23099, 'robbery', '2015-04-07 16:19:23', 10, 'P', '3899604951', 1, 'Via Antonio Vallisneri, 20133 Milano, Italy'),
(59, 45.7901, 15.9537, 'jajshshaahahjs', '2015-04-07 17:12:45', 10, 'P', '+385981909808', 1, 'Ulica ?ire Truhelke, 10000, Zagreb, Croatia'),
(60, 45.7901, 15.9537, 'jajshshaahahjs', '2015-04-07 17:12:45', 10, 'P', '+385981909808', 1, 'Ulica ?ire Truhelke, 10000, Zagreb, Croatia'),
(61, 45.5, 9.24431, 'club fight', '2015-04-08 14:25:04', 10, 'P', '+393899604951', 1, 'Cimiano, Milan, Italy'),
(62, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(63, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(64, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(65, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(66, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(67, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(68, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(69, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(70, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(71, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(72, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(73, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(74, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(75, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(76, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(77, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(78, 45.7898, 15.953, 'hh', '2015-04-08 19:48:13', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(79, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(80, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(81, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(82, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(83, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(84, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(85, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(86, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(87, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(88, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(89, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(90, 45.7898, 15.953, 'hh', '2015-04-08 19:48:49', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(91, 45.7898, 15.953, 'o', '2015-04-08 19:56:40', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(92, 45.7898, 15.953, '2', '2015-04-08 19:58:31', 29.955, 'F', '+385981909808', 0, 'Ulica Stjepana Škreblina 5, Zagreb'),
(93, 45.4769, 9.23436, 'car jacket', '2015-04-09 12:26:32', 10, 'P', '', 1, 'Via Camillo Golgi, 20133 Milano, Italy'),
(94, 45.8128, 15.9775, 'nezti', '2015-04-09 18:31:39', 10, 'E', '+385981909808', 1, 'Trg bana Josipa Jela?i?a, 10000, Zagreb, Croatia'),
(95, 45.4589, 9.16666, 'fire in building no 13', '2015-04-09 20:15:34', 10, 'F', '+393899604951', 0, 'Viale Coni Zugna, 20144 Milano, Italy'),
(96, 45.4641, 9.19193, 'attack on judge', '2015-04-09 21:01:39', 10, 'P', '+393899604951', 1, 'Piazza del Duomo, Milano, Italy'),
(97, 45.4641, 9.19193, 'attack on judge', '2015-04-09 21:01:39', 10, 'P', '+393899604951', 1, 'Piazza del Duomo, Milano, Italy'),
(98, 45.4954, 9.20842, 'im drunk', '2015-04-10 02:07:16', 37.5, 'E', '+393899604951', 1, 'IO Exception trying to get address'),
(99, 45.8128, 15.9775, 'hsbbz\nhzbbzbs\nxhhs', '2015-04-10 10:20:21', 10, 'E', '+385981909808', 1, 'Trg bana Josipa Jela?i?a, 10000, Zagreb, Croatia'),
(100, 45.474, 9.23335, 'b', '2015-04-11 19:51:31', 22.307, 'E', '+385981909808', 0, 'Via Gaetano Strambio, 23, Milan'),
(101, 45.525, 9.32029, 'yyh', '2015-04-11 19:52:41', 10, 'P', '+385981909808', 1, 'Via Monza, 20063 Cernusco sul Naviglio MI, Italy'),
(102, 45.4641, 9.19193, 'pozar!!', '2015-04-11 19:53:44', 10, 'F', '+385981909808', 1, 'Piazza del Duomo, Milano, Italy'),
(103, 45.4641, 9.19193, 'pozar!!', '2015-04-11 19:53:44', 10, 'F', '+385981909808', 1, 'Piazza del Duomo, Milano, Italy'),
(104, 45.4641, 9.19193, 'pozar!!', '2015-04-11 19:53:44', 10, 'F', '+385981909808', 0, 'Piazza del Duomo, Milano, Italy'),
(105, 45.4641, 9.19193, 'pozar!!', '2015-04-11 19:53:44', 10, 'F', '+385981909808', 0, 'Piazza del Duomo, Milano, Italy'),
(106, 45.474, 9.23335, 'jsjz', '2015-04-11 20:12:40', 22.307, 'F', '+385981909808', 0, 'Via Gaetano Strambio, 23, Milan'),
(107, 45.474, 9.23335, 'ffc', '2015-04-11 20:21:38', 22.307, 'F', '+385981909808', 0, 'IO Exception trying to get address'),
(108, 45.474, 9.23329, 'hh', '2015-04-11 20:29:52', 20.054, 'F', '+385981909808', 0, 'IO Exception trying to get address'),
(109, 45.474, 9.23329, 'hh', '2015-04-11 20:29:52', 20.054, 'F', '+385981909808', 0, 'IO Exception trying to get address'),
(110, 45.5211, 9.59512, 'gvv', '2015-04-11 20:45:24', 10, 'F', '+385981909808', 0, '24047 Treviglio BG, Italy'),
(111, 45.474, 9.23329, 'zhs', '2015-04-11 20:51:30', 20.054, 'F', '+385981909808', 0, 'Via Gaetano Strambio, 23, Milan'),
(112, 45.474, 9.23329, 'yhh', '2015-04-11 20:53:46', 20.054, 'F', '+385981909808', 0, 'Via Gaetano Strambio, 23, Milan'),
(113, 45.474, 9.23329, 'pomoc', '2015-04-11 20:55:11', 20.054, 'E', '+385981909808', 0, 'Via Gaetano Strambio, 23, Milan'),
(114, 45.474, 9.23335, '####', '2015-04-16 15:48:30', 30.188, 'P', '+385981909808', 0, 'Via Gaetano Strambio, 23, Milan'),
(115, 45.4887, 9.22717, 'b', '2015-04-16 19:12:24', 10, 'F', '+393899604951', 0, 'Piazza San Materno, 20131 Milano, Italy'),
(116, 45.4798, 9.22647, 'ghj', '2015-04-16 19:42:36', 20, 'P', '+385981909808', 0, 'Via Andrea Maria Ampère, 3, Milan'),
(117, 43.1588, 22.5914, 'vgfdy', '2015-04-16 20:02:15', 10, 'F', '+393899604951', 0, '100 Takovska, Pirot 18300, Serbia'),
(118, 45.5211, 9.59512, 'gggh', '2015-04-16 23:54:34', 10, 'P', '+385981909808', 0, '24047 Treviglio BG, Italy'),
(119, 43.3182, 21.9162, 'hearr attack', '2015-04-17 15:47:19', 10, 'E', '+393899604951', 1, 'Velikotrnovska, Niš, Serbia'),
(120, 43.5128, 16.454, 'ludnica u dubrovackoj', '2015-04-20 00:20:59', 10, 'E', '+385981909808', 0, 'Dubrova?ka ulica, 21000, Split, Croatia'),
(121, 41.9973, 21.428, 'demonstrations', '2015-04-21 11:39:36', 10, 'P', '+393899604951', 1, 'Skopje, Macedonia (FYROM)'),
(122, 45.4747, 9.24821, 'car accident', '2015-04-22 17:19:03', 10, 'P', '+393899604951', 0, 'Italy'),
(123, 45.8081, 9.08518, 'car accident', '2015-04-25 12:29:02', 10, 'E', '+393899604951', 0, 'Como CO, Italy'),
(124, 45.4781, 9.22569, 'robbery', '2015-05-11 19:16:49', 10, 'P', '+393899604951', 0, 'Piazza Leonardo Da Vinci, Milano, Italy'),
(125, 45.4934, 9.20682, 'gdjdjjs', '2015-05-11 20:50:13', 10, 'P', '+393899604951', 0, 'Via Edolo, 20125 Milano, Italy'),
(126, 45.4781, 9.22569, 'earthquake', '2015-05-12 11:41:49', 10, 'P', '+393899604951', 0, 'Piazza Leonardo Da Vinci, Milano, Italy'),
(127, 44.8159, 20.4577, 'glupost', '2015-05-15 14:04:18', 10, 'P', '+393899604951', 0, 'Obili?ev venac, Beograd, Serbia'),
(128, 44.7999, 20.48, 'test', '2015-05-15 14:21:18', 10, 'P', '', 0, 'Radoslava Gruji?a, Beograd, Serbia'),
(129, 45.489, 9.20013, 'test', '2015-05-15 14:24:24', 10, 'P', '+393899604951', 0, 'Via Melchiorre Gioia, Milano, Italy'),
(130, 45.484, 9.2061, 'ggh', '2015-05-15 14:29:22', 10, 'P', '+393899604951', 0, 'Centrale, Milano, Italy'),
(131, 45.4839, 9.25125, 'vhjv', '2015-05-15 14:29:54', 10, 'P', '+393899604951', 0, 'Lambrate, Milano, Italy'),
(132, 45.4531, 9.1703, 'ghzg', '2015-05-15 14:39:59', 10, 'P', '+393899604951', 0, 'Piazzale Porta Genova, 1, 20123 Milano, Italy'),
(133, 45.4721, 9.17722, 'hxg', '2015-05-15 14:41:55', 10, 'P', '+393899604951', 0, 'Piazza Sempione, 20154 Milano, Italy'),
(134, 45.5326, 9.03961, 'expo', '2015-05-15 14:45:16', 10, 'P', '+393899604951', 0, 'Rho MI, Italy'),
(135, 45.4687, 9.18172, 'hhfgu', '2015-05-15 14:47:11', 10, 'P', '+393899604951', 0, 'Via Luca Beltrami, 20121 Milano, Italy'),
(136, 45.4687, 9.18172, 'hhfgu', '2015-05-15 14:47:11', 10, 'P', '+393899604951', 0, 'Via Luca Beltrami, 20121 Milano, Italy'),
(137, 45.5189, 9.10512, 'e ffh', '2015-05-15 14:48:08', 10, 'P', '+393899604951', 0, 'Milan, Italy'),
(138, 45.4875, 9.2138, 'fhgfu', '2015-05-15 14:52:41', 10, 'P', '+393899604951', 0, 'Loreto, Milano, Italy'),
(139, 45.4802, 9.21081, 'hdhjc', '2015-05-15 14:55:30', 10, 'P', '+393899604951', 0, 'Italy'),
(140, 45.4853, 9.20973, 'fjg', '2015-05-15 14:56:45', 10, 'P', '+393899604951', 0, 'Italy'),
(141, 45.4717, 9.18233, 'fuh', '2015-05-15 15:04:03', 10, 'P', '+393899604951', 0, 'Italy'),
(142, 45.4717, 9.18233, 'dhcf', '2015-05-15 15:05:42', 10, 'P', '+393899604951', 0, 'Italy'),
(143, 45.4681, 9.17695, 'jgfh', '2015-05-15 15:07:32', 10, 'P', '+393899604951', 0, 'Italy'),
(144, 45.4681, 9.17695, 'jgfh', '2015-05-15 15:07:32', 10, 'P', '+393899604951', 0, 'Italy'),
(145, 45.9767, 8.7735, 'hh', '2015-05-15 15:07:57', 10, 'P', '+393899604951', 0, '21010 Cadorna VA, Italy'),
(146, 45.9767, 8.7735, 'hh', '2015-05-15 15:07:57', 10, 'P', '+393899604951', 0, '21010 Cadorna VA, Italy'),
(147, 45.9767, 8.7735, 'cjhx', '2015-05-15 15:08:32', 10, 'P', '+393899604951', 0, '21010 Cadorna VA, Italy'),
(148, 45.9767, 8.7735, 'cjhx', '2015-05-15 15:08:32', 10, 'P', '+393899604951', 0, '21010 Cadorna VA, Italy'),
(149, 45.4681, 9.17695, 'vjdjd', '2015-05-15 15:09:18', 10, 'P', '+393899604951', 0, 'Italy'),
(150, 45.4615, 9.18542, 'hdjjd', '2015-05-15 15:11:56', 10, 'P', '+393899604951', 0, 'Via Torino, 20123 Milano, Italy'),
(151, 45.4977, 9.18492, 'kkkkk', '2015-05-15 15:15:23', 10, 'P', '+393899604951', 0, 'Italy'),
(152, 45.4951, 9.19296, 'pppp', '2015-05-15 15:16:23', 10, 'P', '+393899604951', 0, 'Zona Zara, Milano, Italy'),
(153, 45.6646, 9.70258, 'ppp', '2015-05-15 15:17:30', 10, 'P', '+393899604951', 0, 'Via Aeroporto, 24050 Orio Al Serio BG, Italy'),
(154, 45.6646, 9.70258, 'ppp', '2015-05-15 15:17:30', 10, 'P', '+393899604951', 0, 'Via Aeroporto, 24050 Orio Al Serio BG, Italy'),
(155, 45.6739, 9.68896, 'cgvvg', '2015-05-15 15:18:01', 10, 'P', '+393899604951', 0, 'Orio Al Serio BG, Italy'),
(156, 45.6301, 8.72553, 'pppp', '2015-05-15 15:19:13', 10, 'P', '+393899604951', 0, '21010 Ferno VA, Italy'),
(157, 45.4522, 9.15781, 'paznja', '2015-05-15 15:22:00', 10, 'P', '+393899604951', 0, 'Via Savona, Milano, Italy'),
(158, 45.4787, 9.23016, 'coffee break', '2015-05-15 16:01:58', 594, 'P', '+393899604951', 0, 'Via Giuseppe Ponzio, 34-40, Milan'),
(159, 45.474, 9.23337, 'something bad happened something bad happened something bad happened something bad happened something bad happened something bad happened ', '2015-05-15 18:26:16', 32.165, 'P', '+385981909808', 0, 'Via Giacomo Venezian, 19-21, Milan'),
(160, 45.474, 9.23337, 'm122', '2015-05-15 18:28:04', 32.165, 'F', '+385981909808', 0, 'Via Giacomo Venezian, 19-21, Milan'),
(161, 45.5024, 9.15924, 'bad', '2015-05-15 19:44:00', 10, 'P', '+393899604951', 0, 'Italy'),
(162, 45.5014, 9.16389, 'bad', '2015-05-15 19:44:24', 10, 'P', '+393899604951', 0, 'Bovisa, Milan, Italy'),
(163, 45.5014, 9.16389, 'bad', '2015-05-15 19:44:59', 10, 'P', '+393899604951', 0, 'Bovisa, Milan, Italy'),
(164, 45.5014, 9.16389, 'vshsh', '2015-05-15 19:45:18', 10, 'P', '+393899604951', 0, 'Bovisa, Milan, Italy'),
(165, 45.4671, 9.19829, 'murder', '2015-05-15 19:47:46', 10, 'P', '+393899604951', 0, 'Corso Venezia, 2/A, 20121 Milano, Italy'),
(166, 45.4092, 9.26849, 'ghd', '2015-05-15 19:55:35', 10, 'P', '+393899604951', 0, 'San Donato Milanese MI, Italy'),
(167, 45.4781, 9.12396, 'football match hooligans', '2015-05-15 20:00:02', 10, 'P', '+393899604951', 0, 'Piazzale Angelo Moratti, 20151 Milano, Italy'),
(168, 45.5328, 9.22569, 'yyyy', '2015-05-15 20:02:48', 10, 'P', '+393899604951', 0, 'Sesto San Giovanni MI, Italy'),
(169, 45.4861, 9.22759, 'gdjjd', '2015-05-15 20:07:50', 10, 'P', '+393899604951', 0, 'Via Nicola Antonio Porpora, Milano, Italy'),
(170, 45.4959, 9.1387, 'priradiiiiii', '2015-05-15 20:10:58', 10, 'P', '', 0, 'Viale Certosa, Milano, Italy'),
(171, 45.4841, 9.20701, 'bem li ga vise', '2015-05-15 20:16:10', 10, 'P', '', 0, 'Via Mauro Macchi, Milano, Italy'),
(172, 45.6646, 9.70258, 'hshj', '2015-05-15 20:20:13', 10, 'P', '', 0, 'Via Aeroporto, 24050 Orio Al Serio BG, Italy'),
(173, 45.4932, 9.18237, 'yabc', '2015-05-15 20:36:41', 10, 'P', '', 0, 'Via Valtellina, Milano, Italy'),
(174, 45.47, 9.2086, 'yyyyy', '2015-05-15 20:38:16', 10, 'P', '', 0, 'Via Antonio Kramer, 20129 Milano, Italy'),
(175, 45.474, 9.23328, 'vatra vatra \ngori sve 1950', '2015-05-16 00:20:06', 38.274, 'F', '+385981909808', 0, 'Via Giacomo Venezian, 19-21, Milan'),
(176, 45.4806, 9.22461, 'help fire in tbe metro', '2015-05-16 00:26:58', 10, 'F', '', 0, 'Italy'),
(177, 45.4641, 9.19193, 'pozar kod duoma. penzioneri u opasnosti. Svi ostali su pobjegli davno.\nTrebamo pomoc', '2015-05-16 03:36:22', 10, 'F', '', 0, 'Piazza del Duomo, Milano, Italy'),
(178, 45.489, 9.20013, 'gjdhj', '2015-05-16 14:26:37', 10, 'P', '+393899604951', 0, 'Via Melchiorre Gioia, Milano, Italy'),
(179, 45.489, 9.20013, 'gjdhj', '2015-05-16 14:26:37', 10, 'P', '+393899604951', 0, 'Via Melchiorre Gioia, Milano, Italy'),
(180, 45.489, 9.20013, 'gjdhj', '2015-05-16 14:26:37', 10, 'P', '+393899604951', 0, 'Via Melchiorre Gioia, Milano, Italy'),
(181, 45.489, 9.20013, 'gjdhj', '2015-05-16 14:26:37', 10, 'P', '+393899604951', 0, 'Via Melchiorre Gioia, Milano, Italy'),
(182, 45.4459, 9.21322, 'suicide', '2015-05-16 14:32:40', 10, 'P', '+393899604951', 0, 'Italy'),
(183, 45.4519, 9.16313, 'bomb', '2015-05-16 14:34:01', 10, 'P', '+393899604951', 1, 'Via Tortona, 20144 Milano, Italy'),
(184, 45.8768, 8.66736, 'robbery', '2015-05-17 15:26:54', 1641, 'P', '+393899604951', 0, 'Caravate, Varese, Caravate'),
(185, 45.477, 9.22565, 'something happened', '2015-05-18 15:14:40', 10, 'P', '+393899604951', 0, 'Città Studi, Milano, Italy');

-- --------------------------------------------------------

--
-- Структура табеле `gcm_user`
--

CREATE TABLE IF NOT EXISTS `gcm_user` (
  `gcm_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_id` varchar(255) DEFAULT NULL,
  `auth_username` varchar(30) DEFAULT NULL,
  `auth_type` char(1) DEFAULT NULL,
  `auth_phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gcm_id`),
  UNIQUE KEY `auth_username` (`auth_username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Приказ података табеле `gcm_user`
--

INSERT INTO `gcm_user` (`gcm_id`, `registration_id`, `auth_username`, `auth_type`, `auth_phone`) VALUES
(1, 'APA91bH1jlLRPL694kJf6yQN-f_LMJcB-NrtHIaniIqBNcX7g-cygh9RP2BueJ6flt1H1DeNsOi_ONfIRtJvHfDKl3YhjQDvZzx-DVSKzKi2EpU0-eaSj3tFYdkvhaphFKFYuKurN9ETX-pfB4oJo3M5qCQRZxJGGA', 'nemtajo', 'E', '+381640722803'),
(6, 'APA91bGzz01z6Du3wkh2N-rkXUDvHBK6v8lMRW3uIn-E0ESLblCKmEGYz68CAhbuWJQYNjbZ2f5veWihtmUYLOSUZW2QuXGOR-5QBQtvuwrPZs3S8VpTbhzE0dORLfSA4kOKK8SNhnHOvzKDbMYTzEhDJTX7Vz7ROA', 'batman', 'P', '+38162208675'),
(7, ' APA91bFELu9lTDzabEEeIkhT3MYW0wJ_P-52wAzYUABswzDYy5kjMO2gmaVVGPR_SJ1C-ETsgXKGImu1SGI6S7XCF1GaabmtdqYmTMDL12E7HagXGBwS9IB-0I9Or_lPZM9PIh_8IVfy03mzbD9c3EFCJBByLm15GA', 'vatrogasacSam', 'F', '+385981909808');

-- --------------------------------------------------------

--
-- Структура табеле `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_username` varchar(30) NOT NULL,
  `event_id` int(11) NOT NULL,
  `job_description` varchar(160) DEFAULT NULL,
  `job_type` char(1) DEFAULT NULL,
  `job_status` varchar(15) NOT NULL DEFAULT 'taken',
  `job_creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `job_ending_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `event_id` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Приказ података табеле `job`
--

INSERT INTO `job` (`job_id`, `auth_username`, `event_id`, `job_description`, `job_type`, `job_status`, `job_creation_time`, `job_ending_time`) VALUES
(45, 'nemtajo', 29, 'that cat became alive', 'E', 'taken', '2015-04-11 18:49:31', '0000-00-00 00:00:00'),
(46, 'nemtajo', 44, 'robbery', 'E', 'taken', '2015-04-11 18:52:56', '0000-00-00 00:00:00'),
(47, 'nemtajo', 18, 'car accident', 'E', 'taken', '2015-04-11 18:59:30', '0000-00-00 00:00:00'),
(76, 'batman', 159, 'something bad happened something bad happened something bad happened something bad happened something bad happened something bad happened ', 'P', 'taken', '2015-05-18 15:13:10', '0000-00-00 00:00:00'),
(50, 'batman', 13, 'pljacka', 'P', 'taken', '2015-05-15 16:56:27', '0000-00-00 00:00:00'),
(53, 'vatrogasacSam', 175, 'vatra vatra \ngori sve 1950', 'F', 'taken', '2015-05-16 00:36:44', '0000-00-00 00:00:00'),
(55, 'vatrogasacSam', 111, 'zhs', 'F', 'taken', '2015-05-16 00:37:49', '0000-00-00 00:00:00'),
(58, 'vatrogasacSam', 72, 'hh', 'F', 'taken', '2015-05-16 02:15:54', '0000-00-00 00:00:00'),
(59, 'vatrogasacSam', 21, 'umeessagr', 'F', 'taken', '2015-05-16 03:35:48', '0000-00-00 00:00:00'),
(60, 'vatrogasacSam', 105, 'pozar!!', 'F', 'taken', '2015-05-16 03:38:57', '0000-00-00 00:00:00'),
(61, 'vatrogasacSam', 160, 'm122', 'F', 'taken', '2015-05-16 03:39:18', '0000-00-00 00:00:00'),
(62, 'vatrogasacSam', 106, 'jsjz', 'F', 'taken', '2015-05-16 03:39:40', '0000-00-00 00:00:00'),
(63, 'vatrogasacSam', 107, 'ffc', 'F', 'taken', '2015-05-16 03:39:58', '0000-00-00 00:00:00'),
(64, 'vatrogasacSam', 108, 'hh', 'F', 'taken', '2015-05-16 03:40:05', '0000-00-00 00:00:00'),
(65, 'vatrogasacSam', 109, 'hh', 'F', 'taken', '2015-05-16 03:40:14', '0000-00-00 00:00:00'),
(66, 'vatrogasacSam', 112, 'yhh', 'F', 'taken', '2015-05-16 03:40:25', '0000-00-00 00:00:00'),
(67, 'vatrogasacSam', 11, 'pozar', 'F', 'taken', '2015-05-16 03:40:32', '0000-00-00 00:00:00'),
(68, 'vatrogasacSam', 22, 'vatra', 'F', 'taken', '2015-05-16 03:40:44', '0000-00-00 00:00:00'),
(70, 'vatrogasacSam', 115, 'b', 'F', 'taken', '2015-05-16 03:41:03', '0000-00-00 00:00:00'),
(71, 'vatrogasacSam', 15, 'dhdh', 'F', 'taken', '2015-05-16 03:41:13', '0000-00-00 00:00:00'),
(72, 'vatrogasacSam', 27, 'pozar', 'F', 'taken', '2015-05-16 03:41:24', '0000-00-00 00:00:00'),
(73, 'vatrogasacSam', 102, 'pozar!!', 'F', 'taken', '2015-05-16 03:41:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура табеле `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_username` varchar(30) NOT NULL,
  `event_id` int(11) NOT NULL,
  `job_type` char(1) DEFAULT NULL,
  `job_status` varchar(15) NOT NULL,
  `review_creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `event_id` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Приказ података табеле `review`
--

INSERT INTO `review` (`review_id`, `auth_username`, `event_id`, `job_type`, `job_status`, `review_creation_time`) VALUES
(1, 'nemtajo', 29, 'E', 'Solved', '2015-04-11 18:50:17'),
(2, 'nemtajo', 44, 'E', 'Solved', '2015-04-11 18:53:20'),
(3, 'nemtajo', 18, 'E', 'Solved', '2015-04-12 10:20:12'),
(4, 'batman', 13, 'P', 'Solved', '2015-05-15 16:56:50'),
(5, 'vatrogasacSam', 175, 'F', 'Solved', '2015-05-16 00:37:02'),
(6, 'vatrogasacSam', 111, 'F', 'Solved', '2015-05-16 00:37:56'),
(7, 'vatrogasacSam', 72, 'F', 'Impossible to s', '2015-05-16 02:17:33'),
(8, 'vatrogasacSam', 21, 'F', 'Solved', '2015-05-16 03:36:05'),
(9, 'vatrogasacSam', 105, 'F', 'Solved', '2015-05-16 03:39:13'),
(10, 'vatrogasacSam', 160, 'F', 'Solved', '2015-05-16 03:39:25'),
(11, 'vatrogasacSam', 106, 'F', 'Solved', '2015-05-16 03:39:51'),
(12, 'vatrogasacSam', 107, 'F', 'Solved', '2015-05-16 03:40:02'),
(13, 'vatrogasacSam', 108, 'F', 'Solved', '2015-05-16 03:40:10'),
(14, 'vatrogasacSam', 109, 'F', 'Solved', '2015-05-16 03:40:18'),
(15, 'vatrogasacSam', 112, 'F', 'Solved', '2015-05-16 03:40:29'),
(16, 'vatrogasacSam', 11, 'F', 'Solved', '2015-05-16 03:40:39'),
(17, 'vatrogasacSam', 22, 'F', 'Solved', '2015-05-16 03:40:50'),
(18, 'vatrogasacSam', 115, 'F', 'Solved', '2015-05-16 03:41:08'),
(19, 'vatrogasacSam', 15, 'F', 'Solved', '2015-05-16 03:41:20'),
(20, 'vatrogasacSam', 27, 'F', 'Solved', '2015-05-16 03:41:29'),
(21, 'vatrogasacSam', 102, 'F', 'Solved', '2015-05-16 03:41:43'),
(22, 'batman', 159, 'P', 'Solved', '2015-05-18 15:13:31');

-- --------------------------------------------------------

--
-- Структура табеле `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `phone_number` (`phone_number`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Приказ података табеле `user`
--

INSERT INTO `user` (`user_id`, `username`, `phone_number`) VALUES
(16, 'sara', '+919487083025'),
(15, 'saravana', '9790272025'),
(13, 'joca', '+3913629'),
(12, 'test11', '+111'),
(11, 'etst123', '+12'),
(14, 'nemtajo', '+393209081965'),
(17, 'swap', '+919766100079'),
(18, 'dumb', '+25472035078556456'),
(19, 'joew', '+16488789025'),
(20, 'genesis', '+639051480953'),
(21, 'muraya', '+1342626626'),
(22, 'agwkduw', '+188484444'),
(23, 'genesis', '+639051480933'),
(24, 'tyu', '+254720350785'),
(25, 'were', '+23345551771771'),
(26, 'ghe', '+254720258369'),
(27, 'milica13629', '+39888888'),
(28, 'assdd', '+2'),
(29, 'mirjam', '+3912354'),
(37, 'mirjam01', '+385981909808'),
(32, 'hrHtc', '098'),
(34, 'mirjam0', '981909808'),
(35, 'mirjam01', '+385981909808'),
(38, 'mirjam01', '+385981909808'),
(39, 'mirjam', '+385981909808'),
(40, 'mirjam1', '+385981909808'),
(41, 'mirjam2', '+385981909808'),
(42, 'milisko', '+393899604951'),
(43, 'mirjam03', '+385981909808');

-- --------------------------------------------------------

--
-- Структура табеле `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура табеле `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура табеле `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура табеле `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1677 ;

--
-- Приказ података табеле `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://nemanjastolic.co.nf', 'yes'),
(2, 'blogname', 'Nemanja Stolic', 'yes'),
(3, 'blogdescription', 'Software Engineer', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'nemtajo@yahoo.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '1', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'F j, Y', 'yes'),
(23, 'time_format', 'g:i a', 'yes'),
(24, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:6:{i:0;s:43:"always-edit-in-html/always-edit-in-html.php";i:1;s:25:"insert-php/insert_php.php";i:2;s:43:"page-layout-builder/page-layout-builder.php";i:3;s:32:"page-templater/pagetemplater.php";i:4;s:31:"wp-biographia/wp-biographia.php";i:5;s:27:"wp-pagenavi/wp-pagenavi.php";}', 'yes'),
(36, 'home', 'http://nemanjastolic.co.nf', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '0', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', 'a:4:{i:0;s:91:"/srv/disk8/1463364/www/nemanjastolic.co.nf/wordpress/wp-content/themes/portfolium/style.css";i:1;s:90:"/srv/disk8/1463364/www/nemanjastolic.co.nf/wordpress/wp-content/themes/portfolium/page.php";i:3;s:117:"/srv/disk8/1463364/www/nemanjastolic.co.nf/wordpress/wp-content/plugins/stolic-social-widget/stolic-social-widget.php";i:4;s:0:"";}', 'no'),
(44, 'template', 'portfolium', 'yes'),
(45, 'stylesheet', 'portfolium', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '0', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '29632', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'page', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '145', 'yes'),
(63, 'thumbnail_size_h', '145', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '785', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '0', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '0', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(84, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(85, 'uninstall_plugins', 'a:3:{s:27:"wp-pagenavi/wp-pagenavi.php";s:14:"__return_false";s:57:"simple-share-buttons-adder/simple-share-buttons-adder.php";s:14:"ssba_uninstall";s:45:"simple-local-avatars/simple-local-avatars.php";s:30:"simple_local_avatars_uninstall";}', 'no'),
(86, 'timezone_string', '', 'yes'),
(331, 'disable_like_pagetype_40', 'article', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '22442', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:5:{i:1432367520;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1432383087;a:3:{s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1432383136;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1432400931;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(1488, 'minimax_frontend_editing', '0', 'yes'),
(294, 'disable_like_status_20', '', 'yes'),
(295, 'disable_like_pagetype_20', '', 'yes'),
(314, 'disable_like_status_24', '', 'yes'),
(315, 'disable_like_pagetype_24', '', 'yes'),
(316, 'disable_like_status_27', '', 'yes'),
(242, 'cscf_options', 'a:1:{s:13:"confirm-email";b:1;}', 'yes'),
(373, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(374, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(237, 'akismet_strictness', '0', 'yes'),
(238, 'akismet_show_user_comments_approved', '0', 'yes'),
(372, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:26:"http://nemanjastolic.co.nf";s:4:"link";s:102:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://nemanjastolic.co.nf/";s:3:"url";s:135:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://nemanjastolic.co.nf/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(1470, '_site_transient_timeout_browser_837ac6e56c8bf9987e4fbaa5079e156e', '1431201538', 'yes'),
(1471, '_site_transient_browser_837ac6e56c8bf9987e4fbaa5079e156e', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"42.0.2311.90";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1473, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430639942', 'no'),
(1476, '_transient_timeout_feed_867bd5c64f85878d03a060509cd2f92c', '1430639943', 'no'),
(1541, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:3:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:12:"notify_email";s:1:"1";s:13:"support_email";s:26:"updatehelp42@wordpress.org";}i:2;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.5.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.5.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.5-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.1.5-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.1.5";s:7:"version";s:5:"4.1.5";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:13:"support_email";s:26:"updatehelp42@wordpress.org";}}s:12:"last_checked";i:1432352695;s:15:"version_checked";s:5:"4.0.5";s:12:"translations";a:0:{}}', 'yes'),
(1675, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1432352697;s:7:"checked";a:3:{s:10:"portfolium";s:3:"1.0";s:12:"twentyeleven";s:3:"1.5";s:12:"twentytwelve";s:3:"1.1";}s:8:"response";a:2:{s:12:"twentyeleven";a:4:{s:5:"theme";s:12:"twentyeleven";s:11:"new_version";s:3:"2.1";s:3:"url";s:42:"https://wordpress.org/themes/twentyeleven/";s:7:"package";s:58:"https://downloads.wordpress.org/theme/twentyeleven.2.1.zip";}s:12:"twentytwelve";a:4:{s:5:"theme";s:12:"twentytwelve";s:11:"new_version";s:3:"1.7";s:3:"url";s:42:"https://wordpress.org/themes/twentytwelve/";s:7:"package";s:58:"https://downloads.wordpress.org/theme/twentytwelve.1.7.zip";}}s:12:"translations";a:0:{}}', 'yes'),
(1676, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1432352697;s:8:"response";a:8:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.1.zip";}s:51:"all-in-one-wp-security-and-firewall/wp-security.php";O:8:"stdClass":6:{s:2:"id";s:5:"41309";s:4:"slug";s:35:"all-in-one-wp-security-and-firewall";s:6:"plugin";s:51:"all-in-one-wp-security-and-firewall/wp-security.php";s:11:"new_version";s:6:"v3.9.6";s:3:"url";s:66:"https://wordpress.org/plugins/all-in-one-wp-security-and-firewall/";s:7:"package";s:78:"https://downloads.wordpress.org/plugin/all-in-one-wp-security-and-firewall.zip";}s:43:"always-edit-in-html/always-edit-in-html.php";O:8:"stdClass":6:{s:2:"id";s:5:"21670";s:4:"slug";s:19:"always-edit-in-html";s:6:"plugin";s:43:"always-edit-in-html/always-edit-in-html.php";s:11:"new_version";s:3:"1.7";s:3:"url";s:50:"https://wordpress.org/plugins/always-edit-in-html/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/always-edit-in-html.zip";}s:95:"clean-and-simple-contact-form-by-meg-nicholas/clean-and-simple-contact-form-by-meg-nicholas.php";O:8:"stdClass":7:{s:2:"id";s:5:"40316";s:4:"slug";s:45:"clean-and-simple-contact-form-by-meg-nicholas";s:6:"plugin";s:95:"clean-and-simple-contact-form-by-meg-nicholas/clean-and-simple-contact-form-by-meg-nicholas.php";s:11:"new_version";s:5:"4.4.4";s:3:"url";s:76:"https://wordpress.org/plugins/clean-and-simple-contact-form-by-meg-nicholas/";s:7:"package";s:94:"https://downloads.wordpress.org/plugin/clean-and-simple-contact-form-by-meg-nicholas.4.4.4.zip";s:14:"upgrade_notice";s:102:"Added languages, css fix for twenty fifteen theme, remove &#039;notice&#039; errors, remove empty divs";}s:43:"page-layout-builder/page-layout-builder.php";O:8:"stdClass":6:{s:2:"id";s:5:"41069";s:4:"slug";s:19:"page-layout-builder";s:6:"plugin";s:43:"page-layout-builder/page-layout-builder.php";s:11:"new_version";s:5:"1.9.0";s:3:"url";s:50:"https://wordpress.org/plugins/page-layout-builder/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/page-layout-builder.zip";}s:57:"simple-share-buttons-adder/simple-share-buttons-adder.php";O:8:"stdClass":6:{s:2:"id";s:5:"39087";s:4:"slug";s:26:"simple-share-buttons-adder";s:6:"plugin";s:57:"simple-share-buttons-adder/simple-share-buttons-adder.php";s:11:"new_version";s:3:"5.6";s:3:"url";s:57:"https://wordpress.org/plugins/simple-share-buttons-adder/";s:7:"package";s:69:"https://downloads.wordpress.org/plugin/simple-share-buttons-adder.zip";}s:45:"use-google-libraries/use-google-libraries.php";O:8:"stdClass":7:{s:2:"id";s:4:"5425";s:4:"slug";s:20:"use-google-libraries";s:6:"plugin";s:45:"use-google-libraries/use-google-libraries.php";s:11:"new_version";s:7:"1.6.2.1";s:3:"url";s:51:"https://wordpress.org/plugins/use-google-libraries/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/use-google-libraries.1.6.2.1.zip";s:14:"upgrade_notice";s:116:"Bypass UGL in unsupported versions of WordPress (update now, and UGL will start working again when it&#039;s ready).";}s:27:"wp-pagenavi/wp-pagenavi.php";O:8:"stdClass":6:{s:2:"id";s:3:"363";s:4:"slug";s:11:"wp-pagenavi";s:6:"plugin";s:27:"wp-pagenavi/wp-pagenavi.php";s:11:"new_version";s:4:"2.87";s:3:"url";s:42:"https://wordpress.org/plugins/wp-pagenavi/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/wp-pagenavi.2.87.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:4:{s:25:"insert-php/insert_php.php";O:8:"stdClass":7:{s:2:"id";s:5:"36076";s:4:"slug";s:10:"insert-php";s:6:"plugin";s:25:"insert-php/insert_php.php";s:11:"new_version";s:3:"1.2";s:3:"url";s:41:"https://wordpress.org/plugins/insert-php/";s:7:"package";s:53:"https://downloads.wordpress.org/plugin/insert-php.zip";s:14:"upgrade_notice";s:28:"Changed handling of content.";}s:45:"simple-local-avatars/simple-local-avatars.php";O:8:"stdClass":7:{s:2:"id";s:5:"20007";s:4:"slug";s:20:"simple-local-avatars";s:6:"plugin";s:45:"simple-local-avatars/simple-local-avatars.php";s:11:"new_version";s:3:"2.0";s:3:"url";s:51:"https://wordpress.org/plugins/simple-local-avatars/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/simple-local-avatars.2.0.zip";s:14:"upgrade_notice";s:273:"Upgraded to take advantage of WordPress 3.5 and newer. Does not support older versions! This has also not been tested with front end profile plug-ins - feedback welcome. Note that several language strings have been added or modified - revised translations would be welcome!";}s:33:"social-media-icons/smc_widget.php";O:8:"stdClass":6:{s:2:"id";s:5:"30642";s:4:"slug";s:18:"social-media-icons";s:6:"plugin";s:33:"social-media-icons/smc_widget.php";s:11:"new_version";s:5:"1.2.7";s:3:"url";s:49:"https://wordpress.org/plugins/social-media-icons/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/social-media-icons.1.2.7.zip";}s:31:"wp-biographia/wp-biographia.php";O:8:"stdClass":7:{s:2:"id";s:5:"24471";s:4:"slug";s:13:"wp-biographia";s:6:"plugin";s:31:"wp-biographia/wp-biographia.php";s:11:"new_version";s:5:"3.3.2";s:3:"url";s:44:"https://wordpress.org/plugins/wp-biographia/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/wp-biographia.3.3.2.zip";s:14:"upgrade_notice";s:154:"This version now supports changes in category behaviour introduced in WordPress v3.7 and which meant every post was considered to be excluded by category.";}}}', 'yes'),
(371, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(1673, '_site_transient_timeout_theme_roots', '1432354493', 'yes'),
(1674, '_site_transient_theme_roots', 'a:3:{s:10:"portfolium";s:7:"/themes";s:12:"twentyeleven";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(138, 'recently_activated', 'a:6:{s:19:"akismet/akismet.php";i:1418341253;s:26:"better-page-speed/main.php";i:1418338666;s:95:"clean-and-simple-contact-form-by-meg-nicholas/clean-and-simple-contact-form-by-meg-nicholas.php";i:1418338666;s:45:"simple-local-avatars/simple-local-avatars.php";i:1418338666;s:57:"simple-share-buttons-adder/simple-share-buttons-adder.php";i:1418338666;s:33:"social-media-icons/smc_widget.php";i:1418338666;}', 'yes'),
(144, 'current_theme', 'Portfolium', 'yes'),
(145, 'theme_mods_portfolium', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:6:"Header";i:0;}}', 'yes'),
(146, 'theme_switched', '', 'yes'),
(375, 'widget_wp_biographiawidget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(149, 'ssba_version', '5.0', 'yes'),
(150, 'ssba_image_set', 'somacro', 'yes'),
(151, 'ssba_size', '35', 'yes'),
(152, 'ssba_pages', '', 'yes'),
(153, 'ssba_posts', '', 'yes'),
(147, 'pagenavi_options', 'a:15:{s:10:"pages_text";s:36:"Page %CURRENT_PAGE% of %TOTAL_PAGES%";s:12:"current_text";s:13:"%PAGE_NUMBER%";s:9:"page_text";s:13:"%PAGE_NUMBER%";s:10:"first_text";s:13:"&laquo; First";s:9:"last_text";s:12:"Last &raquo;";s:9:"prev_text";s:7:"&laquo;";s:9:"next_text";s:7:"&raquo;";s:12:"dotleft_text";s:3:"...";s:13:"dotright_text";s:3:"...";s:9:"num_pages";i:5;s:23:"num_larger_page_numbers";i:3;s:28:"larger_page_numbers_multiple";i:10;s:11:"always_show";b:0;s:16:"use_pagenavi_css";b:1;s:5:"style";i:1;}', 'yes'),
(148, 'wp_biographia_settings', 'a:67:{s:23:"wp_biographia_installed";s:2:"on";s:21:"wp_biographia_version";s:3:"332";s:22:"wp_biographia_style_bg";s:7:"#7B7E5B";s:26:"wp_biographia_style_border";s:3:"top";s:33:"wp_biographia_display_front_posts";s:0:"";s:36:"wp_biographia_display_archives_posts";s:0:"";s:43:"wp_biographia_display_author_archives_posts";s:0:"";s:45:"wp_biographia_display_category_archives_posts";s:0:"";s:41:"wp_biographia_display_date_archives_posts";s:0:"";s:40:"wp_biographia_display_tag_archives_posts";s:0:"";s:27:"wp_biographia_display_posts";s:0:"";s:27:"wp_biographia_display_pages";s:0:"";s:26:"wp_biographia_display_feed";s:0:"";s:30:"wp_biographia_display_location";s:6:"bottom";s:28:"wp_biographia_content_prefix";s:0:"";s:26:"wp_biographia_content_name";s:15:"first-last-name";s:32:"wp_biographia_content_authorpage";s:2:"on";s:27:"wp_biographia_content_image";s:2:"on";s:32:"wp_biographia_content_image_size";s:3:"100";s:25:"wp_biographia_content_bio";s:2:"on";s:27:"wp_biographia_content_icons";s:0:"";s:31:"wp_biographia_content_alt_icons";s:0:"";s:30:"wp_biographia_content_icon_url";s:0:"";s:27:"wp_biographia_content_email";s:0:"";s:25:"wp_biographia_content_web";s:0:"";s:29:"wp_biographia_content_twitter";s:0:"";s:30:"wp_biographia_content_facebook";s:0:"";s:30:"wp_biographia_content_linkedin";s:0:"";s:32:"wp_biographia_content_googleplus";s:0:"";s:31:"wp_biographia_content_delicious";s:0:"";s:28:"wp_biographia_content_flickr";s:0:"";s:28:"wp_biographia_content_picasa";s:0:"";s:27:"wp_biographia_content_vimeo";s:0:"";s:29:"wp_biographia_content_youtube";s:0:"";s:28:"wp_biographia_content_reddit";s:0:"";s:27:"wp_biographia_content_posts";s:8:"extended";s:33:"wp_biographia_content_link_target";s:5:"_self";s:35:"wp_biographia_content_link_nofollow";s:0:"";s:29:"wp_biographia_admin_new_users";s:0:"";s:33:"wp_biographia_admin_hide_profiles";s:0:"";s:33:"wp_biographia_category_exclusions";s:0:"";s:29:"wp_biographia_post_exclusions";s:0:"";s:36:"wp_biographia_global_post_exclusions";s:0:"";s:29:"wp_biographia_page_exclusions";s:3:"113";s:36:"wp_biographia_admin_content_priority";i:10;s:36:"wp_biographia_admin_excerpt_priority";i:10;s:34:"wp_biographia_sync_content_wpautop";s:0:"";s:34:"wp_biographia_sync_excerpt_wpautop";s:0:"";s:34:"wp_biographia_admin_post_overrides";s:0:"";s:25:"wp_biographia_admin_links";a:14:{s:7:"twitter";s:2:"on";s:8:"facebook";s:2:"on";s:8:"linkedin";s:2:"on";s:10:"googleplus";s:2:"on";s:9:"delicious";s:2:"on";s:6:"flickr";s:2:"on";s:6:"picasa";s:2:"on";s:5:"vimeo";s:2:"on";s:7:"youtube";s:2:"on";s:6:"reddit";s:2:"on";s:3:"yim";s:2:"on";s:3:"aim";s:2:"on";s:3:"msn";s:2:"on";s:6:"jabber";s:2:"on";}s:37:"wp_biographia_display_front_bio_posts";s:4:"full";s:40:"wp_biographia_display_archives_bio_posts";s:4:"full";s:47:"wp_biographia_display_author_archives_bio_posts";s:4:"full";s:49:"wp_biographia_display_category_archives_bio_posts";s:4:"full";s:45:"wp_biographia_display_date_archives_bio_posts";s:4:"full";s:44:"wp_biographia_display_tag_archives_bio_posts";s:4:"full";s:31:"wp_biographia_display_bio_posts";s:4:"full";s:31:"wp_biographia_display_bio_pages";s:4:"full";s:30:"wp_biographia_display_bio_feed";s:4:"full";s:32:"wp_biographia_admin_lock_to_loop";s:0:"";s:32:"wp_biographia_style_border_color";s:7:"#D4AF56";s:38:"wp_biographia_nav_menu_item_exclusions";s:0:"";s:45:"wp_biographia_global_nav_menu_item_exclusions";s:0:"";s:31:"wp_biographia_display_portfolio";s:0:"";s:35:"wp_biographia_display_bio_portfolio";s:4:"full";s:40:"wp_biographia_display_archives_portfolio";s:0:"";s:44:"wp_biographia_display_archives_bio_portfolio";s:4:"full";}', 'yes'),
(154, 'ssba_cats_archs', '', 'yes'),
(155, 'ssba_homepage', '', 'yes'),
(156, 'ssba_excerpts', '', 'yes'),
(157, 'ssba_align', 'left', 'yes'),
(158, 'ssba_padding', '6', 'yes'),
(159, 'ssba_before_or_after', 'after', 'yes'),
(160, 'ssba_custom_styles', '', 'yes'),
(161, 'ssba_email_message', '', 'yes'),
(162, 'ssba_twitter_text', '', 'yes'),
(163, 'ssba_buffer_text', '', 'yes'),
(164, 'ssba_flattr_user_id', '', 'yes'),
(165, 'ssba_flattr_url', '', 'yes'),
(166, 'ssba_share_new_window', 'Y', 'yes'),
(167, 'ssba_link_to_ssb', 'N', 'yes'),
(168, 'ssba_show_share_count', '', 'yes'),
(169, 'ssba_share_count_style', 'default', 'yes'),
(170, 'ssba_share_count_css', '', 'yes'),
(171, 'ssba_share_count_once', 'Y', 'yes'),
(172, 'ssba_widget_text', '', 'yes'),
(173, 'ssba_rel_nofollow', '', 'yes'),
(174, 'ssba_div_padding', '', 'yes'),
(175, 'ssba_div_rounded_corners', '', 'yes'),
(176, 'ssba_border_width', '', 'yes'),
(177, 'ssba_div_border', '#59625c', 'yes'),
(178, 'ssba_div_background', '', 'yes'),
(179, 'ssba_share_text', 'It''s only fair to share...', 'yes'),
(180, 'ssba_text_placement', 'left', 'yes'),
(181, 'ssba_font_family', 'Indie Flower', 'yes'),
(182, 'ssba_font_color', '', 'yes'),
(183, 'ssba_font_size', '20', 'yes'),
(184, 'ssba_font_weight', '', 'yes'),
(185, 'ssba_selected_buttons', '', 'yes'),
(186, 'ssba_custom_email', '', 'yes'),
(187, 'ssba_custom_google', '', 'yes'),
(188, 'ssba_custom_facebook', '', 'yes'),
(189, 'ssba_custom_twitter', '', 'yes'),
(190, 'ssba_custom_diggit', '', 'yes'),
(191, 'ssba_custom_linkedin', '', 'yes'),
(192, 'ssba_custom_reddit', '', 'yes'),
(193, 'ssba_custom_stumbleupon', '', 'yes'),
(194, 'ssba_custom_pinterest', '', 'yes'),
(195, 'ssba_custom_buffer', '', 'yes'),
(196, 'ssba_custom_flattr', '', 'yes'),
(197, 'ssba_custom_tumblr', '', 'yes'),
(198, 'ssba_custom_print', '', 'yes'),
(199, 'ssba_custom_vk', '', 'yes'),
(200, 'ssba_custom_yummly', '', 'yes'),
(201, 'cscf_version', '4.4.2', 'yes'),
(202, 'fb_like_appid', '', 'yes'),
(203, 'fb_like_type', '', 'yes'),
(204, 'fb_like_pos', '', 'yes'),
(205, 'fb_like_layout', '', 'yes'),
(206, 'fb_like_face', '', 'yes'),
(207, 'fb_like_verb', '', 'yes'),
(208, 'fb_like_color', '', 'yes'),
(209, 'fb_like_width', '', 'yes'),
(210, 'fb_like_height', '', 'yes'),
(211, 'fb_like_ht', '', 'yes'),
(212, 'fb_like_css', '', 'yes'),
(213, 'fb_like_home', '', 'yes'),
(214, 'fb_like_page', '', 'yes'),
(215, 'fb_like_post', '', 'yes'),
(216, 'fb_like_cat', '', 'yes'),
(217, 'fb_like_arch', '', 'yes'),
(218, 'fb_like_admeta', '', 'yes'),
(219, 'fb_like_dimage', '', 'yes'),
(220, 'fb_like_enimg', '', 'yes'),
(221, 'fb_like_align', '', 'yes'),
(222, 'fb_like_social', '', 'yes'),
(223, 'fb_like_add', '', 'yes'),
(224, 'fpp_rec_appid', '', 'yes'),
(225, 'fpp_rec_method', '', 'yes'),
(226, 'fpp_rec_domain', '', 'yes'),
(227, 'fpp_rec_width', '', 'yes'),
(228, 'fpp_rec_height', '', 'yes'),
(229, 'fpp_rec_layout', '', 'yes'),
(230, 'fpp_rec_font', '', 'yes'),
(231, 'fpp_rec_border', '', 'yes'),
(232, 'fpp_rec_header', '', 'yes'),
(233, 'fpp_rec_wid_title', '', 'yes'),
(234, 'fblikes_locale', 'default', 'yes'),
(235, 'fblikes_font', '', 'yes'),
(251, 'disable_like_status_6', '', 'yes'),
(252, 'disable_like_pagetype_6', '', 'yes'),
(279, 'disable_like_pagetype_12', '', 'yes'),
(312, 'disable_like_status_23', '', 'yes'),
(282, '_transient_random_seed', '4492fef7cf7b6ae07be2843396747ddc', 'yes'),
(253, 'disable_like_status_8', '', 'yes'),
(254, 'disable_like_pagetype_8', '', 'yes'),
(255, 'disable_like_status_2', '', 'yes'),
(256, 'disable_like_pagetype_2', '', 'yes'),
(271, 'category_children', 'a:3:{i:3;a:3:{i:0;i:4;i:1;i:5;i:2;i:6;}i:7;a:3:{i:0;i:8;i:1;i:9;i:2;i:13;}i:4;a:3:{i:0;i:10;i:1;i:11;i:2;i:12;}}', 'yes'),
(317, 'disable_like_pagetype_27', '', 'yes'),
(288, 'disable_like_status_1', '', 'yes'),
(278, 'disable_like_status_12', '', 'yes'),
(287, 'theme_mods_twentyeleven', 'a:9:{i:0;b:0;s:16:"header_textcolor";s:3:"000";s:16:"background_color";s:6:"e2e2e2";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:18:"nav_menu_locations";a:1:{s:7:"primary";i:0;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1418326100;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;s:9:"sidebar-4";N;s:9:"sidebar-5";N;}}}', 'yes'),
(289, 'disable_like_pagetype_1', '', 'yes'),
(313, 'disable_like_pagetype_23', '', 'yes'),
(309, 'theme_mods_twentytwelve', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1418326476;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(306, 'twentyeleven_theme_options', 'a:3:{s:12:"color_scheme";s:5:"light";s:10:"link_color";s:7:"#1b8be0";s:12:"theme_layout";s:15:"content-sidebar";}', 'yes'),
(320, 'disable_like_status_31', '', 'yes'),
(318, 'disable_like_status_29', '', 'yes'),
(319, 'disable_like_pagetype_29', '', 'yes'),
(321, 'disable_like_pagetype_31', '', 'yes'),
(322, 'disable_like_status_33', '', 'yes'),
(323, 'disable_like_pagetype_33', '', 'yes'),
(326, 'disable_like_status_38', '', 'yes'),
(327, 'disable_like_pagetype_38', 'article', 'yes'),
(328, 'disable_like_status_39', '', 'yes'),
(329, 'disable_like_pagetype_39', 'article', 'yes'),
(330, 'disable_like_status_40', '', 'yes'),
(332, 'page_on_front', '38', 'yes'),
(333, 'page_for_posts', '39', 'yes'),
(370, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:1:{i:0;i:2;}}', 'yes'),
(336, 'WPLANG', '', 'yes'),
(337, 'db_upgraded', '1', 'yes'),
(1395, 'auto_core_update_notified', 'a:4:{s:4:"type";s:6:"manual";s:5:"email";s:17:"nemtajo@yahoo.com";s:7:"version";s:5:"4.2.2";s:9:"timestamp";i:1431492939;}', 'yes');

-- --------------------------------------------------------

--
-- Структура табеле `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

--
-- Приказ података табеле `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(86, 60, '_menu_item_menu_item_parent', '0'),
(85, 60, '_menu_item_type', 'post_type'),
(5, 7, '_wp_attached_file', '2014/12/DSC_0065-64x64.jpg'),
(6, 7, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:64;s:6:"height";i:64;s:4:"file";s:26:"2014/12/DSC_0065-64x64.jpg";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(101, 78, '_menu_item_object_id', '77'),
(82, 59, '_menu_item_xfn', ''),
(83, 59, '_menu_item_url', ''),
(78, 59, '_menu_item_object_id', '40'),
(81, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(79, 59, '_menu_item_object', 'page'),
(80, 59, '_menu_item_target', ''),
(102, 78, '_menu_item_object', 'page'),
(76, 59, '_menu_item_type', 'post_type'),
(77, 59, '_menu_item_menu_item_parent', '0'),
(99, 78, '_menu_item_type', 'post_type'),
(98, 78, 'editInHTML', 'off'),
(97, 77, '_edit_lock', '1418486086:1'),
(96, 77, '_edit_last', '1'),
(95, 38, '_oembed_71bb783f647497977687be66f94a92b2', '{{unknown}}'),
(94, 38, 'editInHTML', 'on'),
(58, 39, '_edit_last', '1'),
(59, 39, '_edit_lock', '1418329950:1'),
(60, 40, '_edit_last', '1'),
(61, 40, '_edit_lock', '1418329960:1'),
(62, 43, '_edit_last', '1'),
(63, 43, '_edit_lock', '1418341520:1'),
(64, 7, '_wp_attachment_image_alt', 'NEMANJA STOLIC'),
(57, 38, '_edit_lock', '1428088195:1'),
(56, 38, '_edit_last', '1'),
(87, 60, '_menu_item_object_id', '39'),
(88, 60, '_menu_item_object', 'page'),
(89, 60, '_menu_item_target', ''),
(90, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(91, 60, '_menu_item_xfn', ''),
(92, 60, '_menu_item_url', ''),
(100, 78, '_menu_item_menu_item_parent', '0'),
(103, 78, '_menu_item_target', ''),
(104, 78, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(105, 78, '_menu_item_xfn', ''),
(106, 78, '_menu_item_url', ''),
(107, 77, 'editInHTML', 'off'),
(133, 88, '_menu_item_object', 'page'),
(132, 88, '_menu_item_object_id', '87'),
(131, 88, '_menu_item_menu_item_parent', '0'),
(130, 88, '_menu_item_type', 'post_type'),
(129, 88, 'editInHTML', 'on'),
(128, 87, '_edit_lock', '1430597050:1'),
(127, 87, '_edit_last', '1'),
(134, 88, '_menu_item_target', ''),
(135, 88, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(136, 88, '_menu_item_xfn', ''),
(137, 88, '_menu_item_url', ''),
(138, 87, 'editInHTML', 'on'),
(139, 87, '_wp_page_template', 'default');

-- --------------------------------------------------------

--
-- Структура табеле `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- Приказ података табеле `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(77, 1, '2014-12-12 14:56:59', '2014-12-12 14:56:59', '<iframe width=100% height="650" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'publish', 'open', 'open', '', 'expo-project', '', '', '2014-12-13 15:25:44', '2014-12-13 15:25:44', '', 0, 'http://nemanjastolic.co.nf/?page_id=77', 0, 'page', '', 0),
(68, 1, '2014-12-12 14:17:03', '2014-12-12 14:17:03', '<iframe src="javascript:false;" frameborder="0" scrolling="no" name="iframeshim" onload="this.contentDocument ? this.contentDocument.body.innerHTML = &quot;&quot; : this.contentWindow ? this.contentWindow.document.body.innerHTML = &quot;&quot; : null" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10000;"></iframe>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:17:03', '2014-12-12 14:17:03', '', 38, 'http://nemanjastolic.co.nf/?p=68', 0, 'revision', '', 0),
(69, 1, '2014-12-12 14:17:48', '2014-12-12 14:17:48', '</p><iframe src="javascript:false;" frameborder="0" scrolling="no" name="iframeshim" onload="this.contentDocument ? this.contentDocument.body.innerHTML = &quot;&quot; : this.contentWindow ? this.contentWindow.document.body.innerHTML = &quot;&quot; : null" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10000;"></iframe><p>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:17:48', '2014-12-12 14:17:48', '', 38, 'http://nemanjastolic.co.nf/?p=69', 0, 'revision', '', 0),
(78, 1, '2014-12-12 14:56:59', '2014-12-12 14:56:59', ' ', '', '', 'publish', 'open', 'open', '', '78', '', '', '2014-12-12 16:32:56', '2014-12-12 16:32:56', '', 0, 'http://nemanjastolic.co.nf/?p=78', 3, 'nav_menu_item', '', 0),
(79, 1, '2014-12-12 14:56:59', '2014-12-12 14:56:59', '<iframe width="560" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=QKZJDF5QWO0AAAAAAAABOw&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C53.26090895938182%2C%2C0%2C-4.575949921918365"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-12 14:56:59', '2014-12-12 14:56:59', '', 77, 'http://nemanjastolic.co.nf/?p=79', 0, 'revision', '', 0),
(7, 1, '2014-12-11 17:13:34', '2014-12-11 17:13:34', '', 'DSC_0065-64x64', '', 'inherit', 'open', 'open', '', 'dsc_0065-64x64', '', '', '2014-12-11 23:47:04', '2014-12-11 23:47:04', '', 43, 'http://nemanjastolic.co.nf/wp-content/uploads/2014/12/DSC_0065-64x64.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2014-12-12 11:49:30', '2014-12-12 11:49:30', '[insert_php]\r\nwp_pagenavi();\r\n[/insert_php]', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 11:49:30', '2014-12-12 11:49:30', '', 38, 'http://nemanjastolic.co.nf/?p=56', 0, 'revision', '', 0),
(55, 1, '2014-12-12 11:48:45', '2014-12-12 11:48:45', '[insert_php]\r\n$pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data->post_content);\r\n$title = $page_data->post_title;\r\necho $title;\r\n} ?>\r\n<ul>\r\n  <?php wp_list_pages(''sort_column=menu_order&title_li=''); ?>\r\n</ul>\r\n[/insert_php]', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 11:48:45', '2014-12-12 11:48:45', '', 38, 'http://nemanjastolic.co.nf/?p=55', 0, 'revision', '', 0),
(62, 1, '2014-12-12 13:43:51', '2014-12-12 13:43:51', '[wp_biographia])', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 13:43:51', '2014-12-12 13:43:51', '', 38, 'http://nemanjastolic.co.nf/?p=62', 0, 'revision', '', 0),
(63, 1, '2014-12-12 13:44:48', '2014-12-12 13:44:48', '[wp_biographia]', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 13:44:48', '2014-12-12 13:44:48', '', 38, 'http://nemanjastolic.co.nf/?p=63', 0, 'revision', '', 0),
(66, 1, '2014-12-12 13:49:09', '2014-12-12 13:49:09', '', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 13:49:09', '2014-12-12 13:49:09', '', 38, 'http://nemanjastolic.co.nf/?p=66', 0, 'revision', '', 0),
(65, 1, '2014-12-12 13:48:01', '2014-12-12 13:48:01', '[wp_biographia]', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 13:48:01', '2014-12-12 13:48:01', '', 38, 'http://nemanjastolic.co.nf/?p=65', 0, 'revision', '', 0),
(67, 1, '2014-12-12 14:13:46', '2014-12-12 14:13:46', '[embed]http://vimeo.com/85179759[/embed]', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:13:46', '2014-12-12 14:13:46', '', 38, 'http://nemanjastolic.co.nf/?p=67', 0, 'revision', '', 0),
(76, 1, '2014-12-12 14:55:51', '2014-12-12 14:55:51', 'Under construction', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:55:51', '2014-12-12 14:55:51', '', 38, 'http://nemanjastolic.co.nf/?p=76', 0, 'revision', '', 0),
(75, 1, '2014-12-12 14:53:56', '2014-12-12 14:53:56', '<iframe width="560" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=QKZJDF5QWO0AAAAAAAABOw&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C53.26090895938182%2C%2C0%2C-4.575949921918365"></iframe>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:53:56', '2014-12-12 14:53:56', '', 38, 'http://nemanjastolic.co.nf/?p=75', 0, 'revision', '', 0),
(74, 1, '2014-12-12 14:46:42', '2014-12-12 14:46:42', '<iframe src="javascript:false;" frameborder="0" scrolling="no" name="iframeshim" onload="this.contentDocument ? this.contentDocument.body.innerHTML = &quot;&quot; : this.contentWindow ? this.contentWindow.document.body.innerHTML = &quot;&quot; : null" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10000;"></iframe>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:46:42', '2014-12-12 14:46:42', '', 38, 'http://nemanjastolic.co.nf/?p=74', 0, 'revision', '', 0),
(71, 1, '2014-12-12 14:19:54', '2014-12-12 14:19:54', '', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:19:54', '2014-12-12 14:19:54', '', 38, 'http://nemanjastolic.co.nf/?p=71', 0, 'revision', '', 0),
(70, 1, '2014-12-12 14:18:56', '2014-12-12 14:18:56', '</p></p></p><iframe src="javascript:false;" frameborder="0" scrolling="no" name="iframeshim" onload="this.contentDocument ? this.contentDocument.body.innerHTML = &quot;&quot; : this.contentWindow ? this.contentWindow.document.body.innerHTML = &quot;&quot; : null" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10000;"></iframe><p>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:18:56', '2014-12-12 14:18:56', '', 38, 'http://nemanjastolic.co.nf/?p=70', 0, 'revision', '', 0),
(73, 1, '2014-12-12 14:46:08', '2014-12-12 14:46:08', '', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:46:08', '2014-12-12 14:46:08', '', 38, 'http://nemanjastolic.co.nf/?p=73', 0, 'revision', '', 0),
(72, 1, '2014-12-12 14:20:05', '2014-12-12 14:20:05', '<iframe src="javascript:false;" frameborder="0" scrolling="no" name="iframeshim" onload="this.contentDocument ? this.contentDocument.body.innerHTML = &quot;&quot; : this.contentWindow ? this.contentWindow.document.body.innerHTML = &quot;&quot; : null" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10000;"></iframe>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 14:20:05', '2014-12-12 14:20:05', '', 38, 'http://nemanjastolic.co.nf/?p=72', 0, 'revision', '', 0),
(57, 1, '2014-12-12 11:50:47', '2014-12-12 11:50:47', 'Site under construction', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 11:50:47', '2014-12-12 11:50:47', '', 38, 'http://nemanjastolic.co.nf/?p=57', 0, 'revision', '', 0),
(59, 1, '2014-12-12 12:46:39', '2014-12-12 12:46:39', ' ', '', '', 'publish', 'open', 'open', '', '59', '', '', '2014-12-12 16:32:56', '2014-12-12 16:32:56', '', 38, 'http://nemanjastolic.co.nf/?p=59', 1, 'nav_menu_item', '', 0),
(49, 1, '2014-12-12 00:01:21', '2014-12-12 00:01:21', '</p>&lt;?php $pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data-&amp;gt;post_content);\r\n$title = $page_data-&amp;gt;post_title;\r\necho $title;\r\n} ?&gt;<p>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 00:01:21', '2014-12-12 00:01:21', '', 38, 'http://nemanjastolic.co.nf/?p=49', 0, 'revision', '', 0),
(50, 1, '2014-12-12 00:02:40', '2014-12-12 00:02:40', '</p><div> <?php $pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data->post_content);\r\n$title = $page_data->post_title;\r\necho $title;\r\n} ?></div><p>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 00:02:40', '2014-12-12 00:02:40', '', 38, 'http://nemanjastolic.co.nf/?p=50', 0, 'revision', '', 0),
(51, 1, '2014-12-12 00:03:32', '2014-12-12 00:03:32', '<?php $pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data->post_content);\r\n$title = $page_data->post_title;\r\necho $title;\r\n} ?></div>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 00:03:32', '2014-12-12 00:03:32', '', 38, 'http://nemanjastolic.co.nf/?p=51', 0, 'revision', '', 0),
(52, 1, '2014-12-12 00:13:31', '2014-12-12 00:13:31', '<?php $pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data->post_content);\r\n$title = $page_data->post_title;\r\necho $title;\r\n} ?>\r\n<ul>\r\n  <?php wp_list_pages(''sort_column=menu_order&title_li=''); ?>\r\n</ul>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 00:13:31', '2014-12-12 00:13:31', '', 38, 'http://nemanjastolic.co.nf/?p=52', 0, 'revision', '', 0),
(54, 1, '2014-12-12 11:47:01', '2014-12-12 11:47:01', '[insert_php]\r\nwp_pagenavi();\r\n[/insert_php]', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 11:47:01', '2014-12-12 11:47:01', '', 38, 'http://nemanjastolic.co.nf/?p=54', 0, 'revision', '', 0),
(53, 1, '2014-12-12 11:36:31', '2014-12-12 11:36:31', '</p><?php $pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data->post_content);\r\n$title = $page_data->post_title;\r\necho $title;\r\n} ?>\r\n<ul>\r\n  <?php wp_list_pages(''sort_column=menu_order&title_li=''); ?>\r\n</ul>\r\n<?php wp_pagenavi(); ?><p>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 11:36:31', '2014-12-12 11:36:31', '', 38, 'http://nemanjastolic.co.nf/?p=53', 0, 'revision', '', 0),
(48, 1, '2014-12-12 00:00:03', '2014-12-12 00:00:03', '</p><?php $pages = get_pages();\r\nforeach ($pages as $page_data) {\r\n$content = apply_filters(''the_content'', $page_data-&gt;post_content);\r\n$title = $page_data-&gt;post_title;\r\necho $title;\r\n} ?><p>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 00:00:03', '2014-12-12 00:00:03', '', 38, 'http://nemanjastolic.co.nf/?p=48', 0, 'revision', '', 0),
(60, 1, '2014-12-12 12:46:39', '2014-12-12 12:46:39', ' ', '', '', 'publish', 'open', 'open', '', '60', '', '', '2014-12-12 16:32:56', '2014-12-12 16:32:56', '', 38, 'http://nemanjastolic.co.nf/?p=60', 2, 'nav_menu_item', '', 0),
(64, 1, '2014-12-12 13:45:14', '2014-12-12 13:45:14', '', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 13:45:14', '2014-12-12 13:45:14', '', 38, 'http://nemanjastolic.co.nf/?p=64', 0, 'revision', '', 0),
(45, 1, '2014-12-11 23:52:23', '2014-12-11 23:52:23', ' <?php wp_list_pages( $args ); ?> ', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-11 23:52:23', '2014-12-11 23:52:23', '', 38, 'http://nemanjastolic.co.nf/?p=45', 0, 'revision', '', 0),
(46, 1, '2014-12-11 23:53:33', '2014-12-11 23:53:33', '</p> <?php wp_list_pages( $args ); ?> <p>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-11 23:53:33', '2014-12-11 23:53:33', '', 38, 'http://nemanjastolic.co.nf/?p=46', 0, 'revision', '', 0),
(61, 1, '2014-12-12 13:36:20', '2014-12-12 13:36:20', 'Site under construction', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-12 13:36:20', '2014-12-12 13:36:20', '', 38, 'http://nemanjastolic.co.nf/?p=61', 0, 'revision', '', 0),
(47, 1, '2014-12-11 23:57:46', '2014-12-11 23:57:46', '</p> $pages = get_pages(); \r\nforeach ($pages as $page_data) {\r\n    $content = apply_filters(''the_content'', $page_data->post_content); \r\n    $title = $page_data->post_title; \r\n    echo $title; \r\n} <p>', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-11 23:57:46', '2014-12-11 23:57:46', '', 38, 'http://nemanjastolic.co.nf/?p=47', 0, 'revision', '', 0),
(39, 1, '2014-12-11 20:32:30', '2014-12-11 20:32:30', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2014-12-11 20:32:30', '2014-12-11 20:32:30', '', 38, 'http://nemanjastolic.co.nf/?page_id=39', 0, 'page', '', 0),
(40, 1, '2014-12-11 20:32:39', '2014-12-11 20:32:39', '', 'Works', '', 'publish', 'closed', 'closed', '', 'works', '', '', '2014-12-11 20:32:39', '2014-12-11 20:32:39', '', 38, 'http://nemanjastolic.co.nf/?page_id=40', 0, 'page', '', 0),
(41, 1, '2014-12-11 20:32:01', '2014-12-11 20:32:01', '', 'Home', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-11 20:32:01', '2014-12-11 20:32:01', '', 38, 'http://nemanjastolic.co.nf/?p=41', 0, 'revision', '', 0),
(42, 1, '2014-12-12 14:14:48', '2014-12-12 14:14:48', '', 'About me', '', 'inherit', 'open', 'open', '', '38-autosave-v1', '', '', '2014-12-12 14:14:48', '2014-12-12 14:14:48', '', 38, 'http://nemanjastolic.co.nf/?p=42', 0, 'revision', '', 0),
(44, 1, '2014-12-11 23:47:18', '2014-12-11 23:47:18', '<a href="http://nemanjastolic.co.nf/wp-content/uploads/2014/12/DSC_0065-64x64.jpg"><img src="http://nemanjastolic.co.nf/wp-content/uploads/2014/12/DSC_0065-64x64.jpg" alt="NEMANJA STOLIC" width="64" height="64" class="alignnone size-full wp-image-7" /></a>', 'Hi everybody', '', 'inherit', 'open', 'open', '', '43-revision-v1', '', '', '2014-12-11 23:47:18', '2014-12-11 23:47:18', '', 43, 'http://nemanjastolic.co.nf/?p=44', 0, 'revision', '', 0),
(38, 1, '2014-12-11 20:32:01', '2014-12-11 20:32:01', '<p>Under construction</p>', 'About me', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2014-12-13 22:07:01', '2014-12-13 22:07:01', '', 0, 'http://nemanjastolic.co.nf/?page_id=38', 0, 'page', '', 0),
(43, 1, '2014-12-11 23:47:18', '2014-12-11 23:47:18', '<a href="http://nemanjastolic.co.nf/wp-content/uploads/2014/12/DSC_0065-64x64.jpg"><img src="http://nemanjastolic.co.nf/wp-content/uploads/2014/12/DSC_0065-64x64.jpg" alt="NEMANJA STOLIC" width="64" height="64" class="alignnone size-full wp-image-7" /></a>', 'Hi everybody', '', 'publish', 'open', 'open', '', 'hi-everybody', '', '', '2014-12-11 23:47:18', '2014-12-11 23:47:18', '', 0, 'http://nemanjastolic.co.nf/?p=43', 0, 'post', '', 0),
(87, 1, '2014-12-12 16:34:14', '2014-12-12 16:34:14', '[insert_php] \r\n        $file = get_header();\r\n[/insert_php]\r\n	<iframe src="http://www.iguide.to/embedplayer_new.php?width=610&amp;height=470&amp;channel=27181&amp;autoplay=true" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="793" height="611"></iframe>\r\n//[insert_php] \r\n//        get_footer();\r\n//[/insert_php]', 'Pink', '', 'publish', 'open', 'closed', '', 'guardian', '', '', '2015-05-02 20:03:01', '2015-05-02 20:03:01', '', 0, 'http://nemanjastolic.co.nf/?page_id=87', 0, 'page', '', 0),
(86, 1, '2014-12-12 15:20:03', '2014-12-12 15:20:03', '<iframe width="560" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=RXzFZUOdtNkAAAQINSiubQ&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C96.97111022808815%2C%2C0%2C14.70027915098602"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-12 15:20:03', '2014-12-12 15:20:03', '', 77, 'http://nemanjastolic.co.nf/?p=86', 0, 'revision', '', 0),
(88, 1, '2014-12-12 16:34:14', '2014-12-12 16:34:14', ' ', '', '', 'publish', 'open', 'open', '', '88', '', '', '2014-12-12 16:34:14', '2014-12-12 16:34:14', '', 0, 'http://nemanjastolic.co.nf/?p=88', 4, 'nav_menu_item', '', 0),
(89, 1, '2014-12-12 16:34:14', '2014-12-12 16:34:14', '<p>Under construction</p>', 'PhoneGuardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-12 16:34:14', '2014-12-12 16:34:14', '', 87, 'http://nemanjastolic.co.nf/?p=89', 0, 'revision', '', 0),
(90, 1, '2014-12-13 14:46:37', '2014-12-13 14:46:37', '<iframe onload="this.width=100%;this.height=100%;" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-autosave-v1', '', '', '2014-12-13 14:46:37', '2014-12-13 14:46:37', '', 77, 'http://nemanjastolic.co.nf/?p=90', 0, 'revision', '', 0),
(92, 1, '2014-12-13 14:43:14', '2014-12-13 14:43:14', '<iframe width="560" height="315" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 14:43:14', '2014-12-13 14:43:14', '', 77, 'http://nemanjastolic.co.nf/?p=92', 0, 'revision', '', 0),
(91, 1, '2014-12-13 14:32:41', '2014-12-13 14:32:41', '<meta name="viewport" content="initial-scale=1.0" />\r\n<script src="https://dl.dropboxusercontent.com/u/2982311/photosphere/three.min.js"></script>\r\n<script src="https://dl.dropboxusercontent.com/u/2982311/photosphere/photo-sphere-viewer.js"></script>\r\n<style>\r\n	html, body {\r\n		margin: 0;\r\n		width: 100%;\r\n		height: 100%;\r\n		overflow: hidden;\r\n	}\r\n\r\n	#container {\r\n		width: 100%;\r\n		height: 100%;\r\n	}\r\n</style>\r\n<div id="container"></div>\r\n\r\n<script>\r\n	var div = document.getElementById(''container'');\r\n	var PSV = new PhotoSphereViewer({\r\n			panorama: ''https://dl.dropboxusercontent.com/u/2982311/photosphere/20141213_150217.jpg'',\r\n			container: div,\r\n			anim_speed: ''3rpm''\r\n		});\r\n</script>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 14:32:41', '2014-12-13 14:32:41', '', 77, 'http://nemanjastolic.co.nf/?p=91', 0, 'revision', '', 0),
(94, 1, '2014-12-13 14:46:51', '2014-12-13 14:46:51', '<iframe onload="this.width=100%;this.height=100%;" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 14:46:51', '2014-12-13 14:46:51', '', 77, 'http://nemanjastolic.co.nf/?p=94', 0, 'revision', '', 0),
(93, 1, '2014-12-13 14:45:35', '2014-12-13 14:45:35', '<iframe onload="this.width=screen.width;this.height=screen.height;" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 14:45:35', '2014-12-13 14:45:35', '', 77, 'http://nemanjastolic.co.nf/?p=93', 0, 'revision', '', 0),
(96, 1, '2014-12-13 15:24:58', '2014-12-13 15:24:58', '<iframe width="800" height="650" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 15:24:58', '2014-12-13 15:24:58', '', 77, 'http://nemanjastolic.co.nf/?p=96', 0, 'revision', '', 0),
(95, 1, '2014-12-13 14:48:20', '2014-12-13 14:48:20', '<iframe onload="this.width=screen.width-150;this.height=screen.height-150;" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 14:48:20', '2014-12-13 14:48:20', '', 77, 'http://nemanjastolic.co.nf/?p=95', 0, 'revision', '', 0),
(97, 1, '2014-12-13 15:25:44', '2014-12-13 15:25:44', '<iframe width=100% height="650" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?layer=c&amp;panoid=7F8BJdc5QdwAAAQZDbYH-A&amp;ie=UTF8&amp;source=embed&amp;output=svembed&amp;cbp=13%2C246.8378846371756%2C%2C0%2C2.108489577041709"></iframe>', 'EXPO project', '', 'inherit', 'open', 'open', '', '77-revision-v1', '', '', '2014-12-13 15:25:44', '2014-12-13 15:25:44', '', 77, 'http://nemanjastolic.co.nf/?p=97', 0, 'revision', '', 0),
(98, 1, '2014-12-13 22:07:01', '2014-12-13 22:07:01', '<p>Under construction</p>', 'About me', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2014-12-13 22:07:01', '2014-12-13 22:07:01', '', 38, 'http://nemanjastolic.co.nf/?p=98', 0, 'revision', '', 0),
(99, 1, '2014-12-13 22:29:39', '2014-12-13 22:29:39', '<p>Under construction</p>', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-13 22:29:39', '2014-12-13 22:29:39', '', 87, 'http://nemanjastolic.co.nf/?p=99', 0, 'revision', '', 0),
(100, 1, '2014-12-14 16:36:03', '2014-12-14 16:36:03', '<?php $file = file_get_contents(''./../../../../../guardian/add user.php'', true); ?>', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:36:03', '2014-12-14 16:36:03', '', 87, 'http://nemanjastolic.co.nf/?p=100', 0, 'revision', '', 0),
(101, 1, '2014-12-14 16:38:03', '2014-12-14 16:38:03', '[insert_php] $file = file_get_contents(''./../../../../../guardian/add user.php'', true); [/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:38:03', '2014-12-14 16:38:03', '', 87, 'http://nemanjastolic.co.nf/?p=101', 0, 'revision', '', 0),
(102, 1, '2015-05-02 20:01:47', '2015-05-02 20:01:47', '[insert_php] \n        $file = get_header();\n[/insert_php]\n	<iframe src="http://www.iguide.to/embedplayer_new.php?width=610&amp;height=470&amp;channel=27181&amp;autoplay=true" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="610" height="470"></iframe>\n//[insert_php] \n//        get_footer();\n//[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-autosave-v1', '', '', '2015-05-02 20:01:47', '2015-05-02 20:01:47', '', 87, 'http://nemanjastolic.co.nf/?p=102', 0, 'revision', '', 0),
(103, 1, '2014-12-14 16:40:16', '2014-12-14 16:40:16', '[insert_php] \r\necho \r\n$file = file_get_contents(''./add user.php'', true); \r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:40:16', '2014-12-14 16:40:16', '', 87, 'http://nemanjastolic.co.nf/?p=103', 0, 'revision', '', 0),
(119, 1, '2015-05-02 20:03:01', '2015-05-02 20:03:01', '[insert_php] \r\n        $file = get_header();\r\n[/insert_php]\r\n	<iframe src="http://www.iguide.to/embedplayer_new.php?width=610&amp;height=470&amp;channel=27181&amp;autoplay=true" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="793" height="611"></iframe>\r\n//[insert_php] \r\n//        get_footer();\r\n//[/insert_php]', 'Pink', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2015-05-02 20:03:01', '2015-05-02 20:03:01', '', 87, 'http://nemanjastolic.co.nf/?p=119', 0, 'revision', '', 0),
(104, 1, '2014-12-14 16:41:26', '2014-12-14 16:41:26', '[insert_php] \r\n/*\r\n * Following code will list all the products\r\n */\r\n \r\n// array for JSON response\r\n$response = array();\r\n \r\n if (isset($_GET["name"]) && isset($_GET["phone"])) {\r\n	 \r\n	$name = $_GET["name"];\r\n	$phone = $_GET["phone"];\r\n	\r\n	//echo json_encode($response);\r\n	 \r\n	// include db connect class\r\n	$con=mysqli_connect("nemanjastolic.co.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");\r\n    mysqli_query( $con,"SET character_set_results = ''utf8'', character_set_client = ''utf8'', character_set_connection = ''utf8'', character_set_database = ''utf8'', character_set_server = ''utf8''");\r\n\r\n	// get all products from products table\r\n\r\n	$result = mysqli_query($con, "INSERT INTO user(name, phone) VALUES(''$name'', ''$phone'')");\r\n	\r\n	if ($result) {\r\n        // successfully inserted into database\r\n        $response["success"] = 1;\r\n        $response["message"] = "User successfully created.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    } else {\r\n        // failed to insert row\r\n        $response["success"] = 0;\r\n        $response["message"] = "Oops! An error occurred.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    }\r\n} else {\r\n    // required field is missing\r\n    $response["success"] = 0;\r\n    $response["message"] = "Required field(s) is missing";\r\n \r\n    // echoing JSON response\r\n    echo json_encode($response);\r\n}\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:41:26', '2014-12-14 16:41:26', '', 87, 'http://nemanjastolic.co.nf/?p=104', 0, 'revision', '', 0),
(105, 1, '2014-12-14 16:45:52', '2014-12-14 16:45:52', '[insert_php] \r\n/*\r\n * Following code will list all the products\r\n */\r\n \r\n// array for JSON response\r\n$response = array();\r\n \r\n if (isset($_GET["name"]) && isset($_GET["phone"])) {\r\n	 \r\n	$name = $_GET["name"];\r\n	$phone = $_GET["phone"];\r\n	\r\n	//echo json_encode($response);\r\n	 \r\n	// include db connect class\r\n	$con=mysqli_connect("nemanjastolic.co.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");\r\n    mysqli_query( $con,"SET character_set_results = ''utf8'', character_set_client = ''utf8'', character_set_connection = ''utf8'', character_set_database = ''utf8'', character_set_server = ''utf8''");\r\n\r\n	// get all products from products table\r\n\r\n	$result = mysqli_query($con, "INSERT INTO user(name, phone_number) VALUES(''$name'', ''$phone'')");\r\n	\r\n	if ($result) {\r\n        // successfully inserted into database\r\n        $response["success"] = 1;\r\n        $response["message"] = "User successfully created.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    } else {\r\n        // failed to insert row\r\n        $response["success"] = 0;\r\n        $response["message"] = "Oops! An error occurred.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    }\r\n} else {\r\n    // required field is missing\r\n    $response["success"] = 0;\r\n    $response["message"] = "Required field(s) is missing";\r\n \r\n    // echoing JSON response\r\n    echo json_encode($response);\r\n}\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:45:52', '2014-12-14 16:45:52', '', 87, 'http://nemanjastolic.co.nf/?p=105', 0, 'revision', '', 0),
(109, 1, '2014-12-15 09:31:36', '2014-12-15 09:31:36', '[insert_php] \r\n        $file = get_header();\r\n[/insert_php]\r\n	<iframe width="1280" height="720" src="//www.youtube.com/embed/2Bls1KKDwmo" frameborder="0" allowfullscreen></iframe>\r\n[insert_php] \r\n        get_footer();\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-15 09:31:36', '2014-12-15 09:31:36', '', 87, 'http://nemanjastolic.co.nf/?p=109', 0, 'revision', '', 0),
(110, 1, '2014-12-15 09:32:18', '2014-12-15 09:32:18', '[insert_php] \r\n        $file = get_header();\r\n[/insert_php]\r\n	<iframe width="640" height="480" src="//www.youtube.com/embed/2Bls1KKDwmo" frameborder="0" allowfullscreen></iframe>\r\n[insert_php] \r\n        get_footer();\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-15 09:32:18', '2014-12-15 09:32:18', '', 87, 'http://nemanjastolic.co.nf/?p=110', 0, 'revision', '', 0),
(111, 1, '2014-12-15 09:32:49', '2014-12-15 09:32:49', '[insert_php] \r\n        $file = get_header();\r\n[/insert_php]\r\n	<iframe width="640" height="480" src="//www.youtube.com/embed/2Bls1KKDwmo" frameborder="0" allowfullscreen></iframe>\r\n//[insert_php] \r\n//        get_footer();\r\n//[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-15 09:32:49', '2014-12-15 09:32:49', '', 87, 'http://nemanjastolic.co.nf/?p=111', 0, 'revision', '', 0),
(106, 1, '2014-12-14 16:49:13', '2014-12-14 16:49:13', '[insert_php] \r\n/*\r\n * Following code will list all the products\r\n */\r\n \r\n// array for JSON response\r\n$response = array();\r\n \r\n if (isset($_GET["name"]) && isset($_GET["phone"])) {\r\n	 \r\n	$name = $_GET["name"];\r\n	$phone = $_GET["phone"];\r\n	\r\n	//echo json_encode($response);\r\n	 \r\n	// include db connect class\r\n	$con=mysqli_connect("nemanjastolic.co.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");\r\n    mysqli_query( $con,"SET character_set_results = ''utf8'', character_set_client = ''utf8'', character_set_connection = ''utf8'', character_set_database = ''utf8'', character_set_server = ''utf8''");\r\n\r\n	// get all products from products table\r\n\r\n	$result = mysqli_query($con, "INSERT INTO user(name, phone_number) VALUES(''$name'', ''$phone'')");\r\n	\r\n	if ($result) {\r\n        // successfully inserted into database\r\n        $response["success"] = 1;\r\n        $response["message"] = "User successfully created.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    } else {\r\n        // failed to insert row\r\n        $response["success"] = 0;\r\n        $response["message"] = "Oops! An error occurred.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    }\r\n} else {\r\n    // required field is missing\r\n    $response["success"] = 0;\r\n    $response["message"] = "Required field(s) is missing";\r\n \r\n    // echoing JSON response\r\n    echo json_encode($response);\r\n}\r\nvar_dump($_GET);\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:49:13', '2014-12-14 16:49:13', '', 87, 'http://nemanjastolic.co.nf/?p=106', 0, 'revision', '', 0),
(108, 1, '2014-12-14 17:38:39', '2014-12-14 17:38:39', '[insert_php] \r\necho "pozdrav";\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 17:38:39', '2014-12-14 17:38:39', '', 87, 'http://nemanjastolic.co.nf/?p=108', 0, 'revision', '', 0),
(107, 1, '2014-12-14 16:50:13', '2014-12-14 16:50:13', '[insert_php] \r\n/*\r\n * Following code will list all the products\r\n */\r\n \r\n// array for JSON response\r\n$response = array();\r\n \r\n if (isset($_GET["username"]) && isset($_GET["phone"])) {\r\n	 \r\n	$name = $_GET["username"];\r\n	$phone = $_GET["phone"];\r\n	\r\n	//echo json_encode($response);\r\n	 \r\n	// include db connect class\r\n	$con=mysqli_connect("nemanjastolic.co.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");\r\n    mysqli_query( $con,"SET character_set_results = ''utf8'', character_set_client = ''utf8'', character_set_connection = ''utf8'', character_set_database = ''utf8'', character_set_server = ''utf8''");\r\n\r\n	// get all products from products table\r\n\r\n	$result = mysqli_query($con, "INSERT INTO user(name, phone_number) VALUES(''$name'', ''$phone'')");\r\n	\r\n	if ($result) {\r\n        // successfully inserted into database\r\n        $response["success"] = 1;\r\n        $response["message"] = "User successfully created.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    } else {\r\n        // failed to insert row\r\n        $response["success"] = 0;\r\n        $response["message"] = "Oops! An error occurred.";\r\n \r\n        // echoing JSON response\r\n        echo json_encode($response);\r\n    }\r\n} else {\r\n    // required field is missing\r\n    $response["success"] = 0;\r\n    $response["message"] = "Required field(s) is missing";\r\n \r\n    // echoing JSON response\r\n    echo json_encode($response);\r\n}\r\nvar_dump($_GET);\r\n[/insert_php]', 'Guardian', '', 'inherit', 'open', 'open', '', '87-revision-v1', '', '', '2014-12-14 16:50:13', '2014-12-14 16:50:13', '', 87, 'http://nemanjastolic.co.nf/?p=107', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Структура табеле `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Приказ података табеле `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(43, 1, 0),
(78, 2, 0),
(59, 2, 0),
(60, 2, 0),
(88, 2, 0);

-- --------------------------------------------------------

--
-- Структура табеле `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Приказ података табеле `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 4),
(3, 3, 'category', '', 0, 0),
(4, 4, 'category', '', 3, 0),
(5, 5, 'category', '', 3, 0),
(6, 6, 'category', '', 3, 0),
(7, 7, 'category', '', 0, 0),
(8, 8, 'category', '', 7, 0),
(9, 9, 'category', '', 7, 0),
(10, 10, 'category', '', 4, 0),
(11, 11, 'category', '', 4, 0),
(12, 12, 'category', '', 4, 0),
(13, 13, 'category', '', 7, 0);

-- --------------------------------------------------------

--
-- Структура табеле `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Приказ података табеле `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Header', 'header', 0),
(3, 'Programming', 'programming', 0),
(4, 'Mobile programming', 'mobile', 0),
(5, 'Desktop programming', 'desktop', 0),
(6, 'Web programming', 'web', 0),
(7, 'Personal', 'personal', 0),
(8, 'Lifestyle', 'lifestyle', 0),
(9, 'Visited places', 'visited', 0),
(10, 'Android programming', 'android', 0),
(11, 'Windows Phone programming', 'wp', 0),
(12, 'iOS programming', 'ios', 0),
(13, 'Friends', 'friends', 0);

-- --------------------------------------------------------

--
-- Структура табеле `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Приказ података табеле `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'nemtajo'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp_biographia_pointer'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '118'),
(15, 1, 'session_tokens', 'a:1:{s:64:"1bea98abf64f11d595b690d3b926dd851378e86f746278cd0c9f3db2d60a597e";i:1431806337;}'),
(16, 1, 'wp_user-settings', 'editor=html&libraryContent=browse'),
(17, 1, 'wp_user-settings-time', '1418393622'),
(18, 1, 'nav_menu_recently_edited', '2'),
(19, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(20, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:8:"add-post";i:1;s:13:"add-portfolio";i:2;s:12:"add-post_tag";i:3;s:9:"add-works";}'),
(21, 1, 'meta-box-order_page', 'a:3:{s:4:"side";s:56:"submitdiv,pageparentdiv,always-edit-in-html,postimagediv";s:6:"normal";s:94:"revisionsdiv,postcustom,commentstatusdiv,commentsdiv,slugdiv,wp-biographia-page-meta,authordiv";s:8:"advanced";s:0:"";}'),
(22, 1, 'screen_layout_page', '2');

-- --------------------------------------------------------

--
-- Структура табеле `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Приказ података табеле `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'nemtajo', '$P$BYhPLYTfBlSUm9UzVTLfuqfOxIzcNu1', 'nemtajo', 'nemtajo@yahoo.com', '', '2014-12-11 12:10:54', '', 0, 'nemtajo');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
