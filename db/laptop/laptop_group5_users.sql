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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(40) NOT NULL,
  `slug` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` text,
  `locale` json DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(10) DEFAULT 'user',
  `age` int DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'0',
  `is_deleted` bit(1) DEFAULT b'0',
  `gender` enum('Nam','Nữ','Khác') DEFAULT 'Khác',
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1c658c2a-14a1-4522-9943-24a13a56f249',NULL,'Nguyễn','https://firebasestorage.googleapis.com/v0/b/sale-laptop.firebasestorage.app/o/uploads%2F1733828426539.jpg?alt=media&token=2e65d3cc-bb73-44ff-9254-d6143471c604',NULL,'abcd@gmail.com','user',0,NULL,NULL,NULL,NULL,'0328965827',NULL,_binary '',_binary '\0','Nam','2002-12-09'),('5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6',NULL,'abdh',NULL,NULL,'truongzxs2@gmail.com','user',0,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',_binary '\0','Khác',NULL),('a03ef9d0-320d-4a08-a289-75fbb8221f73',NULL,'abcd',NULL,NULL,'truongzxs@gmail.com','admin',0,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',_binary '\0','Khác',NULL),('dc82f456-b66c-11ef-aacc-93c52050320c','nguyen-van-a','Nguyễn Văn A','https://vi.pngtree.com/freepng/hello-summer-sale-banner_5386111.html','{\"language\": \"vi\", \"timezone\": \"GMT+7\"}','nguyenvana@example.com','admin',30,'2024-12-10','2024-12-10','Quản lý cửa hàng','123 Đường A, Hà Nội','+84901234567','Công ty ABC',_binary '',_binary '\0','Khác',NULL),('dc830fa4-b66c-11ef-aacc-93c52050320c','le-thi-b','Lê Thị B','https://vi.pngtree.com/freepng/3d-minimalist-beach-summer-promotion-banner_6263719.html','{\"language\": \"vi\", \"timezone\": \"GMT+7\"}','lethib@example.com','user',25,'2024-12-10','2024-12-10','Nhân viên bán hàng','456 Đường B, TP.HCM','+84987654321','Công ty XYZ',_binary '',_binary '\0','Khác',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
