-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: tema
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `albume`
--

DROP TABLE IF EXISTS `albume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albume` (
  `idalbum` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `tip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albume`
--

LOCK TABLES `albume` WRITE;
/*!40000 ALTER TABLE `albume` DISABLE KEYS */;
INSERT INTO `albume` VALUES (5,'At Last!','album de studio'),(6,'LSD','album de studio'),(7,'Glee: The Graduation','coloana sonora'),(8,'Dancing Queen','album tribut'),(9,'New Jersey','album de studio'),(10,'Dawn of the Black Hearts','album live'),(11,'Blood on the Dance Floor','album remixat'),(12,'Trio','album de studio'),(13,'Aida','compilatie');
/*!40000 ALTER TABLE `albume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artisti`
--

DROP TABLE IF EXISTS `artisti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artisti` (
  `idartist` bigint unsigned NOT NULL AUTO_INCREMENT,
  `idalbum` bigint unsigned DEFAULT NULL,
  `idgen` bigint unsigned DEFAULT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `data_lansare` varchar(45) DEFAULT NULL,
  `trupa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idartist`),
  KEY `fk_artisti_1_idx` (`idalbum`),
  KEY `fk_artisti_2_idx` (`idgen`),
  CONSTRAINT `fk_artisti_1` FOREIGN KEY (`idalbum`) REFERENCES `albume` (`idalbum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artisti_2` FOREIGN KEY (`idgen`) REFERENCES `genurimuzicale` (`idgen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artisti`
--

LOCK TABLES `artisti` WRITE;
/*!40000 ALTER TABLE `artisti` DISABLE KEYS */;
INSERT INTO `artisti` VALUES (1,NULL,NULL,'Androne','Ionut','30.02.2000','BrailaKids'),(2,NULL,NULL,'Androne','Ionut','30.02.2000','BrailaKids'),(3,NULL,NULL,'Androne','Ionut','30.02.2000','BrailaKids'),(4,NULL,NULL,'Androne','bobo','30.02.2000','BrailaKids'),(5,NULL,NULL,'Androne','Ionut','30.02.2000','BrailaKids'),(6,NULL,NULL,'Androne','kuku','30.02.2000','BrailaAdl'),(7,NULL,NULL,'Androne','Ionut','30.02.2000','BrailaAdl'),(8,NULL,NULL,'Androne','kuku','30.02.2000','BrailaAdl'),(15,5,49,'James','Etta','1954','Nu face parte'),(16,12,56,'Parton','Dolly','1967','Nu face parte'),(17,7,52,'Monteith','Cory','2009','Glee'),(18,9,50,'Bryan','David','1984','Bon Jovi'),(19,12,56,'Ronstadt','Linda','1969','Nu face parte'),(20,11,52,'Jackson','Michael','1971','Nu face parte'),(21,9,50,'Bongiovi','John Francis','1983','Bon Jovi'),(22,8,52,'Sarkisian','Cherilyn','1965','Nu face parte'),(23,13,51,'Verdi','Giuseppe','1839','Nu face parte'),(24,6,52,'Furler','Sia','1990','Nu face parte');
/*!40000 ALTER TABLE `artisti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genurimuzicale`
--

DROP TABLE IF EXISTS `genurimuzicale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genurimuzicale` (
  `idgen` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `data_aparitie` varchar(45) DEFAULT NULL,
  `tip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgen`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genurimuzicale`
--

LOCK TABLES `genurimuzicale` WRITE;
/*!40000 ALTER TABLE `genurimuzicale` DISABLE KEYS */;
INSERT INTO `genurimuzicale` VALUES (49,'Jazz','Secolul XX','Modern'),(50,'Rock','Secolul XX - Secolul XXI','Modern'),(51,'Opera','Anul 1597','Vocal-Simfonic'),(52,'Pop','Secolul XX','Modern'),(53,'Colind','1400','Folcloric-Religios'),(54,'Concert','Secolul XVIII','Simfonic'),(55,'Disco','1970','Modern'),(56,'Country','Secolul XX','Modern');
/*!40000 ALTER TABLE `genurimuzicale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-01 19:04:42
