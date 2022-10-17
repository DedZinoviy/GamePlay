CREATE DATABASE  IF NOT EXISTS `game_play_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `game_play_db`;
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
-- Table structure for table `age_restrictions`
--

DROP TABLE IF EXISTS `age_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_restrictions` (
  `idage_restriction` int NOT NULL AUTO_INCREMENT,
  `russion` enum('0+','6+','12+','16+','18+') DEFAULT NULL,
  `motion_picture` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`idage_restriction`),
  KEY `russion_idx` (`russion`)
) ENGINE=InnoDB AUTO_INCREMENT=2009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_restrictions`
--

LOCK TABLES `age_restrictions` WRITE;
/*!40000 ALTER TABLE `age_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `age_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `critic_review`
--

DROP TABLE IF EXISTS `critic_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `critic_review` (
  `idcritic_review` int NOT NULL AUTO_INCREMENT,
  `author` varchar(45) NOT NULL,
  `sours` varchar(5000) NOT NULL,
  `idgame` int NOT NULL,
  PRIMARY KEY (`idcritic_review`),
  KEY `idreview_to_film_idx` (`idgame`),
  CONSTRAINT `fk_review_to_film` FOREIGN KEY (`idgame`) REFERENCES `games` (`idfilm`)
) ENGINE=InnoDB AUTO_INCREMENT=2010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critic_review`
--

LOCK TABLES `critic_review` WRITE;
/*!40000 ALTER TABLE `critic_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `critic_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `idfilm` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `category` varchar(20) NOT NULL,
  `annotation` varchar(200) DEFAULT NULL,
  `release_date` date NOT NULL,
  `purchase_price` int NOT NULL,
  `rental_price` int NOT NULL,
  `rental_duration` int NOT NULL,
  `idage_restriction` int NOT NULL,
  PRIMARY KEY (`idfilm`),
  KEY `fk_film_to_age_restriction_idx` (`idage_restriction`),
  KEY `film_title_idx` (`title`),
  CONSTRAINT `fk_film_to_age_restriction` FOREIGN KEY (`idage_restriction`) REFERENCES `age_restrictions` (`idage_restriction`)
) ENGINE=InnoDB AUTO_INCREMENT=33843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  CONSTRAINT `fk_film_to_genre` FOREIGN KEY (`idgame`) REFERENCES `games` (`idfilm`),
  CONSTRAINT `fk_genre_to_film` FOREIGN KEY (`idgenre`) REFERENCES `genres` (`idgenre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_to_games`
--

LOCK TABLES `genres_to_games` WRITE;
/*!40000 ALTER TABLE `genres_to_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres_to_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `contain_text` varchar(10000) DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_ver_users` (`iduser`),
  CONSTRAINT `fk_from_ver_users` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_log`
--

LOCK TABLES `password_log` WRITE;
/*!40000 ALTER TABLE `password_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_log` ENABLE KEYS */;
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
  `action` int NOT NULL,
  `actor_play` int NOT NULL,
  `effects` int NOT NULL,
  PRIMARY KEY (`idgame`,`iduser`),
  KEY `idfilm_idx` (`idgame`),
  KEY `iduser_idy` (`iduser`),
  CONSTRAINT `fk_film_to_rating` FOREIGN KEY (`idgame`) REFERENCES `games` (`idfilm`),
  CONSTRAINT `fk_user_to_rating` FOREIGN KEY (`iduser`) REFERENCES `users` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio_to_games`
--

DROP TABLE IF EXISTS `studio_to_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio_to_games` (
  `idgame` int NOT NULL,
  `idstudio` int NOT NULL,
  PRIMARY KEY (`idgame`,`idstudio`),
  KEY `fk_studio_to_film_idx` (`idstudio`),
  CONSTRAINT `fk_film_to_studio` FOREIGN KEY (`idgame`) REFERENCES `games` (`idfilm`),
  CONSTRAINT `fk_studio_to_film` FOREIGN KEY (`idstudio`) REFERENCES `studios` (`idstudio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio_to_games`
--

LOCK TABLES `studio_to_games` WRITE;
/*!40000 ALTER TABLE `studio_to_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio_to_games` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2022-10-17  8:57:19
