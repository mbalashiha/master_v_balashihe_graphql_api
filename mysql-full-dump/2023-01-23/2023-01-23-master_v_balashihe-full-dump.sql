-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: master_v_balashihe
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `master_v_balashihe`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `master_v_balashihe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `master_v_balashihe`;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `articeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` text NOT NULL,
  `blog_category_id` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`articeId`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  UNIQUE KEY `uniq_title` (`title`) USING HASH,
  KEY `FK_blog_article_blog_category` (`blog_category_id`),
  CONSTRAINT `FK_blog_article_blog_category` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_category` (`blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `blog_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`blog_category_id`) USING BTREE,
  UNIQUE KEY `uniq_blog_category_handle_uri_slug` (`handle`(100)) USING BTREE,
  UNIQUE KEY `uniq_blog_category_category_name` (`category_name`(100)) USING BTREE,
  KEY `FK_blog_category_blog_category_index` (`parent_id`) USING BTREE,
  CONSTRAINT `FK_blog_category_blog_category_constraint` FOREIGN KEY (`parent_id`) REFERENCES `blog_category` (`blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_image_to_article`
--

DROP TABLE IF EXISTS `blog_image_to_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_image_to_article` (
  `articleId` int(10) unsigned NOT NULL,
  `imageId` int(10) unsigned NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `FK_blog_article_image_to_product_image` (`imageId`,`articleId`) USING BTREE,
  KEY `FK_image_to_blog_article` (`articleId`) USING BTREE,
  CONSTRAINT `FK_blog_image_to_article_blog_article` FOREIGN KEY (`articleId`) REFERENCES `blog_article` (`articeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_blog_image_to_article_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_image_to_article`
--

LOCK TABLES `blog_image_to_article` WRITE;
/*!40000 ALTER TABLE `blog_image_to_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_image_to_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout` (
  `checkoutId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `checkoutName` tinytext DEFAULT NULL,
  `taxesIncluded` tinyint(1) unsigned DEFAULT NULL,
  `completedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`checkoutId`),
  UNIQUE KEY `Индекс 2` (`checkoutName`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES
(0x25BB06A7D08511ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 17:18:05','2022-05-10 17:18:05'),
(0x2D429EDAD08511ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 17:18:17','2022-05-10 17:18:17'),
(0x330629FFD08511ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 17:18:27','2022-05-10 17:18:27'),
(0x44AD91D4CA4611ECB72102004C4F4F50,NULL,NULL,NULL,'2022-05-02 18:32:52','2022-05-02 18:32:52'),
(0x51D36404D08511ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 17:19:19','2022-05-10 17:19:19'),
(0x95432998D08511ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 17:21:12','2022-05-10 17:21:12'),
(0x9BDCA560D06911ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 14:00:57','2022-05-10 14:00:57'),
(0x9DA3CCB6D06A11ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 14:08:09','2022-05-10 14:08:09'),
(0xB1C3FB06D08411ECB6AD02004C4F4F50,NULL,NULL,NULL,'2022-05-10 17:14:50','2022-05-10 17:14:50'),
(0xD40D95291BD111EDB79F60A44C4F528E,NULL,NULL,NULL,'2022-08-14 13:05:56','2022-08-14 13:05:56'),
(0xE47A04A5315C11EDB74160A44C4F528E,NULL,NULL,NULL,'2022-09-10 23:04:15','2022-09-10 23:04:15');
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `checkout_checkoutId_uuidtable` AFTER INSERT ON `checkout` FOR EACH ROW SET @last_checkoutId = NEW.checkoutId */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `checkout_line_item`
--

DROP TABLE IF EXISTS `checkout_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_line_item` (
  `checkoutId` binary(16) NOT NULL,
  `variantId` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  UNIQUE KEY `Индекс 3` (`checkoutId`,`variantId`),
  KEY `FK_checkout_line_items_product_variant` (`variantId`),
  CONSTRAINT `FK_checkout_line_item_checkout` FOREIGN KEY (`checkoutId`) REFERENCES `checkout` (`checkoutId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_checkout_line_items_product_variant` FOREIGN KEY (`variantId`) REFERENCES `product_variant` (`variantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_line_item`
--

LOCK TABLES `checkout_line_item` WRITE;
/*!40000 ALTER TABLE `checkout_line_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `checkout_view`
--

DROP TABLE IF EXISTS `checkout_view`;
/*!50001 DROP VIEW IF EXISTS `checkout_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `checkout_view` AS SELECT
 1 AS `webUrl`,
  1 AS `checkoutName`,
  1 AS `taxesIncluded`,
  1 AS `completedAt`,
  1 AS `createdAt`,
  1 AS `updatedAt` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `deleted_image_to_product`
--

DROP TABLE IF EXISTS `deleted_image_to_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_image_to_product` (
  `productId` int(10) unsigned NOT NULL,
  `imageId` int(10) unsigned NOT NULL,
  `orderNumber` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`,`imageId`),
  KEY `FK_deleted_image_to_product_image` (`imageId`),
  CONSTRAINT `FK_deleted_image_to_product_deleted_product` FOREIGN KEY (`productId`) REFERENCES `deleted_product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_deleted_image_to_product_image` FOREIGN KEY (`imageId`) REFERENCES `image` (`imageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_image_to_product`
--

LOCK TABLES `deleted_image_to_product` WRITE;
/*!40000 ALTER TABLE `deleted_image_to_product` DISABLE KEYS */;
INSERT INTO `deleted_image_to_product` VALUES
(14,38,1),
(22,38,1);
/*!40000 ALTER TABLE `deleted_image_to_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_product`
--

DROP TABLE IF EXISTS `deleted_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_product` (
  `productId` int(10) unsigned NOT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `FK_deleted_product_product_category` (`product_category_id`),
  CONSTRAINT `FK_deleted_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_product`
--

LOCK TABLES `deleted_product` WRITE;
/*!40000 ALTER TABLE `deleted_product` DISABLE KEYS */;
INSERT INTO `deleted_product` VALUES
(13,'cool-hat','Cool Hat',NULL,NULL,16,'The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing. • 60% cotton, 40% acrylic• Breathable cotton blend• Form-fitting shape• One size fits most','<meta charset=\"utf-8\">\n<p data-mce-fragment=\"1\">The Next.js beanie has arrived! This embroidered beauty has a snug fit that ensures you\'re going to feel cozy and warm whatever you\'re doing.</p>\n<p data-mce-fragment=\"1\">• 60% cotton, 40% acrylic<br data-mce-fragment=\"1\">• Breathable cotton blend<br data-mce-fragment=\"1\">• Form-fitting shape<br data-mce-fragment=\"1\">• One size fits most</p>\n<meta charset=\"utf-8\">',NULL,'2022-03-26 16:02:09','2022-03-26 16:02:09',NULL,NULL,NULL),
(14,'111199333434','99888434334',NULL,34,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"fshhl\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-03-26 16:02:09','2022-11-02 11:18:12',NULL,1,NULL),
(16,'222/222/11/32234ffffffffffff323232/32234ffffffffffff323232/34234','342343434',NULL,32,NULL,'#####','<p>#####</p>\n','{\"blocks\":[{\"key\":\"4glk8\",\"text\":\"#####\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-08-05 17:02:32','2022-10-23 17:57:00',NULL,NULL,NULL),
(18,'34234hhhh','34234hhhh',NULL,5,NULL,'7','<p>7</p>\n','{\"blocks\":[{\"key\":\"bsjh3\",\"text\":\"7\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(19,'32234ffffffffffff323232/3','3',NULL,34,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"7aduu\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-08-07 18:34:49','2022-08-07 18:34:49',NULL,NULL,NULL),
(20,'32234ffffffffffff323232/24324','24324',NULL,34,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"2suc8\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-08-07 18:53:14','2022-08-07 18:53:14',NULL,NULL,NULL),
(22,'32234ffffffffffff323232/99dd','99dd',NULL,34,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"93fvt\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-10-25 15:57:00','2022-11-01 21:15:14',NULL,1,NULL),
(25,'32234ffffffffffff323232/dsfdsf33333','99dd00',NULL,34,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"93fvt\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-10-25 15:57:45','2022-11-01 19:13:53',NULL,1,NULL),
(26,'32234ffffffffffff323232/dsfdsf33333dsds','99dd0011',NULL,34,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"98tkq\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-10-28 17:16:09','2022-11-01 20:55:14',NULL,0,NULL),
(27,'12221/lightweight-jacket333','99',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"13e1b\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 17:18:33','2022-11-01 17:18:33',NULL,1,NULL),
(28,'12221/lightweight-jacket3333','99d',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"291jg\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 17:42:05','2022-11-01 17:42:05',NULL,1,NULL),
(29,'12221/lightweight-jacket33333333','99d333',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"291jg\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 17:42:17','2022-11-01 17:42:17',NULL,1,NULL),
(30,'12221/lightweight-jacket333324324333','99432432',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"2k4ji\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 17:50:13','2022-11-01 17:50:13',NULL,1,NULL),
(31,'12221/lightweight-jacket3333333300','99d33399',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"e57r5\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 18:42:36','2022-11-01 18:42:36',NULL,1,NULL),
(32,'12221/lightweight-jacket33332432433323232','99432432323223',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"fpq2f\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 18:46:13','2022-11-01 18:46:13',NULL,1,NULL),
(33,'12221/lightweight-jacket333333330000000','99d33399000000',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"5qpud\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 18:50:35','2022-11-01 18:50:35',NULL,1,NULL),
(34,'3434343fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff','3434343fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"6487j\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 19:14:41','2022-11-01 19:14:41',NULL,1,NULL),
(35,'lightweight-jacket45454','8989',NULL,5,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"2286e\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 19:17:55','2022-11-01 19:17:55',NULL,1,NULL),
(36,'lightweight-jacket4545400','8989',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"4o7pm\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 19:21:05','2022-11-01 19:21:05',NULL,1,NULL),
(37,'lightweight-jacket454540023432afsdf','8989234fsdfdsf',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"d37bn\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 19:24:32','2022-11-01 19:24:32',NULL,1,NULL),
(38,'lightweight-jacket454540023432afsdf999','8989234fsdfdsf99',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"83o5u\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 19:52:08','2022-11-01 19:52:08',NULL,1,NULL),
(39,'lightweight-jacket454540023432afsdf9992343243','8989234fsdfdsf9932434',NULL,32,NULL,'32434','<p>32434</p>\n','{\"blocks\":[{\"key\":\"6jn13\",\"text\":\"32434\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 20:22:35','2022-11-01 20:22:35',NULL,1,NULL),
(40,'lightweight-jacket454540023432afsdf999234324355','8989234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"7932c\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 20:24:48','2022-11-01 20:24:48',NULL,1,NULL),
(42,'li22ght33weight-jacket4545420023432afsdf999234324355','89822339234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"ae50u\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 20:36:57','2022-11-01 20:36:57',NULL,1,NULL),
(43,'li22222ght33weight-jacket4545420023432afsdf999234324355','8922822339234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"a6ng1\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 20:40:17','2022-11-01 20:40:17',NULL,1,NULL),
(44,'li22g23434ht33weight-jacket4545420023432afsdf999234324355','8983243422339234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"a3oaf\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 20:42:29','2022-11-01 20:42:29',NULL,1,NULL),
(46,'li22g232323ht33weight-jacket4545420023432afsdf999234324355','892323822339234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'{\"blocks\":[{\"key\":\"7un70\",\"text\":\"\",\"type\":\"unstyled\",\"depth\":0,\"inlineStyleRanges\":[],\"entityRanges\":[],\"data\":{}}],\"entityMap\":{}}','2022-11-01 20:52:18','2022-11-01 20:52:18',NULL,1,NULL);
/*!40000 ALTER TABLE `deleted_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_product_variant`
--

DROP TABLE IF EXISTS `deleted_product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_product_variant` (
  `variantId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned DEFAULT NULL,
  `price` decimal(16,4) unsigned DEFAULT NULL,
  `compareAtPrice` decimal(16,4) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned DEFAULT 1,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `imageId` int(10) unsigned DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  PRIMARY KEY (`variantId`),
  KEY `FK_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_product_variant_image` (`imageId`),
  KEY `FK_deleted_product_variant_deleted_product` (`productId`),
  CONSTRAINT `FK_deleted_product_variant_deleted_product` FOREIGN KEY (`productId`) REFERENCES `deleted_product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_product_variant`
--

LOCK TABLES `deleted_product_variant` WRITE;
/*!40000 ALTER TABLE `deleted_product_variant` DISABLE KEYS */;
INSERT INTO `deleted_product_variant` VALUES
(27,13,20.0000,30.0000,3,'2022-03-26 16:22:02','2022-03-26 16:22:02',5,NULL),
(28,13,20.0000,30.0000,3,'2022-03-26 16:22:02','2022-03-26 16:22:02',5,NULL),
(29,13,20.0000,30.0000,3,'2022-03-26 16:22:02','2022-03-26 16:22:02',5,NULL),
(30,13,20.0000,30.0000,3,'2022-03-26 16:22:02','2022-03-26 16:22:02',5,NULL),
(31,13,20.0000,30.0000,3,'2022-03-26 16:22:02','2022-03-26 16:22:02',5,NULL),
(32,13,20.0000,30.0000,3,'2022-03-26 16:22:02','2022-03-26 16:22:02',5,NULL),
(33,14,100.0000,70.0000,3,'2022-03-26 16:22:23','2022-03-26 16:22:23',9,NULL),
(34,14,100.0000,70.0000,3,'2022-03-26 16:22:23','2022-05-07 21:20:42',7,NULL),
(35,14,100.0000,70.0000,3,'2022-03-26 16:22:23','2022-03-26 16:22:23',9,NULL),
(36,14,100.0000,70.0000,3,'2022-03-26 16:22:23','2022-03-26 16:22:23',9,NULL),
(37,14,100.0000,70.0000,3,'2022-03-26 16:22:23','2022-03-26 16:22:23',9,NULL),
(38,14,100.0000,70.0000,3,'2022-03-26 16:22:24','2022-03-26 16:22:24',9,NULL),
(41,16,4.0000,NULL,3,'2022-08-05 17:02:32','2022-10-23 15:44:48',NULL,NULL),
(42,18,3.0000,NULL,1,'2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL),
(43,19,3.0000,NULL,1,'2022-08-07 18:34:49','2022-08-07 18:34:49',NULL,NULL),
(44,20,3.0000,NULL,1,'2022-08-07 18:53:14','2022-08-07 18:53:14',NULL,NULL),
(45,14,11.0000,NULL,3,'2022-10-23 17:58:18','2022-11-02 11:18:12',NULL,NULL),
(47,22,1.0000,NULL,1,'2022-10-25 15:57:00','2022-10-25 15:57:00',NULL,NULL),
(48,25,1.0000,NULL,1,'2022-10-25 15:57:45','2022-10-25 15:57:45',NULL,NULL),
(49,26,1.0000,NULL,1,'2022-10-28 17:16:09','2022-10-28 17:16:09',NULL,NULL),
(50,27,2.0000,NULL,1,'2022-11-01 17:18:33','2022-11-01 17:18:33',NULL,NULL),
(51,28,2.0000,NULL,1,'2022-11-01 17:42:05','2022-11-01 17:42:05',NULL,NULL),
(52,29,2.0000,NULL,1,'2022-11-01 17:42:17','2022-11-01 17:42:17',NULL,NULL),
(53,30,2.0000,NULL,1,'2022-11-01 17:50:13','2022-11-01 17:50:13',NULL,NULL),
(54,31,2.0000,NULL,1,'2022-11-01 18:42:36','2022-11-01 18:42:36',NULL,NULL),
(55,32,2.0000,NULL,1,'2022-11-01 18:46:13','2022-11-01 18:46:13',NULL,NULL),
(56,33,2.0000,NULL,1,'2022-11-01 18:50:35','2022-11-01 18:50:35',NULL,NULL),
(57,34,2.0000,NULL,1,'2022-11-01 19:14:41','2022-11-01 19:14:41',NULL,NULL),
(58,35,2.0000,NULL,1,'2022-11-01 19:17:55','2022-11-01 19:17:55',NULL,NULL),
(59,36,2.0000,NULL,1,'2022-11-01 19:21:05','2022-11-01 19:21:05',NULL,NULL),
(60,37,2.0000,NULL,1,'2022-11-01 19:24:32','2022-11-01 19:24:32',NULL,NULL),
(61,38,10.0000,NULL,2,'2022-11-01 19:52:08','2022-11-01 19:52:08',NULL,NULL),
(62,39,10.0000,NULL,2,'2022-11-01 20:22:35','2022-11-01 20:22:35',NULL,NULL),
(63,40,10.0000,NULL,2,'2022-11-01 20:24:48','2022-11-01 20:24:48',NULL,NULL),
(65,42,10.0000,NULL,1,'2022-11-01 20:36:57','2022-11-01 20:36:57',NULL,NULL),
(66,43,13.0000,NULL,1,'2022-11-01 20:40:17','2022-11-01 20:40:17',NULL,NULL),
(67,44,13.0000,NULL,1,'2022-11-01 20:42:29','2022-11-01 20:42:29',NULL,NULL),
(69,46,13.0000,NULL,1,'2022-11-01 20:52:18','2022-11-01 20:52:18',NULL,NULL);
/*!40000 ALTER TABLE `deleted_product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_product_variant_id_to_option_id`
--

DROP TABLE IF EXISTS `deleted_product_variant_id_to_option_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_product_variant_id_to_option_id` (
  `variantId` int(10) unsigned NOT NULL,
  `nameId` int(12) unsigned NOT NULL,
  `valueId` int(12) unsigned NOT NULL,
  PRIMARY KEY (`variantId`,`nameId`,`valueId`),
  UNIQUE KEY `uniq_parameter_name_for_each_variant` (`variantId`,`nameId`),
  KEY `FK_del_prod_variant_to_opt_id_prod_option_name_value` (`valueId`),
  KEY `FK_deleted_product_variant_id_to_option_id_product_option_name` (`nameId`),
  CONSTRAINT `FK_del_prod_variant_to_opt_id_prod_option_name_value` FOREIGN KEY (`valueId`) REFERENCES `product_option_name_value` (`valueId`),
  CONSTRAINT `FK_del_variant_id_to_option_deleted_prod_variant` FOREIGN KEY (`variantId`) REFERENCES `deleted_product_variant` (`variantId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_deleted_product_variant_id_to_option_id_product_option_name` FOREIGN KEY (`nameId`) REFERENCES `product_option_name` (`nameId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_product_variant_id_to_option_id`
--

LOCK TABLES `deleted_product_variant_id_to_option_id` WRITE;
/*!40000 ALTER TABLE `deleted_product_variant_id_to_option_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_product_variant_id_to_option_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_image`
--

DROP TABLE IF EXISTS `draft_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft_image` (
  `draftImageId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `imgSrc` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `altText` text DEFAULT NULL,
  `format` tinytext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `existingImageId` int(10) unsigned DEFAULT NULL,
  `originalWidth` int(10) unsigned DEFAULT NULL,
  `originalHeight` int(10) unsigned DEFAULT NULL,
  `pathOfOriginal` text DEFAULT NULL,
  PRIMARY KEY (`draftImageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`imgSrc`(100)) USING BTREE,
  KEY `FK_draft_image_image` (`existingImageId`),
  CONSTRAINT `FK_draft_image_image` FOREIGN KEY (`existingImageId`) REFERENCES `image` (`imageId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_image`
--

LOCK TABLES `draft_image` WRITE;
/*!40000 ALTER TABLE `draft_image` DISABLE KEYS */;
INSERT INTO `draft_image` VALUES
(0x439875CF612111EDB34760A44C4F528E,'/uploads/drafts/draft-balashikha-computer-master-forum-image-1667929490000-5815.jpg',7420,3840,NULL,NULL,'2022-11-10 17:45:49','2022-11-10 17:58:25',58,400,207,NULL),
(0x4399761A612111EDB34760A44C4F528E,'/uploads/drafts/draft-balashikha-computer-master-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg',5754,3840,NULL,NULL,'2022-11-10 17:45:49','2022-11-10 17:58:25',59,487,325,NULL),
(0x764BCA1C629B11EDB37460A44C4F528E,'/uploads/drafts/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg',3840,3840,NULL,NULL,'2022-11-12 15:05:38','2022-11-12 15:05:38',NULL,683,683,'/originals/uploaded/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg'),
(0x7EAFC2F062A311EDB37460A44C4F528E,'/uploads/drafts/balashikha-computer-master-avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.png',3840,3840,NULL,NULL,'2022-11-12 16:03:08','2022-11-12 16:03:08',NULL,678,678,'/originals/uploaded/balashikha-computer-master-avatar-nnm-another-copy-pinguine-pirate-1644835997144-299703.png'),
(0xB806586A68FE11EDB24160A44C4F528E,'/uploads/drafts/draft-balashikha-computer-master-files-publ-broken-screen-469x352-1477781754000-46259.jpg',5116,3839,NULL,NULL,'2022-11-20 18:11:17','2022-11-20 18:11:17',NULL,469,352,'/originals/uploaded/original-balashikha-computer-master-files-publ-broken-screen-469x352-1477781754000-46259.jpg');
/*!40000 ALTER TABLE `draft_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `draft_image_after_insert` AFTER INSERT ON `draft_image` FOR EACH ROW BEGIN

	SET @last_draftImageId = NEW.draftImageId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `draft_image_to_product`
--

DROP TABLE IF EXISTS `draft_image_to_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft_image_to_product` (
  `draftProductId` binary(16) NOT NULL,
  `draftImageId` binary(16) NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  KEY `FK_draft_image_to_product_draft_product` (`draftProductId`),
  KEY `FK_draft_image_to_product_draft_image` (`draftImageId`),
  CONSTRAINT `FK_draft_image_to_product_draft_image` FOREIGN KEY (`draftImageId`) REFERENCES `draft_image` (`draftImageId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_image_to_product_draft_product` FOREIGN KEY (`draftProductId`) REFERENCES `draft_product` (`draftProductId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_image_to_product`
--

LOCK TABLES `draft_image_to_product` WRITE;
/*!40000 ALTER TABLE `draft_image_to_product` DISABLE KEYS */;
INSERT INTO `draft_image_to_product` VALUES
(0xA005640A629B11EDB37460A44C4F528E,0x764BCA1C629B11EDB37460A44C4F528E,1),
(0x75267585629311EDB37460A44C4F528E,0x7EAFC2F062A311EDB37460A44C4F528E,1),
(0x7A1C7E20637111EDB3B560A44C4F528E,0x439875CF612111EDB34760A44C4F528E,1),
(0x7A1C7E20637111EDB3B560A44C4F528E,0x4399761A612111EDB34760A44C4F528E,2),
(0x1F4F5FF968FE11EDB24160A44C4F528E,0xB806586A68FE11EDB24160A44C4F528E,1),
(0xABD4A7B86DD411EDB23E60A44C4F528E,0xB806586A68FE11EDB24160A44C4F528E,1);
/*!40000 ALTER TABLE `draft_image_to_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_product`
--

DROP TABLE IF EXISTS `draft_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft_product` (
  `draftProductId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `managerId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned DEFAULT NULL,
  `handle` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `title` text DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `descriptionHtml` longtext DEFAULT NULL,
  `descriptionRawDraftContentState` longtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `images_has_been_copied` tinyint(1) unsigned DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`draftProductId`),
  UNIQUE KEY `uniq_manager_product_id` (`managerId`,`productId`),
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  KEY `actual_relation` (`productId`) USING BTREE,
  CONSTRAINT `FK_draft_product_managers` FOREIGN KEY (`managerId`) REFERENCES `managers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_product`
--

LOCK TABLES `draft_product` WRITE;
/*!40000 ALTER TABLE `draft_product` DISABLE KEYS */;
INSERT INTO `draft_product` VALUES
(0x1F4F5FF968FE11EDB24160A44C4F528E,1,NULL,NULL,'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис',NULL,NULL,NULL,'','',NULL,'2022-11-20 18:07:00','2022-11-20 18:12:29',NULL,NULL,1,5),
(0x75267585629311EDB37460A44C4F528E,1,21,'32234ffffffffffff323232/99','99',NULL,34,NULL,NULL,NULL,'','2022-11-12 14:08:20','2022-11-13 13:14:51',NULL,1,1,1),
(0x7A1C7E20637111EDB3B560A44C4F528E,1,45,'5','8ddcddcccxdfsdfdf455',NULL,5,NULL,'process.nextTick(() => setFieldValue(\"descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml\", descriptionHtml));','process.nextTick(() => setFieldValue(\"descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml\", descriptionHtml));',NULL,'2022-11-13 16:37:34','2022-11-13 16:37:34',NULL,1,1,3),
(0xA005640A629B11EDB37460A44C4F528E,1,41,'li22ghtweight-jacket4545420023432afsdf999234324355','898229234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'','2022-11-12 15:06:48','2022-11-13 13:14:48',NULL,1,1,4),
(0xABD4A7B86DD411EDB23E60A44C4F528E,1,47,'remont-i-zamena-razbitogo-ekrana-noutbuka-v-den-obrasheniya-zakazhite-vyezd-mastera-po-moskve-na-dom-ili-v-ofis','Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис',NULL,32,NULL,'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.\n\nЗаменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n\n\n    Замена любых матриц прямо на дому\n    1 год гарантия на замену матрицы.\n    Оперативный выезд мастера бесплатно.\n    Замена матрицы ноутбука от 1200 рублей.\n    Низкие цены на запчасти.\n\nЯ ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\nСколько стоит ремонт и замена матрицы ноутбука в Москве?\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\nЦена замены матрицы в ноутбуке = 990 руб + стоимость матрицы\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\nРазбили экран ноутбука? Вызывайте мастера на дом.\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.','<h1>Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.</h1>\n\n<h3>Заменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n</h3>\n<ul>\n    <li>Замена любых матриц прямо на дому</li>\n    <li>1 год гарантия на замену матрицы.</li>\n    <li>Оперативный выезд мастера бесплатно.</li>\n    <li>Замена матрицы ноутбука от 1200 рублей.</li>\n    <li>Низкие цены на запчасти.</li>\n</ul>\n<br><br>Я ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\n<h3>Сколько стоит ремонт и замена матрицы ноутбука в Москве?</h3>\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\n<h3>Цена замены матрицы в ноутбуке = 990 руб + стоимость матрицы</h3>\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\n<h3>Разбили экран ноутбука? Вызывайте мастера на дом.</h3>\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.',NULL,'2022-11-26 21:52:50','2022-11-26 21:52:50',NULL,1,1,5),
(0xEE592933629811EDB37460A44C4F528E,1,15,'t-shirt','T-Shirt',NULL,5,16,NULL,NULL,'','2022-11-12 14:47:31','2022-11-18 18:42:31',NULL,1,1,3);
/*!40000 ALTER TABLE `draft_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `draft_product_after_insert` AFTER INSERT ON `draft_product` FOR EACH ROW BEGIN
	SET @last_draftProductId = NEW.draftProductId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `draft_product_options_view`
--

DROP TABLE IF EXISTS `draft_product_options_view`;
/*!50001 DROP VIEW IF EXISTS `draft_product_options_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `draft_product_options_view` AS SELECT
 1 AS `productId`,
  1 AS `draftProductId`,
  1 AS `draftVariantId`,
  1 AS `variantName`,
  1 AS `options`,
  1 AS `price`,
  1 AS `compareAtPrice`,
  1 AS `currencyCode`,
  1 AS `currencyCodeId`,
  1 AS `createdAt`,
  1 AS `updatedAt`,
  1 AS `imageId`,
  1 AS `sku` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `draft_product_variant`
--

DROP TABLE IF EXISTS `draft_product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft_product_variant` (
  `draftVariantId` binary(16) NOT NULL DEFAULT unhex(replace(uuid(),'-','')),
  `draftProductId` binary(16) NOT NULL,
  `price` decimal(16,4) unsigned DEFAULT NULL,
  `compareAtPrice` decimal(16,4) unsigned DEFAULT NULL,
  `currencyCodeId` int(10) unsigned NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `imageId` int(10) unsigned DEFAULT NULL,
  `sku` tinytext DEFAULT NULL,
  PRIMARY KEY (`draftVariantId`),
  KEY `FK_draft_product_variant_price_currency_code` (`currencyCodeId`),
  KEY `FK_draft_product_variant_draft_product` (`draftProductId`),
  CONSTRAINT `FK_draft_product_variant_draft_product` FOREIGN KEY (`draftProductId`) REFERENCES `draft_product` (`draftProductId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_product_variant`
--

LOCK TABLES `draft_product_variant` WRITE;
/*!40000 ALTER TABLE `draft_product_variant` DISABLE KEYS */;
INSERT INTO `draft_product_variant` VALUES
(0x1F4F9FCC68FE11EDB24160A44C4F528E,0x1F4F5FF968FE11EDB24160A44C4F528E,NULL,0.0000,1,'2022-11-20 18:07:00','2022-11-20 18:12:29',NULL,NULL),
(0x75269618629311EDB37460A44C4F528E,0x75267585629311EDB37460A44C4F528E,4.0000,NULL,1,'2022-10-25 15:56:56','2022-11-04 20:30:37',NULL,NULL),
(0x7A1CA90B637111EDB3B560A44C4F528E,0x7A1C7E20637111EDB3B560A44C4F528E,16.0000,NULL,1,'2022-11-01 20:44:39','2022-11-13 13:31:49',NULL,NULL),
(0xA0059FBE629B11EDB37460A44C4F528E,0xA005640A629B11EDB37460A44C4F528E,10.0000,NULL,1,'2022-11-01 20:33:29','2022-11-01 20:33:29',NULL,NULL),
(0xA83BAB18691F11EDB24160A44C4F528E,0x1F4F5FF968FE11EDB24160A44C4F528E,1.0000,NULL,1,'2022-11-20 22:07:03','2022-11-20 22:07:03',NULL,NULL),
(0xABD4CE606DD411EDB23E60A44C4F528E,0xABD4A7B86DD411EDB23E60A44C4F528E,2.0000,NULL,1,'2022-11-20 22:07:08','2022-11-26 21:43:47',NULL,NULL),
(0xEE594B1E629811EDB37460A44C4F528E,0xEE592933629811EDB37460A44C4F528E,50.0000,NULL,3,'2022-11-05 20:28:36','2022-11-05 20:28:36',NULL,NULL);
/*!40000 ALTER TABLE `draft_product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_product_variant_id_to_option_id`
--

DROP TABLE IF EXISTS `draft_product_variant_id_to_option_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft_product_variant_id_to_option_id` (
  `draftVariantId` binary(16) NOT NULL,
  `nameId` int(12) unsigned NOT NULL,
  `valueId` int(12) unsigned NOT NULL,
  PRIMARY KEY (`draftVariantId`,`nameId`,`valueId`),
  UNIQUE KEY `uniq_parameter_for_each_variant_in_product_draft` (`nameId`,`draftVariantId`),
  KEY `FK_draft_prod_variant_to_option_id_opt_value` (`valueId`),
  CONSTRAINT `FK_draft_prod_variant_to_option_id_opt_value` FOREIGN KEY (`valueId`) REFERENCES `product_option_name_value` (`valueId`),
  CONSTRAINT `FK_draft_product_variant_id_to_option_id_draft_product_variant` FOREIGN KEY (`draftVariantId`) REFERENCES `draft_product_variant` (`draftVariantId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_draft_product_variant_id_to_option_id_product_option_name` FOREIGN KEY (`nameId`) REFERENCES `product_option_name` (`nameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_product_variant_id_to_option_id`
--

LOCK TABLES `draft_product_variant_id_to_option_id` WRITE;
/*!40000 ALTER TABLE `draft_product_variant_id_to_option_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `draft_product_variant_id_to_option_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `draft_product_view`
--

DROP TABLE IF EXISTS `draft_product_view`;
/*!50001 DROP VIEW IF EXISTS `draft_product_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `draft_product_view` AS SELECT
 1 AS `handle`,
  1 AS `managerId`,
  1 AS `amount`,
  1 AS `currencyCode`,
  1 AS `vendor`,
  1 AS `draftProductId`,
  1 AS `draftVariantId`,
  1 AS `productId`,
  1 AS `published`,
  1 AS `orderNumber`,
  1 AS `title`,
  1 AS `sku`,
  1 AS `product_category_id`,
  1 AS `manufacturerId`,
  1 AS `description`,
  1 AS `descriptionHtml`,
  1 AS `descriptionRawDraftContentState`,
  1 AS `createdAt`,
  1 AS `updatedAt`,
  1 AS `publishedAt`,
  1 AS `currencyCodeId`,
  1 AS `variantsWithOptions`,
  1 AS `price`,
  1 AS `image`,
  1 AS `images` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `imageId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imgSrc` text NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `altText` text DEFAULT NULL,
  `format` tinytext DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `originalWidth` int(10) unsigned DEFAULT NULL,
  `originalHeight` int(10) unsigned DEFAULT NULL,
  `pathOfOriginal` text DEFAULT NULL,
  PRIMARY KEY (`imageId`) USING BTREE,
  UNIQUE KEY `uniq_imgSrc` (`imgSrc`(100)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES
(5,'/images/Hat-front-black__72990.1603748583.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(6,'/images/Hat-back-black__57260.1602591509.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(7,'/images/Hat-left-black__51142.1602591510.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(8,'/images/Hat-front-white__31525.1602591510.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(9,'/images/Men-Jacket-Front-Black__15466.1603283963.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(10,'/images/Men-Jacket-Side-Black__68202.1603283961.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(11,'/images/Men-Jacket-Back-Black__33864.1603283963.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(12,'/images/Men-Jacket-Front-White__95300.1603283963.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(13,'/images/Men-Jacket-Side-White__91924.1603283962.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(14,'/images/Men-Jacket-Back-White__02866.1603283963.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(15,'/images/Men-TShirt-Black-Front__70046.1603748348.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(16,'/images/Men-TShirt-Black-Left-Side__72119.1603284781.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(17,'/images/Men-TShirt-Black-Back__57266.1603748348.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(18,'/images/Men-TShirt-White-Front__99616.1603284781.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(19,'/images/Men-TShirt-White-Left-Side__69000.1603284781.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(20,'/images/Men-TShirt-White-Back__33450.1603284781.png',2048,2048,NULL,NULL,'2022-06-10 19:43:22','2022-08-14 15:20:49',NULL,NULL,NULL),
(21,'/uploads/drafts/avatar-nnm-pirate-penguin-1644574095000-71638.jpg',750,1000,NULL,'jpeg','2022-08-05 17:02:32','2022-08-05 17:02:32',NULL,NULL,NULL),
(22,'/uploads/drafts/F1A10725AC9E3847469761D6E058129DC122B2F7327B022884pimgpsh-fullsize-distr-1461589367184-5588046.png',2560,1600,NULL,'png','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(23,'/uploads/drafts/Avatar-kartinka-policejskij-smajlik-1614103989630-7372.jpg',225,225,NULL,'jpeg','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(24,'/uploads/drafts/gosuslugi-1571928636256-3843558.png',1250,1023,NULL,'png','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(25,'/uploads/drafts/DSC03438-1611251723520-1684654.jpg',1900,1900,NULL,'jpeg','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(26,'/uploads/drafts/nnm-avatar-120x120-1644231061776-15135.png',120,120,NULL,'png','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(27,'/uploads/drafts/nnm-avatar-1644230939702-59712.png',274,274,NULL,'png','2022-08-05 17:04:30','2022-08-05 17:04:30',NULL,NULL,NULL),
(28,'/uploads/drafts/dollardollar-clipart-freebsd-freebsd-devil-1585413601569-373803.png',920,1113,NULL,'png','2022-08-08 17:52:20','2022-08-08 17:52:20',NULL,NULL,NULL),
(29,'/uploads/drafts/20190122-183922-1548255657355-2821872.jpg',3264,2448,NULL,'jpeg','2022-10-21 16:12:58','2022-10-21 16:12:58',NULL,NULL,NULL),
(30,'/uploads/drafts/20190109-155341-1547137177679-2779201.jpg',3264,2448,NULL,'jpeg','2022-10-21 16:12:58','2022-10-21 16:12:58',NULL,NULL,NULL),
(31,'/uploads/drafts/20190122-183919-1548255647195-2788447.jpg',3264,2448,NULL,'jpeg','2022-10-21 16:12:58','2022-10-21 16:12:58',NULL,NULL,NULL),
(32,'/uploads/drafts/20190122-183436-1548255561758-2914105.jpg',2448,3264,NULL,'jpeg','2022-10-21 16:39:20','2022-10-21 16:39:20',NULL,NULL,NULL),
(33,'/uploads/drafts/20180802-164540-1533226123288-698292.jpg',3264,2448,NULL,'jpeg','2022-10-21 16:39:20','2022-10-21 16:39:20',NULL,NULL,NULL),
(34,'/uploads/drafts/20190122-183821-1548255782314-2720820.jpg',3264,2448,NULL,'jpeg','2022-10-21 16:39:20','2022-10-21 16:39:20',NULL,NULL,NULL),
(35,'/uploads/drafts/20180802-164558-1533226412229-719093.jpg',3264,2448,NULL,'jpeg','2022-10-21 18:43:20','2022-10-21 18:43:20',NULL,NULL,NULL),
(36,'/uploads/drafts/20190109-124249-1547137265575-2378789.jpg',2448,3264,NULL,'jpeg','2022-10-21 18:43:20','2022-10-21 18:43:20',NULL,NULL,NULL),
(37,'/uploads/drafts/20190109-124304-1547137252170-2419720.jpg',3264,2448,NULL,'jpeg','2022-10-21 18:43:20','2022-10-21 18:43:20',NULL,NULL,NULL),
(38,'/uploads/drafts/20190109-155332-1547137192237-2742885.jpg',3264,2448,NULL,'jpeg','2022-10-21 18:43:20','2022-10-21 18:43:20',NULL,NULL,NULL),
(39,'/uploads/drafts/20190109-155325-1547137204917-2851322.jpg',3264,2448,NULL,'jpeg','2022-10-21 18:43:20','2022-10-21 18:43:20',NULL,NULL,NULL),
(40,'/uploads/drafts/20190122-183315-1548255518626-2543805.jpg',2448,3264,NULL,'jpeg','2022-10-23 17:57:00','2022-10-23 17:57:00',NULL,NULL,NULL),
(41,'/uploads/drafts/120180802-162215-1533224898490-2695602.jpg',2448,3264,NULL,'jpeg','2022-10-23 17:57:00','2022-10-23 17:57:00',NULL,NULL,NULL),
(42,'/uploads/drafts/balashikha-computer-master-120180802-162215-1533224898490-2695602.jpg',3840,5120,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',2448,3264,NULL),
(43,'/uploads/drafts/balashikha-computer-master-20190122-184158-1548255709387-2674673.jpg',1620,2160,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',2448,3264,NULL),
(44,'/uploads/drafts/balashikha-computer-master-sort-svgrepo-com-1667412435777-1166.svg',3840,3840,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',489,489,NULL),
(45,'/uploads/drafts/balashikha-computer-master-20190122-183919-1548255647195-2788447.jpg',2880,2160,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(46,'/uploads/drafts/balashikha-computer-master-20190122-183922-1548255657355-2821872.jpg',2880,2160,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(47,'/uploads/drafts/balashikha-computer-master-20190122-183821-1548255782314-2720820.jpg',2880,2160,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(48,'/uploads/drafts/balashikha-computer-master-20190122-183436-1548255561758-2914105.jpg',3240,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',2448,3264,NULL),
(49,'/uploads/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg',5760,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(50,'/uploads/drafts/balashikha-computer-master-20190109-155332-1547137192237-2742885.jpg',5760,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(51,'/uploads/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg',5760,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(52,'/uploads/drafts/balashikha-computer-master-20190122-183315-1548255518626-2543805.jpg',3240,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',2448,3264,NULL),
(53,'/uploads/drafts/balashikha-computer-master-20190109-124304-1547137252170-2419720.jpg',5760,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(54,'/uploads/drafts/balashikha-computer-master-20180802-164558-1533226412229-719093.jpg',5760,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(55,'/uploads/drafts/balashikha-computer-master-20180802-164540-1533226123288-698292.jpg',2880,2160,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',3264,2448,NULL),
(56,'/uploads/drafts/balashikha-computer-master-20180521-080439-1526880297818-2271365.jpg',1620,2160,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',2448,3264,NULL),
(57,'/uploads/drafts/balashikha-computer-master-20190109-124249-1547137265575-2378789.jpg',3240,4320,NULL,NULL,'2022-11-10 13:05:58','2022-11-10 13:05:58',2448,3264,NULL),
(58,'/uploads/drafts/draft-balashikha-computer-master-forum-image-1667929490000-5815.jpg',7420,3840,NULL,NULL,'2022-11-10 17:45:49','2022-11-10 17:45:49',400,207,NULL),
(59,'/uploads/drafts/draft-balashikha-computer-master-content-uploads-41ova5sqn0l1-1477781790000-17228.jpg',5754,3840,NULL,NULL,'2022-11-10 17:45:49','2022-11-10 17:45:49',487,325,NULL),
(60,'/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155341-1547137177679-2779201.jpg',5760,4320,NULL,NULL,'2022-11-10 17:48:34','2022-11-10 17:48:34',3264,2448,NULL),
(61,'/uploads/uploads/drafts/drafts/balashikha-computer-master-20190109-155325-1547137204917-2851322.jpg',5760,4320,NULL,NULL,'2022-11-10 17:48:34','2022-11-10 17:48:34',3264,2448,NULL),
(62,'/uploads/drafts/balashikha-computer-master-avatar-nnm-Cutted-to-Squere-pirate-penguin-1644835172956-121540.jpg',3840,3840,NULL,NULL,'2022-11-12 15:05:46','2022-11-12 15:05:46',683,683,NULL),
(63,'/uploads/drafts/draft-balashikha-computer-master-files-publ-broken-screen-469x352-1477781754000-46259.jpg',5116,3839,NULL,NULL,'2022-11-20 22:07:08','2022-11-20 22:07:08',469,352,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_to_product`
--

DROP TABLE IF EXISTS `image_to_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_to_product` (
  `productId` int(10) unsigned NOT NULL,
  `imageId` int(10) unsigned NOT NULL,
  `orderNumber` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `FK_image_to_product_image` (`imageId`,`productId`) USING BTREE,
  KEY `FK_image_to_product_product` (`productId`),
  CONSTRAINT `FK_image_to_product_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_to_product`
--

LOCK TABLES `image_to_product` WRITE;
/*!40000 ALTER TABLE `image_to_product` DISABLE KEYS */;
INSERT INTO `image_to_product` VALUES
(45,58,1),
(45,59,2),
(41,62,1),
(47,63,1);
/*!40000 ALTER TABLE `image_to_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(64) DEFAULT NULL,
  `password` char(49) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `friendly_name` tinytext DEFAULT NULL,
  `email` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `Индекс 2` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES
(1,'me-mini','E1DE22AF*0418E2FF14E66CEDE31A798F905EBEB06133C2D4',NULL,'Владелец',NULL,'2022-09-28 14:36:45','2022-10-09 14:25:30');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `manufacturerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturerName` varchar(1024) NOT NULL,
  PRIMARY KEY (`manufacturerId`) USING BTREE,
  UNIQUE KEY `Индекс 2` (`manufacturerName`(100)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES
(16,'EincodeTest');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_page_id` int(10) unsigned DEFAULT NULL,
  `page_name` varchar(512) DEFAULT NULL,
  `page_path` varchar(1024) NOT NULL,
  `page_type` int(11) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT NULL,
  `menu_index` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES
(1,1,'Главная','/',NULL,NULL,NULL),
(2,1,'Политика конфиденциальности','/privacy',NULL,NULL,NULL);
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_currency_code`
--

DROP TABLE IF EXISTS `price_currency_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_currency_code` (
  `currencyCodeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currencyCode` tinytext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `symbolCode` char(1) DEFAULT NULL,
  PRIMARY KEY (`currencyCodeId`),
  UNIQUE KEY `Индекс 2` (`currencyCode`(100))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_currency_code`
--

LOCK TABLES `price_currency_code` WRITE;
/*!40000 ALTER TABLE `price_currency_code` DISABLE KEYS */;
INSERT INTO `price_currency_code` VALUES
(1,'RUB',NULL),
(2,'USD',NULL),
(3,'EUR',NULL);
/*!40000 ALTER TABLE `price_currency_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` text NOT NULL,
  `sku` tinytext DEFAULT NULL,
  `product_category_id` int(10) unsigned DEFAULT NULL,
  `manufacturerId` int(10) unsigned DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `descriptionHtml` mediumtext DEFAULT NULL,
  `descriptionRawDraftContentState` mediumtext DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `publishedAt` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) unsigned DEFAULT 1,
  `orderNumber` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `uniq_product_name_for_category_id` (`title`(100),`product_category_id`) USING BTREE,
  UNIQUE KEY `uniq_handle` (`handle`) USING HASH,
  KEY `FK_product_product_category` (`product_category_id`),
  KEY `FK_product_manufacturer` (`manufacturerId`) USING BTREE,
  CONSTRAINT `FK_product_manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`manufacturerId`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(15,'t-shirt','T-Shirt',NULL,5,16,NULL,NULL,'','2022-03-26 16:02:09','2022-11-13 13:14:13',NULL,0,2),
(21,'32234ffffffffffff323232/99','99',NULL,34,NULL,NULL,NULL,'','2022-10-25 15:56:56','2022-11-13 13:14:10',NULL,1,1),
(41,'li22ghtweight-jacket4545420023432afsdf999234324355','898229234fsdfdsf993243455',NULL,32,NULL,NULL,NULL,'','2022-11-01 20:33:29','2022-11-13 13:14:08',NULL,1,4),
(45,'5','8ddcddcccxdfsdfdf455',NULL,5,NULL,'process.nextTick(() => setFieldValue(\"descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml\", descriptionHtml));','process.nextTick(() => setFieldValue(\"descriptiyuyuy\n\njkkkkkkkk09909032323232322323209329032093290903209092121212kkkkkjkiopijkl;jkmk98yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyuuuuuuuuuuuuuuu\n\nonHtml\", descriptionHtml));',NULL,'2022-11-01 20:44:39','2022-11-13 16:36:59',NULL,1,3),
(47,'remont-i-zamena-razbitogo-ekrana-noutbuka-v-den-obrasheniya-zakazhite-vyezd-mastera-po-moskve-na-dom-ili-v-ofis','Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис',NULL,32,NULL,'Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.\n\nЗаменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n\n\n    Замена любых матриц прямо на дому\n    1 год гарантия на замену матрицы.\n    Оперативный выезд мастера бесплатно.\n    Замена матрицы ноутбука от 1200 рублей.\n    Низкие цены на запчасти.\n\nЯ ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\nСколько стоит ремонт и замена матрицы ноутбука в Москве?\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\nЦена замены матрицы в ноутбуке = 990 руб + стоимость матрицы\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\nРазбили экран ноутбука? Вызывайте мастера на дом.\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.','<h1>Ремонт и замена разбитого экрана ноутбука в день обращения. Закажите выезд мастера по Москве на дом или в офис.</h1>\n\n<h3>Заменю повреждённую матрицу экрана ноутбука или монитора за 1 час уже в день обращения в удобное для Вас время.\n    Звоните.\n</h3>\n<ul>\n    <li>Замена любых матриц прямо на дому</li>\n    <li>1 год гарантия на замену матрицы.</li>\n    <li>Оперативный выезд мастера бесплатно.</li>\n    <li>Замена матрицы ноутбука от 1200 рублей.</li>\n    <li>Низкие цены на запчасти.</li>\n</ul>\n<br><br>Я ремонтирую любые ноутбуки: Acer, Asus, Sony, Samsung, HP,\nToshiba, Lenovo, Dell, eMachines, MSI, Packard Bell; от 8,9″ до 21″ дюймов.\n\nЭкран ноутбука — один из самых хрупких компонентов, при физических повреждениях, падениях и ударах в первую очередь страдает именно экран и требуется\nзамена матрицы экрана. Признаками этого могут являться трещины и деформации, черные блики и отсутствие подсветки изображения.\n\n<h3>Сколько стоит ремонт и замена матрицы ноутбука в Москве?</h3>\nОбщая цена ремонта матрицы складывается из цены работ по замене и цены на саму матрицу для ноутбука,\nкоторая зависит от диагонали (больше как правило дороже), разрешения (числа пикселей), типа (старая ламповая или современная LED)\nи производителя ноутбука, а также нескольких других характеристик. Обычно стандартная 15,6″ светодиодная матрица стоит от 2500 до 3500 руб,\nа работы по замене матрицы, включая выезд мастера на дом = 990 руб.\n\n\n<h3>Цена замены матрицы в ноутбуке = 990 руб + стоимость матрицы</h3>\nНаш мастер может приехать к вам на дом или в офис уже с необходимой матрицей и заменить её на месте.\nКоллектив «Компьютерный мастер Москва.ру» много лет специализируется на ремонте различной компьютерной техники.\nРемонт и замена матриц на ноутбуках нашими специалистами производится оперативно — как правило в день обращения.\n\n<h3>Разбили экран ноутбука? Вызывайте мастера на дом.</h3>\nМы сможем подобрать матрицу для вашего ноутбука по модели, озвучить стоимость и назначить выезд мастера.',NULL,'2022-11-20 22:07:08','2022-11-24 17:49:29',NULL,1,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `product_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  `handle` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_category_id`),
  UNIQUE KEY `uniq_handle_uri_slug` (`handle`(100)) USING BTREE,
  UNIQUE KEY `uniq_category_name` (`category_name`(100)) USING BTREE,
  KEY `FK_product_category_product_category` (`parent_id`),
  CONSTRAINT `FK_product_category_product_category` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES
(5,'11','11',NULL,'2022-07-07 20:15:23','2022-07-07 20:15:23'),
(32,'222','222',NULL,'2022-07-17 23:59:01','2022-07-17 23:59:01'),
(34,'32234фффффффффффф323232','32234ffffffffffff323232',5,'2022-10-21 14:00:32','2022-07-22 18:38:03'),
(35,'32432','32432',NULL,'2022-08-07 18:30:58','2022-08-07 18:30:58');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `product_category_breadcrumbs`
--

DROP TABLE IF EXISTS `product_category_breadcrumbs`;
/*!50001 DROP VIEW IF EXISTS `product_category_breadcrumbs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `product_category_breadcrumbs` AS SELECT
 1 AS `id`,
  1 AS `category_name`,
  1 AS `parent_id`,
  1 AS `handle`,
  1 AS `slug`,
  1 AS `breadcrumbs`,
  1 AS `uri_pathes`,
  1 AS `updatedAt`,
  1 AS `createdAt`,
  1 AS `product_category_id`,
  1 AS `productsCount`,
  1 AS `parentId`,
  1 AS `name` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'master_v_balashihe'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_authenticate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_authenticate`(
	IN `in_login` TEXT,
	IN `in_password` TEXT
)
BEGIN
	DECLARE stored_user_id INT Unsigned DEFAULT NULL;
	DECLARE authenticated_user_id INT Unsigned DEFAULT NULL;
	DECLARE authenticated_login Text DEFAULT NULL;
	DECLARE authenticated_is_admin Boolean DEFAULT NULL;
	DECLARE auth_result Boolean DEFAULT False;
	DECLARE stored_salt TEXT DEFAULT Null;
	DECLARE existing_hash TEXT DEFAULT Null;
	DECLARE input_hash TEXT DEFAULT Null;
	SELECT m.id, 
			IF(m.password Is Not NULL, SUBSTRING(m.password, 1, 8), Null) AS stored_salt, 
			IF(m.password Is Not NULL, Upper(m.password), Null) AS existing_hash,
			m.login,
			m.is_admin
		INTO stored_user_id, stored_salt, existing_hash, authenticated_login, authenticated_is_admin
		FROM managers m WHERE m.login=in_login;
	IF stored_user_id IS NOT NULL
	Then
		SET input_hash := CONCAT(stored_salt, in_password);
		SET input_hash := PASSWORD(input_hash);
		SET input_hash := Upper(CONCAT(stored_salt, input_hash));
		IF input_hash = existing_hash
		Then
			SET authenticated_user_id := stored_user_id;
		Else
			SET authenticated_user_id := Null;
		END IF;
	Else
		SET authenticated_user_id := Null;
	END IF;
	
	If authenticated_user_id IS NOT NULL
	Then
		SELECT authenticated_user_id AS id, authenticated_login AS login, authenticated_is_admin as is_admin;
	ELSE 
		SELECT NULL;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(
	IN `new_user_name` TEXT,
	IN `typed_password` TEXT
)
BEGIN
	DECLARE salt TEXT;
	DECLARE passwordHash TEXT;
	DECLARE inserted_id INT UNSIGNED DEFAULT NULL;
	
	IF new_user_name = '' OR new_user_name='null'
	Then
		SET new_user_name := NULL;
	END IF;
	IF typed_password = '' OR typed_password='null'
	Then
		SET typed_password := NULL;
	END IF;
	IF new_user_name IS NULL
	Then
		SIGNAL SQLSTATE
		    'ERR0R'
		SET
		    MESSAGE_TEXT = 'User name is empty or null',
		    MYSQL_ERRNO = 'errno';
	END IF;
	IF typed_password IS NULL
	Then
		SIGNAL SQLSTATE
		    'ERR0R'
		SET
		    MESSAGE_TEXT = 'User password is empty or null',
		    MYSQL_ERRNO = 'errno';
	END IF;
	SET salt := Upper(LPAD(CONV(FLOOR(RAND() * 0x100000000), 10, 16), 8, '0'));
	SET passwordHash := CONCAT(salt, Password(CONCAT(salt, typed_password)));
	SELECT id INTO inserted_id FROM managers WHERE login=new_user_name;
	IF inserted_id IS NOT NULL
	then
		UPDATE managers SET PASSWORD=passwordHash WHERE id=inserted_id;
	ELSE 
		INSERT INTO managers(login, `password`) VALUES(new_user_name, passwordHash);
		SET inserted_id := LAST_INSERT_ID();
	END IF;
	SELECT inserted_id AS 'id';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `master_v_balashihe`
--

USE `master_v_balashihe`;

--
-- Final view structure for view `checkout_view`
--

/*!50001 DROP VIEW IF EXISTS `checkout_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `checkout_view` AS select 1 AS `webUrl`,1 AS `checkoutName`,1 AS `taxesIncluded`,1 AS `completedAt`,1 AS `createdAt`,1 AS `updatedAt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `draft_product_options_view`
--

/*!50001 DROP VIEW IF EXISTS `draft_product_options_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `draft_product_options_view` AS select 1 AS `productId`,1 AS `draftProductId`,1 AS `draftVariantId`,1 AS `variantName`,1 AS `options`,1 AS `price`,1 AS `compareAtPrice`,1 AS `currencyCode`,1 AS `currencyCodeId`,1 AS `createdAt`,1 AS `updatedAt`,1 AS `imageId`,1 AS `sku` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `draft_product_view`
--

/*!50001 DROP VIEW IF EXISTS `draft_product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `draft_product_view` AS select 1 AS `handle`,1 AS `managerId`,1 AS `amount`,1 AS `currencyCode`,1 AS `vendor`,1 AS `draftProductId`,1 AS `draftVariantId`,1 AS `productId`,1 AS `published`,1 AS `orderNumber`,1 AS `title`,1 AS `sku`,1 AS `product_category_id`,1 AS `manufacturerId`,1 AS `description`,1 AS `descriptionHtml`,1 AS `descriptionRawDraftContentState`,1 AS `createdAt`,1 AS `updatedAt`,1 AS `publishedAt`,1 AS `currencyCodeId`,1 AS `variantsWithOptions`,1 AS `price`,1 AS `image`,1 AS `images` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_category_breadcrumbs`
--

/*!50001 DROP VIEW IF EXISTS `product_category_breadcrumbs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_category_breadcrumbs` AS select 1 AS `id`,1 AS `category_name`,1 AS `parent_id`,1 AS `handle`,1 AS `slug`,1 AS `breadcrumbs`,1 AS `uri_pathes`,1 AS `updatedAt`,1 AS `createdAt`,1 AS `product_category_id`,1 AS `productsCount`,1 AS `parentId`,1 AS `name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-23 16:58:53
