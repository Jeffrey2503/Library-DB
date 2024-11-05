-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `borrowed`
--

DROP TABLE IF EXISTS `borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed` (
  `ISBN` varchar(13) NOT NULL,
  `SSN` varchar(9) NOT NULL,
  `loan_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `Borrow_ID` varchar(4) DEFAULT NULL,
  `CopyNumber` varchar(6) NOT NULL,
  KEY `ISBN` (`ISBN`),
  KEY `SSN` (`SSN`),
  KEY `fk_borrowed_copy_number` (`CopyNumber`),
  CONSTRAINT `borrowed_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`isbn`),
  CONSTRAINT `borrowed_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `member` (`ssn`),
  CONSTRAINT `fk_borrowed_copy_number` FOREIGN KEY (`CopyNumber`) REFERENCES `bookcopy` (`Copy_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed`
--

LOCK TABLES `borrowed` WRITE;
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
INSERT INTO `borrowed` VALUES ('1234567890123','123456789','2023-04-27','2023-05-11','Borrowed','0001','C00001'),('9780786838653','664578565','2023-01-15','2023-04-15','overdue','0002','C00004'),('9781569319208','123456789','2023-04-20','2023-05-04','borrowed','0003','C00006'),('9780439023511','987321654','2022-08-05','2022-11-05','Overdue','0007','C00002'),('9780590353427','456789123','2022-01-15','2022-04-15','Overdue','0008','C00003'),('9780786838653','321654321','2022-08-05','2022-11-05','Overdue','0007','C00004');
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-07 17:17:54
