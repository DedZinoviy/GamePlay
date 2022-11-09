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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `idgame` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `annotation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `release_date` date NOT NULL,
  `idstudio` int NOT NULL,
  `idpublisher` int NOT NULL,
  `idminimum` int DEFAULT NULL,
  `idrecommended` int DEFAULT NULL,
  `idimg` int DEFAULT NULL,
  PRIMARY KEY (`idgame`),
  KEY `film_title_idx` (`title`(191)),
  KEY `fk_from_studio_idx` (`idstudio`),
  KEY `fk_from_publisher_idx` (`idpublisher`),
  KEY `fk_from_minimum_idx` (`idminimum`),
  KEY `fk_from_recommened_idx` (`idrecommended`),
  KEY `fk_from_img_to_game_idx` (`idimg`),
  CONSTRAINT `fk_from_img_to_game` FOREIGN KEY (`idimg`) REFERENCES `images` (`idimg`),
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
INSERT INTO `games` VALUES (1,'The Witcher 3: Wild Hunt','«Ведьмак 3: Дикая Охота» — компьютерная игра от третьего лица в жанре action/RPG. Игрок играет за Геральта из Ривии, охотника на чудовищ, работающего по заказу. В игре существует очень большое количество разных видов чудовищ; при создании этого бестиария использовались мифология разных стран, восточноевропейский фольклор и эзотерика.','2015-05-18',1,1,1,2,1),(2,'Read Dead Redemption 2','Red Dead Redemption 2 представляет собой игру в жанре action-adventure с открытым миром; игрок управляет одним персонажем с возможностью переключения камеры на вид от первого или от третьего лица по своему выбору. Игра включает в себя как однопользовательский, так и многопользовательский режимы — последний носит название Red Dead Online. На протяжении большей части сюжетной кампании однопользовательского режима игрок управляет персонажем по имени Артур Морган, членом банды Ван дер Линде; сюжетная кампания включает в себя ряд миссий — линейных сценариев с чётко поставленной целью в каждом, которые игрок должен выполнить последовательно. Вне миссий даётся возможность свободно путешествовать по обширному миру игры, самостоятельно находя интересные места и побочные задания. Игрок может вступать в сражения с врагами, используя как приёмы и оружие для рукопашного боя, так и разнообразное огнестрельное оружие и взрывчатку.','2018-10-26',2,3,3,4,4),(3,'The Elder Scrolls V: Skyrim','Skyrim сохраняет концепцию большого и открытого мира, характерную для серии The Elder Scrolls. Игрок может свободно странствовать по всей территории провинции Скайрим, включающей в себя девять крупных городов, множество мелких селений, а также обширные пространства диких земель и высоких гор. В городах игрок может предаваться таким занятиям, как приготовление пищи и зелий, зачарование предметов, фермерство, работа с рудой или кузнечное дело. При этом разработчики отмечали, что игровой процесс может занять около 500 часов.','2011-11-11',4,5,5,6,7),(4,'God Of War (2005)',' видеоигра с видом от третьего лица в жанре action-adventure, разработанная компанией SIE Santa Monica и изданная Sony Computer Entertainment. Это первая игра из одноимённой серии игр, она была выпущена 22 марта 2005 года для игровой приставки PlayStation 2.','2005-03-22',6,7,NULL,NULL,10),(5,'Minecraft',' компьютерная инди-игра в жанре песочницы, созданная шведским программистом Маркусом Перссоном и выпущенная его компанией Mojang AB.','2009-05-17',8,8,7,8,13),(6,'FIFA 22','FIFA 22 — новая часть серии футбольных симуляторов от канадской студии EA Sports. В продолжении вас ожидает обновленный сезон с реальной статистикой игроков, геймплейные нововведения и доработанные режимы с захватывающей сюжетной историей.','2021-10-01',9,10,9,10,16),(7,'Farming Simulator 22','Farming Simulator 22 — компьютерная игра в жанре симулятора фермера, разработанная студией Giants Software и выпущенная 22 ноября 2021 года. В игре присутствует больше 100 брендов и более 400 единиц сельскохозяйственной техники и инструментов, среди них — John Deere, New Holland, Deutz-Fahr, MAN и другие.','2021-11-22',11,11,11,12,22),(8,'Dota 2','Dota 2 — многопользовательская командная компьютерная игра в жанре MOBA, разработанная и изданная корпорацией Valve. Игра является продолжением DotA — пользовательской карты-модификации для игры Warcraft III: Reign of Chaos и дополнения к ней Warcraft III: The Frozen Throne. Игра изображает сражение на карте особого вида; в каждом матче участвуют две команды по пять игроков, управляющих «героями» — персонажами с различными наборами способностей и характеристиками. Для победы в матче команда должна уничтожить особый объект — «крепость» (он же «трон»), принадлежащий вражеской стороне, и защитить от уничтожения собственную «крепость». Dota 2 работает по модели free-to-play с элементами микроплатежей.','2013-07-09',12,12,13,14,19),(9,'Sid Meier\'s Civilization VI','Civilization VI является пошаговой стратегией, в которой одному или нескольким игрокам предстоит посоревноваться с ИИ-противниками в деле построения и развития собственной цивилизации, начав с маленького племени, постепенно расширяя свою империю с целью добиться господства над всей планетой. Эта цель может быть достигнута различными способами, в зависимости от условий победы. Игроки основывают города, расширяют их, различным образом улучшают, а также создают военных юнитов, предназначенных для разведки и атаки вражеских сил, постоянно следя за развитием технологий своей цивилизации и дипломатическими отношениями с другими.','2016-10-21',13,14,15,16,25),(10,'Counter-Strike: Global Offensive','Как и предыдущие игры серии, Counter-Strike: Global Offensive является трёхмерным многопользовательским шутером от первого лица, в котором игроки распределяются по двум командам и сражаются друг против друга. В игре представлены две команды: террористы и спецназ, а также содержит несколько многопользовательских режимов игры: обычный и соревновательный режим (разминирование бомбы, спасение заложников), королевская битва, военные игры (гонка вооружений, уничтожение объекта, перелётные снайперы), бой насмерть, зачистка, совместный налёт, напарники и страж. В первом сценарии игроки, играющие за команду террористов, должны заложить бомбу в одной из нескольких точек закладки, а спецназ — успешно её разминировать. Во втором сценарии игрокам из команды террористов необходимо не дать противоборствующей команде спасти заложников, которых они похитили.','2012-08-21',12,12,17,18,28),(11,'PlayerUnknown\'s Battlegrounds','PlayerUnknown’s Battlegrounds является экшн-игрой, в которой игроки в количестве до 100 человек сражаются в «королевской битве» (англ. Battle Royale), по типу крупномасштабной «last man standing» схватки в deathmatch режиме, где игроки воюют между собой, чтобы стать последним выжившим. Игроки могут выбирать, как войти в матч: в одиночку, в паре, в трио или отрядом из четырёх человек. В любом случае, последний человек или команда, оставшаяся в живых, выигрывает матч.','2017-03-23',15,15,19,20,31),(12,'Grand Theft Auto V','Действие игры происходит в вымышленном штате Сан-Андреас, прообразом которого послужила Южная Калифорния. Сюжет в однопользовательском режиме строится вокруг приключений троих грабителей, устраивающих всё более дерзкие ограбления и противостоящих как организованной преступности, так и правоохранительным ведомствам. В процессе игры игрок управляет выбранным персонажем в режиме от первого или от третьего лица; персонаж может свободно передвигаться по обширному миру игры как пешком, так и на автомобилях и других видах транспорта. Особенностью Grand Theft Auto V по сравнению с другими играми серии является возможность переключаться между персонажами в любой момент, как во время выполнения заданий, так и вне их.','2013-10-17',16,17,21,22,34),(13,'Dark Souls III','Действие игры происходит в Лотрике, на стыке владений повелителей пепла. Главному герою предстоит вернуть их на свои троны, чтобы впитать их силу и определить, наконец, роль Огня в будущем всего мира. Также продолжая предыдущие игры Souls, в сюжете мы играем за негорящую нежить, которой предстоит зажечь первородное пламя огня.','2016-03-24',18,19,23,24,37),(14,'Bloodborne','Действие игры начинается в охваченном эпидемией чумы вымышленном городе Ярнам, созданном в викторианско-готическом стиле. Игрок принимает управление за странника, который прибыл в город для излечения своей болезни, но стал так называемым «охотником» вследствие местного ритуала переливания крови.','2015-03-24',18,7,NULL,NULL,40),(15,'Ghost of Tsushima','Действие игры происходит в 1274 году, во время первого монгольского вторжения в Японию, когда остров Цусима был захвачен и разорён Монгольской империей. Главный герой, японский самурай по имени Дзин Сакай (англ. Jin Sakai), в одиночку даёт бой превосходящим силам монголов, опираясь на старые самурайские традиции и необычные методы борьбы. Предводитель монголов, Хотун-хан, описывается как «пугающе здравомыслящий убийца».','2020-07-17',20,7,NULL,NULL,43),(16,'Car Mechanic Simulator 21','Создайте собственную империю по обслуживанию автомобилей. Не бойтесь замарать руки в мире высоко реалистичного симулятора с тщательно проработанными деталями. Посетите аукционный дом, где можно покупать машины в разном состоянии.','2021-08-11',21,22,25,26,46),(17,'The Binding Of Isaac','Когда мать Исаака слышит голос Бога, требующего принесения жертвы в доказательство ее веры, Исаак бежит в подвал, но сталкивается там с толпами безумных врагов, своими потерянными братьями и сестрами, своими страхами и, наконец, с собственной матерью.','2011-09-28',23,23,27,27,49),(18,'God of War: Ragnarök','Сюжет игры, как и сюжет предыдущей игры серии, построен вокруг дальнейших приключений главных героев — Кратоса и его сына Атрея в мире скандинавской мифологии; действие игры разворачивается на территории древней Норвегии. Ожидается, что игра положит начало событиям Рагнарёка, которые приводят к гибели многих скандинавских богов и предполагаемому концу света.','2022-11-09',6,7,NULL,NULL,52),(19,'The Legend of Zelda: Breath of the Wild','Компьютерная игра в жанре action-adventure с открытым миром, разработанная и выпущенная японской компанией Nintendo для консолей Nintendo Switch и Wii U в 2017 году. Это девятнадцатая игра в серии The Legend of Zelda; её действие происходит в той же вымышленной стране Хайрул, что и в предыдущих играх серии, но долгое время спустя. Главный герой игры, Линк, пробуждается после столетнего сна; он должен бросить вызов Бедствию Ганону — злому существу, которое не раз угрожало Хайрулу на протяжении тысячелетий.','2017-03-03',24,25,NULL,NULL,55),(20,'Super Mario Bros.','Марио (или Луиджи) отправляется в путешествие по Грибному Королевству, чтобы найти принцессу Пич, которую Боузер заточил в своём за́мке. Во время путешествия он встречает таких врагов, как Гумба и Купа Трупа, и после схватки с Боузером в первых семи замках находит Тоада, который подсказывает, что Пич заточена в другом замке. В восьмом замке (уровень 8-4) Марио (или Луиджи) находит самого Боузера и сражается с ним. После этого он находит принцессу Пич. На этом этапе сюжет игры заканчивается.','1985-09-13',26,25,NULL,NULL,58);
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
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idgenre`),
  UNIQUE KEY `genres_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (2,'Action'),(3,'Adventure'),(13,'Battle Royal'),(8,'Free-2-Play'),(5,'Hack-&-Slash'),(16,'Indie'),(17,'Platform'),(1,'RPG'),(10,'Sandbox'),(12,'Shooter'),(6,'Simulation'),(14,'Soulslike'),(7,'Sports'),(15,'Stealth'),(9,'Strategy'),(11,'Survival'),(4,'Western');
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
INSERT INTO `genres_to_games` VALUES (1,1),(2,2),(3,2),(4,2),(1,3),(3,4),(5,4),(10,5),(11,5),(6,6),(7,6),(6,7),(2,8),(8,8),(9,8),(9,9),(2,10),(8,10),(12,10),(2,11),(12,11),(13,11),(2,12),(3,12),(14,13),(14,14),(2,15),(15,15),(6,16),(3,17),(12,17),(16,17),(3,18),(5,18),(2,19),(3,19),(17,20);
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
  `url` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idgame` int DEFAULT NULL,
  PRIMARY KEY (`idimg`) USING BTREE,
  KEY `idgames` (`idgame`),
  CONSTRAINT `fk_from_games_to_imgs` FOREIGN KEY (`idgame`) REFERENCES `games` (`idgame`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'http://gameplay.somee.com/imgs/TheWitcher3.jpeg',1),(2,'http://gameplay.somee.com/imgs/Witcher3Gameplay.jpeg',1),(3,'http://gameplay.somee.com/imgs/Griphon.jpeg',1),(4,'http://gameplay.somee.com/imgs/RDR2.jpeg',2),(5,'http://gameplay.somee.com/imgs/RDR2Cinematic.jpeg',2),(6,'http://gameplay.somee.com/imgs/RDR2Gameplay.jpeg',2),(7,'http://gameplay.somee.com/imgs/Skyrim.jpeg',3),(8,'http://gameplay.somee.com/imgs/TheElderScrollsVSkyrimGameplay.jpg',3),(9,'http://gameplay.somee.com/imgs/SkyrimOrk.jpeg',3),(10,'http://gameplay.somee.com/imgs/Gow.jpeg',4),(11,'http://gameplay.somee.com/imgs/God_of_War_gameplay.jpg',4),(12,'http://gameplay.somee.com/imgs/Kratos.jpeg',4),(13,'http://gameplay.somee.com/imgs/MC.jpeg',5),(14,'http://gameplay.somee.com/imgs/MCcreate.jpeg',5),(15,'http://gameplay.somee.com/imgs/MCgameplay.jpg',5),(16,'http://gameplay.somee.com/imgs/FIFA22.jpg',6),(17,'http://gameplay.somee.com/imgs/FIFA.jpeg',6),(18,'http://gameplay.somee.com/imgs/FIFAgp.jpg',6),(19,'http://gameplay.somee.com/imgs/Doka2.jpg',8),(20,'http://gameplay.somee.com/imgs/Doka.jpg',8),(21,'http://gameplay.somee.com/imgs/DokaGP.jpg',8),(22,'http://gameplay.somee.com/imgs/FS22.jpg',7),(23,'http://gameplay.somee.com/imgs/FS.jpeg',7),(24,'http://gameplay.somee.com/imgs/FS22GP.jpeg',7),(25,'http://gameplay.somee.com/imgs/CIVA.jpg',9),(26,'http://gameplay.somee.com/imgs/Civ.jpg',9),(27,'http://gameplay.somee.com/imgs/petr.jpeg',9),(28,'http://gameplay.somee.com/imgs/CSGO.jpg',10),(29,'http://gameplay.somee.com/imgs/csgoGP.jpg',10),(30,'http://gameplay.somee.com/imgs/CS.jpeg',10),(31,'http://gameplay.somee.com/imgs/PUBG.jpg',11),(32,'http://gameplay.somee.com/imgs/Pup.jpeg',11),(33,'http://gameplay.somee.com/imgs/pubgGP.jpg',11),(34,'http://gameplay.somee.com/imgs/GTA.jpg',12),(35,'http://gameplay.somee.com/imgs/gtaV.jpg',12),(36,'http://gameplay.somee.com/imgs/gtaGP.jpg',12),(37,'http://gameplay.somee.com/imgs/DS3.jpg',13),(38,'http://gameplay.somee.com/imgs/DS3_.jpg',13),(39,'http://gameplay.somee.com/imgs/ds3GP.jpg',13),(40,'http://gameplay.somee.com/imgs/BB.jpg',14),(41,'http://gameplay.somee.com/imgs/BludB.jpeg',14),(42,'http://gameplay.somee.com/imgs/bloodborne.jpg',14),(43,'http://gameplay.somee.com/imgs/GoT.jpg',15),(44,'http://gameplay.somee.com/imgs/GhOfTs.jpg',15),(45,'http://gameplay.somee.com/imgs/GoTGP.jpg',15),(46,'http://gameplay.somee.com/imgs/CMS21.jpg',16),(47,'http://gameplay.somee.com/imgs/CMS.jpg',16),(48,'http://gameplay.somee.com/imgs/CMSGP.jpg',16),(49,'http://gameplay.somee.com/imgs/BOI.jpg',17),(50,'http://gameplay.somee.com/imgs/BOIART.jpg',17),(51,'http://gameplay.somee.com/imgs/BOIGP.jpg',17),(52,'http://gameplay.somee.com/imgs/GoWRag.jpg',18),(53,'http://gameplay.somee.com/imgs/GoWRagART.jpg',18),(54,'http://gameplay.somee.com/imgs/GoWGP.jpeg',18),(55,'http://gameplay.somee.com/imgs/Zelda.jpg',19),(56,'http://gameplay.somee.com/imgs/LoZ.jpeg',19),(57,'http://gameplay.somee.com/imgs/LoZGP.jpg',19),(58,'http://gameplay.somee.com/imgs/SM.jpg',20),(59,'http://gameplay.somee.com/imgs/SMLOAD.jpg',20),(60,'http://gameplay.somee.com/imgs/SMGP.jpg',20);
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
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `iduser` int NOT NULL,
  `date` datetime NOT NULL,
  `source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  `oldpassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
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
INSERT INTO `platform_to_game` VALUES (4,1),(5,1),(8,1),(9,1),(10,1),(11,1),(4,2),(8,2),(10,2),(3,3),(4,3),(5,3),(7,3),(8,3),(9,3),(10,3),(11,3),(2,4),(3,4),(12,4),(3,5),(4,5),(7,5),(8,5),(10,5),(11,5),(12,5),(13,5),(14,5),(4,6),(5,6),(8,6),(9,6),(10,6),(11,6),(4,7),(5,7),(8,7),(9,7),(10,7),(14,7),(10,8),(13,8),(14,8),(4,9),(8,9),(10,9),(11,9),(13,9),(14,9),(3,10),(7,10),(10,10),(13,10),(14,10),(4,11),(8,11),(10,11),(3,12),(4,12),(5,12),(7,12),(8,12),(9,12),(10,12),(4,13),(8,13),(10,13),(4,14),(4,15),(5,15),(4,16),(5,16),(8,16),(9,16),(10,16),(10,17),(13,17),(14,17),(4,18),(5,18),(11,19),(15,20);
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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idplatform`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES (1,'Sony PlayStation'),(2,'Sony PlayStation 2'),(3,'Sony PlayStation 3'),(4,'Sony PlayStation 4'),(5,'Sony PlayStation 5'),(6,'Xbox'),(7,'Xbox 360'),(8,'Xbox One'),(9,'Xbox Series X/s'),(10,'Windows'),(11,'Nintendo Switch'),(12,'Sony PlayStation Vita'),(13,'Linux'),(14,'MacOS'),(15,'Nintendo Entertainment System');
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
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
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
INSERT INTO `ratings` VALUES (14156,1,5,5,5,5,'Puska!!!!'),(14155,2,5,5,5,5,NULL),(14155,3,2,2,2,2,NULL),(14156,3,4,5,4,5,NULL),(14155,4,3,5,2,4,NULL),(14155,7,5,5,5,5,NULL),(14155,14,1,1,1,1,'НЕТ НА ПК!!!!');
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
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `processor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `memory` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `graphics_card` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hdd_space` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idrequirement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (1,'64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10','Intel CPU Core i5-2500K 3.3GHz / AMD CPU Phenom II X4 940','6 GB','Nvidia GPU GeForce GTX 660 / AMD GPU Radeon HD 7870','35 GB'),(2,'64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10',' Intel CPU Core i7 3770 3.4 GHz / AMD CPU AMD FX-8350 4','8 GB','Nvidia GPU GeForce GTX 770 / AMD GPU Radeon R9 290','35 GB'),(3,'Windows 10 - обновление от апреля 2018 (v1803)','Intel® Core™ i5-2500K / AMD FX-6300','8 ГБ','NVIDIA GeForce GTX 770 2 ГБ / AMD Radeon R9 280 3 ГБ','150 ГБ'),(4,'Windows 10 - обновление от апреля 2018 (v1803)','Intel® Core™ i7-4770K / AMD Ryzen 5 1500X','12 ГБ','NVIDIA GeForce GTX 1060 6 ГБ / AMD Radeon RX 480 4 ГБ','150 ГБ'),(5,'Windows XP/Vista/7','Intel Core 2 Duo 2.0 Ghz / AMD Athlon 64 X2 4200+','2 Gb','nVidia GeForce 8800 / ATI Radeon HD 3850 с 512 Mb памяти','6 GB'),(6,'Windows XP/Vista/7','Intel Core 2 Quad 2.66 GHz / AMD Phenom II X4 2.8 GHz','4 Gb','nVidia GeForce GTX 260 / ATI Radeon HD 4890 с 1 Gb памяти','6 GB'),(7,'Windows XP','Intel Pentium 4 2.0 Ghz / AMD Athlon XP 2200+','1 Gb','Nvidia GeForce 8600 / ATI Radeon HD 2600 512 Mb ','1 Gb'),(8,'Windows 10','Intel Core i5-4690 3.5GHz / AMD A10-7800 APU 3.5 GHz или эквивалент','4 GB','GeForce 700 Series или AMD Radeon Rx 200 Series (excluding integrated chipsets) with OpenGL 4.5 256 MB','4 GB'),(9,'Windows 10 - 64-Bit','Intel Core i3-6100 @ 3.7GHz или AMD Athlon X4 880K @4GHz','8 GB','NVIDIA GTX 660 или AMD Radeon HD 7850 с 2 GB памяти','50 GB'),(10,'Windows 10 - 64-Bit','Intel i5-3550 @ 3.40GHz или AMD FX 8150 @ 3.6GHz','8 GB','NVIDIA GeForce GTX 670 или AMD Radeon R9 270X с 2 GB памяти','50 GB'),(11,'Windows 7 - 64-Bit','Intel Core i3-560 3.3GHz / AMD Phenom II X4 805','4 GB','AMD Radeon R7 360X или NVIDIA GeForce GTX 750 Ti с 2GB памяти','40 GB'),(12,'Windows 10 Home (x64)','Intel Core i5-5675C или AMD Ryzen 5 1600 или лучше','8 GB','GeForce GTX 1060 или Radeon RX 570 или лучше (min 6GB VRAM) с 6 GB памяти','40 GB'),(13,'Windows XP/Vista/7','4 @ 3.0 GHz / AMD Athlon 64 3200+','1 Gb','nVidia GeForce 6600 / ATI Radeon X800 с 128 Mb памяти','2.5 Gb'),(14,'Windows XP/Vista/7','Intel Core 2 Duo @ 2.4 GHz / AMD Athlon 64 X2 5000+','2 Gb','nVidia GeForce 7800 / ATI Radeon x1800 с 256 Mb памяти','2.5 Gb'),(15,'Windows 7/8.1/10 (x64)','Intel Core i3 с тактовой частотой 2.5 ГГц | AMD Phenom II с тактовой частотой 2.6 ГГц','4 ГБ','Nvidia 450 | AMD 5570 с 1 ГБ памяти','12 ГБ'),(16,'Windows 7/8.1/10 (x64)','Intel Core i5 с тактовой частотой 2.5 ГГц | AMD FX8350 с тактовой частотой 4 ГГц','8 ГБ','Nvidia 770 | AMD 7970 с 2 ГБ памяти','12 ГБ'),(17,'Windows XP/Vista/7','Intel Core 2 Duo @ 1.8 Ghz / AMD Athlon 64 X2 4000+','2 Gb','nVidia GeForce 8800 / ATI Radeon HD 2900 с 512 Mb памяти','7.6 Gb'),(18,'Windows XP/Vista/7','Intel Core 2 Duo @ 2.4 Ghz / AMD Phenom II X3 @ 2.4 GHz','3 Gb','nVidia GeForce GTX 480 / ATI Radeon HD 6970 с 1 Gb памяти','7.6 Gb'),(19,'64-bit Windows 7, Windows 8.1, Windows 10','Intel Core i3-4340 / AMD FX-6300','6 GB','nVidia GeForce GTX 660 / AMD Radeon HD 7850 с 2GB памяти','30 GB'),(20,'64-bit Windows 7, Windows 8.1, Windows 10','Intel Core i5-6600K / AMD Ryzen 5 1600','16 GB','nVidia GeForce GTX 1060 3GB / AMD Radeon RX 580 4GB с 3 GB (4 GB AMD) памяти','30 GB'),(21,'Windows Vista','Intel Core 2 Duo 2.4 Ghz / AMD Athlon 64 X2 5400+','2 Gb','nVidia GeForce 8800 / ATI Radeon HD 3870 с 512 Mb памяти','32 GB'),(22,'Windows Vista/7/8','Intel Core i5 2.8 GHz / AMD Phenom II X4 3.6 GHz','6 Gb','nVidia GeForce GTX 480 / ATI Radeon HD 6970 с 1 Gb памяти','32 GB'),(23,'Windows 7 SP1 64-bit, Windows 8.1 64-bit, Windows 10 64-bit','Intel Core i3-2100 с частотой 3,1 ГГц или AMD FX-6300 с частотой 3,5 ГГц','4 GB','Nvidia GeForce GTX 750 Ti | ATI Radeon HD 7950 с 2 ГБ памяти','25 GB'),(24,'Windows 7 SP1 64-bit, Windows 8.1 64-bit, Windows 10 64-bit','Intel Core i7-3770 с частотой 3,4 ГГц или AMD FX-8350 с частотой 4 ГГц','6 GB','Nvidia GeForce GTX 970 | ATI Radeon R9 с 4 ГБ памяти','25 GB'),(25,'Windows(64-bit) 8.1 / 10','Intel Core i5 4690 / AMD Ryzen 5 1500X','8 GB','NVidia GeForce GTX 760 2GB','35 GB'),(26,'Windows(64-bit) 8.1 / 10','Intel Core i5 6600K / AMD Ryzen 7 1700X','16 GB','NVidia GeForce GTX 1070 8GB','35 GB'),(27,'Windows XP, Vista, 7','с тактовой частотой 2,5 ГГц','1 ГБ','совместимая с Direct X9.0c','50 МБ');
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
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float DEFAULT NULL,
  `idgame` int NOT NULL,
  `source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
