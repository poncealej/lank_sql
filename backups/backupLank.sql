CREATE DATABASE  IF NOT EXISTS `lank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lank`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lank
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `empresaID` int NOT NULL,
  `nombre_empresa` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Lank','Calle 123','123456789','Lank@empresaA.com');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `facturaID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `medioID` int DEFAULT NULL,
  `empresaID` int DEFAULT NULL,
  `subscriptionID` int DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`facturaID`),
  KEY `userID` (`userID`),
  KEY `empresaID` (`empresaID`),
  KEY `subscriptionID` (`subscriptionID`),
  KEY `medioID` (`medioID`),
  CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usuarios` (`userID`),
  CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`),
  CONSTRAINT `facturacion_ibfk_3` FOREIGN KEY (`subscriptionID`) REFERENCES `suscripciones` (`subscriptionID`),
  CONSTRAINT `facturacion_ibfk_4` FOREIGN KEY (`medioID`) REFERENCES `medios_de_pago` (`medioID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1,1,1,1,1,100.00,'2024-01-01'),(2,2,2,1,2,150.00,'2024-01-02'),(3,3,3,1,3,200.00,'2024-01-03'),(4,4,4,1,4,250.00,'2024-01-04'),(5,5,4,1,5,300.00,'2024-01-05'),(6,6,3,1,6,350.00,'2024-01-06'),(7,7,3,1,7,400.00,'2024-01-07'),(8,8,2,1,8,450.00,'2024-01-08'),(9,9,2,1,9,500.00,'2024-01-09'),(10,10,1,1,10,550.00,'2024-01-10');
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `groupID` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  PRIMARY KEY (`groupID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usuarios` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_de_pago`
--

DROP TABLE IF EXISTS `medios_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_pago` (
  `medioID` int NOT NULL AUTO_INCREMENT,
  `nombre_medio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`medioID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_de_pago`
--

LOCK TABLES `medios_de_pago` WRITE;
/*!40000 ALTER TABLE `medios_de_pago` DISABLE KEYS */;
INSERT INTO `medios_de_pago` VALUES (1,'Tarjeta de crédito'),(2,'Transferencia bancaria'),(3,'Tarjeta de débito'),(4,'Tarjeta prepaga');
/*!40000 ALTER TABLE `medios_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `PlataformaID` int NOT NULL AUTO_INCREMENT,
  `nombre_plataforma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PlataformaID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (1,'AppleMusic'),(2,'AppleOne'),(3,'AppleTV+'),(4,'AppleTV+ MLS Season Pass'),(5,'AppleTV+ MLS Season Pass'),(6,'AppleTV+ MLS Season Pass'),(7,'AppleTV+ MLS Season Pass'),(8,'AppleTV+ MLS Season Pass'),(9,'AtresPlayer'),(10,'Avast'),(11,'Calm'),(12,'CanvaPro'),(13,'Combo+'),(14,'Crunchyroll'),(15,'Curiosity4K'),(16,'CyberGhost'),(17,'Deezer'),(18,'DirecTVGO Basico'),(19,'DirecTVGO Full'),(20,'Disney+'),(21,'Duolingo'),(22,'ExpressVPN'),(23,'Funimation'),(24,'Gaia'),(25,'GoogleOne'),(26,'HBOMax'),(27,'Lionsgate'),(28,'MasterClass'),(29,'MAX Estandar'),(30,'MAX Platino'),(31,'MLS'),(32,'MUBI'),(33,'NBA league pass Premium'),(34,'Netflix HD'),(35,'Netflix Ultra HD 4K'),(36,'Netflix+ (Miembro Extra)'),(37,'NintendoSwitch'),(38,'NintendoSwitch Expansión'),(39,'Nord VPN'),(40,'Office365'),(41,'Paramount+'),(42,'Platzi'),(43,'PrimeVideo'),(44,'Proton Family'),(45,'Qobuz'),(46,'Scribd'),(47,'Spotify'),(48,'Star+'),(49,'Surfashak One'),(50,'Surshack Starter'),(51,'TidalHiFi'),(52,'TidalHiFiPlus'),(53,'TunnelBearVPN'),(54,'Viki Pass'),(55,'VIX'),(56,'WWENetwork'),(57,'YouTube');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrocambios`
--

DROP TABLE IF EXISTS `registrocambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrocambios` (
  `CambiosID` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `tabla_afectada` varchar(255) DEFAULT NULL,
  `fecha_hora` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CambiosID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrocambios`
--

LOCK TABLES `registrocambios` WRITE;
/*!40000 ALTER TABLE `registrocambios` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrocambios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `subscriptionID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `tipo_de_suscripcion` varchar(255) DEFAULT NULL,
  `fecha_de_inicio` date DEFAULT NULL,
  `fecha_de_vencimiento` date DEFAULT NULL,
  PRIMARY KEY (`subscriptionID`),
  KEY `userID` (`userID`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usuarios` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
INSERT INTO `suscripciones` VALUES (1,1,NULL,'2024-01-01','2024-02-01'),(2,2,NULL,'2024-01-02','2024-02-02'),(3,3,NULL,'2024-01-03','2024-02-03'),(4,4,NULL,'2024-01-04','2024-02-04'),(5,5,NULL,'2024-01-05','2024-02-05'),(6,6,NULL,'2024-01-06','2024-02-06'),(7,7,NULL,'2024-01-07','2024-02-07'),(8,8,NULL,'2024-01-08','2024-02-08'),(9,9,NULL,'2024-01-09','2024-02-09'),(10,10,NULL,'2024-01-10','2024-02-10');
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ValidarCantidadSuscripcionesPorUsuario` BEFORE INSERT ON `suscripciones` FOR EACH ROW BEGIN
    DECLARE cantidad_suscripciones INT;
    SET cantidad_suscripciones = (SELECT COUNT(*) FROM Suscripciones WHERE userID = NEW.userID);
    IF cantidad_suscripciones >= 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya tiene una suscripción activa';
        ELSE 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario no tiene una suscripción activa';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_de_registro` date DEFAULT NULL,
  `tipo_usuario` varchar(20) DEFAULT 'Null',
  `IDuser` int DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan Perez','juan@example.com','contraseña1',NULL,'2024-01-01','Null',NULL),(2,'María López','maria@example.com','contraseña2',NULL,'2024-01-02','Null',NULL),(3,'Pedro Ramirez','pedro@example.com','contraseña3',NULL,'2024-01-03','Null',NULL),(4,'Ana Martinez','ana@example.com','contraseña4',NULL,'2024-01-04','Null',NULL),(5,'Carlos Rodriguez','carlos@example.com','contraseña5',NULL,'2024-01-05','Null',NULL),(6,'Laura Gomez','laura@example.com','contraseña6',NULL,'2024-01-06','Null',NULL),(7,'Sofia Diaz','sofia@example.com','contraseña7',NULL,'2024-01-07','Null',NULL),(8,'Diego Sanchez','diego@example.com','contraseña8',NULL,'2024-01-08','Null',NULL),(9,'Elena Fernandez','elena@example.com','contraseña9',NULL,'2024-01-09','Null',NULL),(10,'Javier Ruiz','javier@example.com','contraseña10',NULL,'2024-01-10','Null',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarFechaRegistro` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN
    SET NEW.fecha_de_registro = NOW();
    IF Fecha_de_registro = NOW() THEN 
    SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "No tiene permiso para realizar este cambio"; 
    END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RegistroCambiosUsuarios` AFTER INSERT ON `usuarios` FOR EACH ROW INSERT INTO RegistroCambios (accion, tabla_afectada, fecha)
        VALUES ('INSERT', "Usuarios", CURRENT_USER(), NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ventaID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `medioID` int DEFAULT NULL,
  `PlataformaID` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  PRIMARY KEY (`ventaID`),
  KEY `userID` (`userID`),
  KEY `medioID` (`medioID`),
  KEY `PlataformaID` (`PlataformaID`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usuarios` (`userID`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`medioID`) REFERENCES `medios_de_pago` (`medioID`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`PlataformaID`) REFERENCES `plataformas` (`PlataformaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,1,1,50.00,'2024-01-01 12:00:00'),(2,2,2,2,2,75.00,'2024-01-02 13:00:00'),(3,3,3,3,3,100.00,'2024-01-03 14:00:00'),(4,4,4,4,4,125.00,'2024-01-04 15:00:00');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistafacturaciondetallada`
--

DROP TABLE IF EXISTS `vistafacturaciondetallada`;
/*!50001 DROP VIEW IF EXISTS `vistafacturaciondetallada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistafacturaciondetallada` AS SELECT 
 1 AS `facturaID`,
 1 AS `nombre_usuario`,
 1 AS `nombre_empresa`,
 1 AS `nombre_medio`,
 1 AS `monto`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistamediosdepagoutilizados`
--

DROP TABLE IF EXISTS `vistamediosdepagoutilizados`;
/*!50001 DROP VIEW IF EXISTS `vistamediosdepagoutilizados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistamediosdepagoutilizados` AS SELECT 
 1 AS `nombre_medio`,
 1 AS `total_utilizado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaplataformamasventas`
--

DROP TABLE IF EXISTS `vistaplataformamasventas`;
/*!50001 DROP VIEW IF EXISTS `vistaplataformamasventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaplataformamasventas` AS SELECT 
 1 AS `nombre_plataforma`,
 1 AS `total_ventas`,
 1 AS `monto_total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistausuariosconsuscripciones`
--

DROP TABLE IF EXISTS `vistausuariosconsuscripciones`;
/*!50001 DROP VIEW IF EXISTS `vistausuariosconsuscripciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistausuariosconsuscripciones` AS SELECT 
 1 AS `userID`,
 1 AS `nombre`,
 1 AS `correo_electronico`,
 1 AS `tipo_de_suscripcion`,
 1 AS `fecha_de_inicio`,
 1 AS `fecha_de_vencimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaventasporplataforma`
--

DROP TABLE IF EXISTS `vistaventasporplataforma`;
/*!50001 DROP VIEW IF EXISTS `vistaventasporplataforma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaventasporplataforma` AS SELECT 
 1 AS `nombre_plataforma`,
 1 AS `total_ventas`,
 1 AS `monto_total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'lank'
--

--
-- Dumping routines for database 'lank'
--
/*!50003 DROP FUNCTION IF EXISTS `ObtenerPlataformaMasVendida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerPlataformaMasVendida`(P_PlataformaID INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE plataforma_mas_vendida VARCHAR(255);
    SELECT nombre_plataforma INTO plataforma_mas_vendida 
    FROM Plataformas WHERE PlataformaID = (SELECT PlataformaID FROM Ventas WHERE PlataformaID = P_PlataformaID
    GROUP BY PlataformaID ORDER BY COUNT(*) DESC LIMIT 1);
    RETURN plataforma_mas_vendida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `UsuarioTieneSuscripcionActiva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `UsuarioTieneSuscripcionActiva`(userID INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE suscripcion_activa BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM Suscripciones WHERE userID = userID AND CURDATE() BETWEEN fecha_de_inicio AND fecha_de_vencimiento) INTO suscripcion_activa;
    RETURN suscripcion_activa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCorreoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCorreoUsuario`(
    IN userID INT,
    IN nuevo_correo_electronico VARCHAR(255)
)
BEGIN
    UPDATE Usuarios SET correo_electronico = nuevo_correo_electronico WHERE userID = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuario`(IN userID INT)
BEGIN
    DELETE FROM Usuarios WHERE userID = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vistafacturaciondetallada`
--

/*!50001 DROP VIEW IF EXISTS `vistafacturaciondetallada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistafacturaciondetallada` AS select `f`.`facturaID` AS `facturaID`,`u`.`nombre` AS `nombre_usuario`,`e`.`nombre_empresa` AS `nombre_empresa`,`m`.`nombre_medio` AS `nombre_medio`,`f`.`monto` AS `monto`,`f`.`fecha` AS `fecha` from (((`facturacion` `f` join `usuarios` `u` on((`f`.`userID` = `u`.`userID`))) join `empresa` `e` on((`f`.`empresaID` = `e`.`empresaID`))) join `medios_de_pago` `m` on((`f`.`medioID` = `m`.`medioID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistamediosdepagoutilizados`
--

/*!50001 DROP VIEW IF EXISTS `vistamediosdepagoutilizados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistamediosdepagoutilizados` AS select `m`.`nombre_medio` AS `nombre_medio`,count(`f`.`facturaID`) AS `total_utilizado` from (`facturacion` `f` join `medios_de_pago` `m` on((`f`.`medioID` = `m`.`medioID`))) group by `m`.`nombre_medio` order by `total_utilizado` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaplataformamasventas`
--

/*!50001 DROP VIEW IF EXISTS `vistaplataformamasventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaplataformamasventas` AS select `p`.`nombre_plataforma` AS `nombre_plataforma`,count(`v`.`ventaID`) AS `total_ventas`,sum(`v`.`monto_total`) AS `monto_total_ventas` from (`ventas` `v` join `plataformas` `p` on((`v`.`PlataformaID` = `p`.`PlataformaID`))) group by `p`.`nombre_plataforma` order by `total_ventas` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistausuariosconsuscripciones`
--

/*!50001 DROP VIEW IF EXISTS `vistausuariosconsuscripciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistausuariosconsuscripciones` AS select `u`.`userID` AS `userID`,`u`.`nombre` AS `nombre`,`u`.`correo_electronico` AS `correo_electronico`,`s`.`tipo_de_suscripcion` AS `tipo_de_suscripcion`,`s`.`fecha_de_inicio` AS `fecha_de_inicio`,`s`.`fecha_de_vencimiento` AS `fecha_de_vencimiento` from (`usuarios` `u` join `suscripciones` `s` on((`u`.`userID` = `s`.`userID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaventasporplataforma`
--

/*!50001 DROP VIEW IF EXISTS `vistaventasporplataforma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaventasporplataforma` AS select `p`.`nombre_plataforma` AS `nombre_plataforma`,count(`v`.`ventaID`) AS `total_ventas`,sum(`v`.`monto_total`) AS `monto_total_ventas` from (`ventas` `v` join `plataformas` `p` on((`v`.`PlataformaID` = `p`.`PlataformaID`))) group by `p`.`nombre_plataforma` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 23:50:41
