-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: psico
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `combinations`
--

DROP TABLE IF EXISTS `combinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `combinations` (
  `combination_id` int NOT NULL AUTO_INCREMENT,
  `a` tinyint NOT NULL,
  `b` tinyint NOT NULL,
  `c` tinyint NOT NULL,
  `d` tinyint NOT NULL,
  `cr_risk` decimal(10,0) DEFAULT NULL,
  `fk_question_id` int DEFAULT NULL,
  PRIMARY KEY (`combination_id`),
  KEY `rel_question_combination_idx` (`fk_question_id`),
  CONSTRAINT `rel_question_combination` FOREIGN KEY (`fk_question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combinations`
--

LOCK TABLES `combinations` WRITE;
/*!40000 ALTER TABLE `combinations` DISABLE KEYS */;
INSERT INTO `combinations` VALUES (1,1,0,0,0,50,1),(2,0,1,0,0,80,1),(3,0,0,1,0,50,1),(4,0,0,0,1,50,1),(5,0,1,1,0,100,1),(6,1,0,0,0,80,2),(7,0,1,0,0,80,2),(8,0,0,1,0,80,2),(9,0,0,0,1,0,2),(10,1,1,1,0,100,2),(11,1,1,0,0,80,2),(12,0,1,1,0,80,2),(13,1,0,0,0,100,3),(14,0,1,0,0,50,3),(15,0,0,1,0,0,3),(16,0,0,0,1,0,3),(17,0,0,1,1,0,3),(18,1,0,0,0,100,4),(19,0,1,0,0,80,4),(20,0,0,1,0,50,4),(21,0,0,0,1,0,4),(22,1,1,0,0,100,4),(23,1,0,0,0,100,5),(24,0,1,0,0,80,5),(25,0,0,1,0,50,5),(26,0,0,0,1,0,5),(27,1,1,0,0,100,5),(28,1,0,0,0,80,6),(29,0,1,0,0,80,6),(30,0,0,1,0,80,6),(31,0,0,0,1,0,6),(32,1,1,1,0,100,6),(33,1,1,0,0,80,6),(34,0,1,1,0,80,6),(35,1,0,0,0,80,7),(36,0,1,0,0,80,7),(37,0,0,1,0,80,7),(38,0,0,0,1,0,7),(39,1,1,1,1,100,7),(40,1,1,1,0,100,7),(41,0,1,1,1,80,7),(42,1,0,1,1,80,7),(43,1,1,0,1,80,7),(44,1,1,0,0,80,7),(45,0,1,1,0,80,7),(46,0,0,1,1,30,7),(47,1,0,0,1,60,7),(48,1,0,0,0,80,8),(49,0,1,0,0,80,8),(50,0,0,1,0,80,8),(51,0,0,0,1,0,8),(52,1,1,1,0,100,8),(53,1,1,0,0,80,8),(54,0,1,1,0,80,8),(55,1,0,1,0,80,8),(56,1,0,0,0,80,9),(57,0,1,0,0,80,9),(58,0,0,1,0,80,9),(59,0,0,0,1,50,9),(60,1,1,1,0,100,9),(61,1,1,0,0,80,9),(62,0,1,1,0,80,9),(63,1,0,1,0,80,9),(64,1,0,0,1,30,9),(65,1,0,0,0,100,10),(66,0,1,0,0,100,10),(67,0,0,1,0,80,10),(68,0,0,0,1,0,10),(69,1,1,1,0,100,10),(70,1,1,0,0,80,10),(71,0,1,1,0,80,10),(72,1,0,1,0,80,10),(73,1,0,0,0,80,11),(74,0,1,0,0,80,11),(75,0,0,1,0,80,11),(76,0,0,0,1,0,11),(77,1,1,0,0,100,11),(78,1,0,0,0,100,12),(79,0,1,0,0,80,12),(80,0,0,1,0,50,12),(81,0,0,0,1,0,12),(82,0,1,1,0,80,12),(83,0,1,0,1,80,12),(84,1,0,0,0,0,13),(85,0,1,0,0,0,13),(86,0,0,1,0,0,13),(87,0,0,0,1,0,13),(88,1,1,1,0,100,13),(89,1,1,0,0,50,13),(90,1,0,1,0,50,13),(91,1,0,0,0,0,14),(92,0,1,0,0,0,14),(93,0,0,1,0,0,14),(94,0,0,0,1,0,14),(95,1,1,1,1,0,14),(96,1,1,1,0,0,14),(97,1,1,0,0,0,14),(98,0,1,1,0,0,14),(99,0,0,1,1,0,14),(100,0,1,0,1,0,14),(101,1,0,0,1,0,14);
/*!40000 ALTER TABLE `combinations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-26  0:05:14
