-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: laptop_group5
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('06d6457e-845c-4f05-af2a-a1a6decc672d','5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6','DASD (723273) \nSADAS',NULL,_binary '\0',3),('1433c3c2-d025-4f14-9535-7b72ec0d28f5','1c658c2a-14a1-4522-9943-24a13a56f249','DASD (723273) \nSADAS','2024-12-10',_binary '\0',2),('1b7d7410-b66d-11ef-aacc-93c52050320c','user1','Giao hàng trong giờ hành chính.','2024-12-10',_binary '\0',2),('1b7d91ac-b66d-11ef-aacc-93c52050320c','user2','Gói quà giúp tôi.','2024-12-10',_binary '\0',2),('6dde1957-f80b-42a1-887e-98e5401977b2','1c658c2a-14a1-4522-9943-24a13a56f249','hh (6666) \nhhhh','2024-12-10',_binary '\0',1),('954b61dd-25e6-44e5-a477-dd0b8a472aec','5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6','DASD (723273) \nSADAS','2024-12-10',_binary '',4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 19:40:31
