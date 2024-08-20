/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: natesa
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('spatie.permission.cache','a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}',1720890809);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `acronym` varchar(4) NOT NULL,
  `symbol` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'United States Dollar','USD','$','2024-06-12 06:15:16','2024-06-12 06:15:16',NULL),(2,'Nigerian Naira','NGN','₦','2024-06-12 06:15:16','2024-06-12 06:15:16',NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disks`
--

DROP TABLE IF EXISTS `disks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disks`
--

LOCK TABLES `disks` WRITE;
/*!40000 ALTER TABLE `disks` DISABLE KEYS */;
INSERT INTO `disks` VALUES (1,'local',NULL,'2024-06-12 06:15:16','2024-06-12 06:15:16',NULL),(2,'public',NULL,'2024-06-12 06:15:16','2024-06-12 06:15:16',NULL),(3,'s3',NULL,'2024-06-12 06:15:16','2024-06-12 06:15:16',NULL),(4,'name',NULL,'2024-06-12 06:15:16','2024-06-12 06:15:16',NULL),(5,'do',NULL,'2024-06-15 15:45:58','2024-06-15 15:45:58',NULL);
/*!40000 ALTER TABLE `disks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_attendees`
--

DROP TABLE IF EXISTS `event_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_attendees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `event_id` bigint(20) unsigned NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `publicity_mode` varchar(255) NOT NULL,
  `checked_in_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_attendees_user_id_event_id_unique` (`user_id`,`event_id`),
  UNIQUE KEY `event_attendees_ticket_id_unique` (`ticket_id`),
  KEY `event_attendees_event_id_foreign` (`event_id`),
  CONSTRAINT `event_attendees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `sanity_documents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `event_attendees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_attendees`
--

LOCK TABLES `event_attendees` WRITE;
/*!40000 ALTER TABLE `event_attendees` DISABLE KEYS */;
INSERT INTO `event_attendees` VALUES (1,'VS0bpb1',3,1,'male','08187726255','Public Servant','Others',NULL,'2024-06-13 09:04:32','2024-06-13 09:04:32'),(2,'B3Rw6P2',4,1,'male','07036973390','Consultant','Others',NULL,'2024-06-13 11:19:47','2024-06-13 11:19:47'),(3,'1i1GiI3',5,1,'male','+2348058256845','Student photographer','Others',NULL,'2024-06-13 13:25:07','2024-06-13 13:25:07'),(4,'AL0squ4',6,1,'female','07054222099','Product Designer','Others',NULL,'2024-06-13 14:24:08','2024-06-13 14:24:08'),(5,'wKQSSU5',7,1,'male','07025048795','Student','Others',NULL,'2024-06-13 18:12:07','2024-06-13 18:12:07'),(6,'IpNoNM6',8,1,'female','07064363412','I am a skincare consultant and Graphic Designer.','Others',NULL,'2024-06-13 18:13:35','2024-06-13 18:13:35'),(7,'pfmyEU7',9,1,'male','08154994457','Self employed','Others',NULL,'2024-06-13 19:23:24','2024-06-13 19:23:24'),(8,'hkOdjF8',10,1,'female','08163922762','Student','Blog post',NULL,'2024-06-13 19:40:38','2024-06-13 19:40:38'),(9,'6MLY1I9',11,1,'female','09158410348','Product Manager','Others',NULL,'2024-06-13 20:52:06','2024-06-13 20:52:06'),(10,'fiHjn810',12,1,'female','08169784654','Documentary Photographer','Facebook',NULL,'2024-06-14 11:00:02','2024-06-14 11:00:02'),(11,'SN088e11',13,1,'female','+2348070875569','Photographer','Others',NULL,'2024-06-14 11:09:34','2024-06-14 11:09:34'),(12,'TwRKni12',14,1,'male','08033150460','Creative Arts Consultant','Others',NULL,'2024-06-14 12:30:17','2024-06-14 12:30:17'),(13,'yqrFtb13',15,1,'female','07068374330','Student','Others',NULL,'2024-06-14 12:42:57','2024-06-14 12:42:57'),(14,'GXSayi14',16,1,'male','07044020904','Sound engineer','Others',NULL,'2024-06-14 12:57:32','2024-06-14 12:57:32'),(15,'H3CiDN15',17,1,'female','09133630756','Student','Others',NULL,'2024-06-14 21:01:59','2024-06-14 21:01:59'),(16,'CjXPiV16',1,1,'male','09033292224','Web dev','Others',NULL,'2024-06-15 01:31:13','2024-06-15 01:31:13'),(17,'JFoCMv17',18,1,'female','+2348137903352','Student','Instagram',NULL,'2024-06-15 10:55:41','2024-06-15 10:55:41'),(18,'z5MuhX18',19,1,'male','08127796563','Business man','A Friend',NULL,'2024-06-15 11:16:11','2024-06-15 11:16:11'),(19,'jpTWJn19',20,1,'male','09033292224','Software Dev','Instagram',NULL,'2024-06-16 09:32:36','2024-06-16 09:32:36'),(20,'Nn61d720',21,1,'male','08032051555','Visual Artist','Instagram',NULL,'2024-06-17 03:01:36','2024-06-17 03:01:36'),(21,'L4mgrY21',22,1,'male','08181497944','Media consultant','Instagram',NULL,'2024-06-17 14:09:12','2024-06-17 14:09:12'),(22,'WHrMQE22',23,1,'male','08106480266','Photographer','Instagram',NULL,'2024-06-17 14:19:24','2024-06-17 14:19:24'),(23,'ueSahU23',26,1,'male','08066436292','Photography','Instagram',NULL,'2024-06-18 00:04:46','2024-06-18 00:04:46'),(24,'T3sbJQ24',40,1,'male','+2347039584847','Corp member','A Friend',NULL,'2024-06-18 07:19:36','2024-06-18 07:19:36'),(25,'fc7yKB25',47,1,'male','09136142681','Law Student','Instagram',NULL,'2024-06-18 08:35:34','2024-06-18 08:35:34'),(26,'9qk3nz26',48,1,'male','07082548634','Photography','Instagram',NULL,'2024-06-18 09:36:54','2024-06-18 09:36:54'),(27,'vbowq727',56,1,'male','08060503062','Digital Creator','Instagram',NULL,'2024-06-18 10:31:44','2024-06-18 10:31:44'),(28,'dgIjQj28',57,1,'male','08058256845','Student photographer','Instagram',NULL,'2024-06-18 12:10:38','2024-06-18 12:10:38'),(29,'rAWT6h29',63,1,'female','08136186321','Data scienctist/Documentary photographer','Instagram',NULL,'2024-06-18 13:12:48','2024-06-18 13:12:48'),(30,'BkG36P30',64,1,'female','+2347040258721','Student','Instagram',NULL,'2024-06-18 16:05:46','2024-06-18 16:05:46'),(31,'e4P39S31',66,1,'male','09169969847','Photographer','Instagram',NULL,'2024-06-18 18:46:10','2024-06-18 18:46:10'),(32,'h7Zixr32',67,1,'male','+2347089943556','Visual Communicator','Instagram',NULL,'2024-06-18 23:23:40','2024-06-18 23:23:40'),(33,'rkkR1j33',68,1,'male','08030405936','Photographer','Instagram',NULL,'2024-06-19 02:25:20','2024-06-19 02:25:20'),(34,'dneeYP34',70,1,'male','07056386917','Photographer','Instagram',NULL,'2024-06-19 17:00:16','2024-06-19 17:00:16'),(35,'Pv8snw35',71,1,'male','+2348134536053','Photographer','Instagram',NULL,'2024-06-19 17:08:44','2024-06-19 17:08:44'),(36,'NQGKOi36',72,1,'male','09126365012','Student','Instagram',NULL,'2024-06-19 23:10:38','2024-06-19 23:10:38'),(37,'3ffOwY37',82,1,'male','08093047596','Photographer','Instagram',NULL,'2024-06-20 09:52:55','2024-06-20 09:52:55'),(38,'t5DShu38',83,1,'male','09121559399','Photographer','Instagram',NULL,'2024-06-20 14:03:52','2024-06-20 14:03:52'),(39,'jTbGZK39',84,1,'male','08166906936','Photographer','LinkedIn',NULL,'2024-06-20 17:58:55','2024-06-20 17:58:55'),(40,'VZQtbZ40',85,1,'male','07042801446','Filmmaker & Photographer','Instagram',NULL,'2024-06-21 08:53:52','2024-06-21 08:53:52'),(41,'q9RFvK41',86,1,'male','08180641347','Photographer','Instagram',NULL,'2024-06-21 13:48:33','2024-06-21 13:48:33'),(42,'25ZXOM42',87,1,'male','0807 166 3061','Photographer','Instagram',NULL,'2024-06-21 17:37:13','2024-06-21 17:37:13'),(43,'cLAaYF43',88,1,'female','09027997382','Student','Instagram',NULL,'2024-06-22 01:18:36','2024-06-22 01:18:36'),(44,'b3NZay44',89,1,'female','09027997382','Student','Instagram',NULL,'2024-06-22 01:19:53','2024-06-22 01:19:53'),(45,'xTjrb545',90,1,'male','08084224000','Photographer','Instagram',NULL,'2024-06-22 04:07:15','2024-06-22 04:07:15'),(46,'e1Woky46',91,1,'male','08101742781','Creative director','Instagram',NULL,'2024-06-22 05:35:00','2024-06-22 05:35:00'),(47,'H7eU3z47',92,1,'male','08100544147','Documentary Photographer','Instagram',NULL,'2024-06-22 07:12:42','2024-06-22 07:12:42'),(48,'ScLKWF48',93,1,'male','09055118936','Student','A Friend',NULL,'2024-06-22 08:03:35','2024-06-22 08:03:35'),(49,'GPTJqF49',94,1,'male','09055118936','Student','A Friend',NULL,'2024-06-22 08:08:41','2024-06-22 08:08:41'),(50,'OuXbTp50',95,1,'male','09079048102','Photography','Instagram',NULL,'2024-06-22 13:12:14','2024-06-22 13:12:14'),(51,'2Rgo1l51',96,1,'male','+2348138123467','Pro photographer','Instagram',NULL,'2024-06-23 00:25:59','2024-06-23 00:25:59'),(52,'fxebDb52',97,1,'male','09026835406','Photographer','Instagram',NULL,'2024-06-23 03:57:45','2024-06-23 03:57:45'),(53,'aQFZkf53',98,1,'male','08145973449','Media Designer','Instagram',NULL,'2024-06-23 11:04:02','2024-06-23 11:04:02'),(54,'Jv7XvW54',138,1,'male','08135090954','Photographer','Instagram',NULL,'2024-06-24 03:00:38','2024-06-24 03:00:38'),(55,'JM27q755',139,1,'male','09167696885','Photographer','Instagram',NULL,'2024-06-24 07:04:32','2024-06-24 07:04:32'),(56,'Qa9QLH56',140,1,'male','09126547720','Photography','Instagram',NULL,'2024-06-24 09:18:19','2024-06-24 09:18:19'),(58,'iQpFA158',142,1,'male','08149297386','Student','A Friend',NULL,'2024-07-03 08:20:43','2024-07-03 08:20:43'),(59,'qsybff59',144,1,'female','09052544691','Student','Instagram',NULL,'2024-07-03 10:38:37','2024-07-03 10:38:37'),(60,'RQrLUB60',145,1,'male','07073221875','Cinematographer','A Friend',NULL,'2024-07-03 10:40:57','2024-07-03 10:40:57'),(62,'OPPggw62',151,1,'male','08134635012','Photographer','Instagram',NULL,'2024-07-03 15:33:41','2024-07-03 15:33:41'),(63,'KWithJ63',152,1,'female','08143294746','Graduate trainee','Whatsapp',NULL,'2024-07-03 16:02:52','2024-07-03 16:02:52'),(64,'cRHrnX64',153,1,'male','09168045657','Fashion designer','Instagram',NULL,'2024-07-03 16:53:16','2024-07-03 16:53:16'),(65,'y62Fs865',155,1,'male','08184551390','Realtor, Actor,clergyman, freelance Radio and Tv presenter.','Instagram',NULL,'2024-07-03 19:47:36','2024-07-03 19:47:36'),(66,'KlBhSK66',158,1,'male','09072566995','Businessman','Instagram',NULL,'2024-07-04 11:45:30','2024-07-04 11:45:30'),(67,'VgJ61k67',162,1,'male','09053218948','Photographer','A Friend',NULL,'2024-07-04 21:01:00','2024-07-04 21:01:00'),(68,'2WodaJ68',164,1,'male','07037623034','Photographer','Instagram',NULL,'2024-07-05 04:42:34','2024-07-05 04:42:34'),(69,'lcsLJW69',165,1,'male','09046275496','Photographer','Instagram',NULL,'2024-07-05 06:09:03','2024-07-05 06:09:03'),(70,'sgryVC70',166,1,'female','09075932111','Photographer','Instagram',NULL,'2024-07-05 09:06:49','2024-07-05 09:06:49'),(71,'bLoPP271',167,1,'male','08022448640','Photographer','Instagram',NULL,'2024-07-05 09:55:06','2024-07-05 09:55:06'),(72,'3ATIfZ72',169,1,'male','09041507805','Photographer','A Friend',NULL,'2024-07-07 10:56:31','2024-07-07 10:56:31'),(73,'Hnw5GB73',171,1,'male','07063592041','Photography','Instagram',NULL,'2024-07-07 18:23:43','2024-07-07 18:23:43'),(74,'4tY8N274',173,1,'male','08033196160','freelancer','LinkedIn',NULL,'2024-07-09 09:10:53','2024-07-09 09:10:53'),(75,'MXoSxS75',176,1,'female','08168677998','Student','Instagram',NULL,'2024-07-11 15:29:55','2024-07-11 15:29:55');
/*!40000 ALTER TABLE `event_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibitor_works`
--

DROP TABLE IF EXISTS `exhibitor_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibitor_works` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `photograph` varchar(255) NOT NULL,
  `exhibitor_id` bigint(20) unsigned NOT NULL,
  `proposed_value` decimal(17,2) NOT NULL,
  `value_currency_id` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disk_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  KEY `exhibitor_works_exhibitor_id_foreign` (`exhibitor_id`),
  KEY `exhibitor_works_value_currency_id_foreign` (`value_currency_id`),
  KEY `exhibitor_works_disk_id_foreign` (`disk_id`),
  CONSTRAINT `exhibitor_works_disk_id_foreign` FOREIGN KEY (`disk_id`) REFERENCES `disks` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `exhibitor_works_exhibitor_id_foreign` FOREIGN KEY (`exhibitor_id`) REFERENCES `exhibitors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exhibitor_works_value_currency_id_foreign` FOREIGN KEY (`value_currency_id`) REFERENCES `currencies` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitor_works`
--

LOCK TABLES `exhibitor_works` WRITE;
/*!40000 ALTER TABLE `exhibitor_works` DISABLE KEYS */;
INSERT INTO `exhibitor_works` VALUES (3,'Royal Excort',2022,'exhibitor-works/work-Aliyu-Muhammad-Bashar-9c4f6ab3-f708-4b78-9886-93a4aa3d5952.jpg',3,150.00,1,'Typical appearance of Royal escorts in a northern durbar festival','2024-06-17 18:31:05','2024-06-17 18:31:05',5),(4,'Musket',2022,'exhibitor-works/work-Aliyu-Muhammad-Bashar-9c4f6ab4-0a19-409e-af6b-baed8eb659d1.jpg',3,150.00,1,'The musket gun has significant importance in festivals around Nigeria ,in the north the gun is used to honour royals and to begin important activities.\r\nIn some cases it is also used to announce appearance of a royal person','2024-06-17 18:31:05','2024-06-17 18:31:05',5),(5,'Ride',2022,'exhibitor-works/work-Aliyu-Muhammad-Bashar-9c4f6ab4-223e-43b4-bab0-be8d80c96a10.jpg',3,150.00,1,'The camel appearance in a royal durbar is usually to signify the extra regalia of the king ,they are mostly seen behind the king serving as the rare guards to the king .','2024-06-17 18:31:05','2024-06-17 18:31:05',5),(6,'Culture must not die',2020,'exhibitor-works/work-Oluwafemi-Omole-9c4fc628-ae5b-4640-b759-1d0249a3bc63.jpg',4,200000.00,2,'This little child is being taught the ways of the yoruba people by wearing their iro and buba','2024-06-17 22:46:49','2024-06-17 22:46:49',5),(131,'Siblings on camel back',2023,'exhibitor-works/work-John-Otu-9c515afe-04d3-42cb-b616-c8330267704d.jpg',36,35500.00,2,'On camel back are siblings ; half brothers that are evidently fond of each other.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(132,'Mascot 1',2023,'exhibitor-works/work-John-Otu-9c515afe-17c8-4b2c-9968-46188314bbc9.jpg',36,32500.00,2,'The man on horse back has his face covered with powder to motivate the crowd to focus with awe at him.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(133,'Mascot II',2023,'exhibitor-works/work-John-Otu-9c515afe-2922-473b-8e36-324417298908.jpg',36,34500.00,2,'A man has his face covered with powder to engender the teaming crowd to look at him with awe.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(134,'A Palace guard',2023,'exhibitor-works/work-John-Otu-9c515afe-3a38-4a73-b85c-f50c8d3e31e6.jpg',36,30000.00,2,'A Palace guard in green and black flowing gown stands beside a prince on horse back to assist with getting through the crowd of enthusiastic people.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(135,'Fulani performers',2023,'exhibitor-works/work-John-Otu-9c515afe-4c7f-4c58-b5ed-a8ceb4727216.jpg',36,37500.00,2,'A small group of students representing the Fulani ethnic nationality during the mini Durba.','2024-06-18 17:38:49','2024-06-18 17:38:49',5),(136,'Radiant Resilience',2024,'exhibitor-works/work-Abdulrahaman-Abubakar-9c51d5e8-b91d-41fc-bae9-b56200ad9852.jpg',37,1000.00,1,'\"Radiant Resilience\"\r\n   Description: \"Through the lens, the radiant energy of resilience shines bright as the subject raises their head’s, a visual testament to inner strength and unwavering determination in the face of challenges.\"','2024-06-18 23:22:31','2024-06-18 23:22:31',5),(137,'Igba Ekpe',2017,'exhibitor-works/work-Philips-Akwari-9c52e49b-53cd-45a4-b28a-5ce352e20340.jpg',38,105000.00,2,'Material: Photo on paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(138,'Uche Oba',2016,'exhibitor-works/work-Philips-Akwari-9c52e49b-704c-4316-9bed-cfc8b1307423.jpg',38,105000.00,2,'Material: Photo on paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(139,'Onye Iwowo',2014,'exhibitor-works/work-Philips-Akwari-9c52e49b-8867-4fa5-9fff-694dc8e43da1.jpg',38,105000.00,2,'Material: Photo on Paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(140,'Igwa Mang',2016,'exhibitor-works/work-Philips-Akwari-9c52e49b-99d0-46ea-a62b-6489c16e5820.jpg',38,105000.00,2,'Material: Photo on Paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(141,'Eze Ihungwu',2017,'exhibitor-works/work-Philips-Akwari-9c52e49b-afca-4206-91ca-299ddb06513a.jpg',38,105000.00,2,'Material: Photo on Paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(143,'Feel the calmness',2024,'exhibitor-works/work-Oghenemairo-Obaroh-9c5cbd0f-73e6-4eec-a059-142cc0996453.jpg',88,30.00,1,'Calmness at its peak','2024-06-24 09:27:08','2024-06-24 09:27:08',5),(152,'Men of Euphoria',2024,'exhibitor-works/work-Timileyin-Okanlawon-9c71956f-6fd2-4461-8df6-3e0f35825f71.jpg',95,250000.00,2,'Men of Euphoria is tailored for festival-going men who embrace style, individuality, and the adventurous festival lifestyle. This collection gives insight to men who stand out and express their unique sense of fashion while staying comfortable and practical.','2024-07-04 18:08:43','2024-07-04 18:08:43',5),(153,'Euphoria Beauties',2024,'exhibitor-works/work-Timileyin-Okanlawon-9c71956f-e08a-4fdf-9064-66beb034f945.jpg',95,300000.00,2,'Euphoria Beauties is a piece to women who embody beauty, elegance, and a vibrant spirit during festival celebrations. They express their unique style and cultural heritage through carefully curated festival accessories that enhance their overall appearance and contribute to the festive atmosphere.','2024-07-04 18:08:43','2024-07-04 18:08:43',5),(154,'Aged splendor',2024,'exhibitor-works/work-Timileyin-Okanlawon-9c719570-1d9c-40de-8bc0-5db6ba11bb2a.jpg',95,400000.00,2,'Aged splendor is a piece about the celebration of life and cultural heritage of older individuals who shine with grace, dignity, and a profound connection to their traditions. Their participation enriches the festival experience and provide a link between past, present, and future generations through their enduring spirit and cultural contributions.','2024-07-04 18:08:44','2024-07-04 18:08:44',5),(155,'Rhythms Of The Night',2024,'exhibitor-works/work-Obianuju-Nnaji-9c719c5c-fcdd-43e3-ae60-57b31238a088.jpg',96,100.00,1,'In the golden hues of a setting sun, a silhouette stands by the water\'s edge, immersed in the timeless ritual of labor – a symbol of resilience. The tranquil river glistens with the sun\'s fading light, reflecting the serene connection between humanity and nature. The scene is a reminder of simpler times when life flowed with the rhythm of nature. The trees in the distance stand as silent witnesses to this daily dance, their forms blurred by the warm glow of the evening sky. \r\nThis photograph captures not just a moment, but an enduring story of life, tradition, and the delicate balance between man and his environment.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(156,'Memories Of Childhood',2019,'exhibitor-works/work-Obianuju-Nnaji-9c719c5d-7800-42ae-b786-aaea62ae0390.jpg',96,90.00,1,'In the soft afternoon, I am reminded of my childhood memories beholding a child as he crouches, absorbed in the simple joy of drawing on the sand. Bare feet press gently into the ground, grounding him in the moment as his small hand creates a world of shapes and lines. The worn fabric of his shirt speaks of determination, while the surrounding imprints tell stories of other footsteps. I couldn\'t but wonder if this was another Leonardo da Vinci in the making.\r\nThis photograph captures the essence of childhood—innocence, creativity, and the boundless imagination that transforms simplicity into the extraordinary.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(157,'Apunanwu',2022,'exhibitor-works/work-Obianuju-Nnaji-9c719c5d-eca3-4d80-ba34-eada93b58c12.jpg',96,90.00,1,'Against the backdrop of an African hut, she is adorned in unique traditional attire and a timeless hairstyle. Apunanwu – the one who should not step into the scorching sun – sits, embodying femininity and a mother\'s love which dates back to prehistoric times.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(158,'The Abode Of Peace',2022,'exhibitor-works/work-Obianuju-Nnaji-9c719c5e-5283-451d-b641-746c0b3718b9.jpg',96,80.00,1,'Natural African setting, the closeness to nature, the mud houses that breathe in air, the ethereal appeal of raffia, and the bamboo-crafted bench, all serve as reminders of a home once cherished but now forgotten…or almost forgotten.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(159,'Odu Enyi - The Tusk Of Life',2021,'exhibitor-works/work-Obianuju-Nnaji-9c719c5e-947c-43f6-9993-49cf5df0b6a5.jpg',96,85.00,1,'The Elephant tusk is indigenous to Africa. It speaks volumes of power and wealth, and when royalty meets the pulsating sound from an Elephant tusk even the gods come down to dance in a wedlock of mortality and immortality.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(160,'DADA',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-23f7-418e-a38d-ad7beef87af3.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(161,'Dundun',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-512d-4ebc-ab9e-7bac63a19832.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(162,'Growing old',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-7581-4731-95ff-137cb4f094d2.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(163,'Dundun',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-a3be-4be3-9d45-01ebd56a99d4.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(164,'Mystery',2020,'exhibitor-works/work-Naomi-Amarachi-9c71df03-1ab8-44ca-9913-44ddf31a842d.jpg',98,100000.00,2,'A young girl photographer filled with doubt and fears on what the future lies for her.','2024-07-04 21:34:27','2024-07-04 21:34:27',5),(165,'Youthful Radiance',2024,'exhibitor-works/work-Naomi-Amarachi-9c71df03-2e4d-4293-8921-dc247d6fa040.png',98,100000.00,2,'The innocence of the youth has been tampered, what lies ahead for us the youth?','2024-07-04 21:34:27','2024-07-04 21:34:27',5),(166,'Victory',2024,'exhibitor-works/work-Naomi-Amarachi-9c71df03-931e-44b3-922f-ccf912b90edf.jpg',98,100000.00,2,'Victory is what we need! We are victorious','2024-07-04 21:34:28','2024-07-04 21:34:28',5),(167,'The Demonstration',2022,'exhibitor-works/work-Bright-Charles-9c72315b-de69-4097-8b25-5837d72f4e54.jpg',99,550000.00,2,'The protests weren\'t solely because of the women\'s taxes, although that was the primary reason. The women also sought to take back their place in the system. \r\nBefore the British imposed indirect rule on them, women held positions and titles and were greatly respected. But with the presence of the British administrators, women were stripped of their titles, and all powers were transferred to the men. \r\nThe Demonstration represents a decision to stand up against the injustice meted out to them, and the women\'s taxation policy provided a perfect opportunity for them to fight back.','2024-07-05 01:24:43','2024-07-05 01:24:43',5),(168,'The Oloko Trio',2022,'exhibitor-works/work-Bright-Charles-9c72315c-3c31-42d3-afb5-de6764bc4eae.jpg',99,550000.00,2,'In such times, there will always be a need for heroes, regardless of gender, age and status. \r\n\r\nThe Oloko Trio, Ikonnia, Nwannedia and Nwugo were the women appointed to act as their leaders and spokeswomen. They urged the women to keep the protests peaceful, and ensured that the protests didn\'t affect the other activities that took place.','2024-07-05 01:24:43','2024-07-05 01:24:43',5),(169,'Shores Of Hope',2022,'exhibitor-works/work-Bright-Charles-9c72315c-9909-4cd9-a61b-80a1a1752e19.jpg',99,550000.00,2,'There are stories only you have to tell, because there is no one who looks at the world in the way you do. There is no one else who listens to the whispers tucked in a soft breeze or understands the wilting petals whimpering. There is no one who feels the earth in the way you do. You are the one. This is Hope','2024-07-05 01:24:43','2024-07-05 01:24:43',5),(170,'Reconnaissance',2022,'exhibitor-works/work-Bright-Charles-9c72315c-f866-4bf5-91ec-049ec6f28176.jpg',99,550000.00,2,'What started as a peaceful protest turned into a shootout, and women came from Aba, Calabar, Ikot-Ekpene and Umuahia to join the protesters in and around Oloko.','2024-07-05 01:24:44','2024-07-05 01:24:44',5),(171,'Dying To Live',2022,'exhibitor-works/work-Bright-Charles-9c72315d-5f36-4e36-8673-86961273bcdc.jpg',99,700000.00,2,'Death has a higher purpose, and because the women understood this knowledge, it gave them the zeal to rebel and put up a front that broke the boundaries within which they operated. While they were dying to live, these women realized that death was a small price to pay for freedom','2024-07-05 01:24:44','2024-07-05 01:24:44',5),(172,'Savour’ing the Moments',2023,'exhibitor-works/work-Esther-Chidinma-9c72eb1b-8501-46e3-8bd0-14dde40a5b4c.jpg',100,100.00,1,'Simplicity at its finest','2024-07-05 10:04:06','2024-07-05 10:04:06',5),(173,'Love in the air',2023,'exhibitor-works/work-Esther-Chidinma-9c72eb1b-98e4-404a-ba2e-abf7d4d2de2b.jpg',100,100.00,1,'A picture that speaks louder than words','2024-07-05 10:04:06','2024-07-05 10:04:06',5),(174,'Magic moment',2023,'exhibitor-works/work-Esther-Chidinma-9c72eb1b-c9c6-4f68-bc68-6a36eec2d8a2.jpg',100,100.00,1,'Happy and grateful for the Love','2024-07-05 10:04:06','2024-07-05 10:04:06',5),(175,'Modeling is really silent acting',2022,'exhibitor-works/work-Esther-Chidinma-9c72eb1b-e2c4-4cf7-baed-8a7b91c9b2b6.jpg',100,100.00,1,'Modeling, for me, isn\'t about being beautiful but creating something interesting for people to look at and think about.','2024-07-05 10:04:06','2024-07-05 10:04:06',5),(176,'Freshout',2024,'exhibitor-works/work-Esther-Chidinma-9c72eb1b-f9cf-40a2-8a57-364edd1ca0ca.jpg',100,100.00,1,'Whether you think you can or you think you can\'t, you\'re right.” ...','2024-07-05 10:04:06','2024-07-05 10:04:06',5),(177,'Nwanyikaibie',2024,'exhibitor-works/work-Izuchukwu-Nwokedi-9c740c94-8daa-4445-9300-793b04e69ef8.jpg',101,200.00,1,'Bold and unafraid.','2024-07-05 23:33:32','2024-07-05 23:33:32',5),(178,'Nwamaka',2024,'exhibitor-works/work-Izuchukwu-Nwokedi-9c740c94-b07c-41ff-b0c4-2db2e26bb914.jpg',101,100.00,1,'Beauty under the rising sun.','2024-07-05 23:33:32','2024-07-05 23:33:32',5),(179,'Nlecha',2024,'exhibitor-works/work-Izuchukwu-Nwokedi-9c740c94-c798-47ca-bf64-310d2a8d3df6.jpg',101,75.00,1,'Jovial, Unapologetic, pure and raw charisma','2024-07-05 23:33:32','2024-07-05 23:33:32',5),(180,'Chinyelu',2024,'exhibitor-works/work-Izuchukwu-Nwokedi-9c740c94-ebec-4a3f-aee8-2bf6836cdf20.jpg',101,60.00,1,'Adorned with the good fruits of life','2024-07-05 23:33:32','2024-07-05 23:33:32',5),(181,'HUSTLE-BUSTLE',2024,'exhibitor-works/work-Ayomide-Bukola-9c748e5c-cc78-46c7-976a-2cfb2767577b.jpg',102,200.00,1,'ONE DAY ONE DAY','2024-07-06 05:36:26','2024-07-06 05:36:26',5),(182,'GOD\'$ HOME',2024,'exhibitor-works/work-Ayomide-Bukola-9c748e5d-366a-49b0-a770-fa6ee30cdd0f.jpg',102,100.00,1,'Let\'s us go find peace','2024-07-06 05:36:26','2024-07-06 05:36:26',5),(183,'OASIS',2023,'exhibitor-works/work-Ayomide-Bukola-9c748e5d-7cb0-4770-abd5-0f87d8e71b2a.jpg',102,100.00,1,'Everything felt right and it felt familiar. It felt like my head','2024-07-06 05:36:26','2024-07-06 05:36:26',5),(184,'Mkpulumma',2024,'exhibitor-works/work-Izuchukwu-Nwokedi-9c77189f-89b6-41cd-8dc7-e6fb7dad2845.jpg',101,1000.00,1,'As mother nature betrothed to no one she stands strong as the large trees of the plains','2024-07-07 11:54:41','2024-07-07 11:54:41',5),(185,'Tall Tales from Paradise',2024,'exhibitor-works/work-Moses-Akem-9c773bc6-7e86-4ca1-bbfb-6c0efcef718b.jpg',103,50.00,1,'A collection of stunning images, the subject is objectively \'faceless\'; they have a face, but it is shielded in one way or the other through every frame. \r\n\'Tall Tales from Paradise\' celebrates the power of storytelling in shaping perceptions of place and memory. In some pieces, familiar landscapes are transformed into dreamlike vistas where echoes of past civilizations linger. In others, fantastical realms emerge from the artists\' imaginations, blurring the boundaries between myth and reality.\r\nThe exhibition is a testament to the artists\' skill in capturing the essence of \'The forgotten Country\' -a place where history whispers through the rustling leaves of ancient trees and where folklore dances in the flickering light of distant stars. Each artwork beckons viewers to embark on a journey of discovery, challenging them to reconsider what it means to remember and forget in a world where the past and present converge. I would think of \'Manifestos\' when I think of the title of this submission.','2024-07-07 13:32:59','2024-07-07 13:32:59',5),(186,'Tall Tales from Paradise',2024,'exhibitor-works/work-Moses-Akem-9c773bc7-204d-490b-99ea-f9b21faadc0a.jpg',103,50.00,1,'A collection of stunning images, the subject is objectively \'faceless\'; they have a face, but it is shielded in one way or the other through every frame. \r\n\'Tall Tales from Paradise\' celebrates the power of storytelling in shaping perceptions of place and memory. In some pieces, familiar landscapes are transformed into dreamlike vistas where echoes of past civilizations linger. In others, fantastical realms emerge from the artists\' imaginations, blurring the boundaries between myth and reality.\r\nThe exhibition is a testament to the artists\' skill in capturing the essence of \'The forgotten Country\' -a place where history whispers through the rustling leaves of ancient trees and where folklore dances in the flickering light of distant stars. Each artwork beckons viewers to embark on a journey of discovery, challenging them to reconsider what it means to remember and forget in a world where the past and present converge. I would think of \'Manifestos\' when I think of the title of this submission.','2024-07-07 13:32:59','2024-07-07 13:32:59',5),(187,'Tall Tales from Paradise',2024,'exhibitor-works/work-Moses-Akem-9c773bc7-8319-4d1d-bce3-1cbba32f4b8d.jpg',103,50.00,1,'A collection of stunning images, the subject is objectively \'faceless\'; they have a face, but it is shielded in one way or the other through every frame. \r\n\'Tall Tales from Paradise\' celebrates the power of storytelling in shaping perceptions of place and memory. In some pieces, familiar landscapes are transformed into dreamlike vistas where echoes of past civilizations linger. In others, fantastical realms emerge from the artists\' imaginations, blurring the boundaries between myth and reality.\r\nThe exhibition is a testament to the artists\' skill in capturing the essence of \'The forgotten Country\' -a place where history whispers through the rustling leaves of ancient trees and where folklore dances in the flickering light of distant stars. Each artwork beckons viewers to embark on a journey of discovery, challenging them to reconsider what it means to remember and forget in a world where the past and present converge. I would think of \'Manifestos\' when I think of the title of this submission.','2024-07-07 13:32:59','2024-07-07 13:32:59',5),(188,'Tall Tales from Paradise',2024,'exhibitor-works/work-Moses-Akem-9c773bc7-ea94-45ec-af5d-b6c044f13f7a.jpg',103,50.00,1,'A collection of stunning images, the subject is objectively \'faceless\'; they have a face, but it is shielded in one way or the other through every frame. \r\n\'Tall Tales from Paradise\' celebrates the power of storytelling in shaping perceptions of place and memory. In some pieces, familiar landscapes are transformed into dreamlike vistas where echoes of past civilizations linger. In others, fantastical realms emerge from the artists\' imaginations, blurring the boundaries between myth and reality.\r\nThe exhibition is a testament to the artists\' skill in capturing the essence of \'The forgotten Country\' -a place where history whispers through the rustling leaves of ancient trees and where folklore dances in the flickering light of distant stars. Each artwork beckons viewers to embark on a journey of discovery, challenging them to reconsider what it means to remember and forget in a world where the past and present converge. I would think of \'Manifestos\' when I think of the title of this submission.','2024-07-07 13:33:00','2024-07-07 13:33:00',5),(189,'Tall Tales from Paradise',2024,'exhibitor-works/work-Moses-Akem-9c773bc8-7df7-48fb-a2b7-068035d211c5.jpg',103,50.00,1,'A collection of stunning images, the subject is objectively \'faceless\'; they have a face, but it is shielded in one way or the other through every frame. \r\n\'Tall Tales from Paradise\' celebrates the power of storytelling in shaping perceptions of place and memory. In some pieces, familiar landscapes are transformed into dreamlike vistas where echoes of past civilizations linger. In others, fantastical realms emerge from the artists\' imaginations, blurring the boundaries between myth and reality.\r\nThe exhibition is a testament to the artists\' skill in capturing the essence of \'The forgotten Country\' -a place where history whispers through the rustling leaves of ancient trees and where folklore dances in the flickering light of distant stars. Each artwork beckons viewers to embark on a journey of discovery, challenging them to reconsider what it means to remember and forget in a world where the past and present converge. I would think of \'Manifestos\' when I think of the title of this submission.','2024-07-07 13:33:00','2024-07-07 13:33:00',5),(190,'The Boy Child in Sokoto',2022,'exhibitor-works/work-Prince-Enyagam-9c77f3d2-03a5-49a9-9d55-a8f2a065b714.jpg',104,100.00,1,'This is a haunting image that shows a young boy exhausted from his long journey selling Kunu, a traditional beverage that is a staple in many Nigerian households. His tired eyes and weary expression speak volumes about the harsh realities of child labor, a practice that is all too common in Sokoto state. This image is a powerful reminder that childhood is a precious and fleeting phase of life that should be cherished and protected.','2024-07-07 22:07:36','2024-07-07 22:07:36',5),(191,'The Kunu Seller',2022,'exhibitor-works/work-Prince-Enyagam-9c77f3d2-2b26-4ee7-ab2d-39256d5e596f.jpg',104,150.00,1,'The image highlights the stark reality of child labor in Sokoto state, where children as young as five or six years old are forced to work long hours in harsh conditions to support their families. This image is a call to action, a reminder that we must do more to protect the rights and dignity of our children and ensure that they have access to quality education and a childhood that is free from exploitation','2024-07-07 22:07:36','2024-07-07 22:07:36',5),(192,'GDSS GIRLS KWARE SOKOTO',2022,'exhibitor-works/work-Prince-Enyagam-9c77f3d2-3e12-465c-87da-9752173713bc.jpg',104,120.00,1,'This is a powerful image that showcases the empowerment of young girls through education. This photograph is a testament to the transformative power of learning, and a reminder that education is the key to unlocking the potential of our young people. By investing in our girls, we are investing in a brighter future for our communities, our countries, and our continent.','2024-07-07 22:07:36','2024-07-07 22:07:36',5),(193,'Achida Market, Sokoto',2022,'exhibitor-works/work-Prince-Enyagam-9c77f3d2-595a-4097-adbd-b7c1dbc5a084.jpg',104,200.00,1,'This potograph is a vibrant image that reveals the bustling spirit of the second-largest market in Sokoto. It is a celebration of the entrepreneurial spirit of the Sokoto people, and a reminder that even in the face of adversity, there is always hope and always a way forward.','2024-07-07 22:07:36','2024-07-07 22:07:36',5),(194,'ROOTS',2022,'exhibitor-works/work-Valentine-Udemadu-9c7cb1d2-9be4-4246-a50a-ca0b64477375.jpg',105,50000.00,2,'This piece depicts the pride and generational beauty of an Igbo Woman. Omasili, a young Igbo girl is adorned with the Annual August Meeting Attire owned by her grandmother and passed down by her mother.','2024-07-10 06:42:12','2024-07-10 06:42:12',5),(195,'ROOTS',2022,'exhibitor-works/work-Valentine-Udemadu-9c7cb1d2-dd34-49d2-9d02-1a6feae67907.jpg',105,50000.00,2,'Omasili sitted regally in her mother\'s Annual August Meeting Attire, celebrates her womanhood as a Young Igbo Woman.','2024-07-10 06:42:12','2024-07-10 06:42:12',5),(196,'This thing called Nostalgia',2021,'exhibitor-works/work-Valentine-Udemadu-9c7cb1d3-193b-4895-b2cc-aeec707e0c50.jpg',105,50000.00,2,'Sopuru poses before the camera connecting the lifestyle and fashion of the Igbo Man in the 60s. Fresh from colonialism','2024-07-10 06:42:12','2024-07-10 06:42:12',5),(197,'This thing Called Nostalgia',2021,'exhibitor-works/work-Valentine-Udemadu-9c7cb1d3-4f59-4937-a7ed-4b043f1aef1a.jpg',105,200.00,1,'A recollection of the Life and Times of the Nigerian Man who has freshly been douced in the phenomenon called Colonialism','2024-07-10 06:42:13','2024-07-10 06:42:13',5),(198,'The Blind Dance',2021,'exhibitor-works/work-Chiemeziem-Mortanya-9c7db43f-fd1b-4a98-9f87-1c7c0163b053.jpg',106,400000.00,2,'\"The Blind Dance\" portrays a young woman, blindfolded and holding a rose, gracefully moving in an open field. The blurred motion effect captures the essence of movement and freedom, symbolizing the search for inner peace and direction in the face of uncertainty. The blindfold suggests a journey guided by intuition and faith rather than sight, emphasizing the importance of inner vision.','2024-07-10 18:44:49','2024-07-10 18:44:49',5),(199,'The Leap of Faith',2021,'exhibitor-works/work-Chiemeziem-Mortanya-9c7db440-37aa-4b54-ae95-56cb231345f0.jpg',106,450000.00,2,'\"The Leap of Faith\" features a blindfolded figure in mid-air, clutching a single rose against a backdrop of dark, stormy clouds. This image captures the powerful moment of taking a leap into the unknown, driven by courage and hope. The contrast between the figure\'s light attire and the ominous sky highlights the juxtaposition of vulnerability and strength inherent in acts of faith.','2024-07-10 18:44:49','2024-07-10 18:44:49',5),(200,'Unveiled Essence',2024,'exhibitor-works/work-Chiemeziem-Mortanya-9c7db440-630f-47a7-8bcd-13e51c13f7b1.jpg',106,350000.00,2,'\"Unveiled Essence\" is a close-up portrait that delves into the raw beauty and strength of the human face. The subject\'s intense gaze and the fine details of the skin\'s texture invite viewers to explore the depth of emotion and story within. This photograph celebrates individuality and the unique traits that define our personal identity.','2024-07-10 18:44:49','2024-07-10 18:44:49',5),(201,'Echoes of Tradition',2024,'exhibitor-works/work-Chiemeziem-Mortanya-9c7db440-a5cc-4a8b-b312-103860170f92.jpg',106,380000.00,1,'\"Echoes of Tradition\" captures a vibrant scene from a traditional cultural event, with a central figure playing an indigenous wind instrument. The lively background with participants dressed in ceremonial attire reflects the rich cultural heritage and communal spirit. This piece honors the preservation of customs and the collective identity that binds communities together.','2024-07-10 18:44:50','2024-07-10 18:44:50',5),(202,'Embrace of Nature',2021,'exhibitor-works/work-Chiemeziem-Mortanya-9c7db441-11d7-4074-930f-4369d574799c.jpg',106,350000.00,2,'\"Embrace of Nature\" showcases a serene moment of a woman standing in a lush green field, her face lifted towards the sky as rain gently falls. The sense of connection with nature and the openness to the elements symbolize a return to roots and an appreciation for the natural world. This photograph evokes a sense of peace, renewal, and harmony with the environment.','2024-07-10 18:44:50','2024-07-10 18:44:50',5),(203,'Naija to the world',2024,'exhibitor-works/work-Okezie-Pax-9c7e4da3-f25e-448a-8f45-ae56561bb9ba.jpg',107,37.00,1,'\"Naija to the world\" is all about showcasing the talents, culture, and potential of Nigerians globally. It’s our ambition to shine in technology, arts, business, and more. By using our skills and creativity, we can make a mark internationally. This phrase captures our pride and determination to prove that Nigeria has what it takes to succeed on the world stage. It also celebrates the vibrancy, richness, and depth of our culture, sharing our unique stories and energy with everyone.','2024-07-11 01:53:44','2024-07-11 01:53:44',5),(204,'Greener pastures overseas',2024,'exhibitor-works/work-Okezie-Pax-9c7e4da4-1bd0-4333-8eed-e9784e17672c.jpg',107,29.00,1,'\"Greener pastures overseas\" refers to the pursuit of better living conditions, job opportunities, and overall quality of life in foreign countries. Due to economic hardship, inflation, and the collapse of essential institutions in our home country, many Nigerians feel compelled to migrate in search of improved prospects and stability abroad. This often involves seeking higher-paying jobs, better healthcare, and a safer environment, despite the challenges of living away from their roots and loved ones.','2024-07-11 01:53:44','2024-07-11 01:53:44',5),(205,'Your mind is your passport overseas',2024,'exhibitor-works/work-Okezie-Pax-9c7e4da4-4a9f-4255-8911-9c4ce4e3b48f.jpg',107,25.00,1,'\"Your mind is your passport overseas\" emphasizes the idea that your skills, knowledge, and creativity can transcend geographical boundaries. By leveraging your intellectual capabilities and utilizing digital tools, you can access global opportunities and markets without physically relocating. This mindset empowers individuals to achieve success and connect with international clients, proving that one\'s mental assets can open doors to the world, much like a passport.','2024-07-11 01:53:44','2024-07-11 01:53:44',5),(206,'Pele',2022,'exhibitor-works/work-Ololade-Olawale-9c7e4fe2-98d6-419e-a61c-235d642fb878.jpg',108,250000.00,2,'Headshot of a woman with 3 short vertical straight markings on both cheeks.','2024-07-11 02:00:00','2024-07-11 02:00:00',5),(207,'Abaja',2022,'exhibitor-works/work-Ololade-Olawale-9c7e4fe2-b34d-4a55-8409-0ba9142e5ca5.jpg',108,250000.00,2,'Headshot of a woman with 4 horizontal and 3 vertical lines on each cheek as a tribal marking','2024-07-11 02:00:00','2024-07-11 02:00:00',5),(208,'The good old days',2024,'exhibitor-works/work-Clinton-Eze-9c7eae22-ee59-4ce6-98a7-48ce1a4a327a.jpg',109,30.00,1,'This is a piece from the body of work “THE GOOD OLD DAYS” was shot on an Apple iPhone 7, It’s a reminder  of the good times we had while growing up, how free spirited we were, the joy we once had in the streets of Nigeria and of hope that we’ll be remembered','2024-07-11 06:23:33','2024-07-11 06:23:33',5),(209,'The good old days',2024,'exhibitor-works/work-Clinton-Eze-9c7eae23-2d31-4f8f-9d9c-015f076b743b.jpg',109,30.00,1,'This is a piece from the body of work “THE GOOD OLD DAYS” was shot on an Apple iPhone 7, It’s a reminder  of the good times we had while growing up, how free spirited we were, the joy we once had in the streets of Nigeria and of hope that we’ll be remembered','2024-07-11 06:23:33','2024-07-11 06:23:33',5),(210,'The good old days',2024,'exhibitor-works/work-Clinton-Eze-9c7eae23-a6f3-49ff-9c3a-7c69dfae4e17.jpg',109,30.00,1,'This is a piece from the body of work “THE GOOD OLD DAYS” was shot on an Apple iPhone 7, It’s a reminder  of the good times we had while growing up, how free spirited we were, the joy we once had in the streets of Nigeria and of hope that we’ll be remembered','2024-07-11 06:23:34','2024-07-11 06:23:34',5),(211,'9ja no dey carry last',2024,'exhibitor-works/work-Okezie-Pax-9c7eeb7a-5b5e-4be2-b15b-f3097b5b89c2.jpg',107,27.00,1,'\"9ja no dey carry last\" is all about the incredible resilience and determination of Nigerian youth. \r\n\r\nDespite tough economic conditions, poverty, and poor governance, we refuse to be held back.\r\n\r\nThis saying captures our spirit of never giving up and always pushing forward, no matter what. \r\n\r\nIt’s about the creativity, ingenuity, and relentless drive of young Nigerians to succeed and make a difference — turning challenges into opportunities and keeping Nigeria moving forward with pride and strength.','2024-07-11 09:15:05','2024-07-11 09:15:05',5),(212,'9ja no dey carry last',2024,'exhibitor-works/work-Okezie-Pax-9c7eeb80-1923-4c4a-8af4-1dd2e84c6562.jpg',107,27.00,1,'\"9ja no dey carry last\" is all about the incredible resilience and determination of Nigerian youth. \r\n\r\nDespite tough economic conditions, poverty, and poor governance, we refuse to be held back.\r\n\r\nThis saying captures our spirit of never giving up and always pushing forward, no matter what. \r\n\r\nIt’s about the creativity, ingenuity, and relentless drive of young Nigerians to succeed and make a difference — turning challenges into opportunities and keeping Nigeria moving forward with pride and strength.','2024-07-11 09:15:08','2024-07-11 09:15:08',5),(213,'FINDING SALVATION.',2022,'exhibitor-works/work-Osita-Mbagwu-9c7f864c-e1c2-46a0-bd58-10d5f6b1f4d0.jpg',110,275.00,1,'Two women and a little child walk a small path on their way to a local mosque for prayers.','2024-07-11 16:27:59','2024-07-11 16:27:59',5),(214,'AUTUMN IN AFRICA',2023,'exhibitor-works/work-Osita-Mbagwu-9c7f864d-17ae-4560-9d5e-9ca4167a9c6c.jpg',110,180.00,1,'Trees in a forest with leaves about to  wilt and fall just before the rains begin for the year.','2024-07-11 16:28:00','2024-07-11 16:28:00',5),(215,'GREENER PASTURES',2022,'exhibitor-works/work-Osita-Mbagwu-9c7f864d-7d71-4226-8437-13f04d0e338f.jpg',110,185.00,1,'Photograph of sheep grazing in an open field in the North.','2024-07-11 16:28:00','2024-07-11 16:28:00',5),(216,'WHILE WE WERE YOUNG.',2021,'exhibitor-works/work-Osita-Mbagwu-9c7f864d-a92d-4bba-8b7f-d1e99937e1ac.jpg',110,120.00,1,'A photograph of children playing soccer I a field.','2024-07-11 16:28:00','2024-07-11 16:28:00',5),(217,'LIFE IN MOTION',2022,'exhibitor-works/work-Osita-Mbagwu-9c7f864d-bb68-4b50-b95a-64e3d11e3fa6.jpg',110,150.00,1,'Photograph of pedestrians walking a flyover on the outskirts of the city as the sun sets.','2024-07-11 16:28:00','2024-07-11 16:28:00',5),(218,'Agojie',2023,'exhibitor-works/work-Anita-Ovia-9c807103-53a4-4fae-8b98-740dd9ae10a6.jpg',111,150.00,1,'A powerful and unwavering Agojie warrior stands tall, her stare steadfast. The vibrant colours and Intricate details evokes the sense of motion and readiness for battle. The composition of this piece highlights the warrior\'s poised strength and the raw energy of her spirit.','2024-07-12 03:24:17','2024-07-12 03:24:17',5),(219,'Ancestral Guardian',2023,'exhibitor-works/work-Anita-Ovia-9c807103-6878-4188-9e7f-0c6345a73823.jpg',111,150.00,1,'“Ancestral Guardian”captures a young girl self-possessed with determination, wrapped in vibrant red fabric that symbolizes strength and ancestry. Holding a staff, she stands as a protector and bearer of her rich ancestral legacy. This powerful image reflects the enduring spirit and strength of African traditions, celebrating the resilience and pride of the young guardians of ancestral heritage.','2024-07-12 03:24:18','2024-07-12 03:24:18',5),(220,'Unchained Strength',2023,'exhibitor-works/work-Anita-Ovia-9c807103-9f2b-4589-8ed7-bb909cac7c51.jpg',111,150.00,1,'This piece showcases powerful transformative art to the unwavering determination of African spirit in the face of adversity. It explores the themes of emancipation, Inner strength and fortitude.','2024-07-12 03:24:18','2024-07-12 03:24:18',5),(221,'Mournful Eyes',2023,'exhibitor-works/work-Anita-Ovia-9c807103-e6ab-4839-80c0-56b233d62927.jpg',111,150.00,1,'“Mournful Eyes” captures a poignant moment of introspection and sorrow. The subject, adorned in traditional attire with a vibrant headwrap, gazes intently, her expression conveying a deep sense of loss and contemplation. This powerful image speaks to the unsaid and forgotten histories and overlooked cultural legacies that linger in silence, evoking an emotional connection to the past and the enduring spirit of those who remember.','2024-07-12 03:24:18','2024-07-12 03:24:18',5),(222,'Hustle',2020,'exhibitor-works/work-Agape-Obinna-9c818634-5341-4493-88d8-118a84fd1c3a.jpg',112,1000.00,1,'A loader whose job is to load and offload goods from vehicles,sitting comfortably on the roof the mini truck heading to the next location where he will have to offload the goods.','2024-07-12 16:19:22','2024-07-12 16:19:22',5),(223,'The Glide',2020,'exhibitor-works/work-Agape-Obinna-9c818634-6939-43c1-b2f9-7303cb5026df.jpg',112,800.00,1,'A tired cyclist holding on to the tail of a mini truck as it drags him along thereby giving him some minutes rest.','2024-07-12 16:19:23','2024-07-12 16:19:23',5),(224,'Humanity',2020,'exhibitor-works/work-Agape-Obinna-9c818634-82e7-498d-8d8a-153e540fc98c.jpg',112,1000.00,1,'Even in the most incapacitated state,there is someone who is there for you','2024-07-12 16:19:23','2024-07-12 16:19:23',5),(225,'Blind',2020,'exhibitor-works/work-Agape-Obinna-9c818634-a1e2-4ab8-9901-c3f908967653.jpg',112,1200.00,1,'Always in their white attire and praying beads,you have to get close to notice they are blind.','2024-07-12 16:19:23','2024-07-12 16:19:23',5),(226,'The Groove',2020,'exhibitor-works/work-Agape-Obinna-9c818634-bdfd-4c17-852e-6e8acab82027.jpg',112,800.00,1,'A young boy enjoying the cool of the evening by grooving on his bicycle','2024-07-12 16:19:23','2024-07-12 16:19:23',5);
/*!40000 ALTER TABLE `exhibitor_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibitors`
--

DROP TABLE IF EXISTS `exhibitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibitors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `photography_genre_id` bigint(20) unsigned NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `years_of_experience` tinyint(3) unsigned NOT NULL,
  `bio` text NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `collection_title` varchar(255) NOT NULL,
  `collection_description` text NOT NULL,
  `publicity_mode` varchar(255) NOT NULL,
  `works_used_by_external` tinyint(1) NOT NULL,
  `use_for_promotions` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alt_photography_genre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhibitors_user_id_foreign` (`user_id`),
  KEY `exhibitors_photography_genre_id_foreign` (`photography_genre_id`),
  CONSTRAINT `exhibitors_photography_genre_id_foreign` FOREIGN KEY (`photography_genre_id`) REFERENCES `photography_genres` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `exhibitors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitors`
--

LOCK TABLES `exhibitors` WRITE;
/*!40000 ALTER TABLE `exhibitors` DISABLE KEYS */;
INSERT INTO `exhibitors` VALUES (3,24,3,'08123132682',7,'I am a portrait/documentary photographer with 7 years of experience ,I use my art to tell stories of people ,their culture ,experiences and lifestyle.','Blackhydar photography','Durbar Art','A collection of images depicting the Durbar festival in the north .','Instagram',1,1,'2024-06-17 18:31:05','2024-06-17 18:31:05',NULL),(4,25,5,'07042149779',4,'I\'m 18 years old and currently a student at university of benin who loves his sister','Dante\'s Pictures','Culture must not die','A child cultural dressed in a yoruba iro and buba. Keeping culture alive by passing it on to the younger generation.','Instagram',1,1,'2024-06-17 22:46:49','2024-06-17 22:46:49',NULL),(36,65,3,'08062214089',5,'I teach Art History and Drawing at the Federal College of Education Zaria and practice photography as a hobby.','Johnotuphotography','Mini Durba','They photographs of a randomly selected aspects of Durba organised by students of the Department of Hausa Language of Federal College of Education Zaria Kaduna state.','Instagram',1,1,'2024-06-18 17:38:48','2024-06-18 17:38:48',NULL),(37,67,2,'07089943556',8,'Abdul is a creative visual communicator, documenting and keep history using photography. He is also a member of amazing aerial agency.','Photomora','Radiant Resilience','Description: \"Through the lens, the radiant energy of resilience shines bright as the subject raises their head’s, a visual testament to inner strength and unwavering determination in the face of challenges.\"','Instagram',1,1,'2024-06-18 23:22:30','2024-06-18 23:22:30',NULL),(38,69,3,'08094311223',11,'Philips Akwari is a visual storyteller whose expression is usually through documentary photography. His works seek to understand trends, patterns, and relationships between his subjects and their immediate environments. His documentary works have been focused on the everyday nuances and the cultural elements in the areas of his investigations.','M-Visuals Photography','The Rich Abiriba Heritage','These photos were picked from my book \"Abiriba: A Photographic Narrative of a Rich Cultural Heritage\". They are mostly from a different cultural event; The first photo is Igba Ekpe representing the coming of age among young boys in Abiriba. It is a kind of proposal for the formation of an Age Grade. \nThe second photo Uche Oba is guarding the community yam barn. It is the next phase of formation of age grade where the young boys are assigned to guard the community yam barn for a period of time. The photo was taken when they are returning from the bush. \nThe third photo is Onye iwowo (a decorated dancer to entertain the celebrants of Igwa Mang). \nThe fourth photo is that of Ugbo Nde Ekpe belong to the Nwafor Udenyi trading House and decorated with American flags. They are part of the complex Ekpe society in Abiriba kingdom and in this instance is their participation during the Igwa Mang ceremony.\nThe fifth photo is the arrival of Eze Ihungwu ( one of the three important Ezes  of Abiriba kingdom in relation to law making) at the venue of the Itu Eye (law enactment and pronouncement) in Abiriba. Each photo belong to a series of photos that tells broader stories beyond the scope of this exhibition.','Instagram',1,1,'2024-06-19 11:59:26','2024-06-19 11:59:26',NULL),(88,140,2,'09126547720',2,'I’m a young creative photographer that likes to tell stories through my art','Demer','Feel the calmness','A series of photos that shows  the emotional part calmness at it purest form','Instagram',1,1,'2024-06-24 09:27:08','2024-06-24 09:27:08',NULL),(95,159,3,'+2348100544147',7,'Timmy Okanlawon is a Documentary Photographer and a Visual Historian. He is dedicated to capturing the world\'s untold stories through his third eye. He loves to shed light on the diverse cultures, ethnics, festivals, communities, and issues that often remain hidden from the mainstream.','Timmy Okanlawon','Echoes of Euphoria','This collection embodies the spirit of joy, freedom, and vibrant energy that festivals bring. It\'s designed to enhance festival experience with unique and stylish accessories that capture the essence of euphoria. This collection was created from Ojude Oba, a renowned festival in Ijebu Ode, Ogun state. Echoes of Euphoria aims at festival-goers of all ages who love to express their unique style and embrace the festive spirit through accessories.','Instagram',1,1,'2024-07-04 18:08:43','2024-07-04 18:08:43',NULL),(96,160,3,'+2348137887447',5,'I am Nnaji Obianuju Esther, a photo freak. I see the world through the eyes of the lens, observing unnoticed details, finding beauty where others see nothing, and dissecting it to expose its unique flaws. I adore nature, contributing my own quota to creatively bring out its potency.','Esther Nnaji','Rhythms and Roots','Nature is a marriage of sight and sound. From the rhythms of the sea shore to the echoes of Elephant tusks, the joyful heartbeat of a child engrossed with nature and the captivating allure of an African home. \r\nI seek to represent and present the simplicity yet in-depth complexity of an African setting especially sweet part of yore lost to the present generation but still encapsulating the beauty of the African setting, to see if what appears forgotten can forever be engraved  in our minds.','Instagram',0,1,'2024-07-04 18:28:05','2024-07-05 11:08:04',NULL),(97,161,2,'07031997045',5,'Hello my name is tosin olowoleni and I’m a potrait photographer.','The top photos','Heart for Art.','Original photographs by me \r\nMostly taken in the year 2022.','Instagram',1,1,'2024-07-04 18:48:04','2024-07-04 18:48:04',NULL),(98,89,2,'09027997382',3,'A young female photographer who expresses her emotions through photographs.','Genaconcept_media','What lies ahead?','What does the future holds?','Instagram',1,1,'2024-07-04 21:34:27','2024-07-04 21:34:27',NULL),(99,163,3,'08159043633',7,'My name is Bright Charles, a  photographer known for my ability to forge deep connections with my subjects, allowing me to capture images that carry strong emotions and profound depth.','The Storyteller','The Women\'s War','Based on true events that happened in the Aba Province,1929; the Women\'s War project is based of the stories of these women who stood up for themselves against the colonial masters who wanted them to pay tax.','Instagram',1,1,'2024-07-05 01:24:43','2024-07-05 01:24:43',NULL),(100,166,6,'09075932111',2,'I view myself as a creative problem-solver with time management and organisational abilities. Creating memories that will last a lifetime','qwinJp (celebrity_fotographer)','Celebrities','Captioned moments that leave an everlasting impression','Instagram',1,1,'2024-07-05 10:04:06','2024-07-05 10:04:06','Lifestyle'),(101,57,2,'08058256845',4,'I am Louis-Raphael Nwokedi, a visual storyteller and Mechanical Engineering student at Nnamdi Azikiwe University. My photography exquisitely captures the essence of Afro culture and heritage, crafting bespoke narratives that celebrate our rich traditions. Discover the beauty of our world through my refined lens.','Luiz Photography','Ada Iba','\"Ada Iba\" embodies the essence of strength and pride within her family. She stands as the cherished daughter of the household, the unwavering stronghold upon which her family relies. Her presence is a beacon of resilience and fortitude, reflecting the deep-rooted values of her lineage. As her father\'s pride and joy, she carries herself with an elegance and grace that is both captivating and inspiring. Her name, \"Ada Iba,\" is more than just a title—it is a testament to her pivotal role in her family\'s legacy and a symbol of the enduring strength that she represents.','Instagram',1,1,'2024-07-05 23:33:32','2024-07-05 23:33:32',NULL),(102,168,1,'09159516404',4,'I\'m a Creative based in Nigeria. \r\nI love photography and designing.','PRAY4STEEZNGUAP','COLOR PHANTASM','EYEGASM by PRAY4STEEZNGUAP','Instagram',1,1,'2024-07-06 05:36:25','2024-07-06 05:36:25',NULL),(103,170,6,'09060560995',2,'I am a Human being in my most fundamental sense. I think Monochrome can be colorful, and everything that was made, satisfies a very specific purpose in the grand scheme of God\'s good plans.','The Villager','Tall Tales from Paradise','A collection of stunning images, the subject is objectively \'faceless\'; they have a face, but it is shielded in one way or the other through every frame. \r\n\'Tall Tales from Paradise\' celebrates the power of storytelling in shaping perceptions of place and memory. In some pieces, familiar landscapes are transformed into dreamlike vistas where echoes of past civilizations linger. In others, fantastical realms emerge from the artists\' imaginations, blurring the boundaries between myth and reality.\r\nThe exhibition is a testament to the artists\' skill in capturing the essence of \'The forgotten Country\' -a place where history whispers through the rustling leaves of ancient trees and where folklore dances in the flickering light of distant stars. Each artwork beckons viewers to embark on a journey of discovery, challenging them to reconsider what it means to remember and forget in a world where the past and present converge. I would think of \'Manifestos\' when I think of the title of this submission.','A Friend',0,1,'2024-07-07 13:32:59','2024-07-07 13:32:59','Creative, Alternative, Lifestyle.'),(104,172,3,'+2349063573339',4,'As a documentary photographer and African storyteller, I am driven by an unrelenting passion to capture the essence of Africa\'s beauty, diversity, and untapped potential. \r\n\r\nMy photographic journey, for almost five years, has taken me to the most remote and forgotten corners of northern, Nigeria.','The Rediscovery Series Africa','Rediscovery Sokoto Collection','The Collection: Rediscovery Sokoto shines a light on the unseen lives of Sokoto\'s young hearts, shattering the silence and invisibility that often surrounds them. By capturing the raw emotions, struggles, and resilience of these young souls, Rediscovery Sokoto inspires a new perspective on the beauty and strength of Africa\'s forgotten communities.','Instagram',0,1,'2024-07-07 22:07:36','2024-07-07 22:07:36',NULL),(105,47,5,'09079875018',5,'Valentine Udemadu is an independent photographer, fashion enthusiast, and Law student based in Lagos Nigeria. Valentine\'s Afrocentricism can be seen in alot of his works depicting, honoring, and recreating Black Symbols of Excellence while changing the Black/African Narrative through African Pride and Cultural Appreciation.','Valentine Udemadu','ROOTS','Beautiful braiding techniques that date back centuries, telling stories that only the eyes can explain. \r\nThe annual August meeting uniform; The Iconic white blouse, bedazzled with jewelries, a must-have handbag/purse, and the double wrapper draped around their waists. \r\nBell Trousers and Grandpa\'s bike. A fashionable perspective to the Forgotten Country.\r\nThis is an homage to the old times of our grandparents and forebears. Recreating old images of my grandpa and his friends by a 3rd generation \r\nAs well as depicting the Beauty of the Annual August Meeting as my model and sister adorns my Mother\'s August Meeting Uniform.\r\nA lineage of strong, powerful, men and women...there you shall find your roots.\"','Instagram',0,1,'2024-07-10 06:42:12','2024-07-10 06:42:12',NULL),(106,174,6,'08100552753',6,'Chiemeziem Mortanya (99Mortimedia)  an Anambra  artists with a camera(base in awka, from obosi), using a blend of technical skills and an artistic eye to take pictures of people, places,landscapes, food, you name it.','99Mortimedia','Reflections of Identity','This collection, \"Reflections of Identity,\" explores the multifaceted nature of human existence and cultural heritage through a blend of portrait and documentary photography. Each piece invites viewers to delve into the intricate layers of personal and communal identity, capturing moments of introspection, cultural celebration, and raw human emotion. The collection aims to evoke a deeper understanding of the diverse experiences that shape who we are.','Instagram',0,1,'2024-07-10 18:44:49','2024-07-10 18:44:49','Beauty Art'),(107,162,2,'09053218948',4,'My style is all about vibrant colors and tones, and I’m passionate about capturing the beauty in everyday moments. I focus on storytelling and making each photo feel authentic. Photography is a way for me to share the stories and experiences that make life special.','ohjayshotit','Economic Japa','Bad governance has caused the collapse of crucial institutions like healthcare, legal systems, and education in Nigeria. \r\n\r\nWith rising inflation, a high cost of living, and a poor quality of life, many Nigerians are forced to look for \"greener pastures\" overseas.\r\n\r\nThis \"forced\" migration is leading to a brain drain, where the brilliant minds that could help build our nation are leaving. \r\n\r\nOur communal and tribal values, along with our rich cultural heritage, are being lost as the new generation of immigrants loses touch with their roots. Those who migrate end up living in isolation, missing out on important moments with family and friends, and often feeling like second-class citizens in foreign countries.\r\n\r\nThe solution is economic japa. This means boosting your earning potential to the point where your geographical location doesn\'t matter. \r\n\r\nBy leveraging tools like social media and the internet, you can offer your skills and services to clients around the world, improving your financial situation without having to leave Nigeria.','A Friend',0,1,'2024-07-11 01:53:44','2024-07-11 01:53:44',NULL),(108,175,2,'09092196989',4,'Olawale Ololade, a multi-published fine art photographer from Lagos, Nigeria, expresses his passion for visual art through captivating portraits. His unique approach evokes emotions and engages viewers with exceptional skill.','Olawale ololade','Identity','\"Identity: A Visual Exploration of Tribal Marks\" is a collection of photographs that delves into the rich cultural heritage and deep-rooted traditions of tribal communities. Each image captures the unique patterns and intricate designs of tribal markings, showcasing their significance as symbols of identity, beauty, and social status. Through these photographs, I show the artistry and resilience of tribal cultures, offering a window into a world where history and personal stories are etched on the skin.','Instagram',0,1,'2024-07-11 02:00:00','2024-07-11 02:00:00',NULL),(109,97,6,'09026835406',3,'I am Eze Ugochukwu Clinton, also known as The.kingsview. I’m a photographer and a visual artist from owerri, Imo state Nigeria. I express myself and my view of the world through the medium of photography.','The.kingsview','The good old days','Growing up in the streets of Nigeria, it was like a tradition to play football every Saturday morning, we were young, we didn’t have to worry about paying bills, no burden on our shoulders, all we knew was to play have fun and live life as we saw fit, Unlike now where we have to struggle to survive every passing day, old traditions forgotten, everybody on a different path, well such is life but I miss the good old days.','Instagram',0,1,'2024-07-11 06:23:33','2024-07-11 06:23:33','Fine art portrait photography'),(110,177,1,'08058293691',4,'Hi. I\'m Ossy Mbagwu, a medical doctor, photographer and writer. I began documentary and landscape photography as a hobby in 2020, during the lockdown and currently I have many collection of photographs under my belt. I write plays, and fiction and work in the hospital in my spare time lol.','Chillsville','UP NORTH','Up North is a collection of landscape photographs taken at different locations in Northern Nigeria, Niger state to be precise. The beauty of the north is often terribly overlooked, due to inevitable reasons. I hope this gives a glimpse of the beauty I\'ve experienced in real time through my lens and these photographs.','Instagram',0,1,'2024-07-11 16:27:59','2024-07-11 16:27:59',NULL),(111,178,2,'09020170712',4,'My name is Ovia Anita, a portrait photographer, and my inspiration is drawn from God, people, events, and environment. I work to create possibilities with lens.','Annyart','Whispers of Heritage','Whispers of Heritage like echoes from the Past explores the untold stories and hidden legacies that shape our world. It’s a collection that delves into the cultural narratives and ancestral voices that resonate through time, revealing the rich tapestry of history and tradition that binds us all. The ability to capture these highly felt and symbolically powerful events increases viewers\' awareness for the resilience of African ancestors.','Instagram',0,1,'2024-07-12 03:24:17','2024-07-12 03:24:17',NULL),(112,151,3,'08134635012',7,'Traveling is one of my hobbies so whenever I am on the road my camera is always with me to take intriguing images.','Royalty Cynosure','The Street of Minna','Just an evening stroll in the street of Minna Niger State,I saw some intriguing moments and captured it.','Instagram',0,1,'2024-07-12 16:19:22','2024-07-12 16:19:22',NULL);
/*!40000 ALTER TABLE `exhibitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_exhibitions`
--

DROP TABLE IF EXISTS `external_exhibitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_exhibitions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `exhibitor_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_exhibitions_title_exhibitor_id_unique` (`title`,`exhibitor_id`),
  KEY `external_exhibitions_exhibitor_id_foreign` (`exhibitor_id`),
  CONSTRAINT `external_exhibitions_exhibitor_id_foreign` FOREIGN KEY (`exhibitor_id`) REFERENCES `exhibitors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_exhibitions`
--

LOCK TABLES `external_exhibitions` WRITE;
/*!40000 ALTER TABLE `external_exhibitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_exhibitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `google_drive_kind` varchar(255) DEFAULT NULL,
  `google_drive_id` varchar(255) DEFAULT NULL,
  `disk_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_disk_id_foreign` (`disk_id`),
  CONSTRAINT `files_disk_id_foreign` FOREIGN KEY (`disk_id`) REFERENCES `disks` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'0001_01_01_000003_create_permission_tables',1),(5,'0001_01_01_000004_user_role',1),(6,'0001_01_01_000005_create_currencies_table',1),(7,'0001_01_01_000006_create_disks_table',1),(8,'2024_06_02_205146_create_photography_genres_table',1),(9,'2024_06_02_205240_create_exhibitors_table',1),(10,'2024_06_02_205327_create_exhibitor_works_table',1),(11,'2024_06_02_211643_create_personal_access_tokens_table',1),(12,'2024_06_03_040731_create_external_exhibitions_table',1),(13,'2024_06_08_094102_create_files_table',1),(14,'2024_06_09_183038_create_sanity_documents_table',1),(15,'2024_06_09_183057_create_event_attendees_table',1),(16,'2024_06_11_201537_exhibitor_alt_photography_genre',1),(17,'2024_06_12_203024_one_time_login_tokens',2),(18,'2024_06_15_135041_user_image_disk',3),(19,'2024_06_24_170854_exhibitor_work_description_text',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(2,'App\\Models\\User',20),(2,'App\\Models\\User',24),(2,'App\\Models\\User',25),(2,'App\\Models\\User',47),(2,'App\\Models\\User',57),(2,'App\\Models\\User',65),(2,'App\\Models\\User',67),(2,'App\\Models\\User',69),(2,'App\\Models\\User',89),(2,'App\\Models\\User',97),(2,'App\\Models\\User',140),(2,'App\\Models\\User',141),(2,'App\\Models\\User',143),(2,'App\\Models\\User',151),(2,'App\\Models\\User',159),(2,'App\\Models\\User',160),(2,'App\\Models\\User',161),(2,'App\\Models\\User',162),(2,'App\\Models\\User',163),(2,'App\\Models\\User',166),(2,'App\\Models\\User',168),(2,'App\\Models\\User',170),(2,'App\\Models\\User',172),(2,'App\\Models\\User',174),(2,'App\\Models\\User',175),(2,'App\\Models\\User',177),(2,'App\\Models\\User',178),(3,'App\\Models\\User',1),(3,'App\\Models\\User',3),(3,'App\\Models\\User',4),(3,'App\\Models\\User',5),(3,'App\\Models\\User',6),(3,'App\\Models\\User',7),(3,'App\\Models\\User',8),(3,'App\\Models\\User',9),(3,'App\\Models\\User',10),(3,'App\\Models\\User',11),(3,'App\\Models\\User',12),(3,'App\\Models\\User',13),(3,'App\\Models\\User',14),(3,'App\\Models\\User',15),(3,'App\\Models\\User',16),(3,'App\\Models\\User',17),(3,'App\\Models\\User',18),(3,'App\\Models\\User',19),(3,'App\\Models\\User',20),(3,'App\\Models\\User',21),(3,'App\\Models\\User',22),(3,'App\\Models\\User',23),(3,'App\\Models\\User',26),(3,'App\\Models\\User',40),(3,'App\\Models\\User',47),(3,'App\\Models\\User',48),(3,'App\\Models\\User',56),(3,'App\\Models\\User',57),(3,'App\\Models\\User',63),(3,'App\\Models\\User',64),(3,'App\\Models\\User',66),(3,'App\\Models\\User',67),(3,'App\\Models\\User',68),(3,'App\\Models\\User',70),(3,'App\\Models\\User',71),(3,'App\\Models\\User',72),(3,'App\\Models\\User',82),(3,'App\\Models\\User',83),(3,'App\\Models\\User',84),(3,'App\\Models\\User',85),(3,'App\\Models\\User',86),(3,'App\\Models\\User',87),(3,'App\\Models\\User',88),(3,'App\\Models\\User',89),(3,'App\\Models\\User',90),(3,'App\\Models\\User',91),(3,'App\\Models\\User',92),(3,'App\\Models\\User',93),(3,'App\\Models\\User',94),(3,'App\\Models\\User',95),(3,'App\\Models\\User',96),(3,'App\\Models\\User',97),(3,'App\\Models\\User',98),(3,'App\\Models\\User',138),(3,'App\\Models\\User',139),(3,'App\\Models\\User',140),(3,'App\\Models\\User',141),(3,'App\\Models\\User',142),(3,'App\\Models\\User',144),(3,'App\\Models\\User',145),(3,'App\\Models\\User',151),(3,'App\\Models\\User',152),(3,'App\\Models\\User',153),(3,'App\\Models\\User',155),(3,'App\\Models\\User',158),(3,'App\\Models\\User',162),(3,'App\\Models\\User',164),(3,'App\\Models\\User',165),(3,'App\\Models\\User',166),(3,'App\\Models\\User',167),(3,'App\\Models\\User',169),(3,'App\\Models\\User',171),(3,'App\\Models\\User',173),(3,'App\\Models\\User',176);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `one_time_login_tokens`
--

DROP TABLE IF EXISTS `one_time_login_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `one_time_login_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `one_time_login_tokens`
--

LOCK TABLES `one_time_login_tokens` WRITE;
/*!40000 ALTER TABLE `one_time_login_tokens` DISABLE KEYS */;
INSERT INTO `one_time_login_tokens` VALUES ('abdulrahmanabubakar851@gmail.com','$2y$12$Zd9L10auy62RvfTm24daFuYbuECLkcabQX1POXuF7zVY2vtPrh6k.','2024-06-18 23:22:31'),('agapeobinna@gmail.com','$2y$12$y6rHbYo5u4FShV2TUfLi2elFmMvnHC.oCO4xawdW8rCKIpACwyXhC','2024-07-12 16:19:23'),('akemthevibe@gmail.com','$2y$12$VL8DcekSXZMg3wEDHf4mCeOLo1FaeVtEVObscFhE067uaYLmykwli','2024-07-07 13:33:01'),('alium4521@gmail.com','$2y$12$6BOl/4s3SYFdvhmrqLxcPe9eFFnwLEDX35hzZHRbhfgixpXynqV.u','2024-06-17 18:31:06'),('anitaefe847@gmail.com','$2y$12$YymAMueRSu07cqfw03.Awu4ZE5RRh91488M0tuwc9Q81unj.TRbYi','2024-07-12 03:24:19'),('boscophilz@gmail.com','$2y$12$u5XkW1W.V6duMNrTAYbUsu.vma13SczTy7f6kLNQqyNOgeJHWGumK','2024-07-03 21:41:38'),('classicmortanya2@gmail.com','$2y$12$v.SYCZ1yYZwm1ogaRUqlo.hmFz2eg4HvIZF.z6s0ssyk1v0KIAaaW','2024-07-10 18:44:50'),('clintoneze07@gmail.com','$2y$12$Gshknz/vQ3VoGYGBTWZhAehcBu3y1QPBY6llQrijDqSnkKOOMjGBO','2024-07-11 06:23:34'),('naomiamarach20@gmail.com','$2y$12$hXFwf9rVHdD8Jiuax.2.T.QMFAXJrszMngowBEyjh1yUtSXBeB/h.','2024-07-04 21:34:28'),('obarohmairo@gmail.com','$2y$12$hgh3mzhm68N4e7k3V4sEL.Rpvoe2nToKaeQmfM.OXBjbSOjpdt/fG','2024-06-24 09:27:09'),('olawaleololade08@gmail.com','$2y$12$yICuN3PxfdLbzJs/VjhMf.nT05JNjh9aY7eRB0fUO8C1mdC2VYVYa','2024-07-11 02:00:01'),('ozovehe@gmail.com','$2y$12$0IG4kGPcf8Y7aAMtIdtKbuZfqKlxSQIWbJTULW0OyL71erf27OByu','2024-06-18 17:38:49'),('philip.nwokedi.249413@unn.edu.ng','$2y$12$i2bjwhM8DypFeEb2.V2S5OtT7.yHUln9tzs5Pmt3XUbV5fDIMU4Eu','2024-07-03 10:27:44'),('philipsakwari@gmail.com','$2y$12$pTKRdHweZjFZSaSxPuEQ0.PWu7acY2XTN8X/zmOKwE1UIubYn7ZkC','2024-06-19 11:59:27'),('pray4steeznguap@gmail.com','$2y$12$mj.rQ.mDVambQEg9IGtMGum4IKJLv1oNWz9aEiqgIQDPOF7JvTUCW','2024-07-06 05:36:27'),('princemiles350@gmail.com','$2y$12$INQLdr0Qz5rrhJqAu0LCKuX7GAwyHBoxN6rFD1qb6kQfZ5dYgl8u2','2024-07-07 22:07:37'),('qwinjp01@gmail.com','$2y$12$b/Ilpfvai4JDKZxrekvi.ejh5quwVz7LgfxiMtb3pfFuXfzyKqmLG','2024-07-05 10:04:07'),('simeon130705@gmail.com','$2y$12$QW091d867etFrdvoSpVj5.SLzjFcORqpcsbPdvZM.0ZhV80bHrVQ.','2024-06-17 22:46:49'),('tech@natesaconsulting.com','$2y$12$4Y4/e3V0IhrqJjDS7ZSyTuh2ZLfuKDIpvcZfA0lVJnW1XGZL52/aO','2024-07-03 17:24:38'),('valentinesopuru56@gmail.com','$2y$12$3PllKLNIMIJp/7oGm2FWzOUrvEkBTMz6d9Bzz/p3uRAXJZpTrPk1m','2024-07-10 06:42:13');
/*!40000 ALTER TABLE `one_time_login_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photography_genres`
--

DROP TABLE IF EXISTS `photography_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photography_genres` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photography_genres_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photography_genres`
--

LOCK TABLES `photography_genres` WRITE;
/*!40000 ALTER TABLE `photography_genres` DISABLE KEYS */;
INSERT INTO `photography_genres` VALUES (1,'Landscape Photography','GENRE_LANDSCAPE','2024-06-12 06:15:16','2024-06-12 06:15:16'),(2,'Portrait Photography','GENRE_PORTRAIT','2024-06-12 06:15:16','2024-06-12 06:15:16'),(3,'Documentary Photography','GENRE_DOCUMENTARY','2024-06-12 06:15:16','2024-06-12 06:15:16'),(4,'Arial/Drone Photography','GENRE_ARIAL','2024-06-12 06:15:16','2024-06-12 06:15:16'),(5,'Abstract Photography','GENRE_ABSTRACT','2024-06-12 06:15:16','2024-06-12 06:15:16'),(6,'Others','GENRE_MISCELLANEOUS','2024-06-12 06:15:16','2024-06-12 06:15:16');
/*!40000 ALTER TABLE `photography_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2024-06-12 06:15:15','2024-06-12 06:15:15'),(2,'exhibitor','web','2024-06-12 06:15:15','2024-06-12 06:15:15'),(3,'attendee','web','2024-06-12 06:15:15','2024-06-12 06:15:15');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanity_documents`
--

DROP TABLE IF EXISTS `sanity_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanity_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `sanity_id` varchar(255) NOT NULL,
  `sanity_type` varchar(255) NOT NULL,
  `sanity_slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sanity_documents_sanity_id_sanity_type_unique` (`sanity_id`,`sanity_type`),
  UNIQUE KEY `sanity_documents_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanity_documents`
--

LOCK TABLES `sanity_documents` WRITE;
/*!40000 ALTER TABLE `sanity_documents` DISABLE KEYS */;
INSERT INTO `sanity_documents` VALUES (1,'The forgotten Country 2024','THE_FORGOTTEN_COUNTRY_2024','5f1894b4-ba39-4e92-b2d7-7e1070e92c47','event',NULL,'2024-06-12 06:15:16','2024-06-12 06:15:16');
/*!40000 ALTER TABLE `sanity_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `avatar_disk_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_avatar_disk_id_foreign` (`avatar_disk_id`),
  CONSTRAINT `users_avatar_disk_id_foreign` FOREIGN KEY (`avatar_disk_id`) REFERENCES `disks` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Raymond','Chuma-Onwuoku','ray@scala.africa',NULL,'$2y$12$TmC3qz1IMn7hIwjLbSIRt.7VN8hK2sAT8aD7m9YUSygGsJojtEu.6','uploads/headshots//avatar-9c4455f6-91c3-4c6d-af1d-b83a715ffb2d',NULL,'2024-06-12 06:15:16','2024-06-15 02:06:41',NULL,2),(3,'Mark','Okoye','Markokoye@gmail.com',NULL,'$2y$12$bVGDy7TJmucG2tAf.3VlKenwmFeWHjvbLxExhAMwLFzKUL7GpVF9q',NULL,NULL,'2024-06-13 09:04:32','2024-06-13 09:04:32',NULL,2),(4,'Emmanuel','Adeleke','lekeemma1@gmail.com',NULL,'$2y$12$yfycqPmt2CzSNl4yoNS42eenhelMet3fSdhyXeB2AonnrDu.kZP4G',NULL,NULL,'2024-06-13 11:19:47','2024-06-13 11:19:47',NULL,2),(5,'Raphael','Nwokedi','Zukiizu16@gmail.com',NULL,'$2y$12$ryuhXWsV5WTfPFTX0CHcUOakMVgNR5xdJ/cN.GA/7vquwflHL89YO',NULL,NULL,'2024-06-13 13:25:07','2024-06-13 13:25:07',NULL,2),(6,'Favour','Eboh','favoureboh12@gmail.com',NULL,'$2y$12$5sMLmmyLaNFf6TzUwZVtEeoXUHnZ3iAMDkUw.H98vCghVb0wgrqfa',NULL,NULL,'2024-06-13 14:24:08','2024-06-13 14:24:08',NULL,2),(7,'Jesse','Obasi','obasinzubejesse06@gmail.com',NULL,'$2y$12$xJZ5umSP4LrTwGpLHMHGcebG90NHLPFNnn3xQWxy8AbLP1hJIEsP.',NULL,NULL,'2024-06-13 18:12:07','2024-06-13 18:12:07',NULL,2),(8,'I am Igwebuike Marypromise Ifunanya.  I am from Amaowelle in Amansea Awka North L.G.A. I am 25 years old. I am currently a student of the Nigerian Law School, Enugu Campus.','Igwebuike','queeenmarydaisy1605@gmail.com',NULL,'$2y$12$pV./hK0I.dzAd4TeiamTWem4qAmozYj7GzR5Oxm3Qw3f6AAa3Afii',NULL,NULL,'2024-06-13 18:13:35','2024-06-13 18:13:35',NULL,2),(9,'Austin','Okeyika','Okeyikaaustin@gmail.com',NULL,'$2y$12$GWAc0fKEVokTXNvnphhT2uSMu34zPOrPU1WXsvMsk3GJc9b59nqwi',NULL,NULL,'2024-06-13 19:23:24','2024-06-13 19:23:24',NULL,2),(10,'Ogechukwu','Udoji','udojilynda8@gmail.com',NULL,'$2y$12$QffAQQoS38KgcBy23dfLee7Bysr5s6v.3r2m0qscG3T6MkhmRsp2W',NULL,NULL,'2024-06-13 19:40:38','2024-06-13 19:40:38',NULL,2),(11,'Ebube','Chukwudi','chukwudiebube00@gmail.com',NULL,'$2y$12$Vgsbd9MxlJhVIDnYLJK3UOPYdqtWr8rx/P3dp77vZadjpMdUGvtZu',NULL,NULL,'2024-06-13 20:52:06','2024-06-13 20:52:06',NULL,2),(12,'Adaeze','Obi-Obasi','hollaadaeze@gmail.com',NULL,'$2y$12$9Dkv.sEfcWiAlONPru0mROmdmDtlXrWPx3oynG5eRApbvYoADIwsa',NULL,NULL,'2024-06-14 11:00:02','2024-06-14 11:00:02',NULL,2),(13,'Christabel','Nnadi','nnadichristabel6@gmail.com',NULL,'$2y$12$zsTZ9ZyrXEocbBEr1Oe/rul2JeLRix.IZy2DFF6EQULcYXJPHG2Qm',NULL,NULL,'2024-06-14 11:09:34','2024-06-14 11:09:34',NULL,2),(14,'Marcel','Manafa','marcelmanafa@yahoo.com',NULL,'$2y$12$zDSaT6POdWhtlvuE/WmMqe2EH14RrLtwqcHwDy.tFSQZ4u5WmxasG',NULL,NULL,'2024-06-14 12:30:16','2024-06-14 12:30:16',NULL,2),(15,'Jacinta','Nweke','jaycnweke@gmail.com',NULL,'$2y$12$ruhXk9aPAa98.6uYFgdSWuWHeSnj8dO8r3lgas68mwRxZK0jVaeMq',NULL,NULL,'2024-06-14 12:42:57','2024-06-14 12:42:57',NULL,2),(16,'Casmir','Oscar','Casmiroscar123@gmail.com',NULL,'$2y$12$xNyb9NiEl3JSfs68KflPw.jbQlvB03OSpdFiSwrQ/czfnoJK4z6lO',NULL,NULL,'2024-06-14 12:57:32','2024-06-14 12:57:32',NULL,2),(17,'Mmesomachukwu','Favour','mmeso5432@gmail.com',NULL,'$2y$12$8.L1AE6q7gYP/y9gKxEtk.DFQQ6fe0W32mgHNetTPOBWhCUUU2sX6',NULL,NULL,'2024-06-14 21:01:59','2024-06-14 21:01:59',NULL,2),(18,'Ifesinachi','Umeojiako','chialukarita05@gmail.com',NULL,'$2y$12$VOJXoRD9a.c4FIwREYrAFewUCGGw7dZBoLyKaypMMRBpFRsECn/6W',NULL,NULL,'2024-06-15 10:55:41','2024-06-15 10:55:41',NULL,2),(19,'Jude','OKAFOR','okaforanita673@gmail.com',NULL,'$2y$12$COVZI8WZcIElV08ZzJ.tc.EfCtVTnLlvWV3AzyTpZfsNr62aQ18eK',NULL,NULL,'2024-06-15 11:16:11','2024-06-15 11:16:11',NULL,2),(20,'Philip','Olisaemeka','philippos764@gmail.com',NULL,'$2y$12$OqUznTih/KWeeHFaEnTfFuI9TBpcQj/JLl7t5hu29.4Z9SAin1NCm','headshots/headshot-Philip-Olisaemeka-9c4b320f-2890-4d2f-9a90-93e898ede420.jpg','rqWzcbWkLdlU9RWgKN7BgDC3u6pd3h2QN3ZX5wm732SwzISkEU1mXGtlmNjR','2024-06-15 16:09:23','2024-06-15 16:09:23',NULL,5),(21,'Uchechukwu','Ezeemo','ju.ezeemo@unizik.edu.ng',NULL,'$2y$12$vNvygmv1GYwQoUQBLMsQButjj8gkuuyyzc/nADq8SxNUwl/JUfpj.',NULL,NULL,'2024-06-17 03:01:36','2024-06-17 03:01:36',NULL,2),(22,'Bright','Daniel','presh414@gmail.com',NULL,'$2y$12$1sKsayIgubYhY0JH73h6UuebF2w7ubFuOKs7sDueT66PommS5TjCm',NULL,NULL,'2024-06-17 14:09:12','2024-06-17 14:09:12',NULL,2),(23,'Mubarak','Balogun','balogunolawalemubarak@gmail.com',NULL,'$2y$12$L/pBc6M//gdc0kAzjujoUeDUmAOnx8CyhSaqFXc0UBUyfqVlSpo2O',NULL,NULL,'2024-06-17 14:19:24','2024-06-17 14:19:24',NULL,2),(24,'Aliyu','Muhammad Bashar','alium4521@gmail.com',NULL,'$2y$12$CqIQMJ5O2crqCZLZZDAZruVlodcRnKsF3iEjEDmw/r7lxdpwMxa8.','headshots/headshot-Aliyu-Muhammad-Bashar-9c4f6ab3-7122-4a8f-a3a2-5f65d9f03bfc.jpg',NULL,'2024-06-17 18:31:04','2024-06-17 18:31:05',NULL,5),(25,'Oluwafemi','Omole','simeon130705@gmail.com',NULL,'$2y$12$0Hh703psQCttlx58CgrsLeRJk.ZxZQOB7j/9OPZkxHhe9I32wDtoy','headshots/headshot-Oluwafemi-Omole-9c4fc628-612a-484b-9785-cbdaec7a91e5.jpg',NULL,'2024-06-17 22:46:48','2024-06-17 22:46:49',NULL,5),(26,'David','Mkpume','mkpumedavid@gmail.com',NULL,'$2y$12$slzxWahyey3kG0dpzyVLIu.0CQqx8XzsJRI4lkDDaYsHMLULSJOKi',NULL,NULL,'2024-06-18 00:04:46','2024-06-18 00:04:46',NULL,2),(40,'Peace','Olabode','olabodeelijah001@gmail.com',NULL,'$2y$12$7aBlg3CxNQ.RxSBdEcyMO.Svh.ZJyzGFeBeeRhsvxzSb7HxFJauh6',NULL,NULL,'2024-06-18 07:19:36','2024-06-18 07:19:36',NULL,2),(47,'Valentine','Udemadu','valentinesopuru56@gmail.com',NULL,'$2y$12$WbiA62wlBy23fDR4nJ7mK.61DYE3uqmSPsDCSmpr0Iq.V8ZNl6WBm','headshots/headshot-Valentine-Udemadu-9c7cb1d1-cb57-4b4a-a518-3a85b02c907c.jpg',NULL,'2024-06-18 08:35:34','2024-07-10 06:42:12',NULL,5),(48,'Jeremiah','Terfa','jerryterfa1@gmail.com',NULL,'$2y$12$nz4ZalNcSN3E6QiqPRuGq.UKucRlMwkrr69sWYyfJVGP9RNHcj4aS',NULL,NULL,'2024-06-18 09:36:54','2024-06-18 09:36:54',NULL,2),(56,'Francis','Okechukwu','thefbostudios@gmail.com',NULL,'$2y$12$UnmSXzlfZFPBnQjzgyuRZu/p43M4MVWAPX5zOeJjVO9OiKO7Ed1NC',NULL,NULL,'2024-06-18 10:31:44','2024-06-18 10:31:44',NULL,2),(57,'Izuchukwu','Nwokedi','luizphotographee@gmail.com',NULL,'$2y$12$4UC//5JNBUwXY3tiYg4ijuFKu1KpYqw/UQkTEfPlLGV67ZPqiHq8C','headshots/headshot-Izuchukwu-Nwokedi-9c740c93-cf0c-4ea5-b96a-f2bdbc92f987.jpg',NULL,'2024-06-18 12:10:38','2024-07-05 23:33:32',NULL,5),(63,'Chinenye','Oguadinma','chineyoguadinma@gmail.com',NULL,'$2y$12$xz.7K6b5BkO9/ARkjYMWBOKlTWa1117V/weC/QjmnTrIlSeh5VEIe',NULL,NULL,'2024-06-18 13:12:48','2024-06-18 13:12:48',NULL,2),(64,'Chinecherem','Enujioke','veronicaenujioke@gmail.com',NULL,'$2y$12$oAEkMTPTZ7CnpTXy9kqSZunPHS9j3mItEIErSgBsfI3d2znguwADa',NULL,NULL,'2024-06-18 16:05:46','2024-06-18 16:05:46',NULL,2),(65,'John','Otu','ozovehe@gmail.com',NULL,'$2y$12$TBs2XM7gXNCvJjbHui2CVe1h.W/lhAswq1HnLPIqzCyU/DE0Awivu','headshots/headshot-John-Otu-9c515afd-bd95-4d0f-92d2-64ac8f098932.jpg',NULL,'2024-06-18 17:38:48','2024-06-18 17:38:48',NULL,5),(66,'Okolie','Emmanuel','emmanuelokolie67@gmail.com',NULL,'$2y$12$jbEw1iPVXQrpAIG7U.I6IupylZPB8rbZ7zb5MhtsCTXyhRNjQpmHK',NULL,NULL,'2024-06-18 18:46:10','2024-06-18 18:46:10',NULL,2),(67,'Abdulrahaman','Abubakar','abdulrahmanabubakar851@gmail.com',NULL,'$2y$12$eflhW3T34sgmxc2Ua2zVieCq7bEc0ziIOX9JSES04xvyYvlYz1Cf6','headshots/headshot-Abdulrahaman-Abubakar-9c51d5e8-70fc-45b8-bf46-6350e55c0c7e.jpg',NULL,'2024-06-18 23:22:30','2024-06-18 23:22:30',NULL,5),(68,'Joshua','Samu','joshuasamu24@gmail.com',NULL,'$2y$12$hzeCug0c/ix.83UyxcxunePTpEVZgu3PyCG6IpBtOdAGTU/tVBRPu',NULL,NULL,'2024-06-19 02:25:20','2024-06-19 02:25:20',NULL,2),(69,'Philips','Akwari','philipsakwari@gmail.com',NULL,'$2y$12$5FV61Jp5pSSLA.VARzlQSulD4LTtkr2gyshNew0k.8xpKobfQ8f6G','headshots/headshot-Philips-Akwari-9c52e49b-03cd-4255-a267-b33cadf2ef34.jpg',NULL,'2024-06-19 11:59:26','2024-06-19 11:59:26',NULL,5),(70,'Oguntolu','Gbenga','bankybranding@gmail.com',NULL,'$2y$12$WhDC.O6fKEK074KV5yt.1e.31WjgZDH8jUohPr2SGMdSr3TJ9nePy',NULL,NULL,'2024-06-19 17:00:16','2024-06-19 17:00:16',NULL,2),(71,'Udochukwu','Orji','orjiraven18@gmail.com',NULL,'$2y$12$Dqq8s5tyA8gRU79kKEdUouCw0jUc/Fn/BPE4TgXdgS18T8FaE/kS.',NULL,NULL,'2024-06-19 17:08:44','2024-06-19 17:08:44',NULL,2),(72,'Inna','Dodo','dodoinna8@gmail.com',NULL,'$2y$12$RIfAWoDkRlRqebBUquUsMe5x2/.B6TOlZDqDIkGzAYrbE8KikUxL6',NULL,NULL,'2024-06-19 23:10:38','2024-06-19 23:10:38',NULL,2),(82,'Uchenna','Ikenga','uchennaikenga1234@gmail.com',NULL,'$2y$12$iUqyYU0A4KIzf1t4bHafPO40PiuxkK/MbWL4xBI3/Zyb5qN.1kYcy',NULL,NULL,'2024-06-20 09:52:55','2024-06-20 09:52:55',NULL,2),(83,'Joseph Kenneth','Itchara','jkshotit@gmail.com',NULL,'$2y$12$0/j2UzPo0dbXq5e238xGHeEx8Jpv5M.K77sXgLKUDB1OAZVOEQDai',NULL,NULL,'2024-06-20 14:03:52','2024-06-20 14:03:52',NULL,2),(84,'Egokiniovo','Okedavis','chrisoke64@gmail.com',NULL,'$2y$12$w4sXgF1RV.JnUoDLV.5g0.IKrGRAcDY214zT8jjceoqGzRGL2VUya',NULL,NULL,'2024-06-20 17:58:55','2024-06-20 17:58:55',NULL,2),(85,'Keshinro','Olaore','keshinroolaore@gmail.com',NULL,'$2y$12$1nkPUU4pM8h4T6ei/UeWNOOSigrsYwfZGzNfkNYfzP1DS8saFuiRy',NULL,NULL,'2024-06-21 08:53:52','2024-06-21 08:53:52',NULL,2),(86,'Daniel','Adebiyi','adebs.daniel@gmial.com',NULL,'$2y$12$tXqL21Hi3juF9XarTBfMQuf9N0peW.RaQhY/Lr5QfxgvUkAAeksnu',NULL,NULL,'2024-06-21 13:48:33','2024-06-21 13:48:33',NULL,2),(87,'Shalom','Osezua','Shalomosezua007@gmail.com',NULL,'$2y$12$57ZvFp9/mv2rebQZASMIqurn.IRcKxVdEKJ9DwyjfTzZdree91F9q',NULL,NULL,'2024-06-21 17:37:13','2024-06-21 17:37:13',NULL,2),(88,'Naomi','Amarachi','genaconcept@aol.com',NULL,'$2y$12$OvFyrk/MpOlaPTGDd7C67.TngPsp9EAxqY//wXrdLKp.nffm8S6P2',NULL,NULL,'2024-06-22 01:18:36','2024-06-22 01:18:36',NULL,2),(89,'Naomi','Amarachi','naomiamarach20@gmail.com',NULL,'$2y$12$UXbFWt7D.n7ZNR/sj2t2xOSpGpppUhE/YOwG6ko9kNyr9Y3cbES4y','headshots/headshot-Naomi-Amarachi-9c71df02-a9e1-466d-ab22-313c85ec707c.jpg',NULL,'2024-06-22 01:19:53','2024-07-04 21:34:27',NULL,5),(90,'Promise','Njoku','pnpix.360@gmail.com',NULL,'$2y$12$iqK.b9aonBajZChNVdMakukOzfdfOGVxUSxlPAKqn1llqDJMiodci',NULL,NULL,'2024-06-22 04:07:15','2024-06-22 04:07:15',NULL,2),(91,'Akinyemi','Opeyemi','akinyemio197@gmail.com',NULL,'$2y$12$GP5KUZalV8yJ3INy.PPUne0gc5LV2JDgxgG6IFd1llD9zva2cXOD2',NULL,NULL,'2024-06-22 05:35:00','2024-06-22 05:35:00',NULL,2),(92,'Timileyin','Okanlawon','timileyinokanlawon@gmail.com',NULL,'$2y$12$QyVxJWZave5iDdSCq2YeRO/CQnyq4H2SBJ6sNmWG0gBoj5N3/c7.m',NULL,NULL,'2024-06-22 07:12:42','2024-06-22 07:12:42',NULL,2),(93,'Daniel','Nlemoha','dannynlemoha@gmail.com',NULL,'$2y$12$EfHpG2xP8cqaKFuBSp5BROdYacT2635gKPkopIPgb2q3MHOhpYHy.',NULL,NULL,'2024-06-22 08:03:35','2024-06-22 08:03:35',NULL,2),(94,'Daniel','Nlemoha','trenchstudioltd@gmail.com',NULL,'$2y$12$0GRFk/yNF9Y7Weh8O4v14.lBwxIHzWtlBTJqcWHF/n/J2ntiqgOJ6',NULL,NULL,'2024-06-22 08:08:41','2024-06-22 08:08:41',NULL,2),(95,'Solomon','Okunowo','okunsolo4christ@gmail.com',NULL,'$2y$12$K3mM3epDkl.LhpJOD0EkgOL0oMGsJSeXSrbrHDrKTCwB6O1sSy04O',NULL,NULL,'2024-06-22 13:12:14','2024-06-22 13:12:14',NULL,2),(96,'Adewale','Rokeeb','adewale.rockyb@gmail.com',NULL,'$2y$12$GHfuqP6Q5g.Bxo1/LtBrSOoIcsQSgdMC47/mO3Vby5vDi0QgpP2e.',NULL,NULL,'2024-06-23 00:25:59','2024-06-23 00:25:59',NULL,2),(97,'Clinton','Eze','clintoneze07@gmail.com',NULL,'$2y$12$PumFAx9dmByvZISEVCitgeSbGIJ91NJNGuXRu9B.GsblKOM6xoxc.','headshots/headshot-Clinton-Eze-9c7eae22-6a1a-4e5e-bef0-a9b963e17a1d.jpg',NULL,'2024-06-23 03:57:45','2024-07-11 06:23:33',NULL,5),(98,'Arthur','Ike','peterike64@gmail.com',NULL,'$2y$12$TYaItVrfe/MqjV3eVNM21u1jK41bNCZfngwAklwbdBZgPe4NLcKBS',NULL,NULL,'2024-06-23 11:04:02','2024-06-23 11:04:02',NULL,2),(138,'Victor','Oluwayoju','victoroluwayoju@gmail.com',NULL,'$2y$12$hJXMfLh2Vw/B2Kq/m7vqu.SneZlUCL7EP9fOADe.bsGdxzPJunP72',NULL,NULL,'2024-06-24 03:00:38','2024-06-24 03:00:38',NULL,2),(139,'My name is praiz, A family of 4. My interest is photography which came to light after the death of my sibling','Praise','praisedaley@gmail.com',NULL,'$2y$12$nKhdFiQXf2ES3NXHlftAT.1F6OavFqJz6w7tyMr13LERl40W/lGKu',NULL,NULL,'2024-06-24 07:04:32','2024-06-24 07:04:32',NULL,2),(140,'Oghenemairo','Obaroh','obarohmairo@gmail.com',NULL,'$2y$12$S0YammM04PRd/nXoJkKm4.BdvY26PCoxNAPX7Nvfv3ydf6A3Occ.a','headshots/headshot-Oghenemairo-Obaroh-9c5cbd0f-9f29-49e9-b3c0-679b9a63e6a9.jpg',NULL,'2024-06-24 09:18:19','2024-06-24 09:27:08',NULL,5),(141,'Philip','Nwokedi','philip.nwokedi.249413@unn.edu.ng',NULL,'$2y$12$H09N50x68QMoED2VHFUPfeqn1FnXL8IRZLxOak221bB2JM8NU7EUm','headshots/headshot-Philip-Nwokedi-9c6eed96-99bf-4175-890a-e2ff87c23cd1.jpg',NULL,'2024-07-02 17:18:13','2024-07-03 10:56:46','2024-07-03 10:56:46',5),(142,'Bryan','Okafor','bryanokafor1302@gmail.com',NULL,'$2y$12$7jYZt6oDa9RRMSmPMLsSv.gFTfNes3pycqN/Q5TdMYE0A2HO94ZQe',NULL,NULL,'2024-07-03 08:20:43','2024-07-03 08:20:43',NULL,2),(143,'Philip','Nwokedi','hsfgjkrfmfnbvhsdv',NULL,'$2y$12$tqULJ7pvRAUnf30VcUIeW.EuFa8x9OYuY8u3CHc5ZxV4bDQQbi8zy','headshots/headshot-Philip-Nwokedi-9c6ee7e4-75aa-46bc-bacd-e95cd9823a95.jpg',NULL,'2024-07-03 10:11:48','2024-07-03 10:11:48',NULL,5),(144,'Chiamaka','Oduenyi','promiseoduenyi@gmail.com',NULL,'$2y$12$pdCM6GVicwuCyZMgg3hv0ePbBfQH.7vXgOoaO/GdK6gE1A689ACj2',NULL,NULL,'2024-07-03 10:38:37','2024-07-03 10:38:37',NULL,2),(145,'Kingdavid','Adeyemi','kingdav840@gmail.com',NULL,'$2y$12$YXPlGfoD5KICPJElNcP7b.RO8FhacnS7k2ZgmijZp9xVXkXcsg35i',NULL,NULL,'2024-07-03 10:40:57','2024-07-03 10:40:57',NULL,2),(151,'Agape','Obinna','agapeobinna@gmail.com',NULL,'$2y$12$baI6DeEZiW.8gfrTbAgoVeaV/jwJyoNmu7gK1RSD.Tgq.YST6W54i','headshots/headshot-Agape-Obinna-9c818633-9db0-40bd-afb2-d2a1bf91dace.jpg',NULL,'2024-07-03 15:33:41','2024-07-12 16:19:22',NULL,5),(152,'Oluwapelumi','Adegoke','ade1pelumi@gmail.com',NULL,'$2y$12$2wBU.esQlCWvm3InGyf/eOLbjEnjMfpBYz94JzfNQcXAO1empF6by',NULL,NULL,'2024-07-03 16:02:52','2024-07-03 16:02:52',NULL,2),(153,'VANXAN','Classics','vanxanadamz@gmail.com',NULL,'$2y$12$VI7FI4JkhLG.jnk/6MWMcewo4f.K0JL7ZkleAX0r1HLRME.HXsM5a',NULL,NULL,'2024-07-03 16:53:16','2024-07-03 16:53:16',NULL,2),(155,'Noah','Oghenede','ovienoah222@gmail.com',NULL,'$2y$12$.Yu.0wQEdZ3uXxpdwtCBbeuzRwQ.x9J1MWNnfvHjUwjs2wxz7ik2W',NULL,NULL,'2024-07-03 19:47:36','2024-07-03 19:47:36',NULL,2),(158,'OKECHUKWU','OKONKWO','ifointernational@gmail.com',NULL,'$2y$12$wtawZq2Ea3coZ3Hu2d1tyuKXVu525xCX8iDDtP0MMw.jdR/iTzgxS',NULL,NULL,'2024-07-04 11:45:30','2024-07-04 11:45:30',NULL,2),(159,'Timileyin','Okanlawon','timmyokanlawon@gmail.com',NULL,'$2y$12$7oo.fZykTrS3kBbQAX1VJuQzYtFln3gwAiZyLXu52vaoEKpi4/fYO','headshots/headshot-Timileyin-Okanlawon-9c71956e-abf4-4f02-a202-f9c666b69122.jpg',NULL,'2024-07-04 18:08:42','2024-07-04 18:08:43',NULL,5),(160,'Obianuju','Nnaji','ujuesther02@gmail.com',NULL,'$2y$12$DH1FVvY2JPOwvcfRrDC7iOVwJY3Yzg.wcJwrzF0plpwRzMZTjhMw.','headshots/headshot-Obianuju-Nnaji-9c719c5c-bd97-4b8a-80d8-6e202ac0c6cd.jpg',NULL,'2024-07-04 18:28:05','2024-07-04 18:28:05',NULL,5),(161,'Tosin','Olowoleni','preciousolowoleni@gmail.com',NULL,'$2y$12$96bcH0N5bZDzAIJjBS8sduKXs3JGSqe349Df9fiT./PuzHhSn0Wti','headshots/headshot-Tosin-Olowoleni-9c71a381-8f99-4bfc-ab93-6b82ea378f67.jpg',NULL,'2024-07-04 18:48:04','2024-07-04 18:48:04',NULL,5),(162,'Okezie','Pax','paxokezie@gmail.com',NULL,'$2y$12$T9o/7OkB5S7unh4kiFMdOOn9qi7nMLLIvsnuVp62b61NVwdW2XZB.','headshots/headshot-Okezie-Pax-9c7e4da3-482e-4d93-a32c-f89021d55417.jpg',NULL,'2024-07-04 21:01:00','2024-07-11 01:53:44',NULL,5),(163,'Bright','Charles','dstryteller@gmail.com',NULL,'$2y$12$KhN2Lsiv8tg7yjIRwqIWkeiIFhsykFNCvc4WYeNAJ0oXRcz1OJWby','headshots/headshot-Bright-Charles-9c72315b-3eef-4212-bc7f-dd1e22ef22dd.jpg',NULL,'2024-07-05 01:24:42','2024-07-05 01:24:43',NULL,5),(164,'Obinna','Matt','matdiplomacy@gmail.com',NULL,'$2y$12$BLB5eY6WD12nFFi.dfDpwO7AF8gzFSVEwY3.QkBxGvKUAXmow.vpW',NULL,NULL,'2024-07-05 04:42:34','2024-07-05 04:42:34',NULL,2),(165,'Ikechukwu','Ijeh','maximaxwell14@gmail.com',NULL,'$2y$12$qz3ARBzubXZ5eU4byA9amOhwVBgOEgsfj3nDT7o1x2grhbb.iKA0O',NULL,NULL,'2024-07-05 06:09:03','2024-07-05 06:09:03',NULL,2),(166,'Esther','Chidinma','qwinjp01@gmail.com',NULL,'$2y$12$SgMbUDr/pmNvaHQH/92V1O2NHFUDGI/FaExV.vAn7aA6j254w97U.','headshots/headshot-Esther-Chidinma-9c72eb1a-ef57-440e-b896-538a9ab57178.jpg',NULL,'2024-07-05 09:06:49','2024-07-05 10:04:06',NULL,5),(167,'Edward','Ogbuli','kelvinogbuli@gmail.com',NULL,'$2y$12$fMhfkOdDKo9l71qJcLMG8OkwqLaRgTurbeXvWQryJs.L5JIyU82WW',NULL,NULL,'2024-07-05 09:55:06','2024-07-05 09:55:06',NULL,2),(168,'Ayomide','Bukola','pray4steeznguap@gmail.com',NULL,'$2y$12$SebnoQ6TE1L2hM1tlrJk9Oauq0x.B8oS7UtkQ6LmTCX7D3HGkCvA.','headshots/headshot-Ayomide-Bukola-9c748e5c-5ff1-4cc7-977a-a489369e5492.jpg',NULL,'2024-07-06 05:36:25','2024-07-06 05:36:25',NULL,5),(169,'Emmanuel','Chibuzor','chibexemma@gmail.com',NULL,'$2y$12$wiGKEwmQzOY59EBe9Tngc.E6A5Vhmlj5lsuhAnU1hsn0De8vFnO8C',NULL,NULL,'2024-07-07 10:56:31','2024-07-07 10:56:31',NULL,2),(170,'Moses','Akem','akemthevibe@gmail.com',NULL,'$2y$12$wE488rwcv.mb6/ofbwsR6ujadgfMxcLug/nS/kTmxcjjc8x1Dk8DS','headshots/headshot-Moses-Akem-9c773bc6-2e5f-4010-96a7-3be9cf27403c.jpg',NULL,'2024-07-07 13:32:58','2024-07-07 13:32:59',NULL,5),(171,'Sammy','Paschal','paschalchinedu01@gmail.com',NULL,'$2y$12$wc7JZGm3DMJ97rk6MqTRJ.MpYmNLqWOMld.uwVunwXLwKumWBAweK',NULL,NULL,'2024-07-07 18:23:43','2024-07-07 18:23:43',NULL,2),(172,'Prince','Enyagam','princemiles350@gmail.com',NULL,'$2y$12$P49qo29uvVO/chyN7utyPevapPeAtih8TWac8r6aqtAFZP1PaV.RO','headshots/headshot-Prince-Enyagam-9c77f3d1-a465-4ef0-8452-ba440a9bd7ab.jpg',NULL,'2024-07-07 22:07:36','2024-07-07 22:07:36',NULL,5),(173,'Chukwuagoziem','Obazie','agoziemobazie@gmail.com',NULL,'$2y$12$EXq80.kDmP1MajgnwDJJeedJ0J5ZRoM/.2NPaQ2FhbVg6VldZgmD.',NULL,NULL,'2024-07-09 09:10:53','2024-07-09 09:10:53',NULL,2),(174,'Chiemeziem','Mortanya','classicmortanya2@gmail.com',NULL,'$2y$12$2VFEGxdaGX4w5N6.zy3TY.Lt6kPrRYHQJ0K0o7NhKEe1t2oa3te6G','headshots/headshot-Chiemeziem-Mortanya-9c7db43f-90a9-42d7-abcc-5dfc4e0ccead.jpg',NULL,'2024-07-10 18:44:49','2024-07-10 18:44:49',NULL,5),(175,'Ololade','Olawale','olawaleololade08@gmail.com',NULL,'$2y$12$137lMD8wX5aIVmS5MLnEzeVyaqkNlN3ZwMGmEpgJzwPyf2B8BMPle','headshots/headshot-Ololade-Olawale-9c7e4fe1-f6b5-4661-a40d-dd6a8d22e042.jpg',NULL,'2024-07-11 02:00:00','2024-07-11 02:00:00',NULL,5),(176,'Esther','Onwe','onwee92@gmail.com',NULL,'$2y$12$0r57fyELMD.E3AN22CZnLu2S9BOgEu56Dxhd1SrpmP6zPIG9nmI6a',NULL,NULL,'2024-07-11 15:29:55','2024-07-11 15:29:55',NULL,2),(177,'Osita','Mbagwu','ositambagwu@gmail.com',NULL,'$2y$12$gibi3cago65g6Ds8uaaz3.G0/L4wzHjBHQIg5FouhGOjRoLkvNTTO','headshots/headshot-Osita-Mbagwu-9c7f864c-3a9f-4f9b-b3c6-2137a88eebcd.jpg',NULL,'2024-07-11 16:27:59','2024-07-11 16:27:59',NULL,5),(178,'Anita','Ovia','anitaefe847@gmail.com',NULL,'$2y$12$1DzDzeCrZqNCjCzdFscm6uyh69N8OdJR.gIxB.X0ozgshhMIOeE8W','headshots/headshot-Anita-Ovia-9c807102-c2a2-4019-a6b2-799f4498bb1c.jpg',NULL,'2024-07-12 03:24:17','2024-07-12 03:24:17',NULL,5);
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

-- Dump completed on 2024-07-12 17:19:07
