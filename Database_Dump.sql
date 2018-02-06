CREATE DATABASE  IF NOT EXISTS `mydbwoaddress` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydbwoaddress`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: mydbwoaddress
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Consoles`
--

DROP TABLE IF EXISTS `Consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consoles` (
  `Product_id` int(11) NOT NULL,
  `Manufacturer` varchar(45) DEFAULT NULL,
  `Colour` varchar(45) DEFAULT NULL,
  `VR` enum('YES','NO') DEFAULT NULL,
  `Condition` enum('NEW','USED') DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  CONSTRAINT `fk_Consoles_Inventory1` FOREIGN KEY (`Product_id`) REFERENCES `Inventory` (`Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consoles`
--

LOCK TABLES `Consoles` WRITE;
/*!40000 ALTER TABLE `Consoles` DISABLE KEYS */;
INSERT INTO `Consoles` VALUES (3,'Microsoft','Black','NO','NEW','www.xbox.com'),(6,'Sony','White','YES','NEW','www.ps4.com'),(7,'Nintendo','Grey','YES','NEW','www.nintendowii.com'),(11,'Sony','Silver','NO','NEW','www.ps3.com'),(12,'Microsoft','White','NO','USED','www.xbox360.com');
/*!40000 ALTER TABLE `Consoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Games` (
  `Product_id` int(11) NOT NULL,
  `Platform` varchar(45) NOT NULL,
  `Rating` decimal(2,1) NOT NULL,
  `3D` enum('YES','NO') NOT NULL,
  `Condition` char(5) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  CONSTRAINT `fk_Games_Inventory1` FOREIGN KEY (`Product_id`) REFERENCES `Inventory` (`Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games`
--

LOCK TABLES `Games` WRITE;
/*!40000 ALTER TABLE `Games` DISABLE KEYS */;
INSERT INTO `Games` VALUES (1,'Xbox',5.0,'YES','New'),(2,'PC',4.0,'NO','New'),(5,'PC',4.5,'YES','Used'),(13,'PC',4.9,'NO','Used'),(14,'PS4',4.3,'YES','New');
/*!40000 ALTER TABLE `Games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GamingPC`
--

DROP TABLE IF EXISTS `GamingPC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GamingPC` (
  `Product_id` int(11) NOT NULL,
  `Manufacturer` varchar(45) DEFAULT NULL,
  `DisplaySize` int(11) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `HardDiskCapacity` int(11) DEFAULT NULL,
  `Processor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  CONSTRAINT `fk_GamingPC_Inventory1` FOREIGN KEY (`Product_id`) REFERENCES `Inventory` (`Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GamingPC`
--

LOCK TABLES `GamingPC` WRITE;
/*!40000 ALTER TABLE `GamingPC` DISABLE KEYS */;
INSERT INTO `GamingPC` VALUES (4,'Dell',13,16,1024,'i7'),(8,'Dell',15,12,512,'intel i5'),(9,'HP',17,8,512,'AMDRadeon'),(10,'ASUS',15,16,1024,'intel i7');
/*!40000 ALTER TABLE `GamingPC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `Product_id` int(11) NOT NULL,
  `ProductCategory_id` int(11) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `InStock` int(11) NOT NULL,
  `OnOrder` int(11) DEFAULT NULL,
  `YearReleased` int(11) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `fk_Inventory_ProductCategory1_idx` (`ProductCategory_id`),
  CONSTRAINT `fk_Inventory_ProductCategory1` FOREIGN KEY (`ProductCategory_id`) REFERENCES `ProductCategory` (`ProductCategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,1,'Halo',29.00,33,4,1992),(2,1,'Borderlands',39.00,3,4,2009),(3,2,'XboxOne',299.00,9,25,2017),(4,3,'Alienware',999.00,2,0,2016),(5,1,'NeedForSpeed',39.00,13,0,2015),(6,2,'PS4',399.00,15,5,2015),(7,2,'NintendoWii',249.99,8,0,2012),(8,3,'XPS',999.99,12,7,2013),(9,3,'Omen',799.49,2,3,2011),(10,3,'ROG',1199.49,5,2,2017),(11,2,'PS3',199.79,25,0,2009),(12,2,'Xbox360',199.29,35,0,2008),(13,1,'CounterStrike',3.29,75,30,2006),(14,1,'GTA5',49.99,45,0,2015);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger instock_trigger
Before insert on inventory
for each row 
Begin
	if (new.inStock < 1) then 
	signal sqlstate '02000' set message_text = 'ERROR: The product cannot be added as it is not in stock';
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderDetails` (
  `Order_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `OrderQuantity` int(11) DEFAULT NULL,
  `priceperpiece` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_id`,`Product_id`),
  KEY `fk_OrderDetails_Inventory1_idx` (`Product_id`),
  KEY `fk_OrderDetails_CustomerOrder1` (`Order_id`),
  CONSTRAINT `fk_OrderDetails_CustomerOrder1` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Inventory1` FOREIGN KEY (`Product_id`) REFERENCES `Inventory` (`Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
INSERT INTO `OrderDetails` VALUES (1,1,2,29.99),(1,3,1,229.99),(2,7,1,229.99),(3,13,2,3.99),(3,14,2,34.99),(4,4,1,999.99);
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductCategory`
--

DROP TABLE IF EXISTS `ProductCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductCategory` (
  `ProductCategory_id` int(11) NOT NULL,
  `CategoryName` enum('Games','Consoles','GamingPC') NOT NULL,
  PRIMARY KEY (`ProductCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductCategory`
--

LOCK TABLES `ProductCategory` WRITE;
/*!40000 ALTER TABLE `ProductCategory` DISABLE KEYS */;
INSERT INTO `ProductCategory` VALUES (1,'Games'),(2,'Consoles'),(3,'GamingPC');
/*!40000 ALTER TABLE `ProductCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Store`
--

DROP TABLE IF EXISTS `Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Store` (
  `Store_id` int(11) NOT NULL,
  `StoreName` varchar(45) NOT NULL,
  `ContactNumber` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `AddressLine1` varchar(45) NOT NULL,
  `AddressLine2` varchar(45) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) NOT NULL,
  PRIMARY KEY (`Store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Store`
--

LOCK TABLES `Store` WRITE;
/*!40000 ALTER TABLE `Store` DISABLE KEYS */;
INSERT INTO `Store` VALUES (1,'Gamestop','857-233-6453','boston.gamestop@gmail.com','76 Boylston Street','Floor 2','Boston','Massachusetts','20212'),(2,'Gamestop','857-866-2961','caligamestop@gmail.com','256 Whistler Street','Block 5','Los Angeles','California','90212');
/*!40000 ALTER TABLE `Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse`
--

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Warehouse` (
  `Warehouse_id` int(11) NOT NULL,
  `WarehouseName` varchar(45) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
INSERT INTO `Warehouse` VALUES (1,'BostonStorage',1,45);
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `console_view`
--

DROP TABLE IF EXISTS `console_view`;
/*!50001 DROP VIEW IF EXISTS `console_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `console_view` AS SELECT 
 1 AS `Product_id`,
 1 AS `Category`,
 1 AS `Title`,
 1 AS `Price`,
 1 AS `Instock`,
 1 AS `Onorder`,
 1 AS `YearReleased`,
 1 AS `Manufacturer`,
 1 AS `colour`,
 1 AS `VR`,
 1 AS `Condition`,
 1 AS `website`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Sex` enum('MALE','FEMALE') NOT NULL,
  `Age` int(11) NOT NULL,
  `Employee_Employee_id` int(11) NOT NULL,
  `AddressLine1` varchar(45) NOT NULL,
  `AddressLine2` varchar(45) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) DEFAULT NULL,
  `PostalCode` int(11) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  KEY `fk_Customer_Employee1_idx` (`Employee_Employee_id`),
  CONSTRAINT `fk_Customer_Employee1` FOREIGN KEY (`Employee_Employee_id`) REFERENCES `Employee` (`Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dave','Lombardo','MALE',34,2,'55 Forsyth Street','Block 4','Boston','Massachusetts',20332),(2,'Alissa','Gluze','FEMALE',28,6,'46 Coulombus Street','Apartment 3','Baltimore','Washington DC',10697);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Employee_id` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Age` int(11) NOT NULL,
  `Sex` enum('MALE','FEMALE') NOT NULL,
  `Designation` varchar(45) NOT NULL,
  `Store_Store_id` int(11) NOT NULL,
  `ReportingManager` int(11) DEFAULT NULL,
  PRIMARY KEY (`Employee_id`),
  KEY `fk_Employee_Store1_idx` (`Store_Store_id`),
  KEY `fk_Employee_Employee1_idx` (`ReportingManager`),
  CONSTRAINT `fk_Employee_Employee1` FOREIGN KEY (`ReportingManager`) REFERENCES `Employee` (`Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Store1` FOREIGN KEY (`Store_Store_id`) REFERENCES `Store` (`Store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Joseph','Bose',34,'MALE','StoreManager',1,1),(2,'Sally','Christ',26,'FEMALE','SalesRepresentative',1,1),(3,'Jack','Black',28,'MALE','SalesRepresentative',1,1),(4,'Don','Serina',41,'MALE','StoreManager',2,4),(5,'Rob','Patton',22,'MALE','SalesRepresentative',2,4),(6,'Janet','Majors',29,'FEMALE','SalesRepresentative',2,4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `game_view`
--

DROP TABLE IF EXISTS `game_view`;
/*!50001 DROP VIEW IF EXISTS `game_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `game_view` AS SELECT 
 1 AS `Product_id`,
 1 AS `Category`,
 1 AS `Title`,
 1 AS `Price`,
 1 AS `Instock`,
 1 AS `Onorder`,
 1 AS `YearReleased`,
 1 AS `Platform`,
 1 AS `Rating`,
 1 AS `3D`,
 1 AS `Condition`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gamingpc_view`
--

DROP TABLE IF EXISTS `gamingpc_view`;
/*!50001 DROP VIEW IF EXISTS `gamingpc_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `gamingpc_view` AS SELECT 
 1 AS `Product_id`,
 1 AS `Category`,
 1 AS `Title`,
 1 AS `Price`,
 1 AS `Instock`,
 1 AS `Onorder`,
 1 AS `YearReleased`,
 1 AS `Manufacturer`,
 1 AS `Display in inches`,
 1 AS `RAM in GBs`,
 1 AS `HardDiskCapacity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Order_id` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ShippingDate` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Customer_Customer_id` int(11) NOT NULL,
  PRIMARY KEY (`Order_id`),
  KEY `Customer_Customer_id` (`Customer_Customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_Customer_id`) REFERENCES `Customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-12-01','2017-12-07','Shipped',1),(2,'2017-10-17','2017-10-27','Shipped',2),(3,'2017-12-14','2017-12-24','InProcess',1),(4,'2017-11-09','2017-11-17','Shipped',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalperorder_view`
--

DROP TABLE IF EXISTS `totalperorder_view`;
/*!50001 DROP VIEW IF EXISTS `totalperorder_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `totalperorder_view` AS SELECT 
 1 AS `order_id`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydbwoaddress'
--

--
-- Dumping routines for database 'mydbwoaddress'
--
/*!50003 DROP PROCEDURE IF EXISTS `ShippingTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShippingTime`(in customerNo int(11), out shippingtime varchar(50))
BEGIN
DECLARE custCity varchar(50);
SELECT city INTO custCity
FROM customer
WHERE customer_id = customerNo;
 
CASE custCity
WHEN  'Boston' THEN
SET shippingtime = 'Delivery within 2 days';
WHEN 'Los Angeles' THEN
SET shippingtime = 'Delivery within 3 days';
ELSE
SET shippingtime = 'Delivery within 5 days';
END CASE;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `totalitemsNotOnOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `totalitemsNotOnOrder`(IN instorecount int,OUT notonorder INT)
BEGIN
SELECT count(product_id)
INTO notonorder
FROM inventory
WHERE onorder = instorecount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `console_view`
--

/*!50001 DROP VIEW IF EXISTS `console_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `console_view` AS select `i`.`Product_id` AS `Product_id`,`p`.`CategoryName` AS `Category`,`i`.`Title` AS `Title`,`i`.`Price` AS `Price`,`i`.`InStock` AS `Instock`,`i`.`OnOrder` AS `Onorder`,`i`.`YearReleased` AS `YearReleased`,`c`.`Manufacturer` AS `Manufacturer`,`c`.`Colour` AS `colour`,`c`.`VR` AS `VR`,`c`.`Condition` AS `Condition`,`c`.`Website` AS `website` from ((`inventory` `i` join `consoles` `c` on((`c`.`Product_id` = `i`.`Product_id`))) join `productcategory` `p` on((`p`.`ProductCategory_id` = `i`.`ProductCategory_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `game_view`
--

/*!50001 DROP VIEW IF EXISTS `game_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `game_view` AS select `i`.`Product_id` AS `Product_id`,`c`.`CategoryName` AS `Category`,`i`.`Title` AS `Title`,`i`.`Price` AS `Price`,`i`.`InStock` AS `Instock`,`i`.`OnOrder` AS `Onorder`,`i`.`YearReleased` AS `YearReleased`,`g`.`Platform` AS `Platform`,`g`.`Rating` AS `Rating`,`g`.`3D` AS `3D`,`g`.`Condition` AS `Condition` from ((`inventory` `i` join `games` `g` on((`i`.`Product_id` = `g`.`Product_id`))) join `productcategory` `c` on((`c`.`ProductCategory_id` = `i`.`ProductCategory_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gamingpc_view`
--

/*!50001 DROP VIEW IF EXISTS `gamingpc_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gamingpc_view` AS select `i`.`Product_id` AS `Product_id`,`p`.`CategoryName` AS `Category`,`i`.`Title` AS `Title`,`i`.`Price` AS `Price`,`i`.`InStock` AS `Instock`,`i`.`OnOrder` AS `Onorder`,`i`.`YearReleased` AS `YearReleased`,`l`.`Manufacturer` AS `Manufacturer`,`l`.`DisplaySize` AS `Display in inches`,`l`.`RAM` AS `RAM in GBs`,`l`.`HardDiskCapacity` AS `HardDiskCapacity` from ((`inventory` `i` join `gamingpc` `l` on((`l`.`Product_id` = `i`.`Product_id`))) join `productcategory` `p` on((`p`.`ProductCategory_id` = `i`.`ProductCategory_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalperorder_view`
--

/*!50001 DROP VIEW IF EXISTS `totalperorder_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalperorder_view` AS select `orderdetails`.`Order_id` AS `order_id`,sum((`orderdetails`.`OrderQuantity` * `orderdetails`.`priceperpiece`)) AS `total` from `orderdetails` group by `orderdetails`.`Order_id` order by `total` desc */;
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

-- Dump completed on 2017-12-14  6:56:17
