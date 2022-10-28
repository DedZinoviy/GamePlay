-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: game_play_db
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `games`
--

USE `sql11528557`;

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `idgame` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `annotation` longtext,
  `release_date` date NOT NULL,
  `idstudio` int NOT NULL,
  `idpublisher` int NOT NULL,
  `idminimum` int DEFAULT NULL,
  `idrecommended` int DEFAULT NULL,
  PRIMARY KEY (`idgame`),
  KEY `film_title_idx` (`title`(191)),
  KEY `fk_from_studio_idx` (`idstudio`),
  KEY `fk_from_publisher_idx` (`idpublisher`),
  KEY `fk_from_minimum_idx` (`idminimum`),
  KEY `fk_from_recommened_idx` (`idrecommended`),
  CONSTRAINT `fk_from_minimum` FOREIGN KEY (`idminimum`) REFERENCES `requirements` (`idrequirement`),
  CONSTRAINT `fk_from_publisher` FOREIGN KEY (`idpublisher`) REFERENCES `studios` (`idstudio`),
  CONSTRAINT `fk_from_recommened` FOREIGN KEY (`idrecommended`) REFERENCES `requirements` (`idrequirement`),
  CONSTRAINT `fk_from_studios` FOREIGN KEY (`idstudio`) REFERENCES `studios` (`idstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=33843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `idgenre` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idgenre`),
  UNIQUE KEY `genres_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_to_games`
--

DROP TABLE IF EXISTS `genres_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_to_games` (
  `idgenre` int NOT NULL,
  `idgame` int NOT NULL,
  PRIMARY KEY (`idgenre`,`idgame`),
  KEY `fk_film_to_genre_idx` (`idgame`),
  CONSTRAINT `fk_film_to_genre` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`),
  CONSTRAINT `fk_genre_to_film` FOREIGN KEY (`idgenre`) REFERENCES `genres` (`idgenre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_to_games`
--

LOCK TABLES `genres_to_games` WRITE;
/*!40000 ALTER TABLE `genres_to_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `idimg` int NOT NULL AUTO_INCREMENT,
  `url` text CHARACTER SET latin1 NOT NULL,
  `idgame` int DEFAULT NULL,
  PRIMARY KEY (`idimg`) USING BTREE,
  KEY `idgames` (`idgame`),
  CONSTRAINT `fk_from_games_to_imgs` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `iduser` int NOT NULL,
  `date` datetime NOT NULL,
  `source` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_ver_users` (`iduser`),
  CONSTRAINT `fk_from_ver_users` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_log`
--

DROP TABLE IF EXISTS `password_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_log` (
  `idpassword_log` int NOT NULL AUTO_INCREMENT,
  `iduser` int DEFAULT NULL,
  `oldpassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpassword_log`),
  KEY `fk_password_log_to_user` (`iduser`),
  CONSTRAINT `fk_password_log_to_user` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_log`
--

LOCK TABLES `password_log` WRITE;
/*!40000 ALTER TABLE `password_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_to_game`
--

DROP TABLE IF EXISTS `platform_to_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_to_game` (
  `idplatform` int NOT NULL,
  `idgame` int NOT NULL,
  PRIMARY KEY (`idplatform`,`idgame`),
  KEY `fk_from_games_to_m_idx` (`idgame`),
  CONSTRAINT `fk_from_games_to_m` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`),
  CONSTRAINT `fk_from_platforms` FOREIGN KEY (`idplatform`) REFERENCES `platforms` (`idplatform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_to_game`
--

LOCK TABLES `platform_to_game` WRITE;
/*!40000 ALTER TABLE `platform_to_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform_to_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `idplatform` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idplatform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `iduser` int NOT NULL,
  `idgame` int NOT NULL,
  `plot` int NOT NULL,
  `gameplay` int NOT NULL,
  `graphics` int NOT NULL,
  `emotions` int NOT NULL,
  `comment` text,
  PRIMARY KEY (`idgame`,`iduser`),
  KEY `idfilm_idx` (`idgame`),
  KEY `iduser_idy` (`iduser`),
  CONSTRAINT `fk_film_to_rating` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`),
  CONSTRAINT `fk_user_to_rating` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `idrequirement` int NOT NULL,
  `os` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `processor` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `memory` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `graphics_card` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hdd_space` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idrequirement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `idshop` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `price` float DEFAULT NULL,
  `idgame` int NOT NULL,
  `source` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idshop`),
  KEY `fk_from_shops_idx` (`idgame`),
  CONSTRAINT `fk_from_shops` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studios`
--

DROP TABLE IF EXISTS `studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studios` (
  `idstudio` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `information` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studios`
--

LOCK TABLES `studios` WRITE;
/*!40000 ALTER TABLE `studios` DISABLE KEYS */;
/*!40000 ALTER TABLE `studios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_date` date DEFAULT '0001-01-01',
  `isVerificied` tinyint DEFAULT NULL,
  `avatar` text,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14155,'aboba','12345','abob.net','2009-09-09',0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 18:24:46
