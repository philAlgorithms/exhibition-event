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
INSERT INTO `cache` VALUES ('spatie.permission.cache','a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}',1720203036);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_attendees`
--

LOCK TABLES `event_attendees` WRITE;
/*!40000 ALTER TABLE `event_attendees` DISABLE KEYS */;
INSERT INTO `event_attendees` VALUES (1,'VS0bpb1',3,1,'male','08187726255','Public Servant','Others',NULL,'2024-06-13 09:04:32','2024-06-13 09:04:32'),(2,'B3Rw6P2',4,1,'male','07036973390','Consultant','Others',NULL,'2024-06-13 11:19:47','2024-06-13 11:19:47'),(3,'1i1GiI3',5,1,'male','+2348058256845','Student photographer','Others',NULL,'2024-06-13 13:25:07','2024-06-13 13:25:07'),(4,'AL0squ4',6,1,'female','07054222099','Product Designer','Others',NULL,'2024-06-13 14:24:08','2024-06-13 14:24:08'),(5,'wKQSSU5',7,1,'male','07025048795','Student','Others',NULL,'2024-06-13 18:12:07','2024-06-13 18:12:07'),(6,'IpNoNM6',8,1,'female','07064363412','I am a skincare consultant and Graphic Designer.','Others',NULL,'2024-06-13 18:13:35','2024-06-13 18:13:35'),(7,'pfmyEU7',9,1,'male','08154994457','Self employed','Others',NULL,'2024-06-13 19:23:24','2024-06-13 19:23:24'),(8,'hkOdjF8',10,1,'female','08163922762','Student','Blog post',NULL,'2024-06-13 19:40:38','2024-06-13 19:40:38'),(9,'6MLY1I9',11,1,'female','09158410348','Product Manager','Others',NULL,'2024-06-13 20:52:06','2024-06-13 20:52:06'),(10,'fiHjn810',12,1,'female','08169784654','Documentary Photographer','Facebook',NULL,'2024-06-14 11:00:02','2024-06-14 11:00:02'),(11,'SN088e11',13,1,'female','+2348070875569','Photographer','Others',NULL,'2024-06-14 11:09:34','2024-06-14 11:09:34'),(12,'TwRKni12',14,1,'male','08033150460','Creative Arts Consultant','Others',NULL,'2024-06-14 12:30:17','2024-06-14 12:30:17'),(13,'yqrFtb13',15,1,'female','07068374330','Student','Others',NULL,'2024-06-14 12:42:57','2024-06-14 12:42:57'),(14,'GXSayi14',16,1,'male','07044020904','Sound engineer','Others',NULL,'2024-06-14 12:57:32','2024-06-14 12:57:32'),(15,'H3CiDN15',17,1,'female','09133630756','Student','Others',NULL,'2024-06-14 21:01:59','2024-06-14 21:01:59'),(16,'CjXPiV16',1,1,'male','09033292224','Web dev','Others',NULL,'2024-06-15 01:31:13','2024-06-15 01:31:13'),(17,'JFoCMv17',18,1,'female','+2348137903352','Student','Instagram',NULL,'2024-06-15 10:55:41','2024-06-15 10:55:41'),(18,'z5MuhX18',19,1,'male','08127796563','Business man','A Friend',NULL,'2024-06-15 11:16:11','2024-06-15 11:16:11'),(19,'jpTWJn19',20,1,'male','09033292224','Software Dev','Instagram',NULL,'2024-06-16 09:32:36','2024-06-16 09:32:36'),(20,'Nn61d720',21,1,'male','08032051555','Visual Artist','Instagram',NULL,'2024-06-17 03:01:36','2024-06-17 03:01:36'),(21,'L4mgrY21',22,1,'male','08181497944','Media consultant','Instagram',NULL,'2024-06-17 14:09:12','2024-06-17 14:09:12'),(22,'WHrMQE22',23,1,'male','08106480266','Photographer','Instagram',NULL,'2024-06-17 14:19:24','2024-06-17 14:19:24'),(23,'ueSahU23',26,1,'male','08066436292','Photography','Instagram',NULL,'2024-06-18 00:04:46','2024-06-18 00:04:46'),(24,'T3sbJQ24',40,1,'male','+2347039584847','Corp member','A Friend',NULL,'2024-06-18 07:19:36','2024-06-18 07:19:36'),(25,'fc7yKB25',47,1,'male','09136142681','Law Student','Instagram',NULL,'2024-06-18 08:35:34','2024-06-18 08:35:34'),(26,'9qk3nz26',48,1,'male','07082548634','Photography','Instagram',NULL,'2024-06-18 09:36:54','2024-06-18 09:36:54'),(27,'vbowq727',56,1,'male','08060503062','Digital Creator','Instagram',NULL,'2024-06-18 10:31:44','2024-06-18 10:31:44'),(28,'dgIjQj28',57,1,'male','08058256845','Student photographer','Instagram',NULL,'2024-06-18 12:10:38','2024-06-18 12:10:38'),(29,'rAWT6h29',63,1,'female','08136186321','Data scienctist/Documentary photographer','Instagram',NULL,'2024-06-18 13:12:48','2024-06-18 13:12:48'),(30,'BkG36P30',64,1,'female','+2347040258721','Student','Instagram',NULL,'2024-06-18 16:05:46','2024-06-18 16:05:46'),(31,'e4P39S31',66,1,'male','09169969847','Photographer','Instagram',NULL,'2024-06-18 18:46:10','2024-06-18 18:46:10'),(32,'h7Zixr32',67,1,'male','+2347089943556','Visual Communicator','Instagram',NULL,'2024-06-18 23:23:40','2024-06-18 23:23:40'),(33,'rkkR1j33',68,1,'male','08030405936','Photographer','Instagram',NULL,'2024-06-19 02:25:20','2024-06-19 02:25:20'),(34,'dneeYP34',70,1,'male','07056386917','Photographer','Instagram',NULL,'2024-06-19 17:00:16','2024-06-19 17:00:16'),(35,'Pv8snw35',71,1,'male','+2348134536053','Photographer','Instagram',NULL,'2024-06-19 17:08:44','2024-06-19 17:08:44'),(36,'NQGKOi36',72,1,'male','09126365012','Student','Instagram',NULL,'2024-06-19 23:10:38','2024-06-19 23:10:38'),(37,'3ffOwY37',82,1,'male','08093047596','Photographer','Instagram',NULL,'2024-06-20 09:52:55','2024-06-20 09:52:55'),(38,'t5DShu38',83,1,'male','09121559399','Photographer','Instagram',NULL,'2024-06-20 14:03:52','2024-06-20 14:03:52'),(39,'jTbGZK39',84,1,'male','08166906936','Photographer','LinkedIn',NULL,'2024-06-20 17:58:55','2024-06-20 17:58:55'),(40,'VZQtbZ40',85,1,'male','07042801446','Filmmaker & Photographer','Instagram',NULL,'2024-06-21 08:53:52','2024-06-21 08:53:52'),(41,'q9RFvK41',86,1,'male','08180641347','Photographer','Instagram',NULL,'2024-06-21 13:48:33','2024-06-21 13:48:33'),(42,'25ZXOM42',87,1,'male','0807 166 3061','Photographer','Instagram',NULL,'2024-06-21 17:37:13','2024-06-21 17:37:13'),(43,'cLAaYF43',88,1,'female','09027997382','Student','Instagram',NULL,'2024-06-22 01:18:36','2024-06-22 01:18:36'),(44,'b3NZay44',89,1,'female','09027997382','Student','Instagram',NULL,'2024-06-22 01:19:53','2024-06-22 01:19:53'),(45,'xTjrb545',90,1,'male','08084224000','Photographer','Instagram',NULL,'2024-06-22 04:07:15','2024-06-22 04:07:15'),(46,'e1Woky46',91,1,'male','08101742781','Creative director','Instagram',NULL,'2024-06-22 05:35:00','2024-06-22 05:35:00'),(47,'H7eU3z47',92,1,'male','08100544147','Documentary Photographer','Instagram',NULL,'2024-06-22 07:12:42','2024-06-22 07:12:42'),(48,'ScLKWF48',93,1,'male','09055118936','Student','A Friend',NULL,'2024-06-22 08:03:35','2024-06-22 08:03:35'),(49,'GPTJqF49',94,1,'male','09055118936','Student','A Friend',NULL,'2024-06-22 08:08:41','2024-06-22 08:08:41'),(50,'OuXbTp50',95,1,'male','09079048102','Photography','Instagram',NULL,'2024-06-22 13:12:14','2024-06-22 13:12:14'),(51,'2Rgo1l51',96,1,'male','+2348138123467','Pro photographer','Instagram',NULL,'2024-06-23 00:25:59','2024-06-23 00:25:59'),(52,'fxebDb52',97,1,'male','09026835406','Photographer','Instagram',NULL,'2024-06-23 03:57:45','2024-06-23 03:57:45'),(53,'aQFZkf53',98,1,'male','08145973449','Media Designer','Instagram',NULL,'2024-06-23 11:04:02','2024-06-23 11:04:02'),(54,'Jv7XvW54',138,1,'male','08135090954','Photographer','Instagram',NULL,'2024-06-24 03:00:38','2024-06-24 03:00:38'),(55,'JM27q755',139,1,'male','09167696885','Photographer','Instagram',NULL,'2024-06-24 07:04:32','2024-06-24 07:04:32'),(56,'Qa9QLH56',140,1,'male','09126547720','Photography','Instagram',NULL,'2024-06-24 09:18:19','2024-06-24 09:18:19'),(58,'iQpFA158',142,1,'male','08149297386','Student','A Friend',NULL,'2024-07-03 08:20:43','2024-07-03 08:20:43'),(59,'qsybff59',144,1,'female','09052544691','Student','Instagram',NULL,'2024-07-03 10:38:37','2024-07-03 10:38:37'),(60,'RQrLUB60',145,1,'male','07073221875','Cinematographer','A Friend',NULL,'2024-07-03 10:40:57','2024-07-03 10:40:57'),(62,'OPPggw62',151,1,'male','08134635012','Photographer','Instagram',NULL,'2024-07-03 15:33:41','2024-07-03 15:33:41'),(63,'KWithJ63',152,1,'female','08143294746','Graduate trainee','Whatsapp',NULL,'2024-07-03 16:02:52','2024-07-03 16:02:52'),(64,'cRHrnX64',153,1,'male','09168045657','Fashion designer','Instagram',NULL,'2024-07-03 16:53:16','2024-07-03 16:53:16'),(65,'y62Fs865',155,1,'male','08184551390','Realtor, Actor,clergyman, freelance Radio and Tv presenter.','Instagram',NULL,'2024-07-03 19:47:36','2024-07-03 19:47:36'),(66,'KlBhSK66',158,1,'male','09072566995','Businessman','Instagram',NULL,'2024-07-04 11:45:30','2024-07-04 11:45:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitor_works`
--

