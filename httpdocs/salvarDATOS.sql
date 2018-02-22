CREATE DATABASE  IF NOT EXISTS `salvar` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `salvar`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: salvar
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_noticias`
--

LOCK TABLES `not_noticias` WRITE;
/*!40000 ALTER TABLE `not_noticias` DISABLE KEYS */;
INSERT INTO `not_noticias` VALUES (1,'Salvamento Arteixo alcanza el centenar de deportistas','Centenar de deportistas en el Club SALVAR','Salvamento Arteixo (Salvar) supera el centenar de licencias en su segunda temporada y cuenta con representantes en todas las categorÃ­as, tanto masculinas como femeninas.','Salvamento Arteixo (Salvar) supera el centenar de licencias en su segunda temporada y cuenta con representantes en todas las categorÃ­as, tanto masculinas como femeninas. El club se consolida tras el aumento del nÃºmero de deportistas registrado en esta temporada. \"Es un hito para el club\", aseguran desde Salvar, que obtuvo muy buenos resultados en el campeonato espaÃ±ol absoluto que se celebrÃ³ en AlcorcÃ³n.','8e689c142ebfa8162fa85526cf03ffef','2016-12-01 20:36:39'),(2,'El Salvar de Arteixo, campeÃ³n gallego en la categorÃ­a absoluta','El Club NataciÃ³n Cerceda fue el vencedor global en el cÃ³mputo de las seis categorÃ­as','El club Salvar de Arteixo ganÃ³ el tÃ­tulo gallego de la categorÃ­a absoluta con 654 puntos por delante del PC Sanxenxo (525) y UMIA de Caldas (494). Arteixo consiguiÃ³ un total de veinte medallas.','El club Salvar de Arteixo ganÃ³ el tÃ­tulo gallego de la categorÃ­a absoluta con 654 puntos por delante del PC Sanxenxo (525) y UMIA de Caldas (494). En la clasificaciÃ³n general, que se realiza cogiendo los resultados de las seis categorÃ­as en disputa, el cuadro de Arteixo finalizÃ³ en cuarta posiciÃ³n con 1.069 puntos, por detrÃ¡s del Club NataciÃ³n Cerceda (1.465), Salvamento Sasa (1.448) y Umia (1.385).\n\nEn la prueba, el Arteixo consiguiÃ³ un total de veinte medallas (seis oros, siete platas y siete bronces), dos rÃ©cords gallegos absolutos (Raquel MartÃ­nez) y un rÃ©cord juvenil (Alba GÃ³mez). AdemÃ¡s de ellos, fue campeÃ³n gallego Sergio GonzÃ¡lez. Raquel MartÃ­nez se proclamÃ³ mejor deportista gallega, con dos rÃ©cords gallegos, seis medallas de oro y una de plata. Alba GÃ³mez fue oro en juvenil.','f06bc0289eb747d38cf8933196f3e049','2016-12-01 20:38:42'),(3,'El SALVAR acude a Salou','Juveniles y  juniors acuden a los campeonatos de EspaÃ±a.','Los juvenÃ­les y juniors del Club Salvamento Arteixo acuden a los campeonatos de EspaÃ±a en Salou (Tarragona) con esperanzas de ganas medallas.','Aida Yaez, XÃ­an PÃ©rez, Angel Couceiro, Joel Carro, Santi Blanco, Pablo MartÃ­nez y Borja Canedo serÃ¡n los representantes de Arteixo.\nCompetirÃ¡n en las pruebas de sprint playa, banderas, rescate con tabla, carrera con tabla, correr nadar correr, relevo tubo y taplÃ­n. Aguardando que disfruten competiendo y que tengan muchas alegrÃ­as.','15736476f9ffe7d56f8d06f77eeabc63','2016-12-01 20:44:32'),(4,'Club Salvamento Arteixo (SALVAR) con cinco medallas en el campeonato de EspaÃ±a','Cinco medallas (dos platas y tres bronces) en el campeonato de EspaÃ±a de Salvamento AcuÃ¡tico.','Las medallas fueron obtenidas en el campeonato de EspaÃ±a  en Torrevieja, dÃ³nde pudieron participar nadadores juveniles, juniors y absoludos. Gran resultado para los integrantes del club.','Tres rÃ©cords gallegos en relevos, 4Âº en la clasificaciÃ³n absoluta femenina y 7Âº en la clasificaciÃ³n conjunta absoluta.\n\nDos platas y tres bronces.\n- Raquel MartÃ­nez, PLATA en 200M ObstÃ¡culos y 4Âª 100M Combinada.\n\n- El relevo femenino integrado por Peny MartÃ­nez, MarÃ­a Gallardo, MirÃ­am Crespo y Raquel MartÃ­nez, PLATA en 4x25M Remolque ManiquÃ­ y RECORD GALLEGO, BRONCE en 4x50M ObstÃ¡culos y RECORD GALLEGO y 4x50 Relevo Combinada y RECORD GALLEGO.\n\n- MirÃ­am Crespo y MarÃ­a Gallardo, BRONCE en Relevo Cuerda.\n\nUn balance mÃ¡s que positivo, en un campeonato dÃ³nde destacÃ³ la alta participaciÃ³n con mÃ¡s de 400 socorristas, dÃ³nde sobresalieron nuestras absolutas femeninas con tres records gallegos en los relevos, y una cuarta posiciÃ³n por equipos.\n\nRaquel MartÃ­nez con un subcampeonato en 200M ObstÃ¡culos muy cerca de la primera clasificada, y en la prueba de 100M Combinada dejando muy buenas sensaciones para la participaciÃ³n en el Open Internacional que se va a celebrar en Madrid el 31 de Abril y 1 de Mayo.\nDestacar nuestra juvenil Nicole, los jÃºniors XÃ­an y Borja y el absoluto  Manu por conseguir sus objetivos al participar en este campeonato.','720a9a8e7a1e60fcae4cd24054af0837','2016-12-01 21:01:47'),(5,'Cena anual del Club Salvamento Arteixo','Gran participaciÃ³n con mÃ¡s de 130 asistentes, entre ellos el alcalde de Arteixo.','El club Salvamento Arteixo (SALVAR) celebrÃ³ su primera cena anual con una gran participaciÃ³n de mÃ¡s de 130 asistentes, entre ellos el alcalde de Arteixo, Carlos Calvelo y la presidenta de la FederaciÃ³n de Salvamento de Galicia, Nuria Rodriguez.','El club Salvamento Arteixo (SALVAR) celebrÃ³ su primera cena anual con una gran participaciÃ³n de mÃ¡s de 130 asistentes, entre ellos el alcalde de Arteixo, Carlos Calvelo y la presidenta de la FederaciÃ³n de Salvamento de Galicia, Nuria Rodriguez.\nCon unn gran ambiente por parte de los padres, deportistas y amigos se hicieron entrega de los premiados de la temporada pasada, asÃ­ como a los deportistas que empezaron en el club en el aÃ±o 2008 y que aÃºn continuan.\nMejores deportistas: Raquel Martinez, Borja Canedo, XÃ­an Perez, Manauel MuiÃ±o, Xulia DomÃ­nguez, Ivan Bello y Manuel MartÃ­n.\nDeportistas con mayor trayectoria en el club: Samuel Martin, Pablo VÃ¡zquez, Andrea Garcia y Francisco Velo.','9f19bbea887c6925267c490fe5cf28b2','2016-12-01 21:09:15'),(6,'El Club Salvamento Arteixo consigue el tercer puesto en el Gallego Absoluto','Ã‰xito de participaciÃ³n en el Campeonato Gallego Absoluto de Salvamento y Socorrismo en Augas Abiertas celebrado en la Playa de SabÃ³n.','Un total de casi 150 socorristas se dieron cita el pasado fin de semana en el arenal situado en el Concello de Arteixo para competir en la definitiva prueba del calendario autonÃ³mico. Los deportistas locales del Club Salvamento Arteixo (SALVAR) conseguieron la tercera posiciÃ³n en la clasificaciÃ³n general del campeonato.','Ã‰xito de participaciÃ³n en el Campeonato Gallego Absoluto de Salvamento y Socorrismo en Augas Abiertas celebrado en la Playa de SabÃ³n. Un total de casi 150 socorristas se dieron cita el pasado fin de semana en el arenal situado en el Concello de Arteixo para competir en la definitiva prueba del calendario autonÃ³mico. Los deportistas locales del Club Salvamento Arteixo (SALVAR) conseguieron la tercera posiciÃ³n en la clasificaciÃ³n general del campeonato, por detrÃ¡s del Club AcuÃ¡tico UMIA y del Salvamento Sada (SASA). El campeonato contÃ³ con el atractivo de celebrar la final de unas de sus pruebas mÃ¡s competidas, la de banderas, por la noche. En esta ocasiÃ³n 36 socorristas entre las categorÃ­as masculina y feminina se disputaron el oro con la puesta de sol como protagonista. Se registrÃ³ un buen ambiente de competiciÃ³n durante el transcurso de las pruebas, para las cuales se contÃ³ con el apoyo del servicio de ProtecciÃ³n Civil del Concello de Arteixo y de la FederaciÃ³n de Salvamento y Socorrismo de Galicia.\n \nDel Club Salvamento Arteixo (SALVAR) a nivel individual destacaron:\n- AIDA YAÃ‘EZ: Campeona gallega en Sprint Playa y campeona en Banderas (cat. femenina).\n- RAQUEL MARTÃNEZ: Campeona gallega en Nadar Surf (cat. femenina).\n- MANUEL REGUEIRO: CampeÃ³n gallego en Nadar Surf (cat. masculina).\n\nA nivel de equipos destacaron:\n- Subcampeones gallegos en el relevo con Tubo de Rescate (cat. masculina): VICTOR PAZ, MANUEL REGUEIRO, MANUEL MARTIN y PABLO DE LA FUENTE.\n- Subcampeones gallegos en relevo Sprint Playa (cat. masculina): ANGEL COUCEIRO, ADRIÃN MARTÃNEZ, JOEL CARRO y MARTÃN NAYA.','89bdf8e407f5d58a6ed7a1fe9d67f7ac','2016-12-01 21:21:02'),(7,' Manuel Regueiro, del Salvar, debuta hoy en el Mundial','El Campeonato del Mundo se estÃ¡ celebrando en los PaÃ­ses Bajos.','Manu competirÃ¡ en categorÃ­a absoluta en las pruebas de nadar surf, tabla y oceanman, en los PaÃ­ses Bajos dÃ³nde se estÃ¡ celebrando el Campeonato del Mundo de Salvamento.','Manuel Regueiro, deportista del Club Salvamento Arteixo, debutarÃ¡ hoy en el Campeonato del Mundo que se estÃ¡ celebrando en los PaÃ­ses Bajos. Manu competirÃ¡ en categorÃ­a absoluta en las pruebas de nadar surf, tabla y oceanman. Los jÃºniores Ãngel Couceiro y Aida YÃ¡Ã±ez entrarÃ¡n en acciÃ³n el viernes y el sÃ¡bado en esprint playa y banderas.','67719bc500247af4b46a6411575e1fb7','2016-12-01 21:28:18'),(8,'Vecinos reciben a los socorristas del Salvar Arteixo tras los Mundiales','Vecinos y representantes del Concello recibieron a los miembros del Salvar de Arteixo que han participado en el Campeonato del Mundo de Salvamento.','Carlos Calvelo felicitÃ³ a los competidores Aida YÃ¡Ã±ez, que quedÃ³ subcampeona y a Ãngel Couceiro que logrÃ³ una medalla de bronce en ls playa de Noordwijk, en Holanda.','Vecinos y representantes del Concello recibieron a los miembros del Salvar de Arteixo que han participado en el Campeonato del Mundo de Salvamento celebrado en una playa de Noordwijk, en Holanda. Hasta el lugar tambiÃ©n se acercÃ³ el alcalde, Carlos Calvelo, para felicitarlos. En el campeonato destacÃ³ la actuaciÃ³n de Aida YÃ¡Ã±ez, que quedÃ³ subcampeona. Otro de los integrantes del equipo, Ãngel Couceiro, logrÃ³ una medalla de bronce. Los dos participaron en la prueba de banderas en categorÃ­a junior.','75b335eb0c90afd917a6896c59e21c7d','2016-12-01 21:33:16'),(9,' Arteixo, protagonista de la Gala del Deporte Base de A CoruÃ±a','El centro cÃ­vico arteixÃ¡n acogerÃ¡ el evento hoy a las 20.30 horas','El evento se ha convertido, con el paso del tiempo, en una de las citas anuales en las que se reconoce el buen hacer de los deportistas coruÃ±eses del futuro y, al mismo tiempo, se galardona a las entidades y organizaciones que han contribuido al desarrollo del deporte base coruÃ±Ã©s.','El centro cÃ­vico de Arteixo acogerÃ¡ a las ocho y media de esta noche la cuarta ediciÃ³n de la Gala de Deporte Base de A CoruÃ±a que organizarÃ¡n conjuntamente el ayuntamiento arteixÃ¡n y la entidad Ãurea 5.\n\nEl evento se ha convertido, con el paso del tiempo, en una de las citas anuales en las que se reconoce el buen hacer de los deportistas coruÃ±eses del futuro y, al mismo tiempo, se galardona a las entidades y organizaciones que han contribuido al desarrollo del deporte base coruÃ±Ã©s.\n\nEn este sentido, tanto el Concello de Arteixo como Ãurea 5 se han dispuesto premiar tanto a las individualidades (como el mejor deportista masculino y femenino), como acciones (el trabajo de base, la mejor labor solidaria o el apoyo del deporte base) e instituciones.\n\nLos galardones al mejor deportista masculino y femenino han recaÃ­do en Ãngel Couceiro y AÃ­da YÃ¡Ã±ez, que en este aÃ±o se proclamaron subcampeones del mundo de categorÃ­a jÃºnior en salvamento deportivo. Ambos pertenecen al Salvar de Arteixo.\n\nEl reconocimiento a la mejor acciÃ³n solidaria serÃ¡ otorgada al club Luz Verde de Arteixo. El PatÃ­n Axel serÃ¡ distinguido, en la gala que se celebrarÃ¡ hoy en el centro cÃ­vico, con el premio al mejor Desarrollo del Deporte Base.\n\nEl propio Concello de Arteixo recogerÃ¡ un reconocimiento a la Mejor PromociÃ³n del Deporte Base por la iniciativa que anualmente impulsa en referencia al DÃ­a do Deporte na RÃºa. TambiÃ©n serÃ¡ premiada la FundaciÃ³n Abrente, que desarrolla su actividad en el municipio de Arteixo a travÃ©s de un programa deportivo dedicado a personas discapacitadas.\n\nAdemÃ¡s, fueron premiados el BÃ¡squet CoruÃ±a (Mejor Club de Base Masculino), Ximnasia CoruÃ±a (Mejor Club de Base Femenino), Voleibol Zalaeta (Trabajo de FormaciÃ³n) y el Programa Xogade de la Xunta (Apoyo del Deporte Base).\n\nPresentarÃ¡ la gala Beatriz Franco, periodista de Radio Voz, y los premios estÃ¡n elaborados por la AsociaciÃ³n Pro Enfermos Mentales de A CoruÃ±a (APEM).','505a978525ee5baeae3df9ed068a72c1','2016-12-01 21:35:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_nadador_prueba`
--

