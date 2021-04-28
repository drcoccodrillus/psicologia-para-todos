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
-- Table structure for table `rel_question_category`
--

DROP TABLE IF EXISTS `rel_question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `rel_question_category` (
  `rel_question_category_id` int NOT NULL AUTO_INCREMENT,
  `fk_question_id` int NOT NULL,
  `fk_category_id` int NOT NULL,
  `c_risk` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`rel_question_category_id`,`fk_question_id`,`fk_category_id`),
  KEY `rel_question_category_idx` (`fk_question_id`),
  KEY `rel_category_question_idx` (`fk_category_id`),
  CONSTRAINT `rel_category_question` FOREIGN KEY (`fk_category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `rel_question_category` FOREIGN KEY (`fk_question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_question_category`
--

LOCK TABLES `rel_question_category` WRITE;
/*!40000 ALTER TABLE `rel_question_category` DISABLE KEYS */;
INSERT INTO `rel_question_category` VALUES (1,2,1,70),(2,4,1,10),(3,6,1,20),(4,3,2,30),(5,6,2,40),(6,11,2,30),(7,10,3,100),(8,7,4,70),(9,8,4,30),(10,5,5,100),(11,9,6,100);
/*!40000 ALTER TABLE `rel_question_category` ENABLE KEYS */;
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
