-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: TicketBookingSystem
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

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
-- Table structure for table `bus_detail`
--

DROP TABLE IF EXISTS `bus_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_detail` (
  `busId` int NOT NULL AUTO_INCREMENT,
  `busName` varchar(255) NOT NULL,
  `busNo` varchar(255) NOT NULL,
  `totalSeats` int NOT NULL,
  `availableSeats` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`busId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_detail`
--

LOCK TABLES `bus_detail` WRITE;
/*!40000 ALTER TABLE `bus_detail` DISABLE KEYS */;
INSERT INTO `bus_detail` VALUES (1,'Darshan Express','111',100,98,170),(2,'Bharat Ganga','324',150,150,200);
/*!40000 ALTER TABLE `bus_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_route`
--

DROP TABLE IF EXISTS `bus_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_route` (
  `routeId` int NOT NULL AUTO_INCREMENT,
  `stopNo` int NOT NULL,
  `stopName` varchar(255) NOT NULL,
  `busId` int DEFAULT NULL,
  `arrivalTime` time NOT NULL,
  `departTime` time NOT NULL,
  PRIMARY KEY (`routeId`),
  KEY `FK_8b294630e635df1b2d0b4475093` (`busId`),
  CONSTRAINT `FK_8b294630e635df1b2d0b4475093` FOREIGN KEY (`busId`) REFERENCES `bus_detail` (`busId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_route`
--

LOCK TABLES `bus_route` WRITE;
/*!40000 ALTER TABLE `bus_route` DISABLE KEYS */;
INSERT INTO `bus_route` VALUES (4,1,'Vapi',1,'10:30:00','10:35:00'),(5,2,'Valsad',1,'11:30:00','11:35:00'),(6,3,'Navsari',1,'13:30:00','13:35:00'),(7,4,'Surat',1,'14:00:00','14:10:00'),(8,1,'Borivali',2,'09:00:00','09:10:00'),(9,2,'Palghar',2,'10:30:00','10:35:00'),(10,3,'Vapi',2,'12:40:00','12:42:00'),(11,4,'Surat',2,'14:40:00','14:42:00'),(12,5,'Vadodara',2,'16:40:00','16:45:00');
/*!40000 ALTER TABLE `bus_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductor_detail`
--

DROP TABLE IF EXISTS `conductor_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductor_detail` (
  `conductor_id` int NOT NULL AUTO_INCREMENT,
  `cond_name` varchar(255) NOT NULL,
  `cond_gender` varchar(255) NOT NULL,
  `cond_contact` int NOT NULL,
  `cond_age` int NOT NULL,
  `cond_role` tinyint NOT NULL,
  `busBusId` int DEFAULT NULL,
  PRIMARY KEY (`conductor_id`),
  KEY `FK_552a519a39a5ce5b776daeb6784` (`busBusId`),
  CONSTRAINT `FK_552a519a39a5ce5b776daeb6784` FOREIGN KEY (`busBusId`) REFERENCES `bus_detail` (`busId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor_detail`
--

LOCK TABLES `conductor_detail` WRITE;
/*!40000 ALTER TABLE `conductor_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `conductor_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `passengerId` int NOT NULL AUTO_INCREMENT,
  `seatNo` int DEFAULT NULL,
  `ticketId` int DEFAULT NULL,
  `passengerName` varchar(255) NOT NULL,
  `passengerAge` varchar(255) NOT NULL,
  `passengerGender` varchar(255) NOT NULL,
  PRIMARY KEY (`passengerId`),
  KEY `FK_2ef5b58e50636a1cfa6e5b3cfdd` (`ticketId`),
  CONSTRAINT `FK_2ef5b58e50636a1cfa6e5b3cfdd` FOREIGN KEY (`ticketId`) REFERENCES `ticket_detail` (`ticketId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (12,NULL,15,'kajal','22','female'),(13,NULL,16,'dfgfg','34','fgfg'),(14,2,17,'Visha','22','female'),(15,NULL,18,'Kajal','22','female');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_detail`
--

DROP TABLE IF EXISTS `ticket_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_detail` (
  `ticketId` int NOT NULL AUTO_INCREMENT,
  `ticketDate` datetime NOT NULL,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `userId` int DEFAULT NULL,
  `busId` int DEFAULT NULL,
  `bookedAt` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `deletedAt` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `FK_9e5035b32a7d754471ceec98684` (`userId`),
  KEY `FK_c18e7e245633441b32e77ada0ba` (`busId`),
  CONSTRAINT `FK_9e5035b32a7d754471ceec98684` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_c18e7e245633441b32e77ada0ba` FOREIGN KEY (`busId`) REFERENCES `bus_detail` (`busId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_detail`
--

LOCK TABLES `ticket_detail` WRITE;
/*!40000 ALTER TABLE `ticket_detail` DISABLE KEYS */;
INSERT INTO `ticket_detail` VALUES (15,'2024-08-06 00:00:00','Vapi','Surat',1,1,'2024-08-05 04:28:19.068215',NULL),(16,'2024-08-06 00:00:00','Vapi','Surat',1,1,'2024-08-05 04:35:28.816648',NULL),(17,'2024-08-06 00:00:00','Vapi','Surat',1,1,'2024-08-05 04:39:21.514619',NULL),(18,'2024-08-07 00:00:00','Vapi','Surat',1,1,'2024-08-05 05:11:30.950610',NULL);
/*!40000 ALTER TABLE `ticket_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_payment`
--

DROP TABLE IF EXISTS `ticket_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_payment` (
  `paymentId` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `userId` int DEFAULT NULL,
  `paymentDate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `sessionId` varchar(255) NOT NULL,
  `ticektId` int DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  UNIQUE KEY `REL_726dc57088bd0cc1cd7b0ce104` (`ticektId`),
  KEY `FK_69de892df017b03dcfd98feb97e` (`userId`),
  CONSTRAINT `FK_69de892df017b03dcfd98feb97e` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_726dc57088bd0cc1cd7b0ce104b` FOREIGN KEY (`ticektId`) REFERENCES `ticket_detail` (`ticketId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_payment`
--

LOCK TABLES `ticket_payment` WRITE;
/*!40000 ALTER TABLE `ticket_payment` DISABLE KEYS */;
INSERT INTO `ticket_payment` VALUES (1,200,0,NULL,'2024-08-02 12:08:51.739965','cs_test_a1vEn3LL8RVxBZiTxFCroSHw1YsL6KVyy28mdSQnQSyOvEmrwIvp6kg6g3',NULL),(2,340,0,NULL,'2024-08-05 04:16:26.120050','cs_test_a1TfWodgrgV5Xg4X8smqhURjntyssVfSaYSz7D2bu0Q0Av7KMAnLqEZmev',NULL),(3,340,0,NULL,'2024-08-05 04:20:44.473307','cs_test_a1fMUNg0tGZ7PsW2zRXtnc6EbK3bzcoSLoGhu1cUtRO965lcpeYCX1e6UT',NULL),(4,170,0,NULL,'2024-08-05 04:28:19.944467','cs_test_a1xWnQYpdeJGsIDqFns3aim0xiEYoLUr1EKv5caModk40Ob6DqpJdzAj2a',NULL),(5,170,0,NULL,'2024-08-05 04:35:29.728107','cs_test_a1T5gMMhmnaaqYx46FilX5H5eJIwCdhPUp1znmJiJAxFFf8nQrMxmgelqX',NULL),(6,170,0,NULL,'2024-08-05 04:39:22.483980','cs_test_a1dBZOHDjFSG5mWONCGe3VCc4W59PE0r9XpSa6rOhMaktf1pc4MseNFnHn',NULL),(7,170,0,NULL,'2024-08-05 05:11:31.863590','cs_test_a17bakwPAxLevECADIqR5cKl5qTG5iAoY1maU63uCwlZQJxXLlXt7wZqCW',18);
/*!40000 ALTER TABLE `ticket_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contact` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kajal ','Soni','Female',1234567890,'kajal@gmail.com','$2b$10$XxP0Oi2mXu95oGDAuSEhXuE8R31yFsfmPsTIR9U4mFbwXb7aEbrSW'),(2,'Karishma','Soni','Female',1234567890,'karishnma@gmail.com','$2b$10$HWqau8Nn4MLoLqjPe5t2d.cUqrO6kdCFng/SGvI2bqsP7P2DRDcia');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-07 16:20:30