LOCK TABLES `salv_nadador_prueba` WRITE;
/*!40000 ALTER TABLE `salv_nadador_prueba` DISABLE KEYS */;
INSERT INTO `salv_nadador_prueba` VALUES (27,11,6,1,'02:33:14'),(29,10,6,1,'02:36:18'),(30,12,6,1,'02:59:03'),(31,8,6,1,'02:48:19'),(32,14,6,1,'02:18:41'),(33,16,6,1,'02:26:59'),(34,15,6,1,'02:30:25'),(35,17,6,1,'02:27:45'),(36,27,4,1,'02:51:35'),(37,28,4,1,'03:05:59'),(38,30,4,1,'03:10:02'),(39,31,4,1,'03:13:58'),(40,21,5,1,'02:35:43'),(41,22,5,1,'02:52:51'),(42,24,5,1,'02:19:59'),(43,23,5,1,'02:24:58'),(44,25,5,1,'03:21:44'),(46,27,4,3,'01:48:07'),(47,29,4,3,'01:39:59'),(48,30,4,3,'01:41:59'),(49,31,4,3,'02:29:38'),(50,21,5,3,'01:31:55'),(51,22,5,3,'01:27:57'),(52,24,5,3,'01:27:53'),(53,23,5,3,'01:17:08'),(54,10,6,3,'01:27:59'),(55,11,6,3,'01:47:13'),(56,14,6,3,'01:16:59'),(57,16,6,3,'01:22:43'),(58,27,4,6,'01:21:53'),(59,29,4,6,'01:29:59'),(60,30,4,6,'01:11:59'),(61,31,4,6,'01:24:30'),(62,21,5,6,'00:59:59'),(63,22,5,6,'01:23:24'),(64,24,5,6,'00:56:21'),(65,23,5,6,'01:04:57'),(66,11,6,6,'01:12:53'),(67,10,6,6,'01:48:31'),(68,16,6,6,'01:03:58'),(69,15,6,6,'01:15:05'),(70,36,3,6,'01:20:58'),(71,37,3,6,'01:33:24'),(72,38,3,6,'01:22:49'),(73,39,2,1,'02:59:00'),(74,40,2,1,'03:10:25'),(75,42,2,1,'02:58:35'),(76,36,3,1,'02:47:43'),(77,38,3,1,'02:45:01'),(78,32,1,5,'00:58:25'),(79,33,1,5,'01:01:01'),(80,34,1,5,'00:56:25'),(81,35,1,5,'00:59:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salv_nadadores`
--

LOCK TABLES `salv_nadadores` WRITE;
/*!40000 ALTER TABLE `salv_nadadores` DISABLE KEYS */;
INSERT INTO `salv_nadadores` VALUES (8,'Cristina','GarcÃ­a MarÃ­n','1990-01-10','','','','0c72594fd995957baa42de3c735dd95d','',6),(9,'AntÃ­a','GarcÃ­a Silva','1998-01-20','','','','0c72594fd995957baa42de3c735dd95d','',6),(10,'PenÃ©lope','MartÃ­nez Justo','1993-02-15','','','','0c72594fd995957baa42de3c735dd95d','',6),(11,'Raquel','MartÃ­nez Canosa','1991-03-25','','','','0c72594fd995957baa42de3c735dd95d','',6),(12,'MarÃ­a','Gallardo de Artaza','1995-04-16','','','','0c72594fd995957baa42de3c735dd95d','',6),(13,'Nerea','VilariÃ±o Lamas','1996-05-26','','','','0c72594fd995957baa42de3c735dd95d','',6),(14,'Juan','PÃ©rez FernÃ¡ndez','1978-06-10','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(15,'MartÃ­n','Cedeira VÃ¡zquez','1995-05-26','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(16,'Manuel','Regueiro Picallo','1990-08-02','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(17,'Miguel','MartÃ­nez Ãlvarez','1990-03-31','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(18,'Omar','Andrade Ãlvarez','1997-09-19','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(19,'Borja','Canedo MartÃ­nez','1998-04-16','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(20,'Jaume','Martorell Bibiloni','1985-10-10','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',6),(21,'Alba','GÃ³mez MesÃ­as','2000-01-26','','','','0c72594fd995957baa42de3c735dd95d','',5),(22,'Sara','Gallardo de Artaza','1999-06-06','','','','0c72594fd995957baa42de3c735dd95d','',5),(23,'XiÃ¡n','PÃ©rez Merela','1999-06-09','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',5),(24,'Victor','Paz Soage','1999-12-12','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',5),(25,'Francisco','Velo Gesto','1999-11-19','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',5),(26,'Pablo','Florez Vivela','2000-02-02','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',5),(27,'Nicole','AlvariÃ±o Castro','2001-06-16','','','','0c72594fd995957baa42de3c735dd95d','',4),(28,'Carla','FernÃ¡ndez Cereijo','2002-12-24','','','','0c72594fd995957baa42de3c735dd95d','',4),(29,'Ana Yao','GÃ³mez LÃ³pez','2002-11-17','','','','0c72594fd995957baa42de3c735dd95d','',4),(30,'Manuel','MuiÃ±o Rozamontes','2001-07-26','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',4),(31,'Jose','Barreiro Mato','2001-03-06','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',4),(32,'Paula','Ferradas Canda','2007-03-01','','','','0c72594fd995957baa42de3c735dd95d','',1),(33,'Laura','Fraga Periscal','2006-12-01','','','','0c72594fd995957baa42de3c735dd95d','',1),(34,'Ãlvaro','Hidalgo Peon','2006-06-06','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',1),(35,'Samuel','CaamaÃ±o Bello','2007-06-09','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',1),(36,'Andrea','GarcÃ­a ViÃ±an','2002-12-13','','','','0c72594fd995957baa42de3c735dd95d','',3),(37,'Sofia','Dominguez Barreiro','2002-06-25','','','','0c72594fd995957baa42de3c735dd95d','',3),(38,'Daniel','Capelan Varela','2003-09-05','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',3),(39,'Tatiana','Carro Molina','2004-10-10','','','','0c72594fd995957baa42de3c735dd95d','',2),(40,'Naiara','Conde Rodriguez','2004-01-01','','','','0c72594fd995957baa42de3c735dd95d','',2),(41,'Ivan','Bello Ponte','2005-05-05','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',2),(42,'Daniel','Souto Gerpe','2004-06-26','\0','','','fde6c00e6b469c5f3b28c6bfc7a8e245','',2);
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
INSERT INTO `salv_prueba_categoria` VALUES (1,1,1,'00:00:00','00:00:00'),(2,1,2,'03:10:00','03:10:00'),(3,1,3,'03:05:00','03:05:00'),(4,1,4,'02:35:00','02:50:00'),(5,1,5,'02:30:00','02:45:00'),(6,1,6,'02:20:00','02:40:00'),(7,2,1,'00:00:00','00:00:00'),(8,2,2,'00:00:00','00:00:00'),(9,2,3,'00:00:00','00:00:00'),(10,2,4,'00:00:00','00:00:00'),(11,2,5,'00:00:00','00:00:00'),(12,2,6,'00:00:00','00:00:00'),(13,3,1,'00:00:00','00:00:00'),(14,3,2,'00:00:00','00:00:00'),(15,3,3,'01:52:00','01:52:00'),(16,3,4,'01:38:00','01:42:00'),(17,3,5,'01:36:00','01:40:00'),(18,3,6,'01:30:00','01:39:00'),(19,4,1,'00:00:00','00:00:00'),(20,4,2,'00:00:00','00:00:00'),(21,4,3,'00:00:00','00:00:00'),(22,4,4,'00:00:00','00:00:00'),(23,4,5,'00:00:00','00:00:00'),(24,4,6,'00:00:00','00:00:00'),(25,5,1,'00:58:00','00:59:00'),(26,5,2,'00:00:00','00:00:00'),(27,5,3,'00:00:00','00:00:00'),(28,5,4,'00:00:00','00:00:00'),(29,5,5,'00:00:00','00:00:00'),(30,5,6,'00:00:00','00:00:00'),(31,6,1,'00:00:00','00:00:00'),(32,6,2,'01:35:00','01:35:00'),(33,6,3,'01:24:00','01:24:00'),(34,6,4,'01:16:00','01:19:00'),(35,6,5,'01:10:00','01:18:00'),(36,6,6,'01:06:00','01:17:00'),(37,7,1,'00:00:00','00:00:00'),(38,7,2,'00:00:00','00:00:00'),(39,7,3,'00:00:00','00:00:00'),(40,7,4,'00:00:00','00:00:00'),(41,7,5,'00:00:00','00:00:00'),(42,7,6,'00:00:00','00:00:00'),(43,8,1,'00:00:00','00:00:00'),(44,8,2,'00:00:00','00:00:00'),(45,8,3,'00:00:00','00:00:00'),(46,8,4,'00:00:00','00:00:00'),(47,8,5,'00:00:00','00:00:00'),(48,8,6,'00:00:00','00:00:00'),(49,9,1,'00:00:00','00:00:00'),(50,9,2,'00:00:00','00:00:00'),(51,9,3,'00:00:00','00:00:00'),(52,9,4,'00:00:00','00:00:00'),(53,9,5,'00:00:00','00:00:00'),(54,9,6,'00:00:00','00:00:00');
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

-- Dump completed on 2016-12-02 11:02:53
