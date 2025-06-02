CREATE DATABASE  IF NOT EXISTS `project4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project4`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: project4
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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `jnum` varchar(6) NOT NULL,
  `jname` varchar(15) NOT NULL,
  `numworkers` int DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('J1','Operation DB',45,'Berlin'),('J13','Night Strike',350,'Madrid'),('J2','Really Big Job',500,'Melbourne'),('J22','Project On-Time',200,'London'),('J3','Small Job',100,'Chicago'),('J4','New Job',50,'Berlin'),('J5','My Job',1,'Orlando'),('J6','A New Job',14,'Milan'),('J90','Top Secret Job',3,'Stockholm');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `pnum` varchar(6) NOT NULL,
  `pname` varchar(15) NOT NULL,
  `color` varchar(15) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES ('P1','bolt','black',14,'London'),('P10','nut','red',2,'Orlando'),('P11','link','silver',4,'Milan'),('P12','clevis','black',3,'Bonn'),('P13','liner','blue',1,'Brussels'),('P19','screw','green',3,'Paris'),('P2','lever','yellow',5,'Orlando'),('P24','cog','silver',2,'Paris'),('P3','bolt','blue',10,'Chicago'),('P33','cover','red',7,'Tampa'),('P4','nut','silver',3,'London'),('P44','link','green',5,'Zurich'),('P48','washer','green',1,'Stuttgart'),('P5','nut','blue',8,'Berlin'),('P53','rod','green',4,'Zandvoort'),('P6','shaft','black',14,'Melbourne'),('P7','cog','red',1,'Chicago'),('P8','cam','titanium',3,'Berlin'),('P9','bolt','silver',3,'Berlin'),('P90','U-plate','black',50,'Cardiff');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `snum` varchar(6) NOT NULL,
  `pnum` varchar(6) NOT NULL,
  `jnum` varchar(6) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`snum`,`pnum`,`jnum`),
  KEY `pnum` (`pnum`),
  KEY `jnum` (`jnum`),
  CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`snum`) REFERENCES `suppliers` (`snum`),
  CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`pnum`) REFERENCES `parts` (`pnum`),
  CONSTRAINT `shipments_ibfk_3` FOREIGN KEY (`jnum`) REFERENCES `jobs` (`jnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES ('S1','P1','J1',40),('S1','P1','J4',200),('S1','P19','J13',200),('S1','P3','J13',105),('S1','P33','J5',40),('S1','P8','J1',80),('S1','P8','J13',200),('S1','P8','J2',100),('S1','P8','J22',340),('S1','P8','J3',200),('S1','P8','J4',100),('S1','P8','J5',225),('S1','P8','J6',230),('S12','P3','J22',760),('S17','P3','J2',810),('S2','P3','J1',50),('S2','P3','J2',25),('S2','P3','J22',60),('S2','P3','J3',30),('S2','P3','J4',60),('S2','P3','J5',101),('S2','P4','J1',50),('S21','P2','J4',200),('S22','P1','J3',120),('S3','P10','J4',200),('S3','P24','J2',200),('S3','P3','J1',109),('S3','P3','J6',85),('S3','P4','J6',80),('S3','P5','J6',120),('S3','P9','J1',110),('S39','P3','J1',30),('S39','P6','J4',33),('S39','P6','J6',500),('S4','P6','J2',50),('S44','P44','J2',100),('S44','P48','J5',40),('S5','P6','J6',400),('S6','P1','J2',40),('S6','P10','J3',100),('S6','P11','J2',40),('S6','P12','J4',75),('S6','P13','J5',100),('S6','P19','J5',50),('S6','P2','J2',60),('S6','P24','J2',20),('S6','P3','J4',510),('S6','P33','J4',40),('S6','P4','J2',120),('S6','P44','J4',20),('S6','P48','J2',100),('S6','P5','J22',200),('S6','P53','J1',25),('S6','P6','J22',120),('S6','P7','J1',300),('S6','P8','J3',110),('S6','P9','J4',180),('S7','P1','J2',40),('S7','P12','J2',40),('S7','P6','J2',40),('S90','P90','J90',500);
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `snum` varchar(6) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `status` int DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`snum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES ('S1','Michael Schumacher',26,'Berlin'),('S10','David Coulthard',2,'London'),('S11','Bernard Hinault',7,'Paris'),('S12','Eddy Merckx',26,'Brussels'),('S13','Candice Swanepoel',3,'Cape Town'),('S14','Adriana Lima',4,'Sao Paulo'),('S15','Jennifer Lawrence',6,'Owensboro'),('S16','Fernando Alonso',4,'Madrid'),('S17','Rubens Barichello',28,'Sao Paulo'),('S18','Tom Boonen',2,'Brussels'),('S19','Johan Messeuw',1,'Eekloo'),('S2','Juan Pablo Montoya',19,'Interlagos'),('S20','Danilo Rossi',2,'Milan'),('S21','Lizzie Armistead',26,'Hempstead'),('S22','Jan Ullrich',30,'Bonn'),('S3','Dietrich Thurau',26,'Berlin'),('S32','Bernd Schnieder',2,'Berlin'),('S33','Rolf Aldag',3,'Berlin'),('S39','Candice Swanepoel',20,'Cardiff'),('S4','Mark Webber',5,'Melbourne'),('S44','Beryl Burton',29,'London'),('S5','Jenson Button',29,'London'),('S56','Marianne Vos',8,'Zandvoort'),('S6','Nicola Gianniberti',27,'Milan'),('S7','Christian Albers',3,'Orlando'),('S8','Giancarlo Fisichella',3,'Milan'),('S9','Kimi Rikonnen',2,'Helsinki'),('S90','Anna-Frieda',39,'Stockholm');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project4'
--
/*!50003 DROP PROCEDURE IF EXISTS `Get_The_Maximum_Status_Of_All_Suppliers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_The_Maximum_Status_Of_All_Suppliers`()
BEGIN
select max(status) as Maximum_Status_Of_All_Suppliers
from suppliers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_The_Name_Of_The_Job_With_The_Most_Workers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_The_Name_Of_The_Job_With_The_Most_Workers`()
BEGIN
select jname, numworkers
from jobs 
where numworkers = (select max(numworkers) from jobs);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_The_Sum_Of_All_Parts_Weights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_The_Sum_Of_All_Parts_Weights`()
BEGIN
select sum(weight) as Sum_Of_All_Part_Weights
from parts;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_The_Total_Number_Of_Shipments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_The_Total_Number_Of_Shipments`()
BEGIN
select count(*) as The_Total_Number_Of_Shipments
from shipments;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `List_The_Name_And_Status_Of_All_Suppliers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `List_The_Name_And_Status_Of_All_Suppliers`()
BEGIN
select sname, status
from suppliers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02  1:04:37