LOCK TABLES `exhibitor_works` WRITE;
/*!40000 ALTER TABLE `exhibitor_works` DISABLE KEYS */;
INSERT INTO `exhibitor_works` VALUES (3,'Royal Excort',2022,'exhibitor-works/work-Aliyu-Muhammad-Bashar-9c4f6ab3-f708-4b78-9886-93a4aa3d5952.jpg',3,150.00,1,'Typical appearance of Royal escorts in a northern durbar festival','2024-06-17 18:31:05','2024-06-17 18:31:05',5),(4,'Musket',2022,'exhibitor-works/work-Aliyu-Muhammad-Bashar-9c4f6ab4-0a19-409e-af6b-baed8eb659d1.jpg',3,150.00,1,'The musket gun has significant importance in festivals around Nigeria ,in the north the gun is used to honour royals and to begin important activities.\r\nIn some cases it is also used to announce appearance of a royal person','2024-06-17 18:31:05','2024-06-17 18:31:05',5),(5,'Ride',2022,'exhibitor-works/work-Aliyu-Muhammad-Bashar-9c4f6ab4-223e-43b4-bab0-be8d80c96a10.jpg',3,150.00,1,'The camel appearance in a royal durbar is usually to signify the extra regalia of the king ,they are mostly seen behind the king serving as the rare guards to the king .','2024-06-17 18:31:05','2024-06-17 18:31:05',5),(6,'Culture must not die',2020,'exhibitor-works/work-Oluwafemi-Omole-9c4fc628-ae5b-4640-b759-1d0249a3bc63.jpg',4,200000.00,2,'This little child is being taught the ways of the yoruba people by wearing their iro and buba','2024-06-17 22:46:49','2024-06-17 22:46:49',5),(131,'Siblings on camel back',2023,'exhibitor-works/work-John-Otu-9c515afe-04d3-42cb-b616-c8330267704d.jpg',36,35500.00,2,'On camel back are siblings ; half brothers that are evidently fond of each other.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(132,'Mascot 1',2023,'exhibitor-works/work-John-Otu-9c515afe-17c8-4b2c-9968-46188314bbc9.jpg',36,32500.00,2,'The man on horse back has his face covered with powder to motivate the crowd to focus with awe at him.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(133,'Mascot II',2023,'exhibitor-works/work-John-Otu-9c515afe-2922-473b-8e36-324417298908.jpg',36,34500.00,2,'A man has his face covered with powder to engender the teaming crowd to look at him with awe.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(134,'A Palace guard',2023,'exhibitor-works/work-John-Otu-9c515afe-3a38-4a73-b85c-f50c8d3e31e6.jpg',36,30000.00,2,'A Palace guard in green and black flowing gown stands beside a prince on horse back to assist with getting through the crowd of enthusiastic people.','2024-06-18 17:38:48','2024-06-18 17:38:48',5),(135,'Fulani performers',2023,'exhibitor-works/work-John-Otu-9c515afe-4c7f-4c58-b5ed-a8ceb4727216.jpg',36,37500.00,2,'A small group of students representing the Fulani ethnic nationality during the mini Durba.','2024-06-18 17:38:49','2024-06-18 17:38:49',5),(136,'Radiant Resilience',2024,'exhibitor-works/work-Abdulrahaman-Abubakar-9c51d5e8-b91d-41fc-bae9-b56200ad9852.jpg',37,1000.00,1,'\"Radiant Resilience\"\r\n   Description: \"Through the lens, the radiant energy of resilience shines bright as the subject raises their head’s, a visual testament to inner strength and unwavering determination in the face of challenges.\"','2024-06-18 23:22:31','2024-06-18 23:22:31',5),(137,'Igba Ekpe',2017,'exhibitor-works/work-Philips-Akwari-9c52e49b-53cd-45a4-b28a-5ce352e20340.jpg',38,105000.00,2,'Material: Photo on paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(138,'Uche Oba',2016,'exhibitor-works/work-Philips-Akwari-9c52e49b-704c-4316-9bed-cfc8b1307423.jpg',38,105000.00,2,'Material: Photo on paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(139,'Onye Iwowo',2014,'exhibitor-works/work-Philips-Akwari-9c52e49b-8867-4fa5-9fff-694dc8e43da1.jpg',38,105000.00,2,'Material: Photo on Paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(140,'Igwa Mang',2016,'exhibitor-works/work-Philips-Akwari-9c52e49b-99d0-46ea-a62b-6489c16e5820.jpg',38,105000.00,2,'Material: Photo on Paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(141,'Eze Ihungwu',2017,'exhibitor-works/work-Philips-Akwari-9c52e49b-afca-4206-91ca-299ddb06513a.jpg',38,105000.00,2,'Material: Photo on Paper\nSize: 16x24','2024-06-19 11:59:26','2024-06-19 11:59:26',5),(143,'Feel the calmness',2024,'exhibitor-works/work-Oghenemairo-Obaroh-9c5cbd0f-73e6-4eec-a059-142cc0996453.jpg',88,30.00,1,'Calmness at its peak','2024-06-24 09:27:08','2024-06-24 09:27:08',5),(152,'Men of Euphoria',2024,'exhibitor-works/work-Timileyin-Okanlawon-9c71956f-6fd2-4461-8df6-3e0f35825f71.jpg',95,250000.00,2,'Men of Euphoria is tailored for festival-going men who embrace style, individuality, and the adventurous festival lifestyle. This collection gives insight to men who stand out and express their unique sense of fashion while staying comfortable and practical.','2024-07-04 18:08:43','2024-07-04 18:08:43',5),(153,'Euphoria Beauties',2024,'exhibitor-works/work-Timileyin-Okanlawon-9c71956f-e08a-4fdf-9064-66beb034f945.jpg',95,300000.00,2,'Euphoria Beauties is a piece to women who embody beauty, elegance, and a vibrant spirit during festival celebrations. They express their unique style and cultural heritage through carefully curated festival accessories that enhance their overall appearance and contribute to the festive atmosphere.','2024-07-04 18:08:43','2024-07-04 18:08:43',5),(154,'Aged splendor',2024,'exhibitor-works/work-Timileyin-Okanlawon-9c719570-1d9c-40de-8bc0-5db6ba11bb2a.jpg',95,400000.00,2,'Aged splendor is a piece about the celebration of life and cultural heritage of older individuals who shine with grace, dignity, and a profound connection to their traditions. Their participation enriches the festival experience and provide a link between past, present, and future generations through their enduring spirit and cultural contributions.','2024-07-04 18:08:44','2024-07-04 18:08:44',5),(155,'Rhythms Of The Night',2024,'exhibitor-works/work-Obianuju-Nnaji-9c719c5c-fcdd-43e3-ae60-57b31238a088.jpg',96,100.00,1,'In the golden hues of a setting sun, a silhouette stands by the water\'s edge, immersed in the timeless ritual of labor – a symbol of resilience. The tranquil river glistens with the sun\'s fading light, reflecting the serene connection between humanity and nature. The scene is a reminder of simpler times when life flowed with the rhythm of nature. The trees in the distance stand as silent witnesses to this daily dance, their forms blurred by the warm glow of the evening sky. \r\nThis photograph captures not just a moment, but an enduring story of life, tradition, and the delicate balance between man and his environment.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(156,'Memories Of Childhood',2019,'exhibitor-works/work-Obianuju-Nnaji-9c719c5d-7800-42ae-b786-aaea62ae0390.jpg',96,90.00,1,'In the soft afternoon, I am reminded of my childhood memories beholding a child as he crouches, absorbed in the simple joy of drawing on the sand. Bare feet press gently into the ground, grounding him in the moment as his small hand creates a world of shapes and lines. The worn fabric of his shirt speaks of determination, while the surrounding imprints tell stories of other footsteps. I couldn\'t but wonder if this was another Leonardo da Vinci in the making.\r\nThis photograph captures the essence of childhood—innocence, creativity, and the boundless imagination that transforms simplicity into the extraordinary.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(157,'Apunanwu',2022,'exhibitor-works/work-Obianuju-Nnaji-9c719c5d-eca3-4d80-ba34-eada93b58c12.jpg',96,90.00,1,'Against the backdrop of an African hut, she is adorned in unique traditional attire and a timeless hairstyle. Apunanwu – the one who should not step into the scorching sun – sits, embodying femininity and a mother\'s love which dates back to prehistoric times.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(158,'The Abode Of Peace',2022,'exhibitor-works/work-Obianuju-Nnaji-9c719c5e-5283-451d-b641-746c0b3718b9.jpg',96,80.00,1,'Natural African setting, the closeness to nature, the mud houses that breathe in air, the ethereal appeal of raffia, and the bamboo-crafted bench, all serve as reminders of a home once cherished but now forgotten…or almost forgotten.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(159,'Odu Enyi - The Tusk Of Life',2021,'exhibitor-works/work-Obianuju-Nnaji-9c719c5e-947c-43f6-9993-49cf5df0b6a5.jpg',96,85.00,1,'The Elephant tusk is indigenous to Africa. It speaks volumes of power and wealth, and when royalty meets the pulsating sound from an Elephant tusk even the gods come down to dance in a wedlock of mortality and immortality.','2024-07-04 18:28:06','2024-07-04 18:28:06',5),(160,'DADA',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-23f7-418e-a38d-ad7beef87af3.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(161,'Dundun',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-512d-4ebc-ab9e-7bac63a19832.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(162,'Growing old',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-7581-4731-95ff-137cb4f094d2.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5),(163,'Dundun',2022,'exhibitor-works/work-Tosin-Olowoleni-9c71a382-a3be-4be3-9d45-01ebd56a99d4.jpg',97,200000.00,2,'Africa\r\nPotrait \r\nNatural \r\nBeautiful \r\nOutstanding \r\nColourful \r\nReality','2024-07-04 18:48:04','2024-07-04 18:48:04',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitors`
--

LOCK TABLES `exhibitors` WRITE;
/*!40000 ALTER TABLE `exhibitors` DISABLE KEYS */;
INSERT INTO `exhibitors` VALUES (3,24,3,'08123132682',7,'I am a portrait/documentary photographer with 7 years of experience ,I use my art to tell stories of people ,their culture ,experiences and lifestyle.','Blackhydar photography','Durbar Art','A collection of images depicting the Durbar festival in the north .','Instagram',1,1,'2024-06-17 18:31:05','2024-06-17 18:31:05',NULL),(4,25,5,'07042149779',4,'I\'m 18 years old and currently a student at university of benin who loves his sister','Dante\'s Pictures','Culture must not die','A child cultural dressed in a yoruba iro and buba. Keeping culture alive by passing it on to the younger generation.','Instagram',1,1,'2024-06-17 22:46:49','2024-06-17 22:46:49',NULL),(36,65,3,'08062214089',5,'I teach Art History and Drawing at the Federal College of Education Zaria and practice photography as a hobby.','Johnotuphotography','Mini Durba','They photographs of a randomly selected aspects of Durba organised by students of the Department of Hausa Language of Federal College of Education Zaria Kaduna state.','Instagram',1,1,'2024-06-18 17:38:48','2024-06-18 17:38:48',NULL),(37,67,2,'07089943556',8,'Abdul is a creative visual communicator, documenting and keep history using photography. He is also a member of amazing aerial agency.','Photomora','Radiant Resilience','Description: \"Through the lens, the radiant energy of resilience shines bright as the subject raises their head’s, a visual testament to inner strength and unwavering determination in the face of challenges.\"','Instagram',1,1,'2024-06-18 23:22:30','2024-06-18 23:22:30',NULL),(38,69,3,'08094311223',11,'Philips Akwari is a visual storyteller whose expression is usually through documentary photography. His works seek to understand trends, patterns, and relationships between his subjects and their immediate environments. His documentary works have been focused on the everyday nuances and the cultural elements in the areas of his investigations.','M-Visuals Photography','The Rich Abiriba Heritage','These photos were picked from my book \"Abiriba: A Photographic Narrative of a Rich Cultural Heritage\". They are mostly from a different cultural event; The first photo is Igba Ekpe representing the coming of age among young boys in Abiriba. It is a kind of proposal for the formation of an Age Grade. \nThe second photo Uche Oba is guarding the community yam barn. It is the next phase of formation of age grade where the young boys are assigned to guard the community yam barn for a period of time. The photo was taken when they are returning from the bush. \nThe third photo is Onye iwowo (a decorated dancer to entertain the celebrants of Igwa Mang). \nThe fourth photo is that of Ugbo Nde Ekpe belong to the Nwafor Udenyi trading House and decorated with American flags. They are part of the complex Ekpe society in Abiriba kingdom and in this instance is their participation during the Igwa Mang ceremony.\nThe fifth photo is the arrival of Eze Ihungwu ( one of the three important Ezes  of Abiriba kingdom in relation to law making) at the venue of the Itu Eye (law enactment and pronouncement) in Abiriba. Each photo belong to a series of photos that tells broader stories beyond the scope of this exhibition.','Instagram',1,1,'2024-06-19 11:59:26','2024-06-19 11:59:26',NULL),(88,140,2,'09126547720',2,'I’m a young creative photographer that likes to tell stories through my art','Demer','Feel the calmness','A series of photos that shows  the emotional part calmness at it purest form','Instagram',1,1,'2024-06-24 09:27:08','2024-06-24 09:27:08',NULL),(95,159,3,'+2348100544147',7,'Timmy Okanlawon is a Documentary Photographer and a Visual Historian. He is dedicated to capturing the world\'s untold stories through his third eye. He loves to shed light on the diverse cultures, ethnics, festivals, communities, and issues that often remain hidden from the mainstream.','Timmy Okanlawon','Echoes of Euphoria','This collection embodies the spirit of joy, freedom, and vibrant energy that festivals bring. It\'s designed to enhance festival experience with unique and stylish accessories that capture the essence of euphoria. This collection was created from Ojude Oba, a renowned festival in Ijebu Ode, Ogun state. Echoes of Euphoria aims at festival-goers of all ages who love to express their unique style and embrace the festive spirit through accessories.','Instagram',1,1,'2024-07-04 18:08:43','2024-07-04 18:08:43',NULL),(96,160,3,'+2348137887447',5,'I am Nnaji Obianuju Esther, a photo freak. I see the world through the eyes of the lens, observing unnoticed details, finding beauty where others see nothing, and dissecting it to expose its unique flaws. I adore nature, contributing my own quota to creatively bring out its potency.','Esther Nnaji','Rhythms and Roots','Nature is a marriage of sight and sound. From the rhythms of the sea shore to the echoes of Elephant tusks, the joyful heartbeat of a child engrossed with nature and the captivating allure of an African home. \r\nI seek to represent and present the simplicity yet in-depth complexity of an African setting especially sweet part of yore lost to the present generation but still encapsulating the beauty of the African setting, to see if what appears forgotten can forever be engraved  in our minds.','Instagram',1,1,'2024-07-04 18:28:05','2024-07-04 18:28:05',NULL),(97,161,2,'07031997045',5,'Hello my name is tosin olowoleni and I’m a potrait photographer.','The top photos','Heart for Art.','Original photographs by me \r\nMostly taken in the year 2022.','Instagram',1,1,'2024-07-04 18:48:04','2024-07-04 18:48:04',NULL);
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
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(2,'App\\Models\\User',20),(2,'App\\Models\\User',24),(2,'App\\Models\\User',25),(2,'App\\Models\\User',65),(2,'App\\Models\\User',67),(2,'App\\Models\\User',69),(2,'App\\Models\\User',140),(2,'App\\Models\\User',141),(2,'App\\Models\\User',143),(2,'App\\Models\\User',159),(2,'App\\Models\\User',160),(2,'App\\Models\\User',161),(3,'App\\Models\\User',1),(3,'App\\Models\\User',3),(3,'App\\Models\\User',4),(3,'App\\Models\\User',5),(3,'App\\Models\\User',6),(3,'App\\Models\\User',7),(3,'App\\Models\\User',8),(3,'App\\Models\\User',9),(3,'App\\Models\\User',10),(3,'App\\Models\\User',11),(3,'App\\Models\\User',12),(3,'App\\Models\\User',13),(3,'App\\Models\\User',14),(3,'App\\Models\\User',15),(3,'App\\Models\\User',16),(3,'App\\Models\\User',17),(3,'App\\Models\\User',18),(3,'App\\Models\\User',19),(3,'App\\Models\\User',20),(3,'App\\Models\\User',21),(3,'App\\Models\\User',22),(3,'App\\Models\\User',23),(3,'App\\Models\\User',26),(3,'App\\Models\\User',40),(3,'App\\Models\\User',47),(3,'App\\Models\\User',48),(3,'App\\Models\\User',56),(3,'App\\Models\\User',57),(3,'App\\Models\\User',63),(3,'App\\Models\\User',64),(3,'App\\Models\\User',66),(3,'App\\Models\\User',67),(3,'App\\Models\\User',68),(3,'App\\Models\\User',70),(3,'App\\Models\\User',71),(3,'App\\Models\\User',72),(3,'App\\Models\\User',82),(3,'App\\Models\\User',83),(3,'App\\Models\\User',84),(3,'App\\Models\\User',85),(3,'App\\Models\\User',86),(3,'App\\Models\\User',87),(3,'App\\Models\\User',88),(3,'App\\Models\\User',89),(3,'App\\Models\\User',90),(3,'App\\Models\\User',91),(3,'App\\Models\\User',92),(3,'App\\Models\\User',93),(3,'App\\Models\\User',94),(3,'App\\Models\\User',95),(3,'App\\Models\\User',96),(3,'App\\Models\\User',97),(3,'App\\Models\\User',98),(3,'App\\Models\\User',138),(3,'App\\Models\\User',139),(3,'App\\Models\\User',140),(3,'App\\Models\\User',141),(3,'App\\Models\\User',142),(3,'App\\Models\\User',144),(3,'App\\Models\\User',145),(3,'App\\Models\\User',151),(3,'App\\Models\\User',152),(3,'App\\Models\\User',153),(3,'App\\Models\\User',155),(3,'App\\Models\\User',158);
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
INSERT INTO `one_time_login_tokens` VALUES ('abdulrahmanabubakar851@gmail.com','$2y$12$Zd9L10auy62RvfTm24daFuYbuECLkcabQX1POXuF7zVY2vtPrh6k.','2024-06-18 23:22:31'),('alium4521@gmail.com','$2y$12$6BOl/4s3SYFdvhmrqLxcPe9eFFnwLEDX35hzZHRbhfgixpXynqV.u','2024-06-17 18:31:06'),('boscophilz@gmail.com','$2y$12$u5XkW1W.V6duMNrTAYbUsu.vma13SczTy7f6kLNQqyNOgeJHWGumK','2024-07-03 21:41:38'),('obarohmairo@gmail.com','$2y$12$hgh3mzhm68N4e7k3V4sEL.Rpvoe2nToKaeQmfM.OXBjbSOjpdt/fG','2024-06-24 09:27:09'),('ozovehe@gmail.com','$2y$12$0IG4kGPcf8Y7aAMtIdtKbuZfqKlxSQIWbJTULW0OyL71erf27OByu','2024-06-18 17:38:49'),('philip.nwokedi.249413@unn.edu.ng','$2y$12$i2bjwhM8DypFeEb2.V2S5OtT7.yHUln9tzs5Pmt3XUbV5fDIMU4Eu','2024-07-03 10:27:44'),('philipsakwari@gmail.com','$2y$12$pTKRdHweZjFZSaSxPuEQ0.PWu7acY2XTN8X/zmOKwE1UIubYn7ZkC','2024-06-19 11:59:27'),('simeon130705@gmail.com','$2y$12$QW091d867etFrdvoSpVj5.SLzjFcORqpcsbPdvZM.0ZhV80bHrVQ.','2024-06-17 22:46:49'),('tech@natesaconsulting.com','$2y$12$4Y4/e3V0IhrqJjDS7ZSyTuh2ZLfuKDIpvcZfA0lVJnW1XGZL52/aO','2024-07-03 17:24:38'),('ujuesther02@gmail.com','$2y$12$k7VhYwtnhs.1e2m2nmcqLOM73N7hF8sxtWw/D7Dx4ASZEIPCP7bhq','2024-07-04 18:34:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Raymond','Chuma-Onwuoku','ray@scala.africa',NULL,'$2y$12$TmC3qz1IMn7hIwjLbSIRt.7VN8hK2sAT8aD7m9YUSygGsJojtEu.6','uploads/headshots//avatar-9c4455f6-91c3-4c6d-af1d-b83a715ffb2d',NULL,'2024-06-12 06:15:16','2024-06-15 02:06:41',NULL,2),(3,'Mark','Okoye','Markokoye@gmail.com',NULL,'$2y$12$bVGDy7TJmucG2tAf.3VlKenwmFeWHjvbLxExhAMwLFzKUL7GpVF9q',NULL,NULL,'2024-06-13 09:04:32','2024-06-13 09:04:32',NULL,2),(4,'Emmanuel','Adeleke','lekeemma1@gmail.com',NULL,'$2y$12$yfycqPmt2CzSNl4yoNS42eenhelMet3fSdhyXeB2AonnrDu.kZP4G',NULL,NULL,'2024-06-13 11:19:47','2024-06-13 11:19:47',NULL,2),(5,'Raphael','Nwokedi','Zukiizu16@gmail.com',NULL,'$2y$12$ryuhXWsV5WTfPFTX0CHcUOakMVgNR5xdJ/cN.GA/7vquwflHL89YO',NULL,NULL,'2024-06-13 13:25:07','2024-06-13 13:25:07',NULL,2),(6,'Favour','Eboh','favoureboh12@gmail.com',NULL,'$2y$12$5sMLmmyLaNFf6TzUwZVtEeoXUHnZ3iAMDkUw.H98vCghVb0wgrqfa',NULL,NULL,'2024-06-13 14:24:08','2024-06-13 14:24:08',NULL,2),(7,'Jesse','Obasi','obasinzubejesse06@gmail.com',NULL,'$2y$12$xJZ5umSP4LrTwGpLHMHGcebG90NHLPFNnn3xQWxy8AbLP1hJIEsP.',NULL,NULL,'2024-06-13 18:12:07','2024-06-13 18:12:07',NULL,2),(8,'I am Igwebuike Marypromise Ifunanya.  I am from Amaowelle in Amansea Awka North L.G.A. I am 25 years old. I am currently a student of the Nigerian Law School, Enugu Campus.','Igwebuike','queeenmarydaisy1605@gmail.com',NULL,'$2y$12$pV./hK0I.dzAd4TeiamTWem4qAmozYj7GzR5Oxm3Qw3f6AAa3Afii',NULL,NULL,'2024-06-13 18:13:35','2024-06-13 18:13:35',NULL,2),(9,'Austin','Okeyika','Okeyikaaustin@gmail.com',NULL,'$2y$12$GWAc0fKEVokTXNvnphhT2uSMu34zPOrPU1WXsvMsk3GJc9b59nqwi',NULL,NULL,'2024-06-13 19:23:24','2024-06-13 19:23:24',NULL,2),(10,'Ogechukwu','Udoji','udojilynda8@gmail.com',NULL,'$2y$12$QffAQQoS38KgcBy23dfLee7Bysr5s6v.3r2m0qscG3T6MkhmRsp2W',NULL,NULL,'2024-06-13 19:40:38','2024-06-13 19:40:38',NULL,2),(11,'Ebube','Chukwudi','chukwudiebube00@gmail.com',NULL,'$2y$12$Vgsbd9MxlJhVIDnYLJK3UOPYdqtWr8rx/P3dp77vZadjpMdUGvtZu',NULL,NULL,'2024-06-13 20:52:06','2024-06-13 20:52:06',NULL,2),(12,'Adaeze','Obi-Obasi','hollaadaeze@gmail.com',NULL,'$2y$12$9Dkv.sEfcWiAlONPru0mROmdmDtlXrWPx3oynG5eRApbvYoADIwsa',NULL,NULL,'2024-06-14 11:00:02','2024-06-14 11:00:02',NULL,2),(13,'Christabel','Nnadi','nnadichristabel6@gmail.com',NULL,'$2y$12$zsTZ9ZyrXEocbBEr1Oe/rul2JeLRix.IZy2DFF6EQULcYXJPHG2Qm',NULL,NULL,'2024-06-14 11:09:34','2024-06-14 11:09:34',NULL,2),(14,'Marcel','Manafa','marcelmanafa@yahoo.com',NULL,'$2y$12$zDSaT6POdWhtlvuE/WmMqe2EH14RrLtwqcHwDy.tFSQZ4u5WmxasG',NULL,NULL,'2024-06-14 12:30:16','2024-06-14 12:30:16',NULL,2),(15,'Jacinta','Nweke','jaycnweke@gmail.com',NULL,'$2y$12$ruhXk9aPAa98.6uYFgdSWuWHeSnj8dO8r3lgas68mwRxZK0jVaeMq',NULL,NULL,'2024-06-14 12:42:57','2024-06-14 12:42:57',NULL,2),(16,'Casmir','Oscar','Casmiroscar123@gmail.com',NULL,'$2y$12$xNyb9NiEl3JSfs68KflPw.jbQlvB03OSpdFiSwrQ/czfnoJK4z6lO',NULL,NULL,'2024-06-14 12:57:32','2024-06-14 12:57:32',NULL,2),(17,'Mmesomachukwu','Favour','mmeso5432@gmail.com',NULL,'$2y$12$8.L1AE6q7gYP/y9gKxEtk.DFQQ6fe0W32mgHNetTPOBWhCUUU2sX6',NULL,NULL,'2024-06-14 21:01:59','2024-06-14 21:01:59',NULL,2),(18,'Ifesinachi','Umeojiako','chialukarita05@gmail.com',NULL,'$2y$12$VOJXoRD9a.c4FIwREYrAFewUCGGw7dZBoLyKaypMMRBpFRsECn/6W',NULL,NULL,'2024-06-15 10:55:41','2024-06-15 10:55:41',NULL,2),(19,'Jude','OKAFOR','okaforanita673@gmail.com',NULL,'$2y$12$COVZI8WZcIElV08ZzJ.tc.EfCtVTnLlvWV3AzyTpZfsNr62aQ18eK',NULL,NULL,'2024-06-15 11:16:11','2024-06-15 11:16:11',NULL,2),(20,'Philip','Olisaemeka','philippos764@gmail.com',NULL,'$2y$12$OqUznTih/KWeeHFaEnTfFuI9TBpcQj/JLl7t5hu29.4Z9SAin1NCm','headshots/headshot-Philip-Olisaemeka-9c4b320f-2890-4d2f-9a90-93e898ede420.jpg','rqWzcbWkLdlU9RWgKN7BgDC3u6pd3h2QN3ZX5wm732SwzISkEU1mXGtlmNjR','2024-06-15 16:09:23','2024-06-15 16:09:23',NULL,5),(21,'Uchechukwu','Ezeemo','ju.ezeemo@unizik.edu.ng',NULL,'$2y$12$vNvygmv1GYwQoUQBLMsQButjj8gkuuyyzc/nADq8SxNUwl/JUfpj.',NULL,NULL,'2024-06-17 03:01:36','2024-06-17 03:01:36',NULL,2),(22,'Bright','Daniel','presh414@gmail.com',NULL,'$2y$12$1sKsayIgubYhY0JH73h6UuebF2w7ubFuOKs7sDueT66PommS5TjCm',NULL,NULL,'2024-06-17 14:09:12','2024-06-17 14:09:12',NULL,2),(23,'Mubarak','Balogun','balogunolawalemubarak@gmail.com',NULL,'$2y$12$L/pBc6M//gdc0kAzjujoUeDUmAOnx8CyhSaqFXc0UBUyfqVlSpo2O',NULL,NULL,'2024-06-17 14:19:24','2024-06-17 14:19:24',NULL,2),(24,'Aliyu','Muhammad Bashar','alium4521@gmail.com',NULL,'$2y$12$CqIQMJ5O2crqCZLZZDAZruVlodcRnKsF3iEjEDmw/r7lxdpwMxa8.','headshots/headshot-Aliyu-Muhammad-Bashar-9c4f6ab3-7122-4a8f-a3a2-5f65d9f03bfc.jpg',NULL,'2024-06-17 18:31:04','2024-06-17 18:31:05',NULL,5),(25,'Oluwafemi','Omole','simeon130705@gmail.com',NULL,'$2y$12$0Hh703psQCttlx58CgrsLeRJk.ZxZQOB7j/9OPZkxHhe9I32wDtoy','headshots/headshot-Oluwafemi-Omole-9c4fc628-612a-484b-9785-cbdaec7a91e5.jpg',NULL,'2024-06-17 22:46:48','2024-06-17 22:46:49',NULL,5),(26,'David','Mkpume','mkpumedavid@gmail.com',NULL,'$2y$12$slzxWahyey3kG0dpzyVLIu.0CQqx8XzsJRI4lkDDaYsHMLULSJOKi',NULL,NULL,'2024-06-18 00:04:46','2024-06-18 00:04:46',NULL,2),(40,'Peace','Olabode','olabodeelijah001@gmail.com',NULL,'$2y$12$7aBlg3CxNQ.RxSBdEcyMO.Svh.ZJyzGFeBeeRhsvxzSb7HxFJauh6',NULL,NULL,'2024-06-18 07:19:36','2024-06-18 07:19:36',NULL,2),(47,'Valentine','Udemadu','valentinesopuru56@gmail.com',NULL,'$2y$12$2WIrVKBU6G8tpR9Dw2gEd.rHA9XQloXTg59fB2noRwSWAiYb31Jnq',NULL,NULL,'2024-06-18 08:35:34','2024-06-18 08:35:34',NULL,2),(48,'Jeremiah','Terfa','jerryterfa1@gmail.com',NULL,'$2y$12$nz4ZalNcSN3E6QiqPRuGq.UKucRlMwkrr69sWYyfJVGP9RNHcj4aS',NULL,NULL,'2024-06-18 09:36:54','2024-06-18 09:36:54',NULL,2),(56,'Francis','Okechukwu','thefbostudios@gmail.com',NULL,'$2y$12$UnmSXzlfZFPBnQjzgyuRZu/p43M4MVWAPX5zOeJjVO9OiKO7Ed1NC',NULL,NULL,'2024-06-18 10:31:44','2024-06-18 10:31:44',NULL,2),(57,'Louis-Raphael','Nwokedi','luizphotographee@gmail.com',NULL,'$2y$12$8G7A6VwHAmhdJwYHEpqlWu9zT3raesuqDYxBgRDvls2IJQ4P6AYXG',NULL,NULL,'2024-06-18 12:10:38','2024-06-18 12:10:38',NULL,2),(63,'Chinenye','Oguadinma','chineyoguadinma@gmail.com',NULL,'$2y$12$xz.7K6b5BkO9/ARkjYMWBOKlTWa1117V/weC/QjmnTrIlSeh5VEIe',NULL,NULL,'2024-06-18 13:12:48','2024-06-18 13:12:48',NULL,2),(64,'Chinecherem','Enujioke','veronicaenujioke@gmail.com',NULL,'$2y$12$oAEkMTPTZ7CnpTXy9kqSZunPHS9j3mItEIErSgBsfI3d2znguwADa',NULL,NULL,'2024-06-18 16:05:46','2024-06-18 16:05:46',NULL,2),(65,'John','Otu','ozovehe@gmail.com',NULL,'$2y$12$TBs2XM7gXNCvJjbHui2CVe1h.W/lhAswq1HnLPIqzCyU/DE0Awivu','headshots/headshot-John-Otu-9c515afd-bd95-4d0f-92d2-64ac8f098932.jpg',NULL,'2024-06-18 17:38:48','2024-06-18 17:38:48',NULL,5),(66,'Okolie','Emmanuel','emmanuelokolie67@gmail.com',NULL,'$2y$12$jbEw1iPVXQrpAIG7U.I6IupylZPB8rbZ7zb5MhtsCTXyhRNjQpmHK',NULL,NULL,'2024-06-18 18:46:10','2024-06-18 18:46:10',NULL,2),(67,'Abdulrahaman','Abubakar','abdulrahmanabubakar851@gmail.com',NULL,'$2y$12$eflhW3T34sgmxc2Ua2zVieCq7bEc0ziIOX9JSES04xvyYvlYz1Cf6','headshots/headshot-Abdulrahaman-Abubakar-9c51d5e8-70fc-45b8-bf46-6350e55c0c7e.jpg',NULL,'2024-06-18 23:22:30','2024-06-18 23:22:30',NULL,5),(68,'Joshua','Samu','joshuasamu24@gmail.com',NULL,'$2y$12$hzeCug0c/ix.83UyxcxunePTpEVZgu3PyCG6IpBtOdAGTU/tVBRPu',NULL,NULL,'2024-06-19 02:25:20','2024-06-19 02:25:20',NULL,2),(69,'Philips','Akwari','philipsakwari@gmail.com',NULL,'$2y$12$5FV61Jp5pSSLA.VARzlQSulD4LTtkr2gyshNew0k.8xpKobfQ8f6G','headshots/headshot-Philips-Akwari-9c52e49b-03cd-4255-a267-b33cadf2ef34.jpg',NULL,'2024-06-19 11:59:26','2024-06-19 11:59:26',NULL,5),(70,'Oguntolu','Gbenga','bankybranding@gmail.com',NULL,'$2y$12$WhDC.O6fKEK074KV5yt.1e.31WjgZDH8jUohPr2SGMdSr3TJ9nePy',NULL,NULL,'2024-06-19 17:00:16','2024-06-19 17:00:16',NULL,2),(71,'Udochukwu','Orji','orjiraven18@gmail.com',NULL,'$2y$12$Dqq8s5tyA8gRU79kKEdUouCw0jUc/Fn/BPE4TgXdgS18T8FaE/kS.',NULL,NULL,'2024-06-19 17:08:44','2024-06-19 17:08:44',NULL,2),(72,'Inna','Dodo','dodoinna8@gmail.com',NULL,'$2y$12$RIfAWoDkRlRqebBUquUsMe5x2/.B6TOlZDqDIkGzAYrbE8KikUxL6',NULL,NULL,'2024-06-19 23:10:38','2024-06-19 23:10:38',NULL,2),(82,'Uchenna','Ikenga','uchennaikenga1234@gmail.com',NULL,'$2y$12$iUqyYU0A4KIzf1t4bHafPO40PiuxkK/MbWL4xBI3/Zyb5qN.1kYcy',NULL,NULL,'2024-06-20 09:52:55','2024-06-20 09:52:55',NULL,2),(83,'Joseph Kenneth','Itchara','jkshotit@gmail.com',NULL,'$2y$12$0/j2UzPo0dbXq5e238xGHeEx8Jpv5M.K77sXgLKUDB1OAZVOEQDai',NULL,NULL,'2024-06-20 14:03:52','2024-06-20 14:03:52',NULL,2),(84,'Egokiniovo','Okedavis','chrisoke64@gmail.com',NULL,'$2y$12$w4sXgF1RV.JnUoDLV.5g0.IKrGRAcDY214zT8jjceoqGzRGL2VUya',NULL,NULL,'2024-06-20 17:58:55','2024-06-20 17:58:55',NULL,2),(85,'Keshinro','Olaore','keshinroolaore@gmail.com',NULL,'$2y$12$1nkPUU4pM8h4T6ei/UeWNOOSigrsYwfZGzNfkNYfzP1DS8saFuiRy',NULL,NULL,'2024-06-21 08:53:52','2024-06-21 08:53:52',NULL,2),(86,'Daniel','Adebiyi','adebs.daniel@gmial.com',NULL,'$2y$12$tXqL21Hi3juF9XarTBfMQuf9N0peW.RaQhY/Lr5QfxgvUkAAeksnu',NULL,NULL,'2024-06-21 13:48:33','2024-06-21 13:48:33',NULL,2),(87,'Shalom','Osezua','Shalomosezua007@gmail.com',NULL,'$2y$12$57ZvFp9/mv2rebQZASMIqurn.IRcKxVdEKJ9DwyjfTzZdree91F9q',NULL,NULL,'2024-06-21 17:37:13','2024-06-21 17:37:13',NULL,2),(88,'Naomi','Amarachi','genaconcept@aol.com',NULL,'$2y$12$OvFyrk/MpOlaPTGDd7C67.TngPsp9EAxqY//wXrdLKp.nffm8S6P2',NULL,NULL,'2024-06-22 01:18:36','2024-06-22 01:18:36',NULL,2),(89,'Naomi','Amarachi','naomiamarach20@gmail.com',NULL,'$2y$12$0IB9wcBsU6DYDILLFAwGje.D92W4HTp7gTQI93mb05yUEAEp2JJmu',NULL,NULL,'2024-06-22 01:19:53','2024-06-22 01:19:53',NULL,2),(90,'Promise','Njoku','pnpix.360@gmail.com',NULL,'$2y$12$iqK.b9aonBajZChNVdMakukOzfdfOGVxUSxlPAKqn1llqDJMiodci',NULL,NULL,'2024-06-22 04:07:15','2024-06-22 04:07:15',NULL,2),(91,'Akinyemi','Opeyemi','akinyemio197@gmail.com',NULL,'$2y$12$GP5KUZalV8yJ3INy.PPUne0gc5LV2JDgxgG6IFd1llD9zva2cXOD2',NULL,NULL,'2024-06-22 05:35:00','2024-06-22 05:35:00',NULL,2),(92,'Timileyin','Okanlawon','timileyinokanlawon@gmail.com',NULL,'$2y$12$QyVxJWZave5iDdSCq2YeRO/CQnyq4H2SBJ6sNmWG0gBoj5N3/c7.m',NULL,NULL,'2024-06-22 07:12:42','2024-06-22 07:12:42',NULL,2),(93,'Daniel','Nlemoha','dannynlemoha@gmail.com',NULL,'$2y$12$EfHpG2xP8cqaKFuBSp5BROdYacT2635gKPkopIPgb2q3MHOhpYHy.',NULL,NULL,'2024-06-22 08:03:35','2024-06-22 08:03:35',NULL,2),(94,'Daniel','Nlemoha','trenchstudioltd@gmail.com',NULL,'$2y$12$0GRFk/yNF9Y7Weh8O4v14.lBwxIHzWtlBTJqcWHF/n/J2ntiqgOJ6',NULL,NULL,'2024-06-22 08:08:41','2024-06-22 08:08:41',NULL,2),(95,'Solomon','Okunowo','okunsolo4christ@gmail.com',NULL,'$2y$12$K3mM3epDkl.LhpJOD0EkgOL0oMGsJSeXSrbrHDrKTCwB6O1sSy04O',NULL,NULL,'2024-06-22 13:12:14','2024-06-22 13:12:14',NULL,2),(96,'Adewale','Rokeeb','adewale.rockyb@gmail.com',NULL,'$2y$12$GHfuqP6Q5g.Bxo1/LtBrSOoIcsQSgdMC47/mO3Vby5vDi0QgpP2e.',NULL,NULL,'2024-06-23 00:25:59','2024-06-23 00:25:59',NULL,2),(97,'Clinton','Eze','clintoneze07@gmail.com',NULL,'$2y$12$U7UJ3YDADo.Q9ZF2Dsm9fe20ragVk3pwfrSuenUfyYP6H2FPMPK92',NULL,NULL,'2024-06-23 03:57:45','2024-06-23 03:57:45',NULL,2),(98,'Arthur','Ike','peterike64@gmail.com',NULL,'$2y$12$TYaItVrfe/MqjV3eVNM21u1jK41bNCZfngwAklwbdBZgPe4NLcKBS',NULL,NULL,'2024-06-23 11:04:02','2024-06-23 11:04:02',NULL,2),(138,'Victor','Oluwayoju','victoroluwayoju@gmail.com',NULL,'$2y$12$hJXMfLh2Vw/B2Kq/m7vqu.SneZlUCL7EP9fOADe.bsGdxzPJunP72',NULL,NULL,'2024-06-24 03:00:38','2024-06-24 03:00:38',NULL,2),(139,'My name is praiz, A family of 4. My interest is photography which came to light after the death of my sibling','Praise','praisedaley@gmail.com',NULL,'$2y$12$nKhdFiQXf2ES3NXHlftAT.1F6OavFqJz6w7tyMr13LERl40W/lGKu',NULL,NULL,'2024-06-24 07:04:32','2024-06-24 07:04:32',NULL,2),(140,'Oghenemairo','Obaroh','obarohmairo@gmail.com',NULL,'$2y$12$S0YammM04PRd/nXoJkKm4.BdvY26PCoxNAPX7Nvfv3ydf6A3Occ.a','headshots/headshot-Oghenemairo-Obaroh-9c5cbd0f-9f29-49e9-b3c0-679b9a63e6a9.jpg',NULL,'2024-06-24 09:18:19','2024-06-24 09:27:08',NULL,5),(141,'Philip','Nwokedi','philip.nwokedi.249413@unn.edu.ng',NULL,'$2y$12$H09N50x68QMoED2VHFUPfeqn1FnXL8IRZLxOak221bB2JM8NU7EUm','headshots/headshot-Philip-Nwokedi-9c6eed96-99bf-4175-890a-e2ff87c23cd1.jpg',NULL,'2024-07-02 17:18:13','2024-07-03 10:56:46','2024-07-03 10:56:46',5),(142,'Bryan','Okafor','bryanokafor1302@gmail.com',NULL,'$2y$12$7jYZt6oDa9RRMSmPMLsSv.gFTfNes3pycqN/Q5TdMYE0A2HO94ZQe',NULL,NULL,'2024-07-03 08:20:43','2024-07-03 08:20:43',NULL,2),(143,'Philip','Nwokedi','hsfgjkrfmfnbvhsdv',NULL,'$2y$12$tqULJ7pvRAUnf30VcUIeW.EuFa8x9OYuY8u3CHc5ZxV4bDQQbi8zy','headshots/headshot-Philip-Nwokedi-9c6ee7e4-75aa-46bc-bacd-e95cd9823a95.jpg',NULL,'2024-07-03 10:11:48','2024-07-03 10:11:48',NULL,5),(144,'Chiamaka','Oduenyi','promiseoduenyi@gmail.com',NULL,'$2y$12$pdCM6GVicwuCyZMgg3hv0ePbBfQH.7vXgOoaO/GdK6gE1A689ACj2',NULL,NULL,'2024-07-03 10:38:37','2024-07-03 10:38:37',NULL,2),(145,'Kingdavid','Adeyemi','kingdav840@gmail.com',NULL,'$2y$12$YXPlGfoD5KICPJElNcP7b.RO8FhacnS7k2ZgmijZp9xVXkXcsg35i',NULL,NULL,'2024-07-03 10:40:57','2024-07-03 10:40:57',NULL,2),(151,'Agape','Obinna','agapeobinna@gmail.com',NULL,'$2y$12$6mX84XaWhSy/XnbztURQh.lar4acZGOwjWWTG.Jyt2Q0AW98sS5Fq',NULL,NULL,'2024-07-03 15:33:41','2024-07-03 15:33:41',NULL,2),(152,'Oluwapelumi','Adegoke','ade1pelumi@gmail.com',NULL,'$2y$12$2wBU.esQlCWvm3InGyf/eOLbjEnjMfpBYz94JzfNQcXAO1empF6by',NULL,NULL,'2024-07-03 16:02:52','2024-07-03 16:02:52',NULL,2),(153,'VANXAN','Classics','vanxanadamz@gmail.com',NULL,'$2y$12$VI7FI4JkhLG.jnk/6MWMcewo4f.K0JL7ZkleAX0r1HLRME.HXsM5a',NULL,NULL,'2024-07-03 16:53:16','2024-07-03 16:53:16',NULL,2),(155,'Noah','Oghenede','ovienoah222@gmail.com',NULL,'$2y$12$.Yu.0wQEdZ3uXxpdwtCBbeuzRwQ.x9J1MWNnfvHjUwjs2wxz7ik2W',NULL,NULL,'2024-07-03 19:47:36','2024-07-03 19:47:36',NULL,2),(158,'OKECHUKWU','OKONKWO','ifointernational@gmail.com',NULL,'$2y$12$wtawZq2Ea3coZ3Hu2d1tyuKXVu525xCX8iDDtP0MMw.jdR/iTzgxS',NULL,NULL,'2024-07-04 11:45:30','2024-07-04 11:45:30',NULL,2),(159,'Timileyin','Okanlawon','timmyokanlawon@gmail.com',NULL,'$2y$12$7oo.fZykTrS3kBbQAX1VJuQzYtFln3gwAiZyLXu52vaoEKpi4/fYO','headshots/headshot-Timileyin-Okanlawon-9c71956e-abf4-4f02-a202-f9c666b69122.jpg',NULL,'2024-07-04 18:08:42','2024-07-04 18:08:43',NULL,5),(160,'Obianuju','Nnaji','ujuesther02@gmail.com',NULL,'$2y$12$DH1FVvY2JPOwvcfRrDC7iOVwJY3Yzg.wcJwrzF0plpwRzMZTjhMw.','headshots/headshot-Obianuju-Nnaji-9c719c5c-bd97-4b8a-80d8-6e202ac0c6cd.jpg',NULL,'2024-07-04 18:28:05','2024-07-04 18:28:05',NULL,5),(161,'Tosin','Olowoleni','preciousolowoleni@gmail.com',NULL,'$2y$12$96bcH0N5bZDzAIJjBS8sduKXs3JGSqe349Df9fiT./PuzHhSn0Wti','headshots/headshot-Tosin-Olowoleni-9c71a381-8f99-4bfc-ab93-6b82ea378f67.jpg',NULL,'2024-07-04 18:48:04','2024-07-04 18:48:04',NULL,5);
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

-- Dump completed on 2024-07-04 19:06:07
