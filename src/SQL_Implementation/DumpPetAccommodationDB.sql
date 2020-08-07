-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: petaccommodationdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bed`
--

DROP SCHEMA IF EXISTS `petaccommodationdb`;
CREATE SCHEMA `petaccommodationdb`;
USE `petaccommodationdb`;

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bed` (
  `ID_Bed` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_Room` int(10) unsigned NOT NULL,
  `Species` enum('Cat','Dog') DEFAULT NULL,
  `Particularity` tinytext,
  `Size` enum('S','M','L') DEFAULT NULL,
  `Mattress` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Bed`),
  UNIQUE KEY `ID_Bed_UNIQUE` (`ID_Bed`),
  KEY `ID_Room_idx` (`ID_Room`),
  CONSTRAINT `ID_Room1` FOREIGN KEY (`ID_Room`) REFERENCES `room` (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,4,'Dog','Orthopedic','M',_binary '\0'),(2,6,'Cat','wicker basket','M',_binary '\0'),(3,4,'Dog','Hard_matress','M',_binary ''),(4,3,'Dog','Orthopedic','M',_binary ''),(5,6,'Dog','Outdoor','L',_binary ''),(6,3,'Cat','plastic basket','M',_binary ''),(7,8,'Cat','cat igloo','L',_binary ''),(8,3,'Dog','Hard_matress','M',_binary ''),(9,4,'Cat','cat hammocks','M',_binary ''),(10,5,'Cat','cat hammocks','M',_binary ''),(11,4,'Dog','Heated','M',_binary ''),(12,8,'Cat','cat igloo','L',_binary '\0'),(13,9,'Dog','Hammock','S',_binary ''),(14,4,'Cat','donut cat','S',_binary ''),(15,4,'Cat','Outdoor','L',_binary ''),(16,7,'Dog','cat igloo','M',_binary ''),(17,2,'Dog','Hammock','S',_binary '\0'),(23,5,'Dog','Hardmatress','M',_binary '');
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bedsandrooms`
--

DROP TABLE IF EXISTS `bedsandrooms`;
/*!50001 DROP VIEW IF EXISTS `bedsandrooms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `bedsandrooms` AS SELECT 
 1 AS `idRoom`,
 1 AS `RoomName`,
 1 AS `id_bed`,
 1 AS `petSpecies`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buy` (
  `ID_Service` int(10) unsigned NOT NULL,
  `ATOwner` varchar(25) NOT NULL,
  `FromDay` datetime NOT NULL,
  `ToDay` datetime NOT NULL,
  `OwnerNotices` tinytext,
  PRIMARY KEY (`ID_Service`,`ATOwner`),
  KEY `ATOwner_idx` (`ATOwner`),
  CONSTRAINT `ATOwner1` FOREIGN KEY (`ATOwner`) REFERENCES `petowner` (`atowner`),
  CONSTRAINT `ID_Service` FOREIGN KEY (`ID_Service`) REFERENCES `service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (1,'TY487240','2018-01-15 00:00:00','2018-02-18 00:00:00','allergia sthn rigani'),(2,'NM569123','2018-01-15 00:00:00','2018-01-20 00:00:00','NULL'),(3,'NM569123','2018-01-15 00:00:00','2018-01-15 00:00:00','NULL'),(4,'NM569123','2018-01-15 00:00:00','2018-01-17 00:00:00','NULL'),(5,'EP658023','2018-10-28 00:00:00','2018-11-03 00:00:00','NULL'),(6,'EP658023','2018-10-28 00:00:00','2018-12-28 00:00:00','NULL'),(7,'HK473292','2019-01-14 00:00:00','2019-01-24 00:00:00','NULL'),(8,'HK473292','2019-01-14 00:00:00','2019-01-18 00:00:00','NULL'),(9,'YE093212','2019-01-28 00:00:00','2019-04-02 00:00:00','NULL'),(10,'YE093212','2019-01-02 00:00:00','2019-04-02 00:00:00','Kourazete eukola opote aplh e3askhsh'),(11,'OI392544','2019-01-02 00:00:00','2019-09-02 00:00:00','NULL'),(12,'OI392544','2019-01-02 00:00:00','2019-04-02 00:00:00','NULL'),(13,'OI392544','2019-04-02 00:00:00','2019-09-02 00:00:00','NULL'),(14,'KE563829','2019-01-04 00:00:00','2019-05-04 00:00:00','Allergia sthn kanela'),(15,'KE563829','2019-01-04 00:00:00','2019-05-04 00:00:00','NULL'),(16,'OA628492','2019-01-06 00:00:00','2019-05-06 00:00:00','NULL'),(17,'TI102938','2019-07-25 00:00:00','2019-07-27 00:00:00','NULL'),(18,'PO564738','2018-05-05 00:00:00','2018-05-15 00:00:00','NULL'),(20,'HA784523','2018-12-28 00:00:00','2018-12-31 00:00:00','NULL'),(21,'PI384715','2018-12-29 00:00:00','2018-12-31 00:00:00','NULL'),(22,'HO542814','2018-12-18 00:00:00','2018-12-24 00:00:00','NULL'),(23,'HI941839','2018-12-26 00:00:00','2018-12-31 00:00:00','NULL'),(24,'HI941839','2018-12-26 00:00:00','2018-12-31 00:00:00','NULL');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doactivity`
--

DROP TABLE IF EXISTS `doactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doactivity` (
  `ID_Pet` int(10) unsigned NOT NULL,
  `ID_Room` int(10) unsigned NOT NULL,
  `ATEmployee` varchar(25) NOT NULL,
  `Date` datetime NOT NULL,
  `Duration` int(10) unsigned NOT NULL,
  `Type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_Pet`,`ID_Room`,`ATEmployee`),
  KEY `ID_Room_idx` (`ID_Room`),
  KEY `ATEmployee_idx` (`ATEmployee`),
  CONSTRAINT `ATEmployee1` FOREIGN KEY (`ATEmployee`) REFERENCES `employee` (`atemployee`),
  CONSTRAINT `ID_Pet1` FOREIGN KEY (`ID_Pet`) REFERENCES `pet` (`id_pet`),
  CONSTRAINT `ID_Room2` FOREIGN KEY (`ID_Room`) REFERENCES `room` (`id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doactivity`
--

LOCK TABLES `doactivity` WRITE;
/*!40000 ALTER TABLE `doactivity` DISABLE KEYS */;
INSERT INTO `doactivity` VALUES (1,10,'OK563292','2018-01-15 00:00:00',60,'Fun time'),(2,1,'NO582814','2018-01-15 00:00:00',15,'Bathing'),(3,15,'IA828492','2018-10-28 00:00:00',30,'Training'),(4,1,'NO582814','2019-01-14 00:00:00',10,'Bathing'),(5,12,'PH564238','2019-01-28 00:00:00',45,'Fun time'),(6,11,'KI946839','2019-02-01 00:00:00',50,'Fun time'),(7,10,'OK563292','2019-02-01 00:00:00',60,'Fun time'),(8,11,'KI946839','2019-04-01 00:00:00',60,'Fun time'),(9,10,'OK563292','2019-06-01 00:00:00',60,'Fun time'),(10,10,'OK563292','2019-07-25 00:00:00',60,'Fun time'),(11,1,'NO582814','2018-05-05 00:00:00',15,'Bathing'),(12,11,'KI946839','2018-12-28 00:00:00',50,'Fun time'),(13,11,'KI946839','2018-12-29 00:00:00',45,'Fun time'),(14,12,'PH564238','2018-12-26 00:00:00',50,'Fun time');
/*!40000 ALTER TABLE `doactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `ATEmployee` varchar(25) NOT NULL,
  `Job` varchar(40) NOT NULL,
  `YearsOfExperience` int(11) DEFAULT NULL,
  `Specialization` varchar(40) DEFAULT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(40) DEFAULT NULL,
  `AFM` varchar(25) NOT NULL,
  `PhoneNumber` varchar(25) NOT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Αvailability` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ATEmployee`),
  UNIQUE KEY `ATEmployee_UNIQUE` (`ATEmployee`),
  UNIQUE KEY `AFM_UNIQUE` (`AFM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('EI387715','Caretaker',5,'Training','Jack','Daniel','546867217','6954283751','Estrella 7','ken_biral@gmail.com',_binary ''),('EY093712','Animal Trainer',20,'MarineMammals','Mike','Alan','564546202','6932300585','Bronx 114','krikri@yahoo.com',_binary '\0'),('IA784323','Animal Trainer',30,'Veterinarian','Dan','Notariem','977834251','6934382145','Heraklus 83','leoforos13@windowslive.com',_binary ''),('IA828492','Animal Trainer',13,'AnimalBehavioral','John','Savatzer','214595763','6977477511','Ontarel 80','righthat@yahoo.com',_binary ''),('IO822544','Animal Trainer',25,'AnimalBehavioral','Alex','Clifford','258969841','6977833545','Malakasa 23','kones@hotmail.com',_binary '\0'),('KI946839','Caretaker',14,'Veterinarian','Jeremy','Walker','589965256','6956196384','Onirtha 6','everythingisnotok@gmail.com',_binary ''),('MN569167','Cleaner',12,'OdorsDisappear','Derek','Walker','859765837','6957765728','Katerian 45','geogr_yo@yahoo.com',_binary ''),('NO582814','Cleaner',11,'OdorsDisappear','Pat','Patanakis','852301471','6983172319','Montreal 1','canastel@gmail.com',_binary '\0'),('OE562829','Cleaner',10,'OdorsDisappear','Ivan','Crouz','343147890','6977866396','Latern 7','crazer@gmail.com',_binary ''),('OK563292','Caretaker',6,'Vaccines/euthanize','Nick','Drinkwater','345467998','6978512151','Manhatan 285','osterl@windowslive.com',_binary ''),('PH564238','Caretaker',3,'Training','George','Fanoler','778400495','6962282154','Gaziella 81','sol_pason@gmail.com',_binary ''),('PP658023','Caretaker',7,'PetGroomer','Max','Jerenal','938626784','6971365325','Saint Marin 13','tifozi@gmail.com',_binary '\0'),('TO222938','Caretaker',8,'Exercise','George','Octapus','785455112','6973351245','Peramor 11','killahPir@gmail.com',_binary ''),('YT487234','Animal Trainer',15,'GuideDogs','Anty','Smith','564349582','6943375733','Olympoy 1','perieyn@windowslive.com',_binary '');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emptybeds`
--

DROP TABLE IF EXISTS `emptybeds`;
/*!50001 DROP VIEW IF EXISTS `emptybeds`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `emptybeds` AS SELECT 
 1 AS `idRoom`,
 1 AS `RoomName`,
 1 AS `id_bed`,
 1 AS `petSpecies`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pet` (
  `ID_Pet` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Breed` varchar(25) DEFAULT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Species` enum('Cat','Dog') DEFAULT NULL,
  `Age` decimal(6,3) unsigned DEFAULT NULL,
  `Weight` decimal(6,3) unsigned DEFAULT NULL,
  `Color` varchar(25) DEFAULT NULL,
  `ID_Bed` int(10) unsigned NOT NULL,
  `ATOwner` varchar(25) NOT NULL,
  `Sterilization` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Pet`),
  UNIQUE KEY `ID_Pet_UNIQUE` (`ID_Pet`),
  UNIQUE KEY `ID_Bed_UNIQUE` (`ID_Bed`),
  KEY `ID_Bed_idx` (`ID_Bed`),
  KEY `ATOwner_idx` (`ATOwner`),
  CONSTRAINT `ATOwner2` FOREIGN KEY (`ATOwner`) REFERENCES `petowner` (`atowner`),
  CONSTRAINT `ID_Bed` FOREIGN KEY (`ID_Bed`) REFERENCES `bed` (`id_bed`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (1,'yorkshire terrier','Rex','Dog',2.000,5.550,'Grey',1,'TY487240',_binary '\0'),(2,'Russian Blue','Mike','Cat',4.000,4.600,'Black',2,'NM569123',_binary ''),(3,'Labrador Retriever','Doggo','Dog',10.000,9.500,'Brown',3,'EP658023',_binary '\0'),(4,'Pug','Puppie','Dog',4.000,4.300,'White',4,'HK473292',_binary ''),(5,'Dachshund','Moly','Dog',8.000,9.100,'Grey',5,'YE093212',_binary ''),(6,'Persian','Holy','Cat',2.000,4.300,'Brown',6,'OI392544',_binary '\0'),(7,'Siamese','Greg','Cat',6.000,7.500,'White',7,'KE563829',_binary ''),(8,'Poodle','Ivan','Dog',6.000,5.600,'Black',8,'OA628492',_binary ''),(9,'Munchin','Hermiony','Cat',9.000,7.100,'Black',9,'TI102938',_binary ''),(10,'Maine Coon','Pat','Cat',3.000,6.500,'Grey',10,'PO564738',_binary ''),(11,'German Sepherd','Max','Dog',5.000,6.700,'White',11,'HA784523',_binary '\0'),(12,'Ragdoll','Alex','Cat',2.000,9.300,'Brown',12,'PI384715',_binary ''),(13,'Dobermann','Scandal','Dog',1.000,1.500,'Yellow',13,'HO542814',_binary ''),(14,'Himalayan','Garfield','Cat',8.000,4.900,'White',14,'HI941839',_binary '\0');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `petactivitiesemployee`
--

DROP TABLE IF EXISTS `petactivitiesemployee`;
/*!50001 DROP VIEW IF EXISTS `petactivitiesemployee`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `petactivitiesemployee` AS SELECT 
 1 AS `petName`,
 1 AS `petSpecies`,
 1 AS `petBreed`,
 1 AS `RoomName`,
 1 AS `SpaceType`,
 1 AS `ActType`,
 1 AS `ActDate`,
 1 AS `employeeJob`,
 1 AS `EmplName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `petowner`
--

DROP TABLE IF EXISTS `petowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `petowner` (
  `ATOwner` varchar(25) NOT NULL,
  `Visits` int(10) unsigned DEFAULT '0',
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(40) DEFAULT NULL,
  `AFM` varchar(25) DEFAULT NULL,
  `PhoneNumber` varchar(25) NOT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Member` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ATOwner`),
  UNIQUE KEY `ATOwner_UNIQUE` (`ATOwner`),
  UNIQUE KEY `AFM_UNIQUE` (`AFM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petowner`
--

LOCK TABLES `petowner` WRITE;
/*!40000 ALTER TABLE `petowner` DISABLE KEYS */;
INSERT INTO `petowner` VALUES ('EP658023',1,'Dan','Smoth','938625024','6973365325','Saint Marin 23','papifi@gmail.com',_binary '\0'),('HA784523',8,'Eki','Gonzales','977841451','6932782145','Heraklus 81','leoforos@windowslive.com',_binary ''),('HI941839',4,'Alex','Katralex','589128256','6979196384','Onirtha 69','everything@gmail.com',_binary '\0'),('HK473292',1,'Eric','Smith','345486998','6978512141','Manhatan 2','boriza_kratos@windowslive.com',_binary ''),('HO542814',1,'Mike','Cohones','852369471','6981572319','Montreal 8','canada_rules@gmail.com',_binary '\0'),('KE563829',1,'Dani','Alves','343567890','6977852396','Latern 72','crazy_player@gmail.com',_binary ''),('NM569123',13,'George','Geran','859305837','6954765728','Katerian 43','geor_anty@yahoo.com',_binary '\0'),('OA628492',1,'Nick','Cave','214578963','6977454511','Ontarel 8','right_red_hat@yahoo.com',_binary '\0'),('OI392544',7,'Mike','Konak','258963741','6977845545','Malakasa 33','konaki_koupes@hotmail.com',_binary ''),('PI384715',10,'Ken','Barbos','548963217','6953483751','Estrella 57','ken_barbie@gmail.com',_binary '\0'),('PO564738',16,'Jennaro','Gattuso','778452895','6965782154','Gaziella 65','solo_passion@gmail.com',_binary ''),('TI102938',3,'Rambo','Stallone','787845112','6978451245','Peramor 112','killer@gmail.com',_binary ''),('TY487240',2,'Nick','Greaker','564729582','6943375732','Olympoy 19','perMan@windowslive.com',_binary ''),('YE093212',6,'John','Staham','564839202','6932325585','Bronx 115','praktor@yahoo.com',_binary '\0');
/*!40000 ALTER TABLE `petowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `petwithowner`
--

DROP TABLE IF EXISTS `petwithowner`;
/*!50001 DROP VIEW IF EXISTS `petwithowner`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `petwithowner` AS SELECT 
 1 AS `idpet`,
 1 AS `petName`,
 1 AS `ATOwner`,
 1 AS `FName`,
 1 AS `LName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `ID_Room` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MaxNumOfPets` int(10) unsigned NOT NULL,
  `SpaceType` varchar(40) NOT NULL,
  `RoomName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_Room`),
  UNIQUE KEY `ID_Room_UNIQUE` (`ID_Room`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,10,'Bathroom','Artemis1'),(2,20,'Bathroom','Artemis2'),(3,25,'Bathroom','SensitiveSoul'),(4,20,'Bedroom','SensitiveSoul'),(5,25,'Bedroom','Kalliopi1'),(6,30,'Bedroom','Kalliopi2'),(7,35,'Bedroom','Whatever'),(8,40,'Bedroom','Sleep'),(9,10,'Bedroom','Galaxy'),(10,50,'Fun place','HakunaMatata'),(11,60,'Fun place','WhatAWonderful'),(12,55,'Fun place','SensitiveSoul'),(13,45,'Fun place','Paradise'),(14,140,'Outdoor','NoPassingCraze'),(15,3,'Training area','ItMeansNo'),(16,5,'Training area','Savannah');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service` (
  `ID_Service` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CostPerDay` decimal(8,2) NOT NULL,
  `ServiceName` varchar(25) NOT NULL,
  `MemberDiscount` int(11) DEFAULT '0',
  `SerciveInformations` tinytext,
  PRIMARY KEY (`ID_Service`),
  UNIQUE KEY `ID_Service_UNIQUE` (`ID_Service`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,8.00,'Lodging with food',0,'Fun time foodwalk'),(2,10.00,'Lodging with food',25,'Fun timefoodwalk'),(3,7.00,'Bath',5,'Fear of water'),(4,10.00,'Training',15,'obedience training '),(5,10.00,'Lodging with food',5,'Fun time warnings at walks fish food'),(6,10.00,'Exercise',0,'Hard workout needed'),(7,10.00,'Training',0,'Basics Instructions'),(8,15.00,'Lodging with food',10,'AllergyFish a lot of walks fun time'),(9,2.00,'Lodging with food',10,'Only chicken food fun time less walks'),(10,5.00,'Exercise',5,'Medium level of exercise'),(11,5.00,'Lodging with food',5,'Fun timefoodwalk'),(12,10.00,'Exercise',0,'Low level of exercise'),(13,15.00,'Training',5,'obedience training '),(14,5.00,'Bath',0,'Fear of water'),(15,15.00,'Lodging with food',5,'Violence behavior food with calf a lot o walks'),(16,15.00,'Lodging with food',0,'Fun timefoodwalk'),(17,15.00,'Lodging with food',5,'A lot of fun time less food walks'),(18,15.00,'Lodging with food',15,'Fun timefoodwalk'),(19,10.00,'Exercise',10,'Simple exercise'),(20,16.00,'Lodging with food',0,'More food needed a lot of walks Fun time'),(21,15.00,'Lodging with food',0,'Fun time foodwalk'),(22,15.00,'Lodging with food',0,'AllergyChicken food walks fun time'),(23,15.00,'Lodging with food',0,'Fun timefoodwalk'),(24,8.00,'Bath',10,'Fear of water');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takecareof`
--

DROP TABLE IF EXISTS `takecareof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `takecareof` (
  `ID_Pet` int(10) unsigned NOT NULL,
  `ATEmployee` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_Pet`,`ATEmployee`),
  KEY `ATEmployee_idx` (`ATEmployee`) /*!80000 INVISIBLE */,
  CONSTRAINT `ATEmployee2` FOREIGN KEY (`ATEmployee`) REFERENCES `employee` (`atemployee`),
  CONSTRAINT `ID_Pet2` FOREIGN KEY (`ID_Pet`) REFERENCES `pet` (`id_pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takecareof`
--

LOCK TABLES `takecareof` WRITE;
/*!40000 ALTER TABLE `takecareof` DISABLE KEYS */;
INSERT INTO `takecareof` VALUES (1,'KI946839'),(2,'OK563292'),(3,'PH564238'),(4,'YT487234'),(5,'OK563292'),(6,'PH564238'),(7,'OK563292'),(8,'KI946839'),(9,'YT487234'),(10,'KI946839'),(11,'IA828492'),(12,'KI946839'),(13,'OK563292'),(14,'IA828492');
/*!40000 ALTER TABLE `takecareof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bedsandrooms`
--

/*!50001 DROP VIEW IF EXISTS `bedsandrooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bedsandrooms` AS select `t1`.`ID_Room` AS `idRoom`,`t2`.`RoomName` AS `RoomName`,`t1`.`ID_Bed` AS `id_bed`,`t1`.`Species` AS `petSpecies` from ((select `bed`.`Species` AS `Species`,`bed`.`ID_Bed` AS `ID_Bed`,`bed`.`ID_Room` AS `ID_Room` from `bed`) `t1` join (select `room`.`ID_Room` AS `ID_Room`,`room`.`RoomName` AS `RoomName` from `room`) `t2` on((`t1`.`ID_Room` = `t2`.`ID_Room`))) order by `t1`.`ID_Room` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emptybeds`
--

/*!50001 DROP VIEW IF EXISTS `emptybeds`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emptybeds` AS select `t1`.`idRoom` AS `idRoom`,`t1`.`RoomName` AS `RoomName`,`t1`.`id_bed` AS `id_bed`,`t1`.`petSpecies` AS `petSpecies` from (select `bedsandrooms`.`idRoom` AS `idRoom`,`bedsandrooms`.`RoomName` AS `RoomName`,`bedsandrooms`.`id_bed` AS `id_bed`,`bedsandrooms`.`petSpecies` AS `petSpecies`,`pet`.`ID_Pet` AS `ID_Pet` from (`bedsandrooms` left join `pet` on((`bedsandrooms`.`id_bed` = `pet`.`ID_Bed`)))) `t1` where isnull(`t1`.`ID_Pet`) order by `t1`.`idRoom`,`t1`.`id_bed` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `petactivitiesemployee`
--

/*!50001 DROP VIEW IF EXISTS `petactivitiesemployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `petactivitiesemployee` AS select `pet`.`Name` AS `petName`,`pet`.`Species` AS `petSpecies`,`pet`.`Breed` AS `petBreed`,`room`.`RoomName` AS `RoomName`,`room`.`SpaceType` AS `SpaceType`,`doactivity`.`Type` AS `ActType`,`doactivity`.`Date` AS `ActDate`,`employee`.`Job` AS `employeeJob`,`employee`.`LastName` AS `EmplName` from (((`pet` join `doactivity` on((`pet`.`ID_Pet` = `doactivity`.`ID_Pet`))) join `room` on((`room`.`ID_Room` = `doactivity`.`ID_Room`))) join `employee` on((`employee`.`ATEmployee` = `doactivity`.`ATEmployee`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `petwithowner`
--

/*!50001 DROP VIEW IF EXISTS `petwithowner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `petwithowner` AS select `pet`.`ID_Pet` AS `idpet`,`pet`.`Name` AS `petName`,`petowner`.`ATOwner` AS `ATOwner`,`petowner`.`FirstName` AS `FName`,`petowner`.`LastName` AS `LName` from (`pet` join `petowner` on((`pet`.`ATOwner` = `petowner`.`ATOwner`))) */;
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

-- Dump completed on 2018-12-24  0:51:54
