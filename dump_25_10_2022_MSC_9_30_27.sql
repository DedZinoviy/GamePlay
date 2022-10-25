-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql11.freesqldatabase.com
-- Время создания: Окт 25 2022 г., 06:22
-- Версия сервера: 5.5.62-0ubuntu0.14.04.1
-- Версия PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sql11528557`
--



-- -----------------------------------------------------------------УКАЗАТЬ ТРЕБУЕМУЮ БД--------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `game_play_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `game_play_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `age_restrictions`
--

DROP TABLE IF EXISTS `age_restrictions`;
CREATE TABLE IF NOT EXISTS `age_restrictions` (
  `idage_restriction` int(11) NOT NULL AUTO_INCREMENT,
  `russion` enum('0+','6+','12+','16+','18+') DEFAULT NULL,
  `motion_picture` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`idage_restriction`),
  KEY `russion_idx` (`russion`)
) ENGINE=InnoDB AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `critic_review`
--

DROP TABLE IF EXISTS `critic_review`;
CREATE TABLE IF NOT EXISTS `critic_review` (
  `idcritic_review` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(45) NOT NULL,
  `sours` varchar(5000) NOT NULL,
  `idgame` int(11) NOT NULL,
  PRIMARY KEY (`idcritic_review`),
  KEY `idreview_to_film_idx` (`idgame`)
) ENGINE=InnoDB AUTO_INCREMENT=2010 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `idgame` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `annotation` varchar(200) DEFAULT NULL,
  `release_date` date NOT NULL,
  `idage_restriction` int(11) NOT NULL,
  PRIMARY KEY (`idgame`),
  KEY `fk_film_to_age_restriction_idx` (`idage_restriction`),
  KEY `film_title_idx` (`title`(191))
) ENGINE=InnoDB AUTO_INCREMENT=33843 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `idgenre` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idgenre`),
  UNIQUE KEY `genres_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `genres_to_games`
--

DROP TABLE IF EXISTS `genres_to_games`;
CREATE TABLE IF NOT EXISTS `genres_to_games` (
  `idgenre` int(11) NOT NULL,
  `idgame` int(11) NOT NULL,
  PRIMARY KEY (`idgenre`,`idgame`),
  KEY `fk_film_to_genre_idx` (`idgame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `contain_text` varchar(10000) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_ver_users` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `password_log`
--

DROP TABLE IF EXISTS `password_log`;
CREATE TABLE IF NOT EXISTS `password_log` (
  `idpassword_log` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `oldpassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpassword_log`),
  KEY `fk_password_log_to_user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `iduser` int(11) NOT NULL,
  `idgame` int(11) NOT NULL,
  `plot` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `actor_play` int(11) NOT NULL,
  `effects` int(11) NOT NULL,
  PRIMARY KEY (`idgame`,`iduser`),
  KEY `idfilm_idx` (`idgame`),
  KEY `iduser_idy` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `studios`
--

DROP TABLE IF EXISTS `studios`;
CREATE TABLE IF NOT EXISTS `studios` (
  `idstudio` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `information` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `studio_to_games`
--

DROP TABLE IF EXISTS `studio_to_games`;
CREATE TABLE IF NOT EXISTS `studio_to_games` (
  `idgame` int(11) NOT NULL,
  `idstudio` int(11) NOT NULL,
  PRIMARY KEY (`idgame`,`idstudio`),
  KEY `fk_studio_to_film_idx` (`idstudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `url`
--

DROP TABLE IF EXISTS `url`;
CREATE TABLE IF NOT EXISTS `url` (
  `idurl` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `idgames` int(11) NOT NULL,
  PRIMARY KEY (`idurl`) USING BTREE,
  KEY `idgames` (`idgames`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_date` date DEFAULT '0001-01-01',
  `isVerificied` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14156 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`iduser`, `login`, `password`, `email`, `birth_date`, `isVerificied`) VALUES
(14155, 'aboba', '12345', 'abob.net', '2009-09-09', 0);

--
-- Дамп данных таблицы `age_restrictions`
--
INSERT INTO `age_restrictions` (`idage_restriction`, `russion`, `motion_picture`) VALUES
(1, '12+', 'PG-13');

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`idgame`, `title`, `annotation`, `release_date`, `idage_restriction`) VALUES
(1, 'Dota 2', 'Дока 2 Трейд, резать топором 20 минут.', '2013-07-09', 1);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `critic_review`
--
ALTER TABLE `critic_review`
  ADD CONSTRAINT `fk_review_to_film` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`);

--
-- Ограничения внешнего ключа таблицы `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `fk_film_to_age_restriction` FOREIGN KEY (`idage_restriction`) REFERENCES `age_restrictions` (`idage_restriction`);

--
-- Ограничения внешнего ключа таблицы `genres_to_games`
--
ALTER TABLE `genres_to_games`
  ADD CONSTRAINT `fk_film_to_genre` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`),
  ADD CONSTRAINT `fk_genre_to_film` FOREIGN KEY (`idgenre`) REFERENCES `genres` (`idgenre`);

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_from_ver_users` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Ограничения внешнего ключа таблицы `password_log`
--
ALTER TABLE `password_log`
  ADD CONSTRAINT `fk_password_log_to_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Ограничения внешнего ключа таблицы `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `fk_film_to_rating` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`),
  ADD CONSTRAINT `fk_user_to_rating` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`);

--
-- Ограничения внешнего ключа таблицы `studio_to_games`
--
ALTER TABLE `studio_to_games`
  ADD CONSTRAINT `fk_film_to_studio` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`),
  ADD CONSTRAINT `fk_studio_to_film` FOREIGN KEY (`idstudio`) REFERENCES `studios` (`idstudio`);

--
-- Ограничения внешнего ключа таблицы `url`
--
ALTER TABLE `url`
  ADD CONSTRAINT `url_ibfk_1` FOREIGN KEY (`idgames`) REFERENCES `games` (`idgame`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
