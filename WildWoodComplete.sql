-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: WildWoodApartments
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment` (
  `Apartment_Number` int(11) NOT NULL,
  `Apartment_Number_of_Bedrooms` int(11) NOT NULL,
  `Apartment_Number_of_Bathrooms` int(11) NOT NULL,
  `Apartment_Square_Feet` int(7) NOT NULL,
  `Apartment_Currently_Occupied` tinyint(1) NOT NULL,
  `complex_Complex_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Apartment_Number`,`complex_Complex_Name`),
  KEY `fk_apartment_complex1_idx` (`complex_Complex_Name`),
  CONSTRAINT `fk_apartment_complex1` FOREIGN KEY (`complex_Complex_Name`) REFERENCES `complex` (`Complex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES (11,2,1,900,1,'Villa Maria'),(12,2,1,900,1,'Villa Maria'),(21,3,2,1200,1,'Villa Maria'),(22,3,2,1200,1,'Villa Maria'),(101,3,2,1500,1,'Fox Run'),(101,2,1,1050,1,'Oak Meadows'),(102,3,2,1500,1,'Fox Run'),(102,1,1,800,1,'Oak Meadows'),(103,2,1,1280,1,'Fox Run'),(103,2,1,1050,1,'Oak Meadows'),(104,2,1,1280,1,'Fox Run'),(201,1,1,850,1,'Fox Run'),(202,1,1,850,1,'Fox Run'),(203,1,1,850,1,'Fox Run'),(204,1,1,850,1,'Fox Run');
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complex`
--

DROP TABLE IF EXISTS `complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complex` (
  `Complex_Name` varchar(45) NOT NULL,
  `Complex_Total_Units` int(11) NOT NULL,
  `Complex_Phone_Number` varchar(10) NOT NULL,
  `Complex_Office_Street_Address` varchar(45) NOT NULL,
  `Complex_City` varchar(20) NOT NULL,
  `Complex_State` varchar(2) NOT NULL,
  `Complex_Zip` varchar(10) NOT NULL,
  PRIMARY KEY (`Complex_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complex`
--

LOCK TABLES `complex` WRITE;
/*!40000 ALTER TABLE `complex` DISABLE KEYS */;
INSERT INTO `complex` VALUES ('Fox Run',250,'9041264180','257 N Evergreen Dr','Everett','WA','98016'),('Oak Meadows',250,'9061831743','1775 S Prospect Rd','Astoria','OR','95871'),('Villa Maria',250,'5067851022','1007 S 9th E','Bothell','WA','97812');
/*!40000 ALTER TABLE `complex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense` (
  `Expense_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Expense_Catagory` varchar(45) NOT NULL,
  `Expense_Date_Paid` date NOT NULL,
  `Expense_Description` varchar(45) NOT NULL,
  `Expense_Quarter` varchar(10) NOT NULL,
  `maintenance_request_Request_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Expense_ID`),
  KEY `fk_expense_maintenance_request1_idx` (`maintenance_request_Request_ID`),
  CONSTRAINT `fk_expense_maintenance_request1` FOREIGN KEY (`maintenance_request_Request_ID`) REFERENCES `maintenance_request` (`Request_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,'Maintenance','2014-07-06','stove burner','summer',1),(2,'Maintenance','2015-03-05','doorbell','winter',4),(3,'Insurance','2015-01-05','umbrella policy','winter',NULL),(4,'Utilities','2015-01-14','december electric','winter',NULL),(5,'Utilities','2015-01-14','december gas','winter',NULL),(6,'Wages','2015-02-08','january stipend','winter',NULL),(7,'Wages','2015-02-08','january stipend','winter',NULL),(8,'Wages','2015-02-08','january stipend','winter',NULL),(9,'Maintenance','2015-05-18','plaster knife','spring',5),(10,'Maintenance','2015-05-20','white paint','spring',5);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lease` (
  `Lease_Number` int(11) NOT NULL,
  `Lease_Start_Date` date NOT NULL,
  `Lease_End_Date` date NOT NULL,
  `Lease_Deposit_Amount` decimal(6,2) NOT NULL,
  `Lease_Deposit_Collected` tinyint(1) NOT NULL,
  `complex_Complex_Name` varchar(45) NOT NULL,
  `apartment_Apartment_Number` int(11) NOT NULL,
  `Lease_Active` tinyint(1) NOT NULL,
  `tenant_Tenant_Last_Name` varchar(20) NOT NULL,
  `tenant_Tenant_First_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Lease_Number`,`apartment_Apartment_Number`,`complex_Complex_Name`,`tenant_Tenant_Last_Name`,`tenant_Tenant_First_Name`),
  KEY `fk_lease_complex1_idx` (`complex_Complex_Name`),
  KEY `fk_lease_apartment1_idx` (`apartment_Apartment_Number`),
  KEY `fk_lease_tenant1_idx` (`tenant_Tenant_Last_Name`,`tenant_Tenant_First_Name`),
  CONSTRAINT `fk_lease_apartment1` FOREIGN KEY (`apartment_Apartment_Number`) REFERENCES `apartment` (`Apartment_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lease_complex1` FOREIGN KEY (`complex_Complex_Name`) REFERENCES `complex` (`Complex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lease_tenant1` FOREIGN KEY (`tenant_Tenant_Last_Name`, `tenant_Tenant_First_Name`) REFERENCES `tenant` (`Tenant_Last_Name`, `Tenant_First_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
