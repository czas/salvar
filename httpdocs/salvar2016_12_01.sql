CREATE DATABASE  IF NOT EXISTS `salvar` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `salvar`;
-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: salvar
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `not_comentarios`
--

DROP TABLE IF EXISTS `not_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `not_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anonimoNombre` char(50) DEFAULT NULL,
  `anonimoEmail` char(50) DEFAULT NULL,
  `contenido` text,
  `fecha_publicacion` datetime DEFAULT NULL,
  `noticia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_comentarios`
--

LOCK TABLES `not_comentarios` WRITE;
/*!40000 ALTER TABLE `not_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_noticias`
--

DROP TABLE IF EXISTS `not_noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `not_noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) DEFAULT NULL,
  `subtitulo` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `contenido` text,
  `imagen` char(32) DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_noticias`
--

LOCK TABLES `not_noticias` WRITE;
/*!40000 ALTER TABLE `not_noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salv_categorias`
--

DROP TABLE IF EXISTS `salv_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salv_categorias` (
  `id` int(11) NOT NULL,
  `nombre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_categorias`
--

LOCK TABLES `salv_categorias` WRITE;
/*!40000 ALTER TABLE `salv_categorias` DISABLE KEYS */;
INSERT INTO `salv_categorias` VALUES (1,'AlevÃ­n'),(2,'Infantil'),(3,'Cadete'),(4,'Juvenil'),(5,'JÃºnior'),(6,'Absoluta');
/*!40000 ALTER TABLE `salv_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salv_nadador_prueba`
--

DROP TABLE IF EXISTS `salv_nadador_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salv_nadador_prueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nadadorId` int(11) DEFAULT NULL,
  `categoria_nadador` int(11) DEFAULT NULL,
  `pruebaId` int(11) DEFAULT NULL,
  `tiempo_nadador` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nadador_idx` (`nadadorId`),
  KEY `fk_prueba_idx` (`pruebaId`),
  CONSTRAINT `fk_nadador` FOREIGN KEY (`nadadorId`) REFERENCES `salv_nadadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prueba` FOREIGN KEY (`pruebaId`) REFERENCES `salv_pruebas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_nadador_prueba`
--

LOCK TABLES `salv_nadador_prueba` WRITE;
/*!40000 ALTER TABLE `salv_nadador_prueba` DISABLE KEYS */;
/*!40000 ALTER TABLE `salv_nadador_prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salv_nadadores`
--

DROP TABLE IF EXISTS `salv_nadadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salv_nadadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) DEFAULT NULL,
  `apellidos` char(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` bit(1) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `telefono` char(50) DEFAULT NULL,
  `foto` char(32) DEFAULT NULL,
  `descripcion` text,
  `categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_nadadores`
--

LOCK TABLES `salv_nadadores` WRITE;
/*!40000 ALTER TABLE `salv_nadadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `salv_nadadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salv_prueba_categoria`
--

DROP TABLE IF EXISTS `salv_prueba_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salv_prueba_categoria` (
  `id` int(11) NOT NULL,
  `pruebaId` int(11) DEFAULT NULL,
  `categoriaId` int(11) DEFAULT NULL,
  `tiempo_minima_masculina` time DEFAULT NULL,
  `tiempo_minima_femenina` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prueba_idx` (`pruebaId`),
  KEY `fk_categoria_idx` (`categoriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_prueba_categoria`
--

LOCK TABLES `salv_prueba_categoria` WRITE;
/*!40000 ALTER TABLE `salv_prueba_categoria` DISABLE KEYS */;
INSERT INTO `salv_prueba_categoria` VALUES (1,1,1,'00:00:00','00:00:00'),(2,1,2,'00:00:00','00:00:00'),(3,1,3,'00:00:00','00:00:00'),(4,1,4,'00:00:00','00:00:00'),(5,1,5,'00:00:00','00:00:00'),(6,1,6,'00:00:00','00:00:00'),(7,2,1,'00:00:00','00:00:00'),(8,2,2,'00:00:00','00:00:00'),(9,2,3,'00:00:00','00:00:00'),(10,2,4,'00:00:00','00:00:00'),(11,2,5,'00:00:00','00:00:00'),(12,2,6,'00:00:00','00:00:00'),(13,3,1,'00:00:00','00:00:00'),(14,3,2,'00:00:00','00:00:00'),(15,3,3,'00:00:00','00:00:00'),(16,3,4,'00:00:00','00:00:00'),(17,3,5,'00:00:00','00:00:00'),(18,3,6,'00:00:00','00:00:00'),(19,4,1,'00:00:00','00:00:00'),(20,4,2,'00:00:00','00:00:00'),(21,4,3,'00:00:00','00:00:00'),(22,4,4,'00:00:00','00:00:00'),(23,4,5,'00:00:00','00:00:00'),(24,4,6,'00:00:00','00:00:00'),(25,5,1,'00:00:00','00:00:00'),(26,5,2,'00:00:00','00:00:00'),(27,5,3,'00:00:00','00:00:00'),(28,5,4,'00:00:00','00:00:00'),(29,5,5,'00:00:00','00:00:00'),(30,5,6,'00:00:00','00:00:00'),(31,6,1,'00:00:00','00:00:00'),(32,6,2,'00:00:00','00:00:00'),(33,6,3,'00:00:00','00:00:00'),(34,6,4,'00:00:00','00:00:00'),(35,6,5,'00:00:00','00:00:00'),(36,6,6,'00:00:00','00:00:00'),(37,7,1,'00:00:00','00:00:00'),(38,7,2,'00:00:00','00:00:00'),(39,7,3,'00:00:00','00:00:00'),(40,7,4,'00:00:00','00:00:00'),(41,7,5,'00:00:00','00:00:00'),(42,7,6,'00:00:00','00:00:00'),(43,8,1,'00:00:00','00:00:00'),(44,8,2,'00:00:00','00:00:00'),(45,8,3,'00:00:00','00:00:00'),(46,8,4,'00:00:00','00:00:00'),(47,8,5,'00:00:00','00:00:00'),(48,8,6,'00:00:00','00:00:00'),(49,9,1,'00:00:00','00:00:00'),(50,9,2,'00:00:00','00:00:00'),(51,9,3,'00:00:00','00:00:00'),(52,9,4,'00:00:00','00:00:00'),(53,9,5,'00:00:00','00:00:00'),(54,9,6,'00:00:00','00:00:00');
/*!40000 ALTER TABLE `salv_prueba_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salv_pruebas`
--

DROP TABLE IF EXISTS `salv_pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salv_pruebas` (
  `id` int(11) NOT NULL,
  `nombreId` char(50) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `metros` int(11) DEFAULT NULL,
  `descripcion` text,
  `jornada` char(10) DEFAULT NULL,
  `tiempo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_pruebas`
--

LOCK TABLES `salv_pruebas` WRITE;
/*!40000 ALTER TABLE `salv_pruebas` DISABLE KEYS */;
INSERT INTO `salv_pruebas` VALUES (1,'obstaculos_200','NataciÃ³n con ObstÃ¡culos',200,'A la seÃ±al de salida, el competidor entra en el agua con un salto y nada el recorrido de 200m. pasando 8 veces por debajo de un obstÃ¡culo sumergido para finalizar tocando la pared de llegada de la piscina.','Invierno',''),(2,'socorrista_100','Socorrista',100,'A la seÃ±al de salida, el competidor entra en el agua con un salto y nada 50m estilo libre llevando aletas y tubo de rescate. DespuÃ©s de tocar la pared, el competidor asegura el tubo de rescate alrededor del maniquÃ­ y lo remolca con el tubo hasta el final. La prueba termina cuando el competidor toca la pared de llegada. ','Invierno',''),(3,'combinada_100','Combinada de Salvamento',100,'A la seÃ±al de salida, el participante entra en el agua con un salto y nada 50m estilo libre, gira, se sumerge y nada debajo del agua hasta el maniquÃ­ sumergido que estÃ¡ a 17,5m de la pared de viraje, durante estos metros el nadador no puede salir a coger aire. El participante saca a la superficie el maniquÃ­ dentro de la lÃ­nea de recogida de 5m, y entonces lo arrastra la distancia restante hasta la pared de llegada.','Invierno',''),(4,'superSoco_200','SÃºper Socorrista',200,'A la seÃ±al de salida, el competidor entra en el agua con un salto y nada 75m estilo libre para luego sumergirse y recoger un maniquÃ­ sumergido. El competidor saca el maniquÃ­ dentro de la lÃ­nea de recogida los 5m y lo arrastra hasta la pared de viraje. Toca la pared y suelta el maniquÃ­. En el agua, el competidor se coloca las aletas y el tubo de rescate y nada 50m estilo libre. DespuÃ©s de tocar la pared, el competidor asegura el tubo alrededor del maniquÃ­ dentro de la lÃ­nea de 5m desde la pared de viraje y lo remolca hasta tocar la pared de llegada.','Invierno',''),(5,'arrastre_50','Arrastre de ManiquÃ­',50,'A la seÃ±al de salida, el competidor entra en el agua con un salto y nada 25m estilo libre, entonces se sumerge para recoger un maniquÃ­ hundido y sacarlo a la superficie dentro de la lÃ­nea de los 5m de recogida. El competidor arrastra el maniquÃ­ hasta tocar la pared de llegada.','Invierno',''),(6,'arrastreAletas_100','Arrastre de ManiquÃ­ con Aletas',100,'A la seÃ±al de salida, el competidor entra en el agua con un salto y nada 50m estilo libre llevando aletas, recoge un maniquÃ­ hundido y lo saca a la superficie dentro de la lÃ­nea de los 10m de recogida. El competidor arrastra el maniquÃ­ hasta tocar la pared de llegada.','Invierno',''),(7,'relevo_Obs_4x50','Relevo Obstaculos (4x50)',200,'A la seÃ±al de salida, el primer competidor entra en el agua con un salto y nada 50m estilo libre pasando por debajo de dos obstÃ¡culos. Las postas se realizan una vez el competidor toque la pared.','Invierno',''),(8,'relevo_Combi_4x50','Relevo Combinada - Tubo de Rescate (4x50)',200,'A la seÃ±al de salida, el primer competidor entra en el agua con un salto y nada 50m estilo libre sin aletas. DespuÃ©s de que el primer competidor toque la pared, el segundo competidor salta y nada 50m estilo libre con aletas. Tras tocar la pared el segundo, el tercer competidor nada 50m estilo libre con tubo de rescate. El cuarto competidor estÃ¡ en el agua llevando aletas y con al menos una mano agarrada al borde, a la llegada del tercer competidor ambos competidores intercambian el arnÃ©s y el tercer competidor cogerÃ¡ el tubo de rescate con ambas manos mientras es remolcado 50m por el cuarto competidor hasta la llegada. La \'VÃ­ctima\' puede ayudar haciendo pies.','Invierno',''),(9,'relevo_Arrast_4x25','Relevo Arrastre de ManiquÃ­ (4x25)',100,'A la seÃ±al de salida, el primer competidos arrastra un maniquÃ­ 25m, dando el relevo al siguente competidor.','Invierno',''),(10,'lanzamientoCuerda','Lanzamiento de Cuerda',12,'Previamente al lanzamiento, la cuerda se encuentra sumergida en el agua y el competidor que se encuentra fuera de Ã©sta la tiene que recoger y lanzarla sin peso al miembro del equipo localizado en el agua aproximadamente a 12m de distancia y lo recoge mediante tracciÃ³n de la cuerda hasta la pared de llegada.','Invierno','\0'),(11,'sprint','Sprint',90,'Los competidores toman sus posiciones en sus calles asignadas. A la seÃ±al de salida, los competidores corren los 90 metros del recorrido hasta la lÃ­nea de llegada. La llegada es juzgada por el pecho del deportista cruzando la lÃ­nea de llegada. Los competidores deben terminar la prueba sobre sus pies en posiciÃ³n vertical.','Verano','\0'),(12,'banderas','Banderas',20,'Los competidores, se posicionaran tumbados boca abajo, con las manos una por encima de otra, con los dedos a la altura de las muÃ±ecas contrarias, el cuerpo recto, formando perpendicularidad con la lÃ­nea de salida y con los tobillos juntos, al comando de \"Cabezas abajo\", estos posaran la barbilla en las manos. Corren 20m para conseguir una bandera enterrada verticalmente en la arena. Siempre tiene que haber menos banderas que competidores, aquellos que no consigan bandera serÃ¡n eliminados.','Verano','\0'),(13,'correrNadarCorrer','Correr, nadar, correr',800,'A la seÃ±al de salida, el competidor corre 300m y llega al agua, el competidor nada unos 200m en un recorrido delimitado por boyas, vuelve a la arena para realizar otros 300m de correr para terminar entre dos banderas en la playa.','Verano','\0'),(14,'tabla','Carrera con Tabla',500,'Los competidores permanecen detrÃ¡s de la lÃ­nea de salida en la arena con sus tablas con 1,5m de separaciÃ³n entre cada uno. A la seÃ±al de salida, los competidores entran en el agua, lanzan sus tablas y reman el recorrido marcado por las boyas, vuelven a la playa y cruzan la lÃ­nea de llegada.','Verano','\0'),(15,'ski','Carrera con Ski',750,'Los competidores sujetan sus skies en lÃ­nea a la altura de la rodilla con una separaciÃ³n de 1,5m. A la seÃ±al de salida, los competidores palean con sus skies por el recorrido marcado por las boyas y vuelven para llegar a la lÃ­nea de llegada. PodrÃ¡ pasar con cualquier parte del ski, montado, agarrado o arrastrado.','Verano','\0'),(16,'ocean','OceanMan - OceanWoman',1400,'Los competidores cubren un recorrido de 1400m que incluye una posta de nataciÃ³n, una posta de tabla, una posta de ski y un sprint final.','Verano','\0'),(17,'relevo_tuboRescate','Relevo Salvamento con Tubo de Rescate',250,'Cuatro competidores de cada equipo participan en esta prueba: una vÃ­ctima, un nadador con tubo de rescate y dos socorristas. Los tubos de rescate y las aletas se colocan en la arena a 10m de la orilla en lÃ­nea con las boyas del recorrido. A la seÃ±al de salida las vÃ­ctimas nadan mar adentro hasta su boya asignada colocada a 120m de distancia. El Nadador con tubo de rescate toma su posiciÃ³n de salida en la lÃ­nea, alineado a la boya asignada y cara a la arena. Este saldrÃ¡ cuando su compaÃ±ero toque la boya, tendrÃ¡ que correr para acercarse a la orilla y colocarse las aletas y tubo de rescate para a continuaciÃ³n nadar hacia la vÃ­ctima. Cuando llege a la boya, debe pasarla por el lado izquierdo (mirando desde la playa) para asegurar el tubo a la vÃ­ctima que estÃ¡ esperando detrÃ¡s de la boya. Con la vÃ­ctima fijada al tubo, el segundo competidor remolcarÃ¡ a la vÃ­ctima hacia la playa. Mientras el nadador va a por su vÃ­ctima, el Juez de Salidas llamarÃ¡ a los dos socorristas restantes de cada equipo a la lÃ­nea de salida. DespuÃ©s de que el nadador haya empezado a remolcar a la vÃ­ctima hacia la playa, los dos socorristas a su discreciÃ³n, entran en el agua y ayudan al nadador a llevar a la vÃ­ctima a la playa. La vÃ­ctima debe ser arrastrada o cargada del agua a la llegada.','Verano','\0'),(18,'relevo_sprint','Relevo Sprint (4x90)',360,'Un equipo de cuatro competidores completan un relevo con testigo de manera que cubren 90m. de recorrido. Para empezar, 2 competidores toman su posiciÃ³n en su calle asignada en cada extremo del recorrido. DespuÃ©s de la salida cada competidor completa una posta del recorrido con un testigo agarrado con una mano y pasa el testigo al terminar la primera, segunda y tercera posta al siguiente corredor. Todos los competidores terminan su posta sobre sus pies y en posiciÃ³n vertical.','Verano','\0'),(19,'relevo_tabla','Relevo Rescate con Tabla',250,'En esta prueba, un miembro del equipo nada 120m a la boya asignada, seÃ±ala y espera a ser recogido por el segundo miembro del equipo con la tabla. Ambos reman a la orilla y cruzan la lÃ­nea de llegada en la arena con la tabla.','Verano','\0'),(20,'relevo_taplin','Relevo Taplin',1500,'Un equipo de 4 competidores (nado, tabla, ski y sprint) cubren el recorrido en una secuencia de postas determinadas por sorteo al comienzo de cada competiciÃ³n. La posta de sprint serÃ¡ siempre la Ãºltima.','Verano','\0');
/*!40000 ALTER TABLE `salv_pruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'salvar'
--

--
-- Dumping routines for database 'salvar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-01 21:32:48
