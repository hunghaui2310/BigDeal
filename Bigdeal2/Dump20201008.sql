CREATE DATABASE  IF NOT EXISTS `big_deal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `big_deal`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: big_deal
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `USER_NAME` varchar(100) NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `ENCRYTED_PASSWORD` varchar(128) NOT NULL,
  `USER_ROLE` varchar(20) NOT NULL,
  PRIMARY KEY (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('admin01',_binary '','$2a$10$YpsvXb1P2LlUBx6NqwKl.u51z2COXxQdtyC.oa4RU8bno.gYHw6yi','ROLE_MANAGER'),('aund',_binary '\0','$2a$10$tviNE05UZ2QzLGpWuWvQoujHBFp3HJo9jet8YuChnRwB8hLVy.6A2','ROLE_EMPLOYEE'),('aund2',_binary '','$2a$10$Y53KBUBNVGq3P.kZfGRm2OKCkpzPEPlHKsthRFuWnnzBrLlXwwAbS','ROLE_MANAGER'),('aund3',_binary '','$2a$10$tYbuTM6MfzShYHhtjSUlyuI/NF/TkF5zhG3fRogtdNFe10APP5giu','ROLE_MANAGER'),('employee1',_binary '','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','ROLE_EMPLOYEE'),('manager1',_binary '','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','ROLE_MANAGER'),('trungnam',_binary '','$2a$10$EAyzroGAIORyS7KK/4WLi.CkK9gNXGikYeojmayGMJC7qErCOkfLS','ROLE_USER'),('user01',_binary '','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','ROLE_USER'),('user02',_binary '','$2a$10$dt7FbtOtdsY83kFnJ4UMNO5Fy8uCtVuqcWbyRzYwS3EcdUnVvtOIW','ROLE_USER'),('user03',_binary '','$2a$10$shurw/lnxsr5yoLCXOMnBePWbjGuMwPaB4cTWnVCJJBru2R.5SQuS','ROLE_USER'),('user04',_binary '','$2a$10$eozNldtbrNVwaad4mM4pJe0edmxyPg7nfwmM6p6CCMW6lfajor88.','ROLE_USER');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longblob NOT NULL,
  `image2` longblob,
  `position` int NOT NULL,
  `category_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` longblob,
  `category_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;

