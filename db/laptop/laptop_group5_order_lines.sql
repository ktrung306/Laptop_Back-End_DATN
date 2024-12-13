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
-- Table structure for table `order_lines`
--

DROP TABLE IF EXISTS `order_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_lines` (
  `id` varchar(40) NOT NULL,
  `order_id` varchar(40) NOT NULL,
  `product_id` varchar(40) NOT NULL,
  `price` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lines`
--

LOCK TABLES `order_lines` WRITE;
/*!40000 ALTER TABLE `order_lines` DISABLE KEYS */;
INSERT INTO `order_lines` VALUES ('0177a8b7-3938-4c51-b4c7-855885759be4','1433c3c2-d025-4f14-9535-7b72ec0d28f5','1b7af1a4-b66d-11ef-aacc-93c52050320c',20000000,1,NULL),('10039400-a0f8-4199-9bfe-e0bdb542e9b2','d8b4228b-4eb5-424f-914c-aa6978c4fed4','1b7af1a4-b66d-11ef-aacc-93c52050320c',20000000,1,0),('1b7df9a8-b66d-11ef-aacc-93c52050320c','1b7d7410-b66d-11ef-aacc-93c52050320c','1b7af1a4-b66d-11ef-aacc-93c52050320c',18000000,1,1),('1b7e02e0-b66d-11ef-aacc-93c52050320c','1b7d91ac-b66d-11ef-aacc-93c52050320c','1b7b4b18-b66d-11ef-aacc-93c52050320c',14000000,2,0),('7fc4a2a7-3d10-4cd6-bd5c-211425a42ee0','954b61dd-25e6-44e5-a477-dd0b8a472aec','1b7af1a4-b66d-11ef-aacc-93c52050320c',20000000,1,NULL),('a18b5c9f-85d7-4f54-ba24-ad89c34bbd30','06d6457e-845c-4f05-af2a-a1a6decc672d','1b7b4b18-b66d-11ef-aacc-93c52050320c',15000000,1,NULL),('ad86675d-6576-44d1-a739-a1c78330f329','6dde1957-f80b-42a1-887e-98e5401977b2','1b7af1a4-b66d-11ef-aacc-93c52050320c',20000000,1,NULL);
/*!40000 ALTER TABLE `order_lines` ENABLE KEYS */;
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
