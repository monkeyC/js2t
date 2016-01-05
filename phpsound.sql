-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 05 Janvier 2016 à 13:28
-- Version du serveur :  5.5.46-0+deb8u1
-- Version de PHP :  5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `phpsound`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '87ecfce39f34e0dbc5d015e11ebd7535');

-- --------------------------------------------------------

--
-- Structure de la table `blocked`
--

CREATE TABLE IF NOT EXISTS `blocked` (
`id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(35, 'Hardcore');

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
`id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `chat`
--

INSERT INTO `chat` (`id`, `from`, `to`, `message`, `read`, `time`) VALUES
(1, 2, 3, 'c''est rigolo je peux te parler même ici', 1, '2015-12-02 15:00:58'),
(2, 18, 3, 'YOP', 1, '2015-12-07 19:37:47'),
(3, 2, 25, 'LE TCHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT', 1, '2015-12-09 13:35:08'),
(4, 25, 2, 'lol', 1, '2015-12-09 13:35:53'),
(5, 18, 25, 'POP', 1, '2015-12-09 14:18:50'),
(6, 18, 2, 'POP', 1, '2015-12-09 14:19:10'),
(7, 18, 2, 'POP', 1, '2015-12-09 14:19:12'),
(8, 18, 2, 'POP', 1, '2015-12-09 14:19:15'),
(9, 18, 2, 'POP', 1, '2015-12-09 14:19:17'),
(10, 18, 2, 'POP', 1, '2015-12-09 14:19:18'),
(11, 18, 2, 'POP', 1, '2015-12-09 14:19:19'),
(12, 18, 2, 'POP', 1, '2015-12-09 14:19:21'),
(13, 18, 2, 'POP', 1, '2015-12-09 14:19:22'),
(14, 18, 2, 'POP', 1, '2015-12-09 14:19:23'),
(15, 18, 2, 'pop', 1, '2015-12-09 14:19:25'),
(16, 18, 2, 'POP', 1, '2015-12-09 14:19:27'),
(17, 18, 2, 'POP', 1, '2015-12-09 14:19:29'),
(18, 18, 2, 'POP', 1, '2015-12-09 14:19:30'),
(19, 18, 2, 'POP', 1, '2015-12-09 14:19:31'),
(20, 18, 2, 'POP', 1, '2015-12-09 14:19:32'),
(21, 18, 2, 'POP', 1, '2015-12-09 14:19:34'),
(22, 18, 2, 'POP', 1, '2015-12-09 14:19:35'),
(23, 18, 2, 'POP', 1, '2015-12-09 14:19:36'),
(24, 18, 2, 'POP', 1, '2015-12-09 14:19:37'),
(25, 18, 2, 'POP', 1, '2015-12-09 14:19:41'),
(26, 18, 2, '32132132132132132132132132132', 1, '2015-12-09 14:19:49'),
(27, 2, 18, 'OUAAAAAAAAAAAAAAAAA', 1, '2015-12-09 14:19:59');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `comments`
--

INSERT INTO `comments` (`id`, `uid`, `tid`, `message`, `time`) VALUES
(1, 10, 109, 'ça faisait longtemps con !', '2015-12-10 12:31:11'),
(2, 10, 106, 'Je tourne des films de boules amateurs allemand depuis 1986', '2015-12-10 12:35:12'),
(3, 10, 106, 'FAIT PETER BORDEL DE MERDE', '2015-12-10 12:40:28');

-- --------------------------------------------------------

--
-- Structure de la table `downloads`
--

CREATE TABLE IF NOT EXISTS `downloads` (
`id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `downloads`
--

INSERT INTO `downloads` (`id`, `by`, `track`, `time`) VALUES
(1, 27, 37, '2015-12-09 16:53:23'),
(2, 2, 121, '2015-12-16 09:27:01'),
(3, 2, 121, '2015-12-16 09:28:15'),
(4, 2, 117, '2015-12-16 12:33:05'),
(5, 2, 121, '2015-12-16 12:40:49'),
(6, 2, 116, '2015-12-16 12:43:08'),
(7, 2, 121, '2015-12-16 13:11:42'),
(8, 2, 117, '2015-12-17 16:52:04'),
(9, 2, 113, '2015-12-17 16:52:15'),
(10, 2, 108, '2015-12-17 16:52:26'),
(11, 2, 103, '2015-12-17 16:52:38'),
(12, 2, 102, '2015-12-17 16:52:55'),
(13, 2, 94, '2015-12-17 16:53:05'),
(14, 2, 87, '2015-12-17 16:53:16'),
(15, 29, 132, '2016-01-03 22:39:52'),
(16, 29, 102, '2016-01-03 22:42:10'),
(17, 29, 100, '2016-01-03 22:44:13'),
(18, 29, 101, '2016-01-03 22:44:33'),
(19, 29, 109, '2016-01-03 22:45:44'),
(20, 34, 121, '2016-01-05 10:17:10');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
`id` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `likes`
--

INSERT INTO `likes` (`id`, `track`, `by`, `time`) VALUES
(2, 10, 2, '2015-12-03 14:49:52'),
(3, 12, 16, '2015-12-07 17:58:41'),
(4, 9, 16, '2015-12-07 18:03:32'),
(6, 11, 23, '2015-12-08 17:07:34'),
(7, 23, 2, '2015-12-08 18:12:36'),
(8, 47, 2, '2015-12-09 12:37:23'),
(9, 53, 2, '2015-12-09 13:30:26'),
(10, 102, 2, '2015-12-09 14:50:14'),
(11, 101, 2, '2015-12-09 14:50:17'),
(12, 100, 2, '2015-12-09 14:50:19'),
(13, 109, 10, '2015-12-10 12:30:57'),
(14, 106, 10, '2015-12-10 12:39:52'),
(15, 112, 2, '2015-12-11 13:58:36'),
(16, 118, 2, '2015-12-13 20:28:56'),
(17, 116, 2, '2015-12-13 20:29:23'),
(18, 106, 2, '2015-12-15 13:11:41'),
(19, 132, 18, '2016-01-02 19:20:28'),
(20, 131, 18, '2016-01-02 19:20:29'),
(22, 131, 29, '2016-01-03 22:05:05'),
(25, 132, 29, '2016-01-03 22:05:48');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `MODIFICATION TRACKS`
--
CREATE TABLE IF NOT EXISTS `MODIFICATION TRACKS` (
`title` varchar(256)
,`description` text
,`name` varchar(512)
,`tag` varchar(512)
,`download` int(11)
);
-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
`id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `notifications`
--

INSERT INTO `notifications` (`id`, `from`, `to`, `parent`, `child`, `type`, `read`, `time`) VALUES
(2, 3, 2, 0, 0, 4, 1, '2015-12-02 14:52:46'),
(3, 2, 3, 0, 0, 4, 1, '2015-12-02 14:54:01'),
(4, 5, 3, 0, 0, 4, 1, '2015-12-03 14:07:13'),
(5, 5, 2, 0, 0, 4, 1, '2015-12-03 14:07:14'),
(6, 2, 5, 0, 0, 4, 1, '2015-12-03 14:49:15'),
(7, 2, 5, 10, 0, 2, 1, '2015-12-03 14:49:52'),
(8, 7, 5, 0, 0, 4, 1, '2015-12-07 14:43:13'),
(9, 7, 2, 0, 0, 4, 1, '2015-12-07 14:43:14'),
(10, 13, 5, 0, 0, 4, 1, '2015-12-07 15:01:15'),
(11, 2, 7, 0, 0, 4, 1, '2015-12-07 15:21:36'),
(12, 16, 7, 0, 0, 4, 1, '2015-12-07 17:40:20'),
(13, 16, 5, 0, 0, 4, 1, '2015-12-07 17:40:21'),
(14, 16, 2, 0, 0, 4, 1, '2015-12-07 17:40:23'),
(15, 16, 2, 12, 0, 2, 1, '2015-12-07 17:58:41'),
(16, 16, 2, 9, 0, 2, 1, '2015-12-07 18:03:32'),
(18, 2, 16, 0, 0, 4, 0, '2015-12-07 18:39:18'),
(19, 18, 3, 0, 0, 4, 1, '2015-12-07 19:34:00'),
(20, 18, 7, 0, 0, 4, 1, '2015-12-07 19:34:01'),
(21, 18, 16, 0, 0, 4, 0, '2015-12-07 19:34:02'),
(22, 23, 5, 11, 0, 2, 1, '2015-12-08 17:07:34'),
(23, 2, 2, 23, 0, 2, 1, '2015-12-08 18:12:36'),
(24, 10, 3, 0, 0, 4, 1, '2015-12-09 10:46:57'),
(25, 10, 2, 0, 0, 4, 1, '2015-12-09 10:47:12'),
(26, 10, 5, 0, 0, 4, 1, '2015-12-09 10:47:22'),
(27, 2, 10, 0, 0, 4, 1, '2015-12-09 12:33:00'),
(28, 2, 10, 47, 0, 2, 1, '2015-12-09 12:37:23'),
(29, 24, 7, 0, 0, 4, 1, '2015-12-09 13:17:32'),
(30, 24, 3, 0, 0, 4, 1, '2015-12-09 13:17:33'),
(31, 24, 16, 0, 0, 4, 0, '2015-12-09 13:17:34'),
(32, 24, 2, 0, 0, 4, 1, '2015-12-09 13:17:40'),
(33, 24, 5, 0, 0, 4, 0, '2015-12-09 13:17:40'),
(34, 24, 10, 0, 0, 4, 1, '2015-12-09 13:17:41'),
(35, 10, 24, 0, 0, 4, 1, '2015-12-09 13:19:22'),
(36, 10, 25, 0, 0, 4, 1, '2015-12-09 13:28:00'),
(37, 2, 10, 53, 0, 2, 1, '2015-12-09 13:30:26'),
(39, 25, 2, 0, 0, 4, 1, '2015-12-09 13:33:59'),
(40, 25, 10, 0, 0, 4, 1, '2015-12-09 13:34:05'),
(41, 2, 18, 0, 0, 4, 1, '2015-12-09 13:40:08'),
(42, 2, 24, 0, 0, 4, 1, '2015-12-09 13:44:01'),
(43, 25, 7, 0, 0, 4, 1, '2015-12-09 13:56:07'),
(44, 25, 3, 0, 0, 4, 1, '2015-12-09 13:56:08'),
(45, 25, 16, 0, 0, 4, 0, '2015-12-09 13:56:10'),
(46, 25, 18, 0, 0, 4, 1, '2015-12-09 13:57:52'),
(47, 25, 24, 0, 0, 4, 1, '2015-12-09 13:57:53'),
(48, 25, 5, 0, 0, 4, 0, '2015-12-09 13:57:54'),
(49, 18, 25, 0, 0, 4, 1, '2015-12-09 14:15:53'),
(50, 18, 2, 0, 0, 4, 1, '2015-12-09 14:17:47'),
(51, 18, 24, 0, 0, 4, 1, '2015-12-09 14:17:48'),
(52, 18, 5, 0, 0, 4, 0, '2015-12-09 14:17:48'),
(54, 2, 3, 102, 0, 2, 1, '2015-12-09 14:50:14'),
(55, 2, 3, 101, 0, 2, 1, '2015-12-09 14:50:17'),
(56, 2, 3, 100, 0, 2, 1, '2015-12-09 14:50:19'),
(57, 3, 18, 0, 0, 4, 1, '2015-12-09 15:09:03'),
(58, 3, 24, 0, 0, 4, 1, '2015-12-09 15:09:03'),
(59, 3, 10, 0, 0, 4, 1, '2015-12-09 15:09:05'),
(60, 2, 25, 0, 0, 4, 0, '2015-12-09 15:35:36'),
(61, 3, 25, 0, 0, 4, 0, '2015-12-09 15:38:52'),
(62, 3, 5, 0, 0, 4, 0, '2015-12-09 15:38:55'),
(63, 10, 3, 109, 0, 2, 1, '2015-12-10 12:30:57'),
(64, 10, 3, 109, 1, 1, 1, '2015-12-10 12:31:11'),
(65, 10, 3, 106, 2, 1, 1, '2015-12-10 12:35:12'),
(66, 10, 3, 106, 0, 2, 1, '2015-12-10 12:39:52'),
(67, 10, 3, 106, 3, 1, 1, '2015-12-10 12:40:28'),
(68, 2, 10, 112, 0, 2, 1, '2015-12-11 13:58:36'),
(69, 2, 28, 0, 0, 4, 1, '2015-12-13 20:26:00'),
(70, 2, 28, 118, 0, 2, 1, '2015-12-13 20:28:57'),
(71, 2, 28, 116, 0, 2, 1, '2015-12-13 20:29:23'),
(72, 2, 30, 0, 0, 4, 0, '2015-12-14 08:22:30'),
(73, 2, 29, 0, 0, 4, 1, '2015-12-14 08:22:35'),
(74, 2, 27, 0, 0, 4, 0, '2015-12-14 08:22:53'),
(75, 2, 3, 106, 0, 2, 1, '2015-12-15 13:11:41'),
(76, 29, 2, 0, 0, 4, 1, '2015-12-18 21:47:11'),
(77, 18, 3, 132, 0, 2, 1, '2016-01-02 19:20:28'),
(78, 18, 3, 131, 0, 2, 1, '2016-01-02 19:20:29'),
(80, 29, 3, 131, 0, 2, 1, '2016-01-03 22:05:05'),
(83, 29, 3, 132, 0, 2, 1, '2016-01-03 22:05:48'),
(84, 34, 16, 0, 0, 4, 0, '2016-01-05 10:09:51'),
(85, 24, 25, 0, 0, 4, 0, '2016-01-05 10:46:02'),
(86, 34, 2, 0, 0, 4, 0, '2016-01-05 11:17:39');

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
`id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `payer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `payer_first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_country` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `valid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlistentries`
--

CREATE TABLE IF NOT EXISTS `playlistentries` (
`id` int(11) NOT NULL,
  `playlist` int(11) NOT NULL,
  `track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
`id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `public` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `relations`
--

CREATE TABLE IF NOT EXISTS `relations` (
`id` int(11) NOT NULL,
  `leader` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `relations`
--

INSERT INTO `relations` (`id`, `leader`, `subscriber`, `time`) VALUES
(1, 2, 3, '2015-12-02 14:52:46'),
(2, 3, 2, '2015-12-02 14:54:01'),
(3, 3, 5, '2015-12-03 14:07:13'),
(4, 2, 5, '2015-12-03 14:07:14'),
(5, 5, 2, '2015-12-03 14:49:15'),
(6, 5, 7, '2015-12-07 14:43:13'),
(7, 2, 7, '2015-12-07 14:43:14'),
(8, 5, 13, '2015-12-07 15:01:15'),
(9, 7, 2, '2015-12-07 15:21:36'),
(10, 7, 16, '2015-12-07 17:40:20'),
(11, 5, 16, '2015-12-07 17:40:21'),
(12, 2, 16, '2015-12-07 17:40:23'),
(13, 16, 2, '2015-12-07 18:39:18'),
(14, 3, 18, '2015-12-07 19:34:00'),
(15, 7, 18, '2015-12-07 19:34:01'),
(16, 16, 18, '2015-12-07 19:34:02'),
(17, 3, 10, '2015-12-09 10:46:57'),
(18, 2, 10, '2015-12-09 10:47:12'),
(19, 5, 10, '2015-12-09 10:47:22'),
(20, 10, 2, '2015-12-09 12:33:00'),
(21, 7, 24, '2015-12-09 13:17:32'),
(22, 3, 24, '2015-12-09 13:17:33'),
(23, 16, 24, '2015-12-09 13:17:34'),
(24, 2, 24, '2015-12-09 13:17:40'),
(25, 5, 24, '2015-12-09 13:17:40'),
(26, 10, 24, '2015-12-09 13:17:41'),
(27, 24, 10, '2015-12-09 13:19:22'),
(28, 25, 10, '2015-12-09 13:28:00'),
(30, 2, 25, '2015-12-09 13:33:59'),
(31, 10, 25, '2015-12-09 13:34:05'),
(32, 18, 2, '2015-12-09 13:40:08'),
(33, 24, 2, '2015-12-09 13:44:01'),
(34, 7, 25, '2015-12-09 13:56:07'),
(35, 3, 25, '2015-12-09 13:56:08'),
(36, 16, 25, '2015-12-09 13:56:10'),
(37, 18, 25, '2015-12-09 13:57:52'),
(38, 24, 25, '2015-12-09 13:57:53'),
(39, 5, 25, '2015-12-09 13:57:54'),
(40, 25, 18, '2015-12-09 14:15:53'),
(41, 2, 18, '2015-12-09 14:17:47'),
(42, 24, 18, '2015-12-09 14:17:48'),
(43, 5, 18, '2015-12-09 14:17:48'),
(45, 18, 3, '2015-12-09 15:09:03'),
(46, 24, 3, '2015-12-09 15:09:03'),
(47, 10, 3, '2015-12-09 15:09:05'),
(48, 25, 2, '2015-12-09 15:35:36'),
(49, 25, 3, '2015-12-09 15:38:52'),
(50, 5, 3, '2015-12-09 15:38:55'),
(51, 28, 2, '2015-12-13 20:25:59'),
(52, 30, 2, '2015-12-14 08:22:30'),
(53, 29, 2, '2015-12-14 08:22:35'),
(54, 27, 2, '2015-12-14 08:22:53'),
(55, 2, 29, '2015-12-18 21:47:11'),
(56, 16, 34, '2016-01-05 10:09:51'),
(57, 25, 24, '2016-01-05 10:46:02'),
(58, 2, 34, '2016-01-05 11:17:39');

-- --------------------------------------------------------

--
-- Structure de la table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
`id` int(12) NOT NULL,
  `track` varchar(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perpage` int(11) NOT NULL,
  `volume` varchar(4) NOT NULL,
  `captcha` int(11) NOT NULL,
  `intervaln` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `format` varchar(256) NOT NULL,
  `mail` int(11) NOT NULL,
  `artsize` int(11) NOT NULL,
  `artformat` varchar(256) NOT NULL,
  `tracksize` int(11) NOT NULL,
  `trackformat` varchar(128) NOT NULL,
  `tracksizetotal` bigint(12) NOT NULL,
  `cperpage` int(11) NOT NULL,
  `ilimit` int(11) NOT NULL,
  `mlimit` int(11) NOT NULL,
  `qperpage` tinyint(4) NOT NULL,
  `rperpage` int(11) NOT NULL,
  `sperpage` int(11) NOT NULL,
  `nperpage` tinyint(4) NOT NULL,
  `nperwidget` tinyint(4) NOT NULL,
  `lperpost` int(11) NOT NULL,
  `aperip` int(11) NOT NULL,
  `conline` int(4) NOT NULL,
  `ronline` tinyint(4) NOT NULL,
  `mperpage` tinyint(4) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notifications` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `chatr` int(11) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `smiles` tinyint(4) NOT NULL,
  `fbapp` int(11) NOT NULL,
  `fbappid` varchar(128) NOT NULL,
  `fbappsecret` varchar(128) NOT NULL,
  `paypalapp` int(11) NOT NULL,
  `paypaluser` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalpass` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalsign` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalsand` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `promonth` decimal(6,2) NOT NULL,
  `proyear` decimal(6,2) NOT NULL,
  `protracksize` int(11) NOT NULL,
  `protracktotal` bigint(12) NOT NULL,
  `ad1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad4` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad5` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad6` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad7` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `settings`
--

INSERT INTO `settings` (`title`, `theme`, `perpage`, `volume`, `captcha`, `intervaln`, `time`, `size`, `format`, `mail`, `artsize`, `artformat`, `tracksize`, `trackformat`, `tracksizetotal`, `cperpage`, `ilimit`, `mlimit`, `qperpage`, `rperpage`, `sperpage`, `nperpage`, `nperwidget`, `lperpost`, `aperip`, `conline`, `ronline`, `mperpage`, `notificationl`, `notificationc`, `notifications`, `notificationd`, `notificationf`, `chatr`, `email_comment`, `email_like`, `email_new_friend`, `smiles`, `fbapp`, `fbappid`, `fbappsecret`, `paypalapp`, `paypaluser`, `paypalpass`, `paypalsign`, `paypalsand`, `currency`, `promonth`, `proyear`, `protracksize`, `protracktotal`, `ad1`, `ad2`, `ad3`, `ad4`, `ad5`, `ad6`, `ad7`) VALUES
('Juste du son 2 teuf ! ', 'sound', 10, '0.80', 1, 60000, 0, 10485760, 'png,jpg,gif,jpeg', 1, 10485760, 'png,jpg,gif,jpeg', 524288000, 'mp3,wav,wma', 1073741824, 10, 9, 1000, 10, 20, 10, 100, 30, 5, 0, 600, 11, 10, 1, 1, 1, 1, 1, 30, 0, 1, 1, 1, 1, '1335121723180345', '1f178df9c492dd4d141e9181e8842318', 0, '', '', '', 0, 'EUR', 0.00, 0.00, 524288000, 5368709120, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
`id` int(12) NOT NULL,
  `uid` int(32) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `art` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `buy` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `record` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `release` date NOT NULL,
  `license` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `views` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `tracks`
--

INSERT INTO `tracks` (`id`, `uid`, `title`, `description`, `name`, `tag`, `art`, `buy`, `record`, `release`, `license`, `size`, `download`, `time`, `public`, `likes`, `downloads`, `views`) VALUES
(1, 2, 'Tao H - Smell of powder', '', '715074677_100628188_1817633607.mp3', 'taoh,', '756891335_1624127711_1362143324.jpg', '', '', '0000-00-00', 0, 4901145, 1, '2015-12-16 12:42:40', 1, 1, 0, 2),
(2, 2, 'les bretons version hardcore a prendre avec humour', '', '32508222_1455415372_595464496.mp3', 'hardcore,', 'default.png', '', '', '0000-00-00', 0, 1608469, 1, '2015-12-02 13:14:36', 1, 0, 0, 3),
(3, 2, 'T''en as trop pris- TINKEN', '', '673330605_1061865076_2132911914.mp3', 'harcore,', 'default.png', '', '', '0000-00-00', 0, 75656926, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(5, 2, 'BIOHAZARD PART 41 MIX BY LARRY (Présente-coupé court) (le 03.2012)', '', '447589426_1044528231_428394975.mp3', 'hardcore,larrygola2,bhz,', 'default.png', '', '', '0000-00-00', 0, 58943194, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(6, 3, 'kauProD - Live TEKNIVIBRATION 22', 'Tekos du 1er Mai 2015 Mix by KauProd', '126385230_112965041_373681502.mp3', 'teknival,hardcore,acidcore,', '1003275006_1613850249_1224469164.jpg', '', '', '0000-00-00', 0, 52814757, 1, '2015-12-02 14:50:28', 1, 0, 0, 0),
(7, 3, 'ketaklak - MegaMix2', 'Le grand KKK sort ses vinyles les plus gras pour plus d''une heure de ramonage sans retenue.\r\npur hardcore 2 speedcore\r\n(◣_◢)', '687932805_384151618_1115761284.mp3', 'hardcore,oldschool,highbpm,speedcore,', '1081072896_98039361_1433707786.jpg', '', '', '0000-00-00', 0, 73347752, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(8, 2, 'AcoK - The PEDRA Set', '', '1741146135_716390487_1214848302.mp3', 'hardcore,', 'default.png', '', '', '0000-00-00', 0, 131893248, 1, '2015-12-02 19:12:36', 1, 0, 0, 0),
(9, 2, 'mecreant - audioygenic', 'Comme son nom l''indique ', '929407906_361810650_834062511.mp3', 'hardcore,', 'default.png', '', '', '0000-00-00', 0, 72920816, 1, '2015-12-16 12:42:40', 1, 1, 0, 0),
(10, 5, 'Je ne regrette rien', 'Edith Piaf Remix', '493979490_1937352791_635792993.mp3', 'edithpiaf,dominator,frenchcore,jeneregretterien,', '1045266177_1536337556_754941506.jpg', '', '', '0000-00-00', 0, 4130012, 1, '2015-12-16 12:42:40', 1, 1, 0, 1),
(11, 5, 'Renegade Returns', '', '1199740925_298077100_182529989.mp3', 'frenchcore,radium,', '1466404495_699569919_902263812.jpg', '', '', '0000-00-00', 0, 6768331, 1, '2015-12-16 12:42:40', 1, 1, 0, 1),
(12, 2, 'Srb - Solid Cervezas_73375469_soundcloud', 'Quoi de mieux avec une bonne binouse ! ', '625154164_1586942413_317625222.mp3', 'hardcore,biere,beer,americano,', '349656084_1686804836_1596920282.PNG', '', '', '0000-00-00', 0, 2652447, 1, '2015-12-16 12:42:40', 1, 1, 0, 1),
(13, 2, 'Mix Pumpcore , Le Coy  (Free download  -)_138456344_soundcloud', '', '852248108_723329429_652508473.mp3', 'pumpcore,core,pumping,', '1197285151_18384010_222708470.jpg', '', '', '0000-00-00', 0, 48513444, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(14, 2, 'Relakztek - Alixe Wonderfixe (extrait LIVE 2015)_228541864_soundcloud', '', '963813878_1569951895_1898851005.mp3', 'tribecore,alix,wonderland,', '296629226_2140519650_1811171630.jpg', '', '', '0000-00-00', 0, 8002251, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(15, 2, 'rumbull - sa rap sec.', '', '858525975_206552614_283848866.mp3', 'hardcore,rap,', '1097193515_122691326_1024678580.jpeg', '', '', '0000-00-00', 0, 43238726, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(16, 2, 'johnfaustus - Acid Mentalcore 1', '', '29238105_438418253_1284102275.mp3', 'acid,mental,core,mentalcore,', '1961206220_2041424117_1967347841.jpg', '', '', '0000-00-00', 0, 16606594, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(17, 2, 'NO3ltb - Binaural Bears', '', '55099636_1800386987_2013523449.mp3', 'acid,', 'default.png', '', '', '0000-00-00', 0, 13205641, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(18, 2, 'Tribecore celtik_32335274_soundcloud', '', '65442354_784736696_906250862.mp3', 'tribecore,celtic,', '680794446_1815284887_880320076.jpg', '', '', '0000-00-00', 0, 5294676, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(19, 2, 'Le Swing Des Aristocats ! KalbO', '', '182060704_1610493330_613619498.mp3', 'tribe,aristochats,jazytek,', '589848548_1079327640_781781602.jpg', '', '', '0000-00-00', 0, 4267841, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(20, 2, 'xTa - fuck da end', '', '1345007510_1874982010_794729551.mp3', 'hardtek,', 'default.png', '', '', '0000-00-00', 0, 64802002, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(21, 23, 'Zone 33 - Beb', '', '153290776_1915302298_1122562035.MP3', 'hardtecktribe,', 'default.png', '', '', '0000-00-00', 0, 5763072, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(22, 2, 'Fighter Core', 'Du bon gros core des familles', '1997584079_1401306529_371965198.mp3', 'core,hardcore,', '392432305_1129975580_214108119.PNG', '', '', '0000-00-00', 0, 73927633, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(23, 2, 'Sasio - Zelda Vs Link (Tribecore Remix)', '', '93965920_1360350440_221203442.mp3', 'zelda,tribecore,harcore,', '510994369_1008464628_519316967.jpg', '', '', '0000-00-00', 0, 4617883, 1, '2015-12-16 12:42:40', 1, 1, 0, 1),
(24, 2, 'Manzanitek - Sex, Drugs and Frenchcore !', '', '1856517144_1148959723_1640679627.mp3', 'frenchcore,sexdrugs,drug,manzanitek,', '439526545_934982416_183011725.jpg', '', '', '0000-00-00', 0, 16176874, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(25, 2, 'Manzanitek - Alchemy', '', '1772887155_1075940315_1787771909.mp3', 'mental,tribe,mentaltribe,', '1261721086_961295886_541735948.jpg', '', '', '0000-00-00', 0, 67020577, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(26, 24, 'Micropoint | Exit Mankind | 01 - Harder Than Hitler', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '374405519_1839702839_1819087100.mp3', 'micropoint,hardcore,', '1847626467_937203070_1965342336.jpg', '', '', '0000-00-00', 0, 7265093, 1, '2015-12-08 18:25:00', 1, 0, 0, 0),
(27, 24, 'Micropoint |Exit Mankind | 02 - 6 Billion Clones', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '1715178022_1278134935_1660562081.mp3', 'micropoint,hardcore,', '2004947321_728606968_2146382326.jpg', '', '', '0000-00-00', 0, 9661253, 1, '2015-12-08 18:26:15', 1, 0, 0, 0),
(28, 24, 'Micropoint | Exit Mankind |03 - Mastermind', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '1338123819_2131804785_988174382.mp3', 'micropoint,hardcore,', '1043814111_1981234806_1753023559.jpg', '', '', '0000-00-00', 0, 5540385, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(29, 24, 'Micropoint | Exit Mankind | 04 - Get Stupid', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '991461568_1533386372_1690367567.mp3', 'micropoint,hardcore,', '1023785466_461870475_1775275845.jpg', '', '', '0000-00-00', 0, 7243150, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(30, 24, 'Micropoint | Exit Mankind | 05 - Useless People', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '1975631087_639371325_358463903.mp3', 'micropoint,hardcore,', '1976687682_757376000_1595191586.jpg', '', '', '0000-00-00', 0, 7008048, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(31, 24, 'Micropoint | Exit Mankind | 06 - No Blood No Money', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '219795384_1462252747_328100184.mp3', 'micropoint,hardcore,', '2117675221_1657916152_2123648211.jpg', '', '', '0000-00-00', 0, 9493234, 1, '2015-12-08 18:38:34', 1, 0, 0, 0),
(32, 24, 'Micropoint | Exit Mankind | 07 - Stress Test', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '1060403371_196935794_1759953443.mp3', 'micropoint,hardcore,', '1632308308_1592043702_1293053756.jpg', '', '', '0000-00-00', 0, 3650791, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(33, 24, 'Micropoint | Exit Mankind | 08 - No Sex', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '440381170_843545579_1369145310.mp3', 'micropoint,hardcore,', '457589295_631296572_1670475753.jpg', '', '', '0000-00-00', 0, 6477031, 1, '2015-12-08 18:41:22', 1, 0, 0, 0),
(34, 24, 'Micropoint | Exit Mankind | 09 - Kiss Kiss Kill [Remix]', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '1363616416_1585547577_1647577321.mp3', 'micropoint,hardcore,', '1001240849_1005251333_1712803387.jpg', '', '', '0000-00-00', 0, 8147196, 1, '2015-12-08 18:42:38', 1, 0, 0, 0),
(35, 24, 'Micropoint | Exit Mankind | 10 - Immolation', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '363997091_1619642302_1909630063.mp3', 'micropoint,hardcore,', '1249038721_806475074_777975827.jpg', '', '', '0000-00-00', 0, 7940306, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(36, 24, 'Micropoint | Exit Mankind | 11 - Reality Sucks', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '1981239439_2045964809_1325408561.mp3', 'micropoint,hardcore,', '2033312303_1590952958_1623124399.jpg', '', '', '0000-00-00', 0, 8169766, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(37, 24, 'Micropoint | Exit Mankind | 12 - Kill Yourself', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '709271169_1241397792_29061123.mp3', 'micropoint,hardcore,', '1569922076_1277473966_748232425.jpg', '', '', '0000-00-00', 0, 8856891, 1, '2015-12-08 18:47:33', 1, 0, 1, 0),
(38, 24, 'Micropoint | Exit Mankind | 13 - Cumshot', 'Micropoint est un groupe français de musiques électroniques hardcore, composé de Daniel Técoult et Denis Cohen Scali', '525202895_1975161249_1516868162.mp3', 'micropoint,hardcore,', '103620900_286586105_1050275668.jpg', '', '', '0000-00-00', 0, 7172933, 1, '2015-12-08 18:48:54', 1, 0, 0, 0),
(39, 10, 'Alextrem - Hydrolight', '', '1421426666_1276876202_1542079688.mp3', 'hardtek,', 'default.png', '', '', '0000-00-00', 0, 5444857, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(40, 10, 'Alextrem - Pandemo', '', '870294364_133826493_1516871644.mp3', 'mentalhardtek,', 'default.png', '', '', '0000-00-00', 0, 11541993, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(41, 10, 'ALEXTREM - TRANSELUCID 03', '', '1866970472_1015142501_182538325.mp3', 'mentalhardtek,', 'default.png', '', '', '0000-00-00', 0, 5001486, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(42, 10, 'ALEXTREM- RSF 03', '', '1470495301_1477460221_611767510.mp3', 'hardtek,', 'default.png', '', '', '0000-00-00', 0, 13283438, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(43, 10, 'ALEXTREM - vicelard 02', '', '1996227720_1249153878_1086609762.mp3', 'hardtek,', 'default.png', '', '', '0000-00-00', 0, 10254478, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(44, 10, 'PANDRO - Into the pineal 23', '', '291007869_341966461_1530060150.mp3', 'tribecore,', 'default.png', '', '', '0000-00-00', 0, 6532364, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(45, 10, 'Hesed - Until Dawn', '', '309417956_1205958671_1702363793.mp3', 'acidcore,', '728911926_109672036_421710526.jpg', '', '', '0000-00-00', 0, 6139123, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(46, 10, 'Kindaaz - Dsp Revival (Non drogué)', 'Non drogué !', '426748761_921151531_1401576387.mp3', 'hardtek,', '1547105068_1858881043_2014071807.jpg', '', '', '0000-00-00', 0, 4880780, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(47, 10, 'Wanorde - Brain bubble', '', '2003878523_1638184170_79796153.mp3', 'acid,acidcore,', '701008204_711200612_1950965063.jpg', '', '', '0000-00-00', 0, 5276220, 1, '2015-12-16 12:42:40', 1, 1, 0, 2),
(48, 5, 'The Good Old Days', 'Un bon gros mix Hardcore/Gabber', '1048295002_1906196740_1779802570.mp3', 'hardcore,gabber,mix,', '1878509951_1371942902_672692434.jpg', '', '', '0000-00-00', 0, 111428048, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(49, 25, 'ARTMOX LIVE SET - PROGRESSIVE PSY TRANCE GOA 2012', '', '1268883995_1857972056_492011306.mp3', 'trance,psytrance,progressive,', 'default.png', '', '', '0000-00-00', 0, 76062451, 1, '2015-12-09 13:09:45', 1, 0, 0, 0),
(50, 2, 'Never Stop Speedcore', 'Tout est dit', '2090510231_364539014_2073617649.mp3', 'speedcore,', '1782363787_781355607_1074570148.jpg', '', '', '0000-00-00', 0, 3370697, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(51, 25, 'Grosche - My Vision The Forest', '', '1497489356_461450144_840568594.mp3', 'forest,darkpsy,', '889379104_1277886994_1498907041.jpg', '', '', '0000-00-00', 0, 16912384, 1, '2015-12-09 13:13:09', 1, 0, 0, 0),
(52, 10, 'Johnfaustus - primitive', '', '1441384162_428595215_1361537101.mp3', 'hardcore,', '1625449527_1548237712_1691305932.jpg', '', '', '0000-00-00', 0, 13378614, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(53, 10, 'Ketaklak - Fuir ou subir', '', '165467904_858254689_1799738209.mp3', 'hardcore,', '570952917_1828218984_804087825.jpg', '', '', '0000-00-00', 0, 5314001, 1, '2015-12-16 12:42:40', 1, 1, 0, 2),
(54, 25, 'Erofex - Forest Gate', '', '1809246433_1240608692_672519968.mp3', 'forest,darkpsy,', '1409035705_1607802090_508016677.jpg', '', '', '0000-00-00', 0, 15679488, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(55, 25, 'dynamicbreakup', '', '1306460755_55044803_1993234189.mp3', 'trance,progressive,', 'default.png', '', '', '0000-00-00', 0, 59595589, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(56, 25, 'DJ SWAP - Minimal Psy Trance', '', '775548836_1674111496_1298382511.mp3', 'psytrance,trance,minimal,', 'default.png', '', '', '0000-00-00', 0, 28869903, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(57, 25, 'dj rise @glazart', '', '563378247_319915955_299363014.mp3', 'trance,progressive,', 'default.png', '', '', '0000-00-00', 0, 89634935, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(58, 25, 'Nazrael - The Illusion Of Time', '', '1496365137_517189759_652354765.mp3', 'forest,darkpsy,', '680700615_195976358_1371365055.jpg', '', '', '0000-00-00', 0, 16386404, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(59, 25, 'Parasect - Naturspective', '', '2117447962_1720048900_1473684458.mp3', 'forest,darkpsy,', '389448083_1038260827_126426061.jpg', '', '', '0000-00-00', 0, 17580032, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(60, 25, 'Surupo - Frequencies In Motion', '', '1421706255_56319121_350118258.mp3', 'forest,darkpsy,', '906160202_1931559899_1636004761.jpg', '', '', '0000-00-00', 0, 20248576, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(61, 25, 'Parasect - Paramecium And Green Algae', '', '2090882168_1358161684_743285291.mp3', 'forest,darkpsy,', '1184712808_927360889_1951383980.jpg', '', '', '0000-00-00', 0, 17580032, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(62, 25, 'Surupo - Quantum Touch', '', '1987393254_130485967_2048605090.mp3', 'forest,darkpsy,', '841507855_1787321022_1396497774.jpg', '', '', '0000-00-00', 0, 21555200, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(63, 25, 'Zaiklophobia - Human Revolution', '', '1005059556_565401749_730758164.mp3', 'forest,darkpsy,', '905436334_766448727_64589144.jpg', '', '', '0000-00-00', 0, 18133475, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(64, 25, 'Parasect &amp; Biogrid - Blossom Molecular', '', '2061005473_1133446793_1298809580.mp3', 'forest,darkpsy,', '2021213327_1385363679_1851339818.jpg', '', '', '0000-00-00', 0, 18268160, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(65, 25, 'Surupo - Inne I Skogen', '', '125843947_1447229878_1473249528.mp3', 'forest,darkpsy,', '943935299_360560395_287111278.jpg', '', '', '0000-00-00', 0, 18769920, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(66, 25, 'Surupo - Noctis Somnium', '', '522626250_1660144826_508306400.mp3', 'forest,darkpsy,', '559222887_1849992727_597222532.jpg', '', '', '0000-00-00', 0, 18188288, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(67, 25, 'Zaiklophobia vs Nazrael - Subliminal Expiriens', '', '842833733_1828366053_2140076119.mp3', 'forest,darkpsy,', '1813892352_2054727259_1278806208.jpg', '', '', '0000-00-00', 0, 19381098, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(68, 25, 'Nazrael vs Zaiklophobia - Aliens Contact', '', '1869728592_1787741941_1711111350.mp3', 'forest,darkpsy,', '792222353_1195386982_1826298834.jpg', '', '', '0000-00-00', 0, 18614137, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(69, 25, 'Voodoo Link - Cheez', '', '437457013_1345770621_616735608.mp3', 'forest,darkpsy,', '922218744_1595718503_1504459956.jpg', '', '', '0000-00-00', 0, 16244736, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(70, 25, 'Hanuman - Mystic Space', '', '91283345_789742302_1292443436.mp3', 'forest,darkpsy,', '905491017_1024528484_1182430798.jpg', '', '', '0000-00-00', 0, 17889280, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(71, 25, 'Toxixot 25 - Twisted Dream', '', '1529018918_1786428807_1812872338.mp3', 'forest,darkpsy,', '312538975_1607589053_1877258264.jpg', '', '', '0000-00-00', 0, 17969152, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(72, 25, 'Livewire - Mechanical Shaman', '', '1159600703_2035122705_1010141472.mp3', 'forest,darkpsy,', '1802848920_728635670_1769657939.jpg', '', '', '0000-00-00', 0, 19363840, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(73, 25, 'Jivaz - Kaleidoscope', '', '1353586912_780681758_553430381.mp3', 'forest,darkpsy,', '1324634270_28251900_1655787432.jpg', '', '', '0000-00-00', 0, 13594624, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(74, 25, 'Insane El Rato - The Window', '', '1501661993_690350119_333509135.mp3', 'forest,darkpsy,', '1148516231_382065063_557542857.jpg', '', '', '0000-00-00', 0, 15622144, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(75, 25, 'Triptonit - Skup Skup', '', '1695536501_821664838_1741268599.mp3', 'forest,darkpsy,', '1097581613_1015894727_1742539533.jpg', '', '', '0000-00-00', 0, 22878208, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(76, 25, 'Psykobeatz - Psyjungle', '', '866334281_1912099526_2070705468.mp3', 'forest,darkpsy,', '1444396616_643814738_1219809831.jpg', '', '', '0000-00-00', 0, 15517696, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(77, 25, 'fisherman fucks sarko', '', '429505192_1095544397_548230734.mp3', 'forest,darkpsy,', '1898504694_230897378_1955470179.jpg', '', '', '0000-00-00', 0, 17350569, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(78, 25, 'HypoGeo Live-BoomFestival2012', '', '1572476019_1227131874_849269110.mp3', 'forest,darkpsy,', '858336945_1030616906_1286861834.jpg', '', '', '0000-00-00', 0, 132217928, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(79, 25, 'johnfaustus - Behind the Tree', '', '955757576_827106922_1234061011.mp3', 'forest,darkpsy,', '1005311046_1841558463_431940407.jpg', '', '', '0000-00-00', 0, 19266908, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(80, 18, 'black-mountain', '', '905549910_1118110963_1172503547.mp3', 'harcore,', '1065862709_1884713347_1270784224.png', '', '', '0000-00-00', 0, 5586859, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(81, 25, 'Best of Trance (December 2011)', '', '69913615_32188028_814867846.mp3', 'trance,', 'default.png', '', '', '0000-00-00', 0, 55880621, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(82, 18, 'LBtk - c''est mal', '', '338603958_177531020_209563567.mp3', 'hardcore,', '225054145_975426674_999673453.jpg', '', '', '0000-00-00', 0, 21523320, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(83, 25, 'DJ Radium &amp; Vandal - Fatty Fatty', '', '297437723_1108406118_1281828170.mp3', 'raggahardtek,', 'default.png', '', '', '0000-00-00', 0, 4648438, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(84, 25, 'internet-friends', '', '781781825_1615426177_546548106.mp3', 'tribecore,', 'default.png', '', '', '0000-00-00', 0, 7530787, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(85, 25, 'crayon - la rentrer des goss la teuf pour les parents', '', '262076823_42720558_1659647.mp3', 'tribecore,', 'default.png', '', '', '0000-00-00', 0, 97898907, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(86, 25, 'brebs-cypri-in-paris', '', '1570720311_49296023_12513920.mp3', 'tribecore,', 'default.png', '', '', '0000-00-00', 0, 5067336, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(87, 25, 'de-lopera-a-la-bergerie', '', '919753773_1156049884_809295613.mp3', 'tribecore,', 'default.png', '', '', '0000-00-00', 0, 5272136, 1, '2015-12-16 12:42:40', 1, 0, 1, 0),
(88, 25, 'eclairer-lobscurit-sans', '', '1925960182_381927749_1712195435.mp3', 'tribecore,', 'default.png', '', '', '0000-00-00', 0, 5761984, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(89, 25, 'brebskore hardnausifloor-final-sans', '', '909470281_485088252_2003961767.mp3', 'tribecore,', '1363919777_2006894821_376467645.jpg', '', '', '0000-00-00', 0, 5117491, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(91, 25, 'le nombre 23 remix', '', '1930717952_1228746606_287171258.mp3', 'tribecore,', '1042124182_1984392618_2075006108.jpg', '', '', '0000-00-00', 0, 5947976, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(92, 25, 'Maissouille - Onde de choc', '', '4093677_2033742705_62662901.mp3', 'frenchcore,', '427113579_1895911228_1351329858.jpg', '', '', '0000-00-00', 0, 167759926, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(93, 25, 'Oui, Cest Paranormal ! FRENCHCORE', '', '1933879288_2032670316_1951962194.mp3', 'frenchcore,', '520051337_833151180_766884519.jpg', '', '', '0000-00-00', 0, 16913699, 1, '2015-12-16 12:42:40', 1, 0, 0, 0),
(94, 25, 'SMK au pays des merveilles DFC SMK RENARD', '', '2125555520_863371004_38441159.mp3', 'frenchcore,', '1510912361_878675140_1329522670.jpg', '', '', '0000-00-00', 0, 58887048, 1, '2015-12-16 12:42:40', 1, 0, 1, 0),
(100, 3, 'D-brayé - Miki live prod - Dead guitar', 'Half hardcore / frenchcore live record by Miki ! D-brayé 6tem', '1009704640_1988847758_1315280832.mp3', 'hardcore,frenchcore,dbraye,d-brayé,', '1238940050_182154622_1309988182.jpg', '', '', '0000-00-00', 0, 2230456, 1, '2015-12-16 12:42:40', 1, 1, 1, 3),
(101, 3, 'Ratkore - RKAOTIK - La menace hardcore', 'Oldskool track by RKAOTIK, Ratkore sound system', '50268092_1527817499_1994118092.mp3', 'oldschool,hardcore,ratkore,rkaotik,oldskool,', '344914911_1381239070_703090647.png', '', '', '0000-00-00', 0, 6780550, 1, '2015-12-16 12:42:40', 1, 1, 1, 2),
(102, 3, 'D-brayé 6tem - MiKi - attack-cardiak', 'Miki live record : Attack cardiak', '1005216612_860763887_632083351.mp3', 'hardcore,live,miki,dbraye,d-brayé,', '425154288_2130829781_1381654648.jpg', '', '', '0000-00-00', 0, 5923316, 1, '2015-12-16 12:42:40', 1, 1, 2, 2),
(103, 25, 'hARRY pOTAR Quelques grammes de finesse dans un monde de PUTES', '', '1782523740_21152072_643136477.mp3', 'hardtek,', 'default.png', '', '', '0000-00-00', 0, 6351670, 1, '2015-12-16 12:42:40', 1, 0, 1, 1),
(104, 3, 'cold rush 09 1995 -  Pilldriver - Pitch Hiker', 'Old school hardcore vinyl - Cold rush maxi no 09', '1666782977_1347132217_43379799.mp3', 'hardcorebasic,coldrush,oldschoolhardcore,oldskool,', '604322226_888887997_1751910855.png', '', '', '0000-00-00', 0, 4824029, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(105, 2, 'HOW HIGH son de TEUF', '', '1675899307_131562072_1472899505.mp3', 'hardcore,hardtek,', '454434522_2134838252_336224594.jpg', '', '', '0000-00-00', 0, 7776344, 1, '2015-12-16 12:42:40', 1, 0, 0, 2),
(106, 3, 'Cecelson - Mix label Architek - Fais péter Dédé !!', 'Bon mix de tonton avec les bonnes grosses galettes du label Architek !\n\nBy Cecelson', '1637961778_1327304952_408192417.mp3', 'tribecore,mix,architek,cecelson,tonton,dédé,', '129882211_206970353_235765712.jpg', '', '', '0000-00-00', 0, 28201741, 1, '2015-12-16 12:42:40', 1, 2, 0, 3),
(107, 3, 'brebskore - De l''opéra à la bergerie', 'Swing dans la bergerie ! Original track by le grand brebskore \r\nFrenchTribe des familles, fucking classic', '199583853_623214445_953774678.mp3', 'frenchcore,tribecore,brebskore,brebis,blackmountain,', '1344985288_1078262244_1597956708.jpg', '', '', '0000-00-00', 0, 5272136, 1, '2015-12-16 12:42:40', 1, 0, 0, 2),
(108, 3, 'KnarD - Analyse Cut ( 3 litres de pisse !)', 'Dernière partie du mix Analyze Cerebral by KnarD.... TATATATA !\n\n3 litres de pisse, que t''aura !!', '1709388628_1650003197_1049186415.mp3', 'tribecore,frenchcore,knard,mix,teknival,troislitresdepisse,', '1065488962_528829706_1784979766.jpg', '', '', '0000-00-00', 0, 16509067, 1, '2015-12-16 12:42:40', 1, 0, 1, 2),
(109, 3, 'LSD Boomerang ( TAZ -  Rabbie on the beach Remix)', 'Remix d''un classique par un bon vieux tonton polonais des familles\r\nHIGH BPM &lt;3', '1100802267_191188498_1888347210.mp3', 'tribecore,remix,highbpm,teknival,pologne,poland,', '670771788_1038393739_1858803774.jpg', '', '', '0000-00-00', 0, 8823034, 1, '2015-12-16 12:42:40', 1, 1, 1, 1),
(110, 10, 'Narkotek - Made in Tekos', '', '457661370_281116239_38056783.mp3', 'hardtek,', '1687606836_2071909860_144642429.jpg', '', '', '0000-00-00', 0, 47122271, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(111, 2, 'vincegazmask - X tRem K0re 2 Thounsand.XIII', 'Que du bon son WTF comme on l''aime !', '1707012674_730445502_1939074015.mp3', 'hardcore,cervezas,biere,wtf,vincegazmask,', '2133216137_696665046_410720439.jpg', '', '', '0000-00-00', 0, 37597518, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(112, 10, 'Shmirlap - No Hope', '', '1590587604_1723825053_1494230873.mp3', 'acidcore,', '862679867_1669750432_550213808.jpg', '', '', '0000-00-00', 0, 6564787, 1, '2015-12-16 12:42:40', 1, 1, 0, 2),
(113, 10, 'Mr Gasmask - Acid Attack', '', '4209960_34115504_929163124.mp3', 'acidcore,', '189062611_1724061906_596765845.jpg', '', '', '0000-00-00', 0, 6488824, 1, '2015-12-16 12:42:40', 1, 0, 1, 2),
(114, 10, 'Shmirlap Vs Puch-K - Acid Invaders', '', '556417402_1849457819_980831638.mp3', 'acidcore,', '653444695_1929644364_683560109.jpg', '', '', '0000-00-00', 0, 9772361, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(115, 10, 'Shmirlap Vs Timballmastaz - A Great Eye', '', '976843238_602524226_2088863312.mp3', 'acidcore,', '1049099560_837931297_397556761.jpg', '', '', '0000-00-00', 0, 6188973, 1, '2015-12-16 12:42:40', 1, 0, 0, 2),
(116, 28, 'The Whistlers - PPF', '', '925559362_868890303_1301292563.mp3', 'frenchcore,', '514705276_1922986454_154163041.jpg', '', '', '0000-00-00', 0, 3957395, 1, '2015-12-16 12:42:40', 1, 1, 1, 3),
(117, 2, 'Spitnoise - Hardshock Festival 2015 Promomix', '', '1182555065_476256648_92774707.mp3', 'spitnoise,harcdore,', '1715231802_2051204725_1512443734.jpg', '', '', '0000-00-00', 0, 46421031, 1, '2015-12-12 15:13:52', 1, 0, 2, 0),
(118, 28, 'Venom - El Dicktator', '', '179306752_592869081_94921751.mp3', 'hardcore,', '664931966_1214613157_1574442538.jpg', '', '', '0000-00-00', 0, 5425684, 1, '2015-12-16 12:42:40', 1, 1, 0, 11),
(119, 28, 'Brutal Jesters &amp; Dr. Peacock ft. Mystika - We Are The Resistance', '', '1848055948_1423611633_1583939877.mp3', 'frenchcore,', '1743466951_1012963327_215569485.jpg', '', '', '0000-00-00', 0, 5661831, 1, '2015-12-16 12:42:40', 1, 0, 0, 3),
(120, 18, 'Current Value - Rolling Hi.', '', '740424460_232193475_1350417971.mp3', 'drumandbass,', '1751226244_246120371_751686923.jpg', '', '', '0000-00-00', 0, 13923402, 1, '2015-12-16 12:42:40', 1, 0, 0, 1),
(121, 2, 'FreeKc Sound6Tem -by BDOUILLE - LASCAR (ah Les Batard)', '', '633834932_1367330726_1746222465.mp3', 'tribecore,', '1406480655_933273270_1351395453.jpg', '', '', '0000-00-00', 0, 4680723, 1, '2015-12-16 08:00:43', 1, 0, 7, 1),
(123, 2, 'TEK*FORAINE - Audiofile - Tinkle son de teuf', '', '205555846_1239945037_1326757559.mp3', 'tekforaine,audiofile,hardteck,', '394959138_1808554861_268519121.jpg', '', '', '0000-00-00', 0, 6687463, 1, '2015-12-18 07:57:18', 1, 0, 0, 1),
(124, 2, 'B2R - Space Rave [Diaspora09]', '', '162440309_1440843075_1098277770.mp3', 'back2roots,b2r,tribecore,', '229286643_1150575236_962033609.jpg', '', '', '0000-00-00', 0, 5190430, 1, '2015-12-18 08:11:00', 1, 0, 0, 2),
(125, 2, 'Asthmatek - Pokeur Amateur', '', '185755990_775752974_1634185061.mp3', 'tribe,asthmatek,', '1197807411_266655913_318347581.jpg', '', '', '0000-00-00', 0, 3385858, 1, '2015-12-18 08:13:51', 1, 0, 0, 2),
(126, 2, 'Babou - Le Pays Joyeux Des Teuffeurs Heureux', '', '1858680048_1744305187_1153548572.mp3', 'babou,tribecore,hardteck,casimir,', '1942025626_645846932_921186973.jpg', '', '', '0000-00-00', 0, 5688705, 1, '2015-12-18 08:26:00', 1, 0, 0, 2),
(127, 2, 'Alifer™ - Requiem for a Trip', '', '1615041953_1231361191_1728634602.mp3', 'alifer,requiem,tribecore,', '2146319967_1983320934_1435145609.jpg', '', '', '0000-00-00', 0, 5239913, 1, '2015-12-18 08:36:23', 1, 0, 0, 1),
(128, 2, 'GrOmiNeT Corp - Redemption', '', '1115913487_537742761_337060568.mp3', 'tribecore,pump,pumping,tribe,frenchcore,', '887104617_1454130670_1150321424.jpg', '', '', '0000-00-00', 0, 6198234, 1, '2015-12-18 08:45:01', 1, 0, 0, 2),
(129, 3, 'Natas - Gaaaz', 'Hardtek des familles', '1843339886_500364262_176235685.mp3', 'hardtek,hardtechno,', '707213916_1937594626_393063522.jpg', '', '', '0000-00-00', 0, 8221415, 1, '2015-12-24 01:37:02', 1, 0, 0, 0),
(130, 3, 'KnarD - FRENCHCORE Brain Killer Vol.2 Pt 3', 'Mix frenchcore by KnarD\r\nTa ta ta ta !', '742814868_1930620867_1143051951.mp3', 'frenchcore,mix,', '558897591_195244276_1694883634.jpg', '', '', '0000-00-00', 0, 75624409, 1, '2016-01-02 17:54:21', 1, 0, 0, 0),
(131, 3, 'RéforMé 6tem - 6 h du mat', 'Attention track hardcore RARE voir UNIQUE ! Du bon hardcore de gros tonton bien gras et bien régulier comme je l''aime, par un des meilleurs sounds system français ! \r\nIls ont posé leur dernière teuf aux montagnes noires en 2013, et j''peux vous dire qu''on s''en souvient :'')\r\nAH ça débouche, la RÉFORME !', '1609456443_588889015_1238235457.mp3', 'hardcore,débouchage,débouche,réforme,rform,blackmountain,matinal,', '2125373495_862046576_1205055200.jpg', '', '', '0000-00-00', 0, 14399737, 1, '2016-01-02 18:43:24', 1, 2, 2, 1),
(132, 3, 'RéforMé 6tem - Ah ça débouche, la réforme !', 'Tout est dit ! Bon gros tabassage des familles par des vrais.\r\ntrack INTROUVABLE alors enjoy &amp; download !', '1253924010_445178056_466941023.mp3', 'hardcore,débouchage,débouche,réforme,rform,blackmountain,', '555246277_430756774_130482891.jpg', '', '', '0000-00-00', 0, 15457909, 1, '2016-01-02 18:47:45', 1, 2, 1, 1),
(133, 3, 'Ratkore - RKAOTIK - nimbuskore', 'Track hardcore old school by Rkatotik', '413884616_2034047647_1309011827.mp3', 'hardcore,oldschool,oldskool,ratkore,rkaotik,', '672850584_10474851_1973564995.png', '', '', '0000-00-00', 0, 5455620, 1, '2016-01-04 09:54:24', 1, 0, 0, 0),
(134, 3, 'KnarD - FRENCHCORE Brain Killer Vol.2 Part 2', 'Mix frenchcore by KnarD', '872621018_1874779393_613595632.mp3', 'frenchcore,mix,', '654811272_1784497774_1366411604.jpg', '', '', '0000-00-00', 0, 74827779, 1, '2016-01-04 10:43:14', 1, 0, 0, 0),
(135, 3, 'Live by Unknown - PLAYMOSTYLE', 'Un des premiers sons de teuf téléchargé ... souvenirs !\r\nLive Frenchcore par un parfait inconnu. Si tu te reconnais, saches que c''est énorme.', '60428373_2147277800_553699113.mp3', 'frenchcore,live,playmobil,playmostyle,', '183343605_548337609_2043660992.jpg', '', '', '0000-00-00', 0, 54701498, 1, '2016-01-04 13:08:34', 1, 0, 0, 0),
(137, 34, 'sicmo´s Warbass', '', '522128906_697707656_1965998188.mp3', 'tribe,', '1339473853_852801552_1007731106.jpg', '', '', '0000-00-00', 0, 10576745, 1, '2016-01-05 11:30:23', 1, 0, 0, 0),
(138, 34, 'Tetratek - Blunt Sensation', '', '1490791273_616125536_181228317.mp3', 'tribe,', '1428640665_810047625_1173853351.png', '', '', '0000-00-00', 0, 4651700, 1, '2016-01-05 11:32:55', 1, 0, 0, 0),
(139, 34, 'LESOtek - Sdaghidaghi', '', '42653388_953484682_2063265136.mp3', 'tribe,', '709138215_746411229_1107084601.jpg', '', '', '0000-00-00', 0, 4344596, 1, '2016-01-05 11:34:52', 1, 0, 0, 1),
(140, 34, 'Alifer - I Am the Devil', '', '503814654_1985017391_1924451336.mp3', 'tribe,', '48477043_389727732_719186298.jpg', '', '', '0000-00-00', 0, 5455396, 1, '2016-01-05 11:43:11', 1, 0, 0, 0),
(141, 34, 'Mimaniac - Nocturnal terror', '', '1008529047_286542174_1963786090.mp3', 'tribecore,', '751386579_2091778094_1658655977.jpg', '', '', '0000-00-00', 0, 5374277, 1, '2016-01-05 11:50:00', 1, 0, 0, 0),
(142, 34, 'Organ'' - Mais l''odieuse', '', '1498828029_2087067911_1624317338.mp3', 'tribecore,', '1491311545_1082798036_1463128674.jpg', '', '', '0000-00-00', 0, 7497085, 1, '2016-01-05 11:52:22', 1, 0, 0, 0),
(143, 34, 'Pulsion - Skarry', '', '783220529_1202574904_702554482.mp3', 'acidtribecore,', '609059675_2067316504_1076597831.jpg', '', '', '0000-00-00', 0, 4369503, 1, '2016-01-05 11:54:51', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`idu` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(64) NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(128) NOT NULL,
  `description` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `facebook` varchar(256) NOT NULL,
  `twitter` varchar(128) NOT NULL,
  `gplus` varchar(256) NOT NULL,
  `youtube` varchar(128) NOT NULL,
  `vimeo` varchar(128) NOT NULL,
  `tumblr` varchar(128) NOT NULL,
  `soundcloud` varchar(128) NOT NULL,
  `myspace` varchar(128) NOT NULL,
  `lastfm` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `private` int(11) NOT NULL,
  `suspended` int(11) NOT NULL,
  `salted` varchar(256) NOT NULL,
  `cover` varchar(128) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `online` int(11) NOT NULL,
  `offline` tinyint(4) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`idu`, `username`, `password`, `email`, `first_name`, `last_name`, `country`, `city`, `website`, `description`, `date`, `facebook`, `twitter`, `gplus`, `youtube`, `vimeo`, `tumblr`, `soundcloud`, `myspace`, `lastfm`, `image`, `private`, `suspended`, `salted`, `cover`, `gender`, `online`, `offline`, `ip`, `notificationl`, `notificationc`, `notificationd`, `notificationf`, `email_comment`, `email_like`, `email_new_friend`) VALUES
(2, 'lejuste', 'c067703516410eb14da30d9b1425d2b8', 'p.justinien@gmail.com', 'Lejuste', '', '', '', '', '', '2015-12-01', '', '', '', '', '', '', '', '', '', '1580891152_1849817847_488181279.JPG', 0, 0, '', '634620541_580764638_538881123.jpg', 0, 1451987653, 0, '85.233.216.37', 1, 1, 1, 1, 1, 1, 1),
(3, 'alan.corbel', '344224ea310213f5f6b855398278694e', 'alan.corbel@viacesi.fr', 'mnky_c', '', 'Japan', 'Tokyo', '', 'Alan , le bab ou le singe pour les intimes.\n\nMordu de hardcore, de ramonage et autres débouchages.\n\nAlleeeeez lààààààààà !!', '2015-12-02', '', '', '', '', '', '', '', '', '', '395635693_1751397638_181092324.png', 0, 0, '4db94969a6d8bc8ebb63529980632e09', '640872220_260991418_2121265827.jpg', 0, 1451912959, 0, '85.233.216.37', 1, 1, 1, 1, 1, 1, 1),
(4, 'tom.rocher', 'ae02985a4a621835c1f3bbf1472e1fb8', 'motca24@hotmail.fr', 'Tom', 'Rocher', '', '', '', '', '2015-12-02', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449086291, 0, '83.200.210.23', 1, 1, 1, 1, 1, 1, 1),
(5, 'pither.brangeur', '22078700a519ec5af5cf11547df73903', 'pierre.branger@hotmail.fr', 'Pither', 'Brangeur', '', '', '', '', '2015-12-03', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449666129, 0, '85.233.216.37', 1, 1, 1, 1, 1, 1, 1),
(6, 'sidvain', '7ed8623ba2b2a1ddfc795596a5894ba1', 'lescop.sylvain@laposte.net', '', '', '', '', '', '', '2015-12-06', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449392552, 0, '88.161.87.54', 1, 1, 1, 1, 1, 1, 1),
(7, 'allan.campos', 'dd213f355f14ab231f4edeb6dc6eaaac', 'allancampoos@gmail.com', 'Allan', 'Campos', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1451057271, 0, '37.163.104.102', 1, 1, 1, 1, 1, 1, 1),
(8, 'juu.nanou', '554ddb0c843a6a4cd6aacb91eceda071', 'juunanou@gmail.com', 'Juu', 'Nanou', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449499603, 0, '80.12.58.82', 1, 1, 1, 1, 1, 1, 1),
(9, 'nanounuts', 'b3e7b8a3361223726be9baa357f92500', 'manon280695@gmail.com', '', '', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449499711, 0, '80.12.58.82', 1, 1, 1, 1, 1, 1, 1),
(10, 'ryukku', '94ad8aff30099302daee6a75a9385349', 'ryukku.raymond@gmail.com', '', '', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', '16803959_780401863_1925430983.jpg', 0, 0, '', '190257370_327751631_634970862.jpg', 0, 1451981804, 0, '82.216.102.67', 1, 1, 1, 1, 1, 1, 1),
(11, 'yoan.boissinot', '839e591d6ab56dcb79610b5b7d753ee9', 'slipknot-3301@hotmail.fr', 'Yoan', 'Boissinot', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449500006, 0, '176.181.126.45', 1, 1, 1, 1, 1, 1, 1),
(12, 'rom.boudbois', 'f2098f839195f7ee5d13cd87c62f7ed2', 'audouard.romain@laposte.net', 'Rom', 'Boudbois', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449500354, 0, '176.180.160.253', 1, 1, 1, 1, 1, 1, 1),
(13, 'lunou', '905c539f9a291ac57e834d9e0d2a2817', 'blacklunou@gmail.com', '', '', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449500482, 0, '185.3.135.138', 1, 1, 1, 1, 1, 1, 1),
(14, 'marius.libert', '32fd3d6fd2dabae2fdbd1fe85282a8e6', 'mama9688@hotmail.fr', 'Marius', 'Libert', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449505974, 0, '81.57.200.129', 1, 1, 1, 1, 1, 1, 1),
(15, 'langlois', '0738e89041ea770296bf399cc3884b20', 'ekauws@gmail.com', 'Lu''', 'Langlois', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449508993, 0, '176.182.138.94', 1, 1, 1, 1, 1, 1, 1),
(16, 'floo', 'df82f7e493f1e919bd41477f02abb539', 'tiitflo@gmail.com', 'Florence', 'Bressan', 'France', 'Bordeaux', '', 'Rave on', '2015-12-07', '', '', '', '', '', '', '', '', '', '1367322353_1431436355_1378707634.jpg', 0, 0, 'bfb8ad7846c8c5ef9adb122c988c875f', '1567990334_1965098153_1512677290.jpg', 0, 1449512828, 0, '83.200.255.118', 1, 1, 1, 1, 1, 1, 1),
(17, 'kritic1dlik', 'ffc54562a8b60063607c5aa6e4c5314e', 'kritic.1.dli.k@gmail.com', '', '', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449516428, 0, '78.211.88.132', 1, 1, 1, 1, 1, 1, 1),
(18, 'alexandre', '05c52fc5b2836e69dc7c9230563925b7', 'polo-geek@hotmail.com', 'Alexandre', 'Mc-Doge', '', '', '', '', '2015-12-07', '', '', '', '', '', '', '', '', '', '1596236104_1114452456_1048801512.gif', 0, 0, '', '1340603763_1868375652_1110133734.jpg', 0, 1451762442, 0, '89.158.215.72', 1, 1, 1, 1, 1, 1, 1),
(19, 'zl', 'd6c9b9f5f2d7f83944249742fa0626ee', 'gasopaul33740@hotmail.com', 'Påúl', 'ZL', '', '', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449531437, 0, '109.21.64.86', 1, 1, 1, 1, 1, 1, 1),
(20, 'raul', 'bc7a844476607e1a59d8eb1b1f311830', 'raul.muanza@gmail.com', '', '', '', '', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449535280, 0, '78.240.191.130', 1, 1, 1, 1, 1, 1, 1),
(21, 'mush', 'f0aa44438e6aff296184cd19ad67eae9', 'bruno.prud.homme0@gmail.com', '', '', '', '', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449552403, 0, '88.139.147.240', 1, 1, 1, 1, 1, 1, 1),
(22, 'simon.jumelle', 'b267ed4069393d56c4c1e18a64c7e9aa', 'sailmon@hotmail.fr', 'Simon', 'Jumelle', '', '', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449577363, 0, '81.220.65.101', 1, 1, 1, 1, 1, 1, 1),
(23, 'melhappytek', '83a33ad451ee1937e96605a348a3a70e', 'mathimel-16@hotmail.fr', '', '', '', '', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', '490947730_653839868_518055818.jpg', 0, 0, '', '1046823242_1019391045_924588960.jpg', 0, 1449594508, 0, '78.119.203.241', 1, 1, 1, 1, 1, 1, 1),
(24, 'matthieu.david', '681799126542f1ae0ac8a63c919a336a', 'mat.david93@hotmail.fr', 'Matthieu', 'David', '', '', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', '1292614947_1197247733_1604950110.png', 0, 0, '', 'default.png', 0, 1451990805, 0, '82.216.102.195', 1, 1, 1, 1, 1, 1, 1),
(25, 'david.billiere', '96458f5366bc4b88a235ea5e29df50fa', 'david.billiere@hotmail.fr', 'David', 'Billiere', 'France', 'bordeaux', '', '', '2015-12-08', '', '', '', '', '', '', '', '', '', '323831182_843407746_1552983413.png', 0, 0, '', '613731120_1837246032_341248725.jpg', 0, 1451599866, 0, '80.215.247.150', 1, 1, 1, 1, 1, 1, 1),
(27, 'jordan.berisset', '622abdd7996eaac4397413e50cfeda1c', 'jordan.berisset@hotmail.fr', 'Jordan', 'Berisset', '', '', '', '', '2015-12-09', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449679994, 0, '109.31.107.186', 1, 1, 1, 1, 0, 1, 1),
(28, 'cripple420', 'f26f7c5b909ab2a2654b45b0fa6d67b8', 'malleacyprien@gmail.com', '', '', '', '', '', '', '2015-12-09', '', '', '', '', '', '', '', '', '', '2059150283_299852169_240945952.jpg', 0, 0, '', '1608720794_348686059_1234104018.jpg', 0, 1451989518, 0, '86.213.120.150', 1, 1, 1, 1, 0, 1, 1),
(29, 'spion', '52c139c576b0d340cc3c1aeb92fac0b2', 'Brun.adrien24@gmail.com', '', '', '', '', '', '', '2015-12-09', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1451860777, 0, '78.115.56.197', 1, 1, 1, 1, 0, 1, 1),
(30, 'victor.thiebaud', '3fb1fb8bd51a5c21d1ba26aea913dbe5', 'victor.thiebaud@gmx.fr', 'Victor', 'Thiebaud', '', '', '', '', '2015-12-09', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449700478, 0, '85.68.44.247', 1, 1, 1, 1, 0, 1, 1),
(31, 'mika.mure', 'a981d938d0946796f53822066ebf86e0', 'joeybat@hotmail.fr', 'Mika', 'Mure', '', '', '', '', '2015-12-12', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1449930578, 0, '88.167.255.77', 1, 1, 1, 1, 0, 1, 1),
(32, 'florence.bressan', '36aa3da8092e5cd03e1e7dd49507cb24', 's3miniflo@gmail.com', 'Florence', 'Bressan', '', '', '', '', '2015-12-19', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1450514471, 0, '92.134.183.225', 1, 1, 1, 1, 0, 1, 1),
(33, 'alan.corbel184', '18992d4ed5ac9be6a05ea5fdba5a6dc8', 'romibeno@gmail.com', 'Alan', 'Corbel', '', '', '', '', '2016-01-02', '', '', '', '', '', '', '', '', '', 'default.png', 0, 0, '', 'default.png', 0, 1451755894, 0, '109.22.249.31', 1, 1, 1, 1, 0, 1, 1),
(34, 'quentechno', '2a4cb35fab9dfa4193957ac3c1625f92', 'Quentin.dhoorne@icloud.com', '', '', '', '', '', '', '2016-01-05', '', '', '', '', '', '', '', '', '', '232887159_613095705_1663700999.png', 0, 0, '', '1034815131_680514534_1067602484.jpeg', 0, 1451994947, 0, '109.28.121.121', 1, 1, 1, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `views`
--

CREATE TABLE IF NOT EXISTS `views` (
`id` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `views`
--

INSERT INTO `views` (`id`, `by`, `track`, `time`) VALUES
(1, 5, 2, '2015-12-03 14:04:51'),
(2, 2, 10, '2015-12-04 16:50:32'),
(3, 2, 2, '2015-12-07 13:48:08'),
(4, 2, 12, '2015-12-07 14:09:50'),
(5, 16, 1, '2015-12-07 18:17:59'),
(6, 18, 1, '2015-12-07 19:42:19'),
(7, 2, 19, '2015-12-08 17:58:51'),
(8, 2, 18, '2015-12-08 18:04:22'),
(9, 10, 39, '2015-12-09 10:25:06'),
(10, 2, 50, '2015-12-09 13:16:51'),
(11, 2, 53, '2015-12-09 13:35:36'),
(12, 2, 105, '2015-12-09 15:08:03'),
(13, 28, 103, '2015-12-09 17:06:56'),
(14, 28, 102, '2015-12-09 17:13:06'),
(15, 28, 101, '2015-12-09 17:20:10'),
(16, 28, 100, '2015-12-09 17:24:47'),
(17, 28, 23, '2015-12-09 17:31:00'),
(18, 28, 48, '2015-12-09 21:09:15'),
(19, 28, 47, '2015-12-09 21:14:43'),
(20, 28, 46, '2015-12-09 21:19:46'),
(21, 28, 45, '2015-12-09 21:26:08'),
(22, 10, 106, '2015-12-10 13:04:47'),
(23, 10, 110, '2015-12-10 14:32:23'),
(24, 10, 109, '2015-12-10 14:35:45'),
(25, 2, 111, '2015-12-10 18:26:28'),
(26, 10, 112, '2015-12-11 13:58:20'),
(27, 2, 113, '2015-12-11 14:07:12'),
(28, 31, 115, '2015-12-12 14:27:33'),
(29, 2, 118, '2015-12-13 20:29:13'),
(30, 2, 116, '2015-12-13 20:31:20'),
(31, 2, 118, '2015-12-14 08:31:06'),
(32, 2, 119, '2015-12-14 09:52:56'),
(33, 2, 118, '2015-12-14 09:58:36'),
(34, 2, 118, '2015-12-14 19:33:04'),
(35, 2, 108, '2015-12-15 12:58:16'),
(36, 2, 107, '2015-12-15 13:03:56'),
(37, 2, 106, '2015-12-15 13:33:19'),
(38, 7, 118, '2015-12-17 10:07:02'),
(39, 7, 116, '2015-12-17 10:11:57'),
(40, 7, 115, '2015-12-17 10:18:21'),
(41, 7, 114, '2015-12-17 10:28:28'),
(42, 7, 113, '2015-12-17 10:35:11'),
(43, 7, 112, '2015-12-17 10:41:59'),
(44, 2, 119, '2015-12-17 16:45:22'),
(45, 2, 118, '2015-12-17 16:51:01'),
(46, 2, 116, '2015-12-17 16:55:40'),
(47, 7, 124, '2015-12-20 14:57:03'),
(48, 2, 128, '2015-12-22 11:57:03'),
(49, 2, 127, '2015-12-22 12:02:29'),
(50, 2, 126, '2015-12-22 12:08:24'),
(51, 2, 125, '2015-12-22 12:11:52'),
(52, 2, 124, '2015-12-22 12:17:13'),
(53, 2, 123, '2015-12-22 12:24:07'),
(54, 2, 121, '2015-12-22 12:28:59'),
(55, 2, 120, '2015-12-22 12:34:48'),
(56, 2, 119, '2015-12-22 12:40:42'),
(57, 2, 118, '2015-12-22 12:46:22'),
(58, 2, 128, '2015-12-30 14:30:44'),
(59, 25, 118, '2015-12-31 22:17:19'),
(60, 2, 118, '2016-01-05 06:48:27'),
(61, 34, 139, '2016-01-05 11:36:46');

-- --------------------------------------------------------

--
-- Structure de la vue `MODIFICATION TRACKS`
--
DROP TABLE IF EXISTS `MODIFICATION TRACKS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `MODIFICATION TRACKS` AS select `tracks`.`title` AS `title`,`tracks`.`description` AS `description`,`tracks`.`name` AS `name`,`tracks`.`tag` AS `tag`,`tracks`.`download` AS `download` from `tracks` where 1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blocked`
--
ALTER TABLE `blocked`
 ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chat`
--
ALTER TABLE `chat`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `downloads`
--
ALTER TABLE `downloads`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playlistentries`
--
ALTER TABLE `playlistentries`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Index pour la table `playlists`
--
ALTER TABLE `playlists`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `relations`
--
ALTER TABLE `relations`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `reports`
--
ALTER TABLE `reports`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `tracks`
--
ALTER TABLE `tracks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD UNIQUE KEY `id` (`idu`);

--
-- Index pour la table `views`
--
ALTER TABLE `views`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `blocked`
--
ALTER TABLE `blocked`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `chat`
--
ALTER TABLE `chat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `downloads`
--
ALTER TABLE `downloads`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `playlistentries`
--
ALTER TABLE `playlistentries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `playlists`
--
ALTER TABLE `playlists`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `relations`
--
ALTER TABLE `relations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT pour la table `reports`
--
ALTER TABLE `reports`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tracks`
--
ALTER TABLE `tracks`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `idu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `views`
--
ALTER TABLE `views`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
