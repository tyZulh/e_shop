-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e-shop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Order_has_Product`
--

DROP TABLE IF EXISTS `Order_has_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_has_Product` (
  `Order_id` int NOT NULL,
  `Product_id` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Order_id`,`Product_id`),
  KEY `fk_Order_has_Product_Product1_idx` (`Product_id`),
  KEY `fk_Order_has_Product_Order1_idx` (`Order_id`),
  CONSTRAINT `fk_Order_has_Product_Order1` FOREIGN KEY (`Order_id`) REFERENCES `Order` (`id`),
  CONSTRAINT `fk_Order_has_Product_Product1` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_has_Product`
--

LOCK TABLES `Order_has_Product` WRITE;
/*!40000 ALTER TABLE `Order_has_Product` DISABLE KEYS */;
INSERT INTO `Order_has_Product` VALUES (3,1,2),(4,1,2),(4,2,1),(5,1,2),(5,2,1),(6,1,2),(6,2,1),(7,1,2),(7,2,1),(8,1,2),(8,2,1),(9,1,2),(9,2,1),(10,1,2),(10,2,1),(11,1,2),(11,2,1),(12,1,2),(12,2,1),(13,1,2),(13,2,1),(14,1,2),(14,2,1),(15,1,2),(15,2,1),(16,1,2),(16,2,1),(17,1,2),(17,2,1),(18,1,2),(18,2,1),(19,1,2),(19,2,1),(20,1,2),(20,2,1);
/*!40000 ALTER TABLE `Order_has_Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-06  1:27:32
