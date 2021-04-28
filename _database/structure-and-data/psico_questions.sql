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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(150) NOT NULL,
  `r_risk` decimal(10,0) DEFAULT NULL,
  `fk_survey_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `rel_survey_question_idx` (`fk_survey_id`),
  CONSTRAINT `rel_survey_question` FOREIGN KEY (`fk_survey_id`) REFERENCES `surveys` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'¿Ha recibido tratamiento psicológico o psiquiátrico?',9,1),(2,'Tengo miedo a',9,1),(3,'¿Cuál es mi actitud al realizar las tareas cotidianas?',8,1),(4,'Mi percepción del futuro es',10,1),(5,'¿Presenta conductas agresivas contra sí mismo o su entorno?',8,1),(6,'He notado disminución o aumento en la(s) siguiente(s) área(s)',10,1),(7,'Tengo sensaciones corporales como',10,1),(8,'Últimamente ',8,1),(9,'Frente a la adversidad',8,1),(10,'¿Cómo vivo mis emociones?',8,1),(11,'¿Dedica más tiempo de lo habitual a una o más actividades de ocio?',5,1),(12,' ¿Quisieras hacer alguna consulta particular con un especialista de salud mental?',7,1),(13,'El motivo de consulta está relacionado con',0,1),(14,'Desea dejar alguna observación adicional sobre su situación personal',0,1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
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
