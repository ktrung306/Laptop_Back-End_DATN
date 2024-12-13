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
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `provider_id` varchar(40) NOT NULL,
  `provider_key` varchar(20) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL,
  `hasher` varchar(10) NOT NULL,
  `password_hash` varchar(200) NOT NULL,
  `password_salt` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES ('85cadaf1-3e2a-4485-a30c-a369f8c04068',NULL,'5eb5c3d2-bdbe-43f9-b723-0248f71ae4a6','10','$2a$12$iHFXjc.egn01EQrw4bJheeZ1Lvz6SpAgOf9.KG1LIf0r1moMkJ3Bm','10'),('b986b154-4801-497a-a0e6-34da0944255c',NULL,'1c658c2a-14a1-4522-9943-24a13a56f249','10','$2a$12$xaRFU052DXjRwxFevBH1QOmxlPe2SQfoHgrXoBFil0y9qqTFCiqwC','10'),('dc82182e-b66c-11ef-aacc-93c52050320c','local','user1','bcrypt','$2a$12$examplehash1','salt1'),('dc82238c-b66c-11ef-aacc-93c52050320c','local','user2','bcrypt','$2a$12$examplehash2','salt2'),('e925f02d-054c-470f-9ce3-db1dfd9a0028',NULL,'a03ef9d0-320d-4a08-a289-75fbb8221f73','10','$2a$12$TiQ0oi3S1fgfzYS1VsYhJ.XKfGeuNducHV1TziQU8FixGZV.2rwpu','10');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
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
