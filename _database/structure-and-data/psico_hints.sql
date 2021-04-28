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
-- Table structure for table `hints`
--

DROP TABLE IF EXISTS `hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `hints` (
  `hint_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `hint` varchar(5000) DEFAULT NULL,
  `min_category_risk` decimal(10,0) DEFAULT NULL,
  `max_category_risk` decimal(10,0) DEFAULT NULL,
  `fk_category_id` int DEFAULT NULL,
  PRIMARY KEY (`hint_id`),
  KEY `rel_category_hint_idx` (`fk_category_id`),
  CONSTRAINT `rel_category_hint` FOREIGN KEY (`fk_category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hints`
--

LOCK TABLES `hints` WRITE;
/*!40000 ALTER TABLE `hints` DISABLE KEYS */;
INSERT INTO `hints` VALUES (1,'Posiblemente tú...','<ul><li>Estás intentando ser un predictor fatalista de tu futuro.</li><li>Tienes los pelos de punta por el trabajo, la salud y el dinero.</li><li>Estás tenso, no duermes lo suficiente, te duele la cabeza y no te concentras.</li></ul>',70,100,1),(2,'Posiblemente tú...','<ul><li>Te estás frenando por el miedo.</li><li>Estás creando un ambiente negativo.</li><li>Tienes la atención en las situaciones que están fuera de tu control y has olvidado aquellas en las que si puedes influir.</li></ul>',20,69,1),(3,'Técnicas','<ul><li>Hacer ejercicios de respiración y relajación.</li><li>Hacer ejercicio físico como trotar, caminar o bailar.</li><li>Realiza actividades de distracción como pintar, escuchar música o ver el paisaje.</li></ul>',70,100,1),(4,'Técnicas','<div>Desarrolla una personalidad resistente:</div><ol><li>Comprométete con nuevos hábitos y muévete a la acción.</li><li>Sé creativo para desarrollar un ambiente de crecimiento y motivación.</li><li>Mira las situaciones difíciles como un desafío y una oportunidad para crecer</li></ol><div>Que el miedo no te paralice:</div><ul><li>Tu vida continua, sigue adelante con tus proyectos.</li><li>Evita estar centrado en noticias o conversaciones negativas.</li><li>Comparte más momentos de alegría, aumenta la dosis de humor, anécdotas y recuerdos positivos.</li><li>Define un horario y una programación de actividades de acuerdo a tus prioridades y metas personales.</li></ul>',20,69,1),(5,'Pensamientos prácticos, ten en cuenta…','<ul><li>La preocupación rara vez consigue solucionar un problema.</li><li>La ansiedad te lleva a ver el mundo más peligroso de lo que realmente es.</li><li>La preocupación en exceso te paraliza y no te deja sacar lo mejor de ti.</li></ul>',70,100,1),(6,'Pensamientos prácticos, ten en cuenta…','<div>Si todo tiene que estar bien a nuestro alrededor para tener un poco de alegría entones somos esclavos de las circunstancias.</div>',20,69,1),(7,'Posiblemente tú...','<ul><li>Estás perdiendo el interés por hacer actividades que anteriormente disfrutabas.</li><li>Estás experimentando desánimo, culpa, fátiga y cansancio.</li><li>Tienes ganas de quedarte en casa y no hacer ninguna actividad.</li></ul>',69,100,2),(8,'Técnicas','<ul><li>Elaborar un horario para levantarte, acostarte y para las comidas, realiza programación de actividades diarias y semanales.</li><li>Hacer ejercicio físico como trotar, caminar o bailar.</li><li>Fortalecer tus vínculos con familiares y amigos.</li><li>Hacer una lista de actividades que disfrutes y dedica tiempo a cada una.</li><li>Escribir en un cuaderno las causas de tu desánimo, esto te ayudará a aceptar tus emociones.</li><li>Evitar bebidas alcohólicas.</li></ul>',69,100,2),(9,'Pensamientos prácticos, ten en cuenta...','<ul><li>Los pensamientos son los responsables de las emociones, cultiva pensamientos positivos y constructivos que te  ayuden a sentirte bien.</li><li>Trátate a ti mismo con amabilidad, siempre.</li><li>Quizá no te sientes lo suficientemente valorado por los demás, o por ti mismo. Empieza  reconociendo tus propios logros.</li><li>Céntrate en los «para qué» y no en los «porqués»  te ayudará a abrir nuevos horizontes y  a tomar mejores decisiones.</li></ul>',69,100,2),(10,'Posiblemente tú...','<ul><li>Sientes que falta armonía en algunas de tus áreas personales (emocional, social, familiar, económico, espiritual, laboral etc.)</li><li>Con frecuencia te importa la opinión que otros tienen acerca de ti.</li><li>Notas que con frecuencia tus reacciones son más emocionales que racionales</li><li>Necesites conocerte más, profundizar en descubrir tu propia forma de ser</li></ul>',80,100,3),(11,'Técnicas','<ul><li>No castigarte por cometer errores. Mira los errores como una manera de aprender para trabajar en mejorarlos.</li><li>No insistir en que las cosas siempre salen bien, no todo es color de rosa, los golpes pueden ser una buena oportunidad para crecer.</li><li>Disfrutar tanto del tiempo en soledad como del tiempo compartido.</li></ul>',80,100,3),(12,'Pensamientos prácticos, ten en cuenta...','<ul><li>Recuerda que tú no eres solo tus emociones, haz lo correcto por encima de tus deseos o impulsos emocionales.</li><li>Conocer la importancia que tiene vivir en el presente, superando y aceptando lo que sucedió.</li><li>Si actúas más y te quejas menos significa que estás creciendo emocionalmente.</li></ul>',80,100,3),(13,'Posiblemente tú...','<ul><li>Puedes estar experimentado miedo intenso a enloquecer o a morir.</li><li>Sientes que  tu corazón late más fuerte y no puedes respirar.</li><li>Estas evitando algunas situaciones por miedo a que te pase algo.</li><li>Estas teniendo dificultades para conciliar el sueño.</li></ul>',70,100,4),(14,'Posiblemente tú...','<ul><li>Te adelantas a imaginar lo que va a pasar y se te ocurren cosas negativas.</li><li>Te bloqueas y no terminas tus proyectos o actividades por miedo a que algo salga mal.</li><li>Estás experimentando falta de confianza en ti mismo y piensas que no eres capaz.</li></ul>',20,69,4),(15,'Técnicas','<ul><li>Reconocer que estás experimentando un miedo o malestar con mucha intensidad, teniendo presente que es temporal y en unos minutos pasará</li><li>Evita fumar, tomar o consumir productos con cafeína: esto puede incrementar la susceptibilidad a sentir miedo o pérdida del control</li><li>Controla tu respiración: empieza haciendo ejercicios de respiración frecuentemente</li><li>Técnica de 5, 4, 3, 2, 1 (5 cosas q ves a tu alrededor, 4 cosas q consigues tocar, 3 sonidos que detectas, 2 cosas q puedes oler, 1 cosa para saborear).</li></ul>',70,100,4),(16,'Técnicas','<ul><li>Trabajar en tu autoestima y sé compasivo contigo mismo.</li><li>Reconocer el miedo, habla de ello y expresa tus emociones.</li><li>Exponerte al estímulo temido por medio de la imaginación y en vivo. </li><li>Ser consciente del miedo, ponle nombre, permítete sentir su emoción y pregúntale por qué está ahí y que puedes hacer para que te sientas mejor.</li></ul>',20,69,4),(17,'Pensamientos prácticos, ten en cuenta...','<ul><li>Utiliza frases tranquilizadoras que te ayuden a pensar que todo está bien.</li><li>Recuerda que es un episodio breve y pronto pasará.</li><li>Si te concretas en la respiración pronto tendrás de nuevo el control</li></ul>',70,100,4),(18,'Pensamientos prácticos, ten en cuenta...','<ul><li>El miedo te aleja de la meta que quieres lograr.</li><li>Debes saber que el miedo nunca desaparecerá totalmente pero si puede ser regulado.</li><li>El miedo es una reacción afectiva que todos los seres humanos tenemos.</li></ul>',20,69,4),(19,'Posiblemente tú...','<ul><li>Estás liberando tu frustración y/o ansiedad actuando por impulsos.</li><li>Reaccionas descontroladamente frente a algunas situaciones.</li><li>Te expresas de manera inadecuada, utilizas la crítica, el rechazo, o la culpa contra ti u otras personas. A veces de manera no consciente.</li></ul>',80,100,5),(20,'Posiblemente tú...','<ul><li>Experimentas mal humor, te molestas fácilmente por aspectos insignificantes.</li><li>Vives tus emociones de manera muy intensa.</li><li>Te sientes más impaciente de lo habitual y poco tolerante a otras personas. </li></ul>',50,79,5),(21,'Técnicas','<ul><li>Detenerte frente al exceso de ira, porque en este momento empiezas a perder racionalidad y necesitas un tiempo fuera para serenarte. </li><li>Identificar la fuente de tu ira ¿qué es lo que te molesta? ¿De qué manera estás siendo amenazado? Y podrás identificar si la amenaza es real.</li><li>Verificar si tu ira es inadecuada o desproporcionada.</li></ul>',80,100,5),(22,'Técnicas','<ul><li>Realizar respiración diafragmática: respira al ritmo de 2-4-6 por diez veces. Inspira contando hasta 4, aguanta el aire contando hasta 2, y exhala por la boca contando hasta 6.</li><li>Pedir tiempo fuera: elige el momento oportuno para manifestar tus disgustos, evita que una conversación se vuelva en discusión. </li><li>Hacer ejercicio físico como trotar, caminar o bailar.</li><li>Tener tiempos de reflexión para que puedas tener mejores perspectivas de la realidad</li></ul>',50,79,5),(23,'Pensamientos prácticos, ten en cuenta...','<ul><li>Las personas no se alteran por los hechos, si no por lo que piensan acerca de los hechos.</li><li>Si estas sintiendo que pierdes el control de tus emociones es porque te sientes amenazado, pregúntate si la amenaza es real o imaginaria</li></ul>',80,100,5),(24,'Pensamientos prácticos, ten en cuenta...','<ul><li>Acepta aquello que no puedes cambiar.</li><li>Utiliza la razón para regular tus emociones, que ellas no tengan todo el control.</li><li>“Prevenir antes que curar”. Tú más que nadie debe saber en qué momentos o situaciones te enfadas más, aléjate a tiempo.</li></ul>',50,79,5),(25,'Posiblemente tú...','<ul><li>Te pones ansioso al enfrentarte a un nuevo problema y prefieres ignorarlo o te quedas dando vueltas en el mismo punto.</li><li>Niegas el malestar que te causa el estar al frente de una situación estresante.</li><li>Prefieres mostrar tu lado más fuerte hacia los demás.</li></ul>',80,100,6),(26,'Técnicas','<ul><li>Conéctate con tus emociones, permítete tiempos de conexión con aquellas emociones que a veces quisieras evitar. Llevar un diario es una excelente manera.</li><li>Fortalece tus relaciones sociales, se empático con quienes están a tu alrededor.</li><li>Permítete tener tiempos de desconexión, practicar actividades físicas y ocupar la mente en actividades de ocio que aumenten tus sonrisas.</li></ul>',80,100,6),(27,'Pensamientos prácticos, ten en cuenta...','<ul><li>No siempre tienes que ser la persona fuerte, también es válido pedir ayuda o un consejo.</li><li>Considera replantear la forma en la que estás  percibiendo la situación, tal vez piensas que es más seria o delicada de lo que realmente es.</li></ul>',80,100,6);
/*!40000 ALTER TABLE `hints` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-26  0:05:15