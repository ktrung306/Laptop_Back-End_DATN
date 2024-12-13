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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(40) NOT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(20) NOT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `discount_type` varchar(20) DEFAULT NULL,
  `discount_value` bigint DEFAULT NULL,
  `sales` bigint DEFAULT NULL,
  `tags` json DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_by` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1b7af1a4-b66d-11ef-aacc-93c52050320c','1b79e0c0-b66d-11ef-aacc-93c52050320c','Laptop Gaming XYZ','laptop-gaming-xyz','https://tinhte.vn/thread/rog-ra-mat-loat-san-pham-laptop-gaming-tai-viet-nam.3660162/','Laptop gaming hiệu năng cao','Laptop gaming với cấu hình mạnh mẽ, phù hợp cho game thủ',20000000,'percentage',10,50,'[\"gaming\", \"high-performance\"]','2024-12-10','2024-12-10','user1'),('1b7b4b18-b66d-11ef-aacc-93c52050320c','1b79f9d4-b66d-11ef-aacc-93c52050320c','Smartphone ABC','smartphone-abc','https://vi.pngtree.com/freepng/blue-water-pattern-fruit-drink-summer-promotion-poster_6249890.html','Điện thoại thông minh cao cấp','Điện thoại với thiết kế sang trọng và hiệu năng vượt trội',15000000,'flat',1000000,100,'[\"android\", \"premium\"]','2024-12-10','2024-12-10','user2');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