INSERT INTO `shops` VALUES (1,'Steam',499.99,1,'https://steamdb.info/app/292030/'),(2,'SteamBuy',599,3,'https://steambuy.com/steam/the-elder-scrolls-v-skyrim/');
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
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `information` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studios`
--

LOCK TABLES `studios` WRITE;
/*!40000 ALTER TABLE `studios` DISABLE KEYS */;
INSERT INTO `studios` VALUES (1,'CD Project Red',NULL),(2,'Rockstar Studios',NULL),(3,'Rockstar Games',NULL),(4,'Bethesda Game Studios',NULL),(5,'Bethesda Softworks',NULL),(6,'SCE Santa Monica Studio',NULL),(7,'Sony Computer Entertainment',NULL),(8,'Mojang Studios',NULL),(9,'EA Canada',NULL),(10,'Electronic Arts',NULL),(11,'Giants Software',NULL),(12,'Valve',NULL),(13,'Firaxis Games',NULL),(14,'2K Games',NULL),(15,'PUBG Corporation',NULL),(16,'Rockstar North',NULL),(17,'Take-Two Interactive',NULL),(18,'FromSoftware',NULL),(19,'Bandai Namco Intertainment',NULL),(20,'Sucker Punch Productions',NULL),(21,'Red Dot Games',NULL),(22,'PlayWay S. A.',NULL),(23,'Эдмунд Макмиллен',NULL),(24,'Nintendo EPD',NULL),(25,'Nintendo',NULL),(26,'Nintendo R&D4',NULL);
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
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birth_date` date DEFAULT '0001-01-01',
  `isVerificied` tinyint DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (14155,'aboba','12345','abob.net','2009-09-09',0,NULL),(14156,'dimon','222','dimon@Mail.com','0001-01-01',0,NULL),(14157,'dedzinoviy','dedperded','12345.ded','0001-01-01',0,NULL);
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

-- Dump completed on 2022-11-09 22:58:19
