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
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('19399ac2-5cf9-403d-9bc9-220eb568e7fe','1c658c2a-14a1-4522-9943-24a13a56f249',NULL,'1433c3c2-d025-4f14-9535-7b72ec0d28f5',2,'kjhnk',NULL),('1b7ba39c-b66d-11ef-aacc-93c52050320c','user1','1b79e0c0-b66d-11ef-aacc-93c52050320c','1b7af1a4-b66d-11ef-aacc-93c52050320c',5,'Sản phẩm tuyệt vời, hiệu năng cao.','2024-12-10'),('1b7bb56c-b66d-11ef-aacc-93c52050320c','user2','1b79f9d4-b66d-11ef-aacc-93c52050320c','1b7b4b18-b66d-11ef-aacc-93c52050320c',4,'Thiết kế đẹp, nhưng giá hơi cao.','2024-12-10'),('27aaf0e8-2c63-41d8-83c3-09a9e4d84a6e','5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6',NULL,'06d6457e-845c-4f05-af2a-a1a6decc672d',4,'jhgkhj',NULL),('4706edc4-95eb-4f75-a338-234aabbace24','1c658c2a-14a1-4522-9943-24a13a56f249',NULL,'1433c3c2-d025-4f14-9535-7b72ec0d28f5',4,'asaaa',NULL),('6307ab33-4aea-425a-b83b-6d2768824997','1c658c2a-14a1-4522-9943-24a13a56f249',NULL,'1433c3c2-d025-4f14-9535-7b72ec0d28f5',4,'kjhnk',NULL),('6c243be7-9df6-4c0c-b829-58c51b22fd95','1c658c2a-14a1-4522-9943-24a13a56f249',NULL,'1433c3c2-d025-4f14-9535-7b72ec0d28f5',2,'asaaa',NULL),('cac8f815-4980-4b05-b9aa-5297b9c36497','5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6',NULL,'06d6457e-845c-4f05-af2a-a1a6decc672d',4,'asad',NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
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
