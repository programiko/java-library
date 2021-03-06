-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_library
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `debits`
--

DROP TABLE IF EXISTS `debits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debits` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date_of_debit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `return_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `book_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_member` (`member_id`),
  KEY `fk_book` (`book_id`),
  CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debits`
--

LOCK TABLES `debits` WRITE;
/*!40000 ALTER TABLE `debits` DISABLE KEYS */;
INSERT INTO `debits` VALUES (1,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',3,2),(2,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',5,7),(3,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',7,10),(4,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',3,8),(5,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',1,2),(6,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',6,2),(7,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',7,3),(8,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',4,11),(9,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',5,11),(10,'2017-08-24 22:00:00','2017-09-23 22:00:00','zaduzio knjigu dana…',2,11);
/*!40000 ALTER TABLE `debits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-25 12:21:05