INSERT INTO `lease` VALUES (1,'2014-01-01','2015-01-01',900.00,1,'Oak Meadows',101,1,'Summers','Charles'),(2,'2015-04-01','2016-04-01',900.00,1,'Oak Meadows',102,1,'Newton','Marilyn'),(3,'2014-03-01','2015-03-01',900.00,1,'Oak Meadows',103,1,'Ortiz','Jose'),(4,'2015-03-01','2015-09-01',0.00,1,'Oak Meadows',103,1,'Ortiz','Jose'),(5,'2015-04-01','2015-10-01',600.00,1,'Villa Maria',21,1,'Lewis','Janice'),(6,'2014-07-01','2015-07-01',600.00,1,'Villa Maria',11,1,'Lee','Cassie'),(7,'2015-07-01','2016-07-01',0.00,1,'Villa Maria',11,1,'Lee ','Cassie'),(8,'2013-09-15','2014-09-15',600.00,1,'Villa Maria',12,1,'Woodward','Robert'),(9,'2014-09-15','2015-09-15',0.00,1,'Villa Maria',12,1,'Woodward','Robert'),(10,'2015-06-01','2016-06-01',1000.00,1,'Fox Run',104,1,'Tam','Anne'),(11,'2013-09-15','2014-09-15',1000.00,1,'Fox Run',103,1,'Thomas','Larry'),(12,'2014-09-15','2015-09-15',0.00,1,'Fox Run',102,1,'Thomas','Larry'),(13,'2015-01-01','2016-01-01',1000.00,1,'Fox Run',101,1,'McCoy','Shannon'),(14,'2013-12-01','2014-12-01',1000.00,1,'Fox Run',201,1,'Patterson','Mark'),(15,'2014-12-01','2015-12-01',0.00,1,'Fox Run',204,1,'Patterson','Mark');
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_request`
--

DROP TABLE IF EXISTS `maintenance_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_request` (
  `Request_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Request_Description` varchar(50) NOT NULL,
  `Request_Payee` varchar(30) NOT NULL,
  `Request_Expense_Amount` decimal(6,2) NOT NULL,
  `manager_Manager_ID` int(11) NOT NULL,
  `complex_Complex_Name` varchar(45) NOT NULL,
  `apartment_Apartment_Number` int(11) NOT NULL,
  `Request_Date_Entered` date NOT NULL,
  `Request_Date_Closed` date NOT NULL,
  PRIMARY KEY (`Request_ID`,`manager_Manager_ID`,`complex_Complex_Name`,`apartment_Apartment_Number`),
  KEY `fk_maintenance_request_manager1_idx` (`manager_Manager_ID`),
  KEY `fk_maintenance_request_complex1_idx` (`complex_Complex_Name`),
  KEY `fk_maintenance_request_apartment1_idx` (`apartment_Apartment_Number`),
  CONSTRAINT `fk_maintenance_request_apartment1` FOREIGN KEY (`apartment_Apartment_Number`) REFERENCES `apartment` (`Apartment_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_maintenance_request_complex1` FOREIGN KEY (`complex_Complex_Name`) REFERENCES `complex` (`Complex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_maintenance_request_manager1` FOREIGN KEY (`manager_Manager_ID`) REFERENCES `manager` (`Manager_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_request`
--

LOCK TABLES `maintenance_request` WRITE;
/*!40000 ALTER TABLE `maintenance_request` DISABLE KEYS */;
INSERT INTO `maintenance_request` VALUES (1,'Burner for stove','Seattle Appliance Parts',34.72,1,'Oak Meadows',101,'2014-07-05','2015-07-06'),(2,'Damaged bathroom floor','Seattle Flooring',256.00,2,'Villa Maria',11,'2015-04-10','2015-04-11'),(3,'Refridgerator bad plug','Seattle Appliance Parts',50.00,2,'Villa Maria',12,'2015-02-05','2015-02-06'),(4,'Broken Doorbell','Ace Hardware',6.32,2,'Villa Maria',12,'2015-03-05','2015-03-05'),(5,'Hole in wall','Ace Hardware',13.45,3,'Fox Run',101,'2015-05-17','2015-05-20');
/*!40000 ALTER TABLE `maintenance_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `Manager_ID` int(11) NOT NULL,
  `Manager_Monthly_Stipend` decimal(6,2) NOT NULL,
  `Manager_First_Name` varchar(15) NOT NULL,
  `Manager_Last_Name` varchar(15) NOT NULL,
  `Manager_Hire_Date` date NOT NULL,
  `Manager_Apartment_Unit` int(11) NOT NULL,
  `complex_Complex_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Manager_ID`,`complex_Complex_Name`),
  KEY `fk_manager_complex1_idx` (`complex_Complex_Name`),
  CONSTRAINT `fk_manager_complex1` FOREIGN KEY (`complex_Complex_Name`) REFERENCES `complex` (`Complex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,400.00,'Charles','Summers','2015-01-01',101,'Oak Meadows'),(2,500.00,'Cassie','Lee','2014-07-01',11,'Villa Maria'),(3,1500.00,'Shannon','McCoy','2014-03-01',101,'Fox Run');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_payment`
--

DROP TABLE IF EXISTS `rent_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent_payment` (
  `Payment_ID` int(11) NOT NULL,
  `Payment_Amount` decimal(6,2) NOT NULL,
  `Payment_Date_Due` date NOT NULL,
  `Payment_Date_Received` date NOT NULL,
  `lease_Lease_Number` int(11) NOT NULL,
  `complex_Complex_Name` varchar(45) NOT NULL,
  `tenant_Tenant_Last_Name` varchar(20) NOT NULL,
  `Payment_Late` tinyint(1) NOT NULL,
  PRIMARY KEY (`Payment_ID`,`lease_Lease_Number`,`complex_Complex_Name`,`tenant_Tenant_Last_Name`),
  KEY `fk_rent_payment_lease1_idx` (`lease_Lease_Number`),
  KEY `fk_rent_payment_complex1_idx` (`complex_Complex_Name`),
  KEY `fk_rent_payment_tenant1_idx` (`tenant_Tenant_Last_Name`),
  CONSTRAINT `fk_rent_payment_complex1` FOREIGN KEY (`complex_Complex_Name`) REFERENCES `complex` (`Complex_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rent_payment_lease1` FOREIGN KEY (`lease_Lease_Number`) REFERENCES `lease` (`Lease_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rent_payment_tenant1` FOREIGN KEY (`tenant_Tenant_Last_Name`) REFERENCES `tenant` (`Tenant_Last_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_payment`
--

LOCK TABLES `rent_payment` WRITE;
/*!40000 ALTER TABLE `rent_payment` DISABLE KEYS */;
INSERT INTO `rent_payment` VALUES (1,700.00,'2015-03-01','2015-03-01',2,'Oak Meadows','Newton',0),(2,800.00,'2015-03-01','2015-03-01',4,'Oak Meadows','Ortiz',0),(3,600.00,'2015-03-01','2015-03-01',5,'Villa Maria','Lewis',0),(4,600.00,'2015-03-01','2015-03-01',9,'Villa Maria','Woodward',0),(5,600.00,'2015-03-01','2015-03-01',10,'Fox Run','Tam',0),(6,600.00,'2015-03-01','2015-03-01',12,'Fox Run','Thomas',0),(7,600.00,'2015-03-01','2015-03-01',15,'Fox Run','Patterson',0),(8,700.00,'2015-03-01','2015-03-01',2,'Oak Meadows','Newton',0),(9,600.00,'2015-03-01','2015-03-01',5,'Villa Maria','Lewis',0),(10,800.00,'2015-03-03','2015-03-03',4,'Oak Meadows','Ortiz',0),(11,600.00,'2015-03-03','2015-03-03',10,'Fox Run','Tam',0),(12,600.00,'2015-03-04','2015-03-04',9,'Villa Maria','Woodward',0),(13,50.00,'2015-03-06','2015-03-06',12,'Fox Run','Thomas',0),(14,50.00,'2015-03-06','2015-03-06',15,'Fox Run','Patterson',0),(15,650.00,'2015-03-10','2015-03-10',15,'Fox Run','Patterson',0),(16,700.00,'2015-04-01','2015-04-01',2,'Oak Meadows','Newton',0),(17,800.00,'2015-04-01','2015-04-01',3,'Oak Meadows','Ortiz',0),(18,600.00,'2015-04-01','2015-04-01',5,'Villa Maria','Lewis',0),(19,700.00,'2015-04-02','2015-04-02',2,'Oak Meadows','Newton',0),(20,600.00,'2015-04-01','2015-04-02',5,'Villa Maria','Lewis',0);
/*!40000 ALTER TABLE `rent_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant` (
  `Tenant_Last_Name` varchar(20) NOT NULL,
  `Tenant_Phone_Number` varchar(10) NOT NULL,
  `Tenant_Email_Address` varchar(45) DEFAULT NULL,
  `Tenant_First_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Tenant_Last_Name`,`Tenant_First_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES ('Lee','8279102934','cassie@gmail.com','Cassie'),('Lewis','1029384012','janice@gmail.com','Janice'),('McCoy','2320813401','shannon@hotmail.com','Shannon'),('Newton','2061029812','marilyn@msn.com','Marilyn'),('Ortiz','7618910234','jose@hotmail.com','Jose'),('Patterson','2082930143','mark@gmail.com','Mark'),('Summers','4061442360','charles@gmail.com','Charles'),('Tam','4210342192','anne@gmail.com','Anne'),('Thomas','1039234012','larry@msn.com','Larry'),('Woodward','6579301293','robert@hotmail.com','Robert');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-29 17:26:47