/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longblob,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longblob,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Nguyễn Đức Âu 222','au.nguyen@sotatek.com','0377524660','fdssf','ffffffffffff','2020-07-17 00:36:05','2020-07-17 00:36:05');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Trung Quốc',NULL,NULL,NULL),(2,'Việt Nam',NULL,NULL,NULL),(3,'Mỹ',NULL,NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ward_id` int NOT NULL,
  `district_id` int NOT NULL,
  `city_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (12,'Nguyễn Doãn Toàn2222','toan@fsoft.com.vn','0377524660','Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','1',0,0,0,NULL,'2020-07-15 16:56:55','2020-09-22 03:00:24'),(16,'ggggggggggggg','admin@gmail.com','213213123','fdsfsdfsdfdsf','1',107,12,2,NULL,'2020-07-16 01:02:09','2020-07-16 01:02:09'),(18,'hgfhghgh','admin@gmail.com','123123','fdssfffff','1',106,12,2,NULL,'2020-07-16 01:08:38','2020-07-16 01:08:38'),(19,'Nguyễn Đức Âu Nguyễn Đức Âu','mr.au1992@gmail.com','+84377524660','fddddsa','1',90,10,2,NULL,'2020-07-18 19:45:50','2020-07-18 19:45:50'),(20,'cusstomer 223432','dasdsa@gmail.com','432432432','sasdasdasddsagggggggggg','2',0,0,0,NULL,'2020-09-22 03:02:28','2020-09-22 03:09:14');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `discount_percent` decimal(8,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,5.00,'2020-01-01','2020-01-20','2020-07-13 18:44:34','2020-07-20 06:47:14',NULL),(2,15.00,'2020-01-01','2020-07-20','2020-07-13 19:41:33','2020-07-20 06:47:21',NULL),(3,20.00,'2020-01-01','2020-07-15','2020-07-13 19:41:39','2020-07-15 00:50:20',NULL),(4,10.00,'2020-01-01','2020-07-20','2020-07-13 19:41:44','2020-07-20 06:47:18',NULL),(5,50.00,'2020-01-01','2020-07-17','2020-07-13 21:29:28','2020-07-16 18:44:25',NULL);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `ID` varchar(50) NOT NULL,
  `AMOUNT` double NOT NULL,
  `PRICE` double NOT NULL,
  `QUANITY` int NOT NULL,
  `ORDER_ID` varchar(50) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ORDER_DETAIL_ORD_FK` (`ORDER_ID`),
  KEY `ORDER_DETAIL_PROD_FK` (`PRODUCT_ID`),
  CONSTRAINT `ORDER_DETAIL_ORD_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `ORDER_DETAIL_PROD_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES ('0cd0d1da-f3a9-4f06-9f98-4a5880c3f2dd',120,120,1,'8c153800-cebf-43cc-ac2e-a9eff205d069','S003'),('116c8c49-2f14-40ec-addf-9712efcf9f40',440,110,4,'ff5677d0-7712-47fd-9233-d295eb590b54','S005'),('144eb98a-55c5-4392-b4fa-7b38158db921',880000,880000,1,'89b171b1-6819-4dc4-b3a3-dfee448d9a59','S003'),('18aec1ad-c17f-4057-ac41-445e755383d5',120,120,1,'ff5677d0-7712-47fd-9233-d295eb590b54','S004'),('1b16b2a6-7a38-479d-a3b7-09870dc1b352',120,120,1,'9c066780-1f4f-4c4b-8d2b-a22211f0983a','S004'),('221ebb9c-f3ab-4e51-b7cb-249565edbb89',1000000,1000000,1,'c4e66445-1b78-4683-818f-a67f74d95af7','S005'),('26f86d6f-e060-4813-b7e0-eaa93c37c5c6',880000,880000,1,'651a46a3-19b5-4bd3-896f-f0cedc2dbc1f','S003'),('3b422eec-d055-4032-8a47-0ac19420fbde',120,120,1,'4ebcd993-2913-4426-9663-f1033cea8f71','S003'),('3f6cfac4-cd10-46d7-bac4-9e04927f8cec',2888,1444,2,'cbf66775-4183-47a9-a63c-6f336b6b7bc9','S006'),('449f599a-1652-44a9-aa7a-828861152259',200,100,2,'8c153800-cebf-43cc-ac2e-a9eff205d069','S001'),('4e254c96-501e-493c-ba99-203732fea4ca',1444,1444,1,'4ebcd993-2913-4426-9663-f1033cea8f71','S006'),('51d50667-0f5a-4529-aea5-f8d95c468676',1000000,1000000,1,'ee8657cb-7ba6-4048-96d4-0828202f6317','S005'),('5cb92a1c-d852-4c11-a1a3-c23ace89224c',1000000,1000000,1,'784f7102-f4a1-492d-abf5-b75701028033','S005'),('5f618681-d1c0-42c4-aead-36ea2e7fa50e',250,50,5,'ee689e36-3e41-40e4-a2da-3fc6e887bd7a','S002'),('5fed04e7-0cde-4738-a8e3-c73bcbf81329',1444,1444,1,'3830f2f7-64b3-4f43-b4b0-607547e326fc','S006'),('6013eac0-048e-420f-9db7-04139d12d10a',120,120,1,'cbf66775-4183-47a9-a63c-6f336b6b7bc9','S003'),('626dcea5-26ec-4680-a831-4235281e2256',880000,880000,1,'ee8657cb-7ba6-4048-96d4-0828202f6317','S003'),('71bab482-4840-48d0-9c12-767747d0e5b7',250000,250000,1,'e2c908e3-cb14-40a5-8fd4-9c7fe7696983','S006'),('7f7563d7-44da-47ad-8630-571974517143',25000000,25000000,1,'b5dda9c8-53eb-4ba6-a608-b766e6fda5d7','S013'),('7fbf4523-2616-4143-860c-8bc5c082ab37',3213213,3213213,1,'ed58c7d6-4ad3-4e0b-b6f9-c610e9a4e5b0','S09'),('83f3ba07-8562-4d6f-b12b-250ec5f5a600',3213213,3213213,1,'8c153800-cebf-43cc-ac2e-a9eff205d069','S09'),('8f9cbe3d-a22a-46f1-ae45-fea158ca9c56',600000,300000,2,'3830f2f7-64b3-4f43-b4b0-607547e326fc','S012'),('92d3dbe9-9394-4ec6-a4d5-7e3142e08670',110,110,1,'9c066780-1f4f-4c4b-8d2b-a22211f0983a','S005'),('b5a11286-ec42-445b-be98-eee27ed991ab',24666,12333,2,'ed58c7d6-4ad3-4e0b-b6f9-c610e9a4e5b0','S111'),('c75a61f1-6752-449c-af28-f7f0060107d9',100,100,1,'b66d8cf4-0d67-4636-bf66-2e4f5f4a9c96','S001'),('d2054052-4409-494a-b726-0bc9a21f4b21',120,120,1,'3830f2f7-64b3-4f43-b4b0-607547e326fc','S004'),('df5622ce-c09d-4312-bcc2-c990e1aedf5f',100,100,1,'2e5ddeb5-b3f9-4d11-911f-ea401d4262ef','S001'),('e1465058-b298-4e26-a7b9-c1577699451f',14000000,250000,56,'a1d32689-d90f-49f3-86de-ad12e598afba','S006'),('e47c143b-d7a5-4a31-8192-6ed4d921e511',50,50,1,'b66d8cf4-0d67-4636-bf66-2e4f5f4a9c96','S002'),('ea104bc9-1f15-41c2-aca3-596e5611150e',5776,1444,4,'972e0a76-93f5-48ae-9d9c-04b19a33642b','S006'),('f04ce0db-9492-4b80-8615-f3816f04f084',120,120,1,'08b3ab96-b845-4f14-991d-a13efb185898','S003'),('f1244830-0935-47bd-adeb-97cfb2619e93',50,50,1,'9eda1a22-71c5-42f1-82c5-df17dbd95d9d','S002');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` varchar(50) NOT NULL,
  `AMOUNT` double NOT NULL,
  `CUSTOMER_ADDRESS` varchar(255) NOT NULL,
  `CUSTOMER_EMAIL` varchar(128) NOT NULL,
  `CUSTOMER_NAME` varchar(255) NOT NULL,
  `CUSTOMER_PHONE` varchar(128) NOT NULL,
  `ORDER_DATE` datetime NOT NULL,
  `ORDER_NUM` int NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ORDER_UK` (`ORDER_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('08b3ab96-b845-4f14-991d-a13efb185898',120,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu','0377524660','2020-09-25 09:51:43',1236,NULL,1),('1',100000,'219 Trung kinh','au.nguyen@gmail.com','Au Nguyen','0377524660','2020-12-18 13:17:17',1233,NULL,1),('2e5ddeb5-b3f9-4d11-911f-ea401d4262ef',100,'Ngõ 219 Trung kính , Tòa CIC Tower , Cầu Giấy Hà NỘi','mr.au1992@gmail.com','Nguyễn Đức Âu Nguyễn Đức Âu','+84377524660','2020-10-01 08:14:55',1246,'user02',1),('3830f2f7-64b3-4f43-b4b0-607547e326fc',601564,'Ngõ 219 Trung kính , Tòa CIC Tower , Cầu Giấy Hà NỘi','mr.au1992@gmail.com','Nguyễn Đức Âu Testttttttttttt','+84377524660','2020-09-29 07:10:37',1243,'user04',1),('4ebcd993-2913-4426-9663-f1033cea8f71',1564,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 222','0377524660','2020-09-28 10:32:31',1240,'user01',1),('651a46a3-19b5-4bd3-896f-f0cedc2dbc1f',880000,'Mỹ Đình','mr.au1992@gmail.com','Nguyễn Đức Âu','0377524660','2020-10-05 07:05:37',1251,'mr.au1992@gmail.com',2),('784f7102-f4a1-492d-abf5-b75701028033',1000000,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 222','0377524660','2020-10-05 10:39:23',1254,'3431128656947920Âu Nguyễn',1),('89b171b1-6819-4dc4-b3a3-dfee448d9a59',880000,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 333333333333','0377524660','2020-10-02 04:35:33',1249,'user03',1),('8c153800-cebf-43cc-ac2e-a9eff205d069',3213533,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','admin@gmail.com','GGGGGGGGGGGGGGGGG','0377524660','2020-09-29 06:59:56',1241,'user03',2),('972e0a76-93f5-48ae-9d9c-04b19a33642b',5776,'gaddddddddddd','dasdsd@gmail.com','gggggggggggg','ggggggggggg','2020-09-29 07:02:41',1242,'user03',1),('9c066780-1f4f-4c4b-8d2b-a22211f0983a',230,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 222','0377524660','2020-09-25 09:55:52',1237,NULL,1),('9eda1a22-71c5-42f1-82c5-df17dbd95d9d',50,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 222','0377524660','2020-09-25 09:51:06',1235,NULL,2),('a1d32689-d90f-49f3-86de-ad12e598afba',14000000,'','','TrungNam','','2020-10-05 02:02:38',1250,'trungnam',1),('b5dda9c8-53eb-4ba6-a608-b766e6fda5d7',25000000,'Mỹ Đình','mr.au1992@gmail.com','Nguyễn Đức Âu','0377524660','2020-10-05 07:25:39',1253,'mr.au1992@gmail.com',1),('b66d8cf4-0d67-4636-bf66-2e4f5f4a9c96',150,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu','0377524660','2020-09-25 09:49:27',1234,NULL,1),('c4e66445-1b78-4683-818f-a67f74d95af7',1000000,'Mỹ Đình','mr.au1992@gmail.com','Nguyễn Đức Âu','0377524660','2020-10-05 07:13:51',1252,'mr.au1992@gmail.com',1),('cbf66775-4183-47a9-a63c-6f336b6b7bc9',3008,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 222','0377524660','2020-09-29 09:43:50',1245,'3431128656947920Âu Nguyễn',1),('e2c908e3-cb14-40a5-8fd4-9c7fe7696983',250000,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen+123@sotatek.com','Nguyễn Đức Âu 3','0377524660','2020-10-01 08:23:52',1247,'user02',1),('ed58c7d6-4ad3-4e0b-b6f9-c610e9a4e5b0',3237879,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 333333333333','0377524660','2020-09-25 10:45:36',1239,'user01',1),('ee689e36-3e41-40e4-a2da-3fc6e887bd7a',250,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 333333333333','0377524660','2020-09-25 10:23:50',1238,'user01',1),('ee8657cb-7ba6-4048-96d4-0828202f6317',1880000,'Tòa CIC Tower , Ngõ 219 trung kính , Hà Nội','au.nguyen@sotatek.com','Nguyễn Đức Âu 333333333333','0377524660','2020-10-01 08:28:25',1248,'user02',1),('ff5677d0-7712-47fd-9233-d295eb590b54',560,'dasdsadasdsa','admin@gmail.com','fdsfsd','12312321','2020-09-29 07:14:27',1244,'user04',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_rating`
--

DROP TABLE IF EXISTS `product_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_rating` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` smallint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_rating`
--

LOCK TABLES `product_rating` WRITE;
/*!40000 ALTER TABLE `product_rating` DISABLE KEYS */;
INSERT INTO `product_rating` VALUES (1,'employee1','S001',5,'gggggggggggggggggggggggggg','2020-07-16 12:56:28','2020-07-16 12:56:28'),(2,'employee1','S001',3,'gfgfdgfdgfd','2020-07-16 12:56:28','2020-07-16 12:56:28'),(3,'employee1','S002',4,'hghgfhgfhgfhgf','2020-07-16 12:56:28','2020-07-16 12:56:28'),(4,'employee1','S002',1,'hgfhgfhf','2020-07-16 13:18:54','2020-07-16 13:18:54'),(5,'employee1','S003',5,'rffffffffffffffffff','2020-07-16 13:19:08','2020-07-16 13:19:08'),(6,'employee1','S003',3,'gggggggggggggggggggggggggggggg','2020-07-16 13:25:59','2020-07-16 13:25:59'),(7,'user01','',1,'mnmbnmnb','2020-09-28 03:20:07',NULL),(8,'user01','S006',1,'fdgfdgfdgfgfd','2020-09-28 03:22:30',NULL),(9,'user01','S006',1,'hetrtretre','2020-09-28 03:29:00',NULL),(10,'user01','S005',1,'mbbmnbmbn','2020-09-28 03:37:26',NULL),(11,'user01','S005',1,'czcxcxz','2020-09-28 03:37:32',NULL),(12,'user01','S005',1,'jkljklk','2020-09-28 03:37:45',NULL),(13,'user03','S006',1,'gfdgfdgfd','2020-09-29 00:01:40',NULL),(14,'user03','S006',1,'user review','2020-09-29 00:02:15',NULL),(15,'user04','S006',1,'fdsfdsf','2020-09-29 00:11:26',NULL),(16,'user04','S013',1,'san pham tốt','2020-09-29 00:15:05',NULL),(17,'3431128656947920Âu Nguyễn','S003',1,'gfdgfdgdf','2020-09-29 02:42:12',NULL);
/*!40000 ALTER TABLE `product_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `CODE` varchar(20) NOT NULL,
  `IMAGE` longblob,
  `NAME` varchar(255) NOT NULL,
  `PRICE` double NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `discount` int DEFAULT '0',
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
INSERT INTO `social_account` VALUES (1,'Trần Văn Cừ','XZfNMOeU');
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconnection`
--

DROP TABLE IF EXISTS `userconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userconnection` (
  `USERID` varchar(255) NOT NULL,
  `PROVIDERID` varchar(255) NOT NULL,
  `PROVIDERUSERID` varchar(255) NOT NULL,
  `RANK` int NOT NULL,
  `DISPLAYNAME` varchar(255) DEFAULT NULL,
  `PROFILEURL` varchar(512) DEFAULT NULL,
  `IMAGEURL` varchar(512) DEFAULT NULL,
  `ACCESSTOKEN` varchar(255) NOT NULL,
  `SECRET` varchar(255) DEFAULT NULL,
  `REFRESHTOKEN` varchar(255) DEFAULT NULL,
  `EXPIRETIME` bigint DEFAULT NULL,
  PRIMARY KEY (`USERID`,`PROVIDERID`,`PROVIDERUSERID`),
  UNIQUE KEY `USERCONNECTIONRANK` (`USERID`,`PROVIDERID`,`RANK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconnection`
--

LOCK TABLES `userconnection` WRITE;
/*!40000 ALTER TABLE `userconnection` DISABLE KEYS */;
INSERT INTO `userconnection` VALUES ('Trần Văn Cừ','facebook','2346898372193364',1,'Trần Văn Cừ',NULL,'https://graph.facebook.com/v2.5/2346898372193364/picture','EAAIVhEmfx6gBAIhjpMwz0TODQWK5upnM8SxS2ZB0Q9q8ROZBPSfb0X0pY0Y4ligVuljoI87lcFPHOCDUzMyeKCC7qqnOUJm1oPSowk9kXAzlkzUJCXPrR3OSLqc4maRrSBcKIb7Tp63zKRUkO3CoMzxmTsas4vGeQHPK8qjwZDZD',NULL,NULL,1562635906341);
/*!40000 ALTER TABLE `userconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
INSERT INTO `wish` VALUES (3,'14','1','2020-07-16 20:15:09','2020-07-16 20:15:09'),(4,'14','2','2020-07-16 20:15:11','2020-07-16 20:15:11'),(5,'14','3','2020-07-16 20:15:14','2020-07-16 20:15:14'),(6,'14','4','2020-07-16 20:16:33','2020-07-16 20:16:33'),(15,'15','4','2020-07-16 21:35:42','2020-07-16 21:35:42'),(17,'15','2','2020-07-18 04:03:55','2020-07-18 04:03:55'),(18,'15','6','2020-07-18 04:14:42','2020-07-18 04:14:42'),(19,'user01','S005','2020-09-28 01:53:55','2020-09-28 01:53:55'),(20,'user01','S111','2020-09-28 02:19:19','2020-09-28 02:19:19'),(21,'user01','S006','2020-09-28 02:23:16','2020-09-28 02:23:16'),(23,'user01','S003','2020-09-28 03:32:03','2020-09-28 03:32:03'),(24,'user03','S005','2020-09-28 23:59:09','2020-09-28 23:59:09'),(25,'user04','S111','2020-09-29 00:13:08','2020-09-29 00:13:08'),(26,'trungnam','S006','2020-10-04 19:00:51','2020-10-04 19:00:51');
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-08 14:10:34
