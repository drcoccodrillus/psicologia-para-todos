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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(150) DEFAULT NULL,
  `fk_question_id` int DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `rel_question_answer_idx` (`fk_question_id`),
  CONSTRAINT `rel_question_answer` FOREIGN KEY (`fk_question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Nunca lo he contemplado pero podría necesitarlo',1),(2,'Psiquiátrico',1),(3,'Psicólogico',1),(4,'No creo que pueda ayudarme',1),(5,'Morir',2),(6,'Perder el control',2),(7,'Enloquecer',2),(8,'Pocas cosas o ninguna',2),(9,'He perdido completamente el interés',3),(10,'Sí, me interesa pero me siento cansado y sin energías',3),(11,'Me intereso y disfruto realizando tareas cotidianas',3),(12,'Además de mis actividades, llevo a cabo otros proyectos',3),(13,'No creo que exista un futuro para mi',4),(14,'Creo que cada día va a empeorar',4),(15,'Soy consciente de la incertidumbre pero todavía no sé que hacer',4),(16,'Estoy haciendo planes para el futuro',4),(17,'Sí, contra mi mismo',5),(18,'Sí, contra los demás',5),(19,'No soy agresivo, pero me siento irritable',5),(20,'Nada fuera de lo habitual',5),(21,'Alimentación',6),(22,'Sueño',6),(23,'Estado de ánimo',6),(24,'Ninguna',6),(25,'Taquicardia',7),(26,'Falta de oxígeno',7),(27,'Tensión muscular',7),(28,'Otras o ninguna',7),(29,'Siento pánico con facilidad',8),(30,'Actúo por impulsos',8),(31,'No puedo concentrarme',8),(32,'Nada fuera de lo habitual',8),(33,'Me es difícil relajarme',9),(34,'Trato de ocultar mi malestar',9),(35,'Procuro no pensar en el problema',9),(36,'Intento ver los aspectos positivos del problema',9),(37,'No soy capaz de controlar mis emociones y actuo por impulsos',10),(38,'Lloro fácilmente',10),(39,'Cuando hay cambios de planes me enfado y me pongo nervioso',10),(40,'Rara vez me excedo',10),(41,'Sí, paso más de 5 horas en la misma actividad',11),(42,'Realizo otras actividades pero repito una en particular varias veces al día',11),(43,'No logro permanecer más de una hora en la misma actividad',11),(44,'Rara vez me excedo',11),(45,'Sí, definitivamente',12),(46,'En caso de ser sugerido lo contemplaría',12),(47,'Tengo dudas, no estoy seguro',12),(48,'No creo que sea necesario',12),(49,'Covid',13),(50,'Aislamiento social',13),(51,'No tiene relación con el Covid ni el aislamiento social',13),(52,'No deseo hacer consulta',13);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-26  0:05:13
