-- MySQL dump 10.11
--
-- Host: localhost    Database: pay4memall
-- ------------------------------------------------------
-- Server version	5.0.88

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_account`
--

DROP TABLE IF EXISTS `account_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_account` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `title` varchar(4) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES (1,30,'Mr.','08029299274','9, Admiralty Way','Lekki','Lagos','Nigeria'),(2,31,'Mr.','08029299274','9, Admiralty Way','Lekki','Lagos','Nigeria');
/*!40000 ALTER TABLE `account_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Merchant');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (22,1,48),(21,1,47),(20,1,46),(19,1,45),(18,1,44),(17,1,43),(16,1,42),(15,1,41),(14,1,40);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(52,'Can add store',18,'add_store'),(51,'Can delete account',17,'delete_account'),(49,'Can add account',17,'add_account'),(50,'Can change account',17,'change_account'),(53,'Can change store',18,'change_store'),(31,'Can add department',11,'add_department'),(32,'Can change department',11,'change_department'),(33,'Can delete department',11,'delete_department'),(34,'Can add category',12,'add_category'),(35,'Can change category',12,'change_category'),(36,'Can delete category',12,'delete_category'),(59,'Can change transaction',20,'change_transaction'),(58,'Can add transaction',20,'add_transaction'),(40,'Can add product group',14,'add_productgroup'),(41,'Can change product group',14,'change_productgroup'),(42,'Can delete product group',14,'delete_productgroup'),(43,'Can add product',15,'add_product'),(44,'Can change product',15,'change_product'),(45,'Can delete product',15,'delete_product'),(46,'Can add product detail',16,'add_productdetail'),(47,'Can change product detail',16,'change_productdetail'),(48,'Can delete product detail',16,'delete_productdetail'),(54,'Can delete store',18,'delete_store'),(55,'Can add store owner',19,'add_storeowner'),(56,'Can change store owner',19,'change_storeowner'),(57,'Can delete store owner',19,'delete_storeowner'),(60,'Can delete transaction',20,'delete_transaction'),(61,'Can add ordered item',21,'add_ordereditem'),(62,'Can change ordered item',21,'change_ordereditem'),(63,'Can delete ordered item',21,'delete_ordereditem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'zedd','Oladayo','Osikoya','alwaysdeone@gmail.com','sha1$196ce$00f495c46f0d7352f58d59c8a1007f72dd37d9ce',1,1,1,'2010-08-02 15:57:03','2010-07-16 11:30:38'),(2,'fashiondealer@pay4memall.com','Olusegun','Obasanjo','segun@gov.ng','sha1$31adb$8212349a1d6642a299a91c5461833602e52982d0',1,1,0,'2010-07-21 04:14:27','2010-07-20 00:33:34'),(3,'toyshop@pay4memall.com','Namadi','Sambo','alwaysdeone@gmail.com','sha1$aab8c$136867083cc008f8d786dfd114a86853973cb1d8',1,1,0,'2010-07-22 02:13:24','2010-07-22 02:07:04'),(30,'seyi@ola.com','Seun','Osikoya','seyi@ola.com','sha1$0decf$b91215b2902f0c52977c2b88ab82d44b2dd4b85e',0,1,0,'2010-08-03 10:41:38','2010-08-03 10:41:38'),(31,'ade@olu.com','Ade','Ade','ade@olu.com','sha1$6bdc2$9641493f101d1dabe2890b1491d7cafa7ba6238d',0,1,0,'2010-08-03 13:57:10','2010-08-03 13:57:10'),(27,'seyi@yahoo.com','Seyi','Ola','seyi@yahoo.com','sha1$4fabc$8b260206806b37258d5fef8bef43a8a4f56d67a1',0,1,0,'2010-07-30 14:07:21','2010-07-30 14:07:21'),(26,'chigoelectronics','John','Olusegun','john.olu@yahoo.com','sha1$f5aad$72abbcd48c0326cb847a830d40ececd7db2a1da5',1,1,0,'2010-08-02 11:28:09','2010-07-30 09:11:36'),(25,'amazemobiles','Olaolu','Adebayo','olaolu@gmail.com','sha1$985a8$242542a0c6d80a7b46340c06cbaeb76e46b82a34',1,1,0,'2010-08-02 11:26:38','2010-07-30 09:11:18'),(24,'thegroceryshop','Chika','Anyanwu','chika@email.com','sha1$dc261$71f59b35490c2eebb15e5a4bedce14dd2d16ecb7',1,1,0,'2010-08-02 11:27:47','2010-07-30 07:56:28');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (4,2,1),(5,3,1),(6,24,1),(11,25,1),(12,26,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2010-07-19 03:59:15',1,11,'1','Books',1,''),(2,'2010-07-19 03:59:29',1,11,'2','Movies, Music & Games',1,''),(3,'2010-07-19 04:00:22',1,12,'1','Textbooks',1,''),(4,'2010-07-19 04:00:33',1,12,'2','Novels',1,''),(5,'2010-07-19 04:00:46',1,12,'3','Magazines',1,''),(6,'2010-07-19 04:01:03',1,12,'4','Movies & TV',1,''),(7,'2010-07-19 04:01:12',1,12,'5','Video Games',1,''),(8,'2010-07-19 04:01:25',1,12,'6','Musical Instruments',1,''),(10,'2010-07-20 00:33:34',1,3,'2','shop@pay4memall.com',1,''),(11,'2010-07-20 00:37:23',1,2,'1','Merchant',1,''),(12,'2010-07-20 00:37:34',1,3,'2','shop@pay4memall.com',2,'Changed first_name, last_name, email and groups.'),(13,'2010-07-20 00:39:39',1,3,'2','shop@pay4memall.com',2,'Changed is_staff.'),(26,'2010-07-20 11:18:17',2,14,'2','Women\'s Shirts',1,''),(16,'2010-07-20 00:54:53',1,17,'1','Account object',1,''),(25,'2010-07-20 11:15:11',2,14,'1','Men\'s Shirts',1,''),(18,'2010-07-20 01:01:27',1,3,'2','game@pay4memall.com',2,'Changed username.'),(19,'2010-07-20 02:02:28',2,14,'1','Laptops',1,''),(20,'2010-07-20 02:02:50',2,14,'2','Televisions',1,''),(24,'2010-07-20 11:12:05',1,18,'1','Fashion Dealer',1,''),(22,'2010-07-20 08:41:08',1,2,'1','Merchant',2,'Changed permissions.'),(23,'2010-07-20 08:42:24',1,3,'2','fashiondealer@pay4memall.com',2,'Changed username.'),(27,'2010-07-21 03:49:37',2,15,'1','Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt',1,''),(28,'2010-07-21 03:52:11',2,15,'2','Navy 4 Season Travel 2 Button Suit Jacket',1,''),(29,'2010-07-21 03:54:07',2,15,'3','Grey Blue Tonal Split Stripe John Francomb Roma Fitted Button Cuff Shirt',1,''),(30,'2010-07-21 03:55:39',2,15,'4','Blue Plain Luxury Twill Windsor Slim Fit Double Cuff Shirt',1,''),(31,'2010-07-21 03:57:36',2,15,'5','White Plain 2-Fold Poplin John Francomb Milan Slim Fit Shirt',1,''),(32,'2010-07-21 03:58:46',2,15,'6','Navy White Fine Stripe White Collar John Francomb Milan Slim Fit Shirt',1,''),(33,'2010-07-21 03:59:55',2,15,'7','Black White Floral Print John Francomb Milan Slim Fit Shirt',1,''),(34,'2010-07-21 04:00:43',2,14,'1','Men\'s',2,'Changed name.'),(35,'2010-07-21 04:00:50',2,14,'2','Women\'s',2,'Changed name.'),(36,'2010-07-21 04:04:01',2,15,'8','Blue Highlight Multi Stripe Fitted Double Cuff Shirt',1,''),(37,'2010-07-21 04:04:56',2,15,'9','Black White Spaced Stripe Fitted Double Cuff Shirt',1,''),(38,'2010-07-21 04:06:09',2,15,'10','Turquoise Floral Bunch Luxury Jacquard Fitted Double Cuff Shirt',1,''),(39,'2010-07-21 04:07:06',2,15,'11','Blue Yellow Multi Stripe Fitted Double Cuff Shirt',1,''),(40,'2010-07-21 04:08:07',2,15,'12','Pink Floral Bunch Fitted Double Cuff Shirt',1,''),(41,'2010-07-21 04:09:39',2,15,'13','Lime Stripe Fitted Double Cuff Shirt',1,''),(42,'2010-07-21 04:10:56',2,15,'14','Lime Graded Multi Stripe Fitted Double Cuff Shirt',1,''),(43,'2010-07-21 04:11:56',2,15,'15','Pink Fine Bar Stripe Fitted Double Cuff Shirt',1,''),(44,'2010-07-21 09:36:16',2,15,'1','Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt',2,'Changed thumbnail and large_image.'),(45,'2010-07-22 02:07:04',1,3,'3','toyshop@pay4memall.com',1,''),(46,'2010-07-22 02:07:58',1,3,'3','toyshop@pay4memall.com',2,'Changed first_name, last_name, email, is_staff and groups.'),(47,'2010-07-22 02:10:54',1,18,'2','Toy Shop',1,''),(48,'2010-07-22 02:16:03',3,14,'3','Boy Toys',1,''),(49,'2010-07-30 07:52:47',1,3,'22','Chika',1,''),(50,'2010-07-30 07:53:07',1,3,'22','Chika',3,''),(51,'2010-07-30 07:54:06',1,3,'23','thegroceryshop',1,''),(52,'2010-07-30 07:54:28',1,3,'23','thegroceryshop',3,''),(53,'2010-07-30 07:56:28',1,3,'24','groceryshop',1,''),(54,'2010-07-30 07:58:18',1,3,'24','thegroceryshop',2,'Changed username, first_name, last_name, email, is_staff and groups.'),(55,'2010-07-30 08:10:56',1,3,'1','zedd',2,'Changed first_name and last_name.'),(56,'2010-07-30 08:12:05',1,3,'19','dayo@aol.com',3,''),(57,'2010-07-30 08:12:05',1,3,'18','dora@dora.net',3,''),(58,'2010-07-30 08:12:05',1,3,'17','seyi@ade.com',3,''),(59,'2010-07-30 08:12:05',1,3,'16','seyi@ola.com',3,''),(60,'2010-07-30 08:12:05',1,3,'21','tope@gmail.com',3,''),(61,'2010-07-30 08:12:05',1,3,'20','yinka@yahoo.com',3,''),(62,'2010-07-30 08:15:55',1,3,'1','zedd',2,'Changed first_name and last_name.'),(63,'2010-07-30 08:18:40',1,3,'1','zedd',2,'Changed first_name and last_name.'),(64,'2010-07-30 08:31:09',1,18,'3','The Grocery Shop',1,''),(65,'2010-07-30 08:32:47',24,14,'4','Coffee',1,''),(66,'2010-07-30 08:32:56',24,14,'5','Tea',1,''),(67,'2010-07-30 08:46:54',24,15,'16','Tassimo T-Disk: Starbucks 100% Colombian Coffee T-Disc Pods (Case of 5 packages; 60 T-Discs Total)',1,''),(68,'2010-07-30 08:48:21',24,15,'16','Tassimo T-Disk: Starbucks 100% Colombian Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed name.'),(69,'2010-07-30 08:48:36',24,15,'16','Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed name.'),(70,'2010-07-30 08:51:20',24,15,'17','Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)',1,''),(71,'2010-07-30 08:53:37',24,15,'18','Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)',1,''),(72,'2010-07-30 08:54:50',24,15,'19','Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)',1,''),(73,'2010-07-30 09:05:19',24,15,'20','Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)',1,''),(74,'2010-07-30 09:06:37',24,15,'21','PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)',1,''),(75,'2010-07-30 09:07:45',24,15,'22','Traditional Medicinals Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)',1,''),(76,'2010-07-30 09:08:00',24,15,'22','Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)',2,'Changed name.'),(77,'2010-07-30 09:09:32',24,15,'23','Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)',1,''),(78,'2010-07-30 09:11:18',1,3,'25','amazemobiles',1,''),(79,'2010-07-30 09:11:36',1,3,'26','chigoelectronics',1,''),(80,'2010-07-30 09:13:04',1,18,'4','Chigo Electronics',1,''),(81,'2010-07-30 09:13:42',1,18,'5','Amaze Mobiles',1,''),(82,'2010-07-30 09:14:37',1,3,'25','amazemobiles',2,'Changed groups.'),(83,'2010-07-30 09:14:48',1,3,'26','chigoelectronics',2,'Changed groups.'),(84,'2010-07-30 09:15:06',1,3,'25','amazemobiles',2,'Changed is_staff.'),(85,'2010-07-30 09:15:23',1,3,'26','chigoelectronics',2,'Changed is_staff.'),(86,'2010-07-30 09:15:50',1,3,'25','amazemobiles',2,'Changed first_name, last_name and email.'),(87,'2010-07-30 09:16:13',1,3,'26','chigoelectronics',2,'Changed first_name, last_name and email.'),(88,'2010-07-30 09:17:09',25,14,'6','Nokia',1,''),(89,'2010-07-30 09:24:02',25,15,'23','Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)',2,'Changed description.'),(90,'2010-07-30 09:24:20',25,15,'22','Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)',2,'Changed description.'),(91,'2010-07-30 09:24:29',25,15,'21','PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)',2,'Changed description.'),(92,'2010-07-30 09:24:34',25,15,'20','Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)',2,'Changed description.'),(93,'2010-07-30 09:36:34',1,18,'3','The Grocery Shop',2,'Changed logo.'),(94,'2010-07-30 09:36:46',1,18,'4','Chigo Electronics',2,'Changed logo.'),(95,'2010-07-30 09:36:55',1,18,'5','Amaze Mobiles',2,'Changed logo.'),(96,'2010-07-30 09:42:03',25,15,'24','Nokia 5530 XpressMusic',1,''),(97,'2010-07-30 09:42:55',25,15,'24','Nokia 5530 XpressMusic',2,'Changed description.'),(98,'2010-07-30 09:45:55',25,15,'25','Nokia E5',1,''),(99,'2010-07-30 09:49:30',25,15,'26','Nokia N85',1,''),(100,'2010-07-30 09:53:56',25,15,'27','Nokia N900',1,''),(101,'2010-08-02 14:13:31',1,15,'1','dfdfdf',1,''),(102,'2010-08-02 14:23:54',1,15,'1','dfdfdf',3,''),(103,'2010-08-02 14:32:34',1,15,'1','Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(104,'2010-08-02 14:33:18',1,15,'2','Navy 4 Season Travel 2 Button Suit Jacket',2,'Changed quantity, date_added and last_modified.'),(105,'2010-08-02 14:33:34',1,15,'3','Grey Blue Tonal Split Stripe John Francomb Roma Fitted Button Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(106,'2010-08-02 14:34:03',1,15,'4','Blue Plain Luxury Twill Windsor Slim Fit Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(107,'2010-08-02 14:34:18',1,15,'5','White Plain 2-Fold Poplin John Francomb Milan Slim Fit Shirt',2,'Changed quantity, date_added and last_modified.'),(108,'2010-08-02 14:34:32',1,15,'6','Navy White Fine Stripe White Collar John Francomb Milan Slim Fit Shirt',2,'Changed quantity, date_added and last_modified.'),(109,'2010-08-02 14:34:47',1,15,'7','Black White Floral Print John Francomb Milan Slim Fit Shirt',2,'Changed quantity, date_added and last_modified.'),(110,'2010-08-02 14:35:01',1,15,'8','Blue Highlight Multi Stripe Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(111,'2010-08-02 14:35:26',1,15,'9','Black White Spaced Stripe Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(112,'2010-08-02 14:35:39',1,15,'10','Turquoise Floral Bunch Luxury Jacquard Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(113,'2010-08-02 14:35:56',1,15,'11','Blue Yellow Multi Stripe Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(114,'2010-08-02 14:36:13',1,15,'12','Pink Floral Bunch Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(115,'2010-08-02 14:36:28',1,15,'13','Lime Stripe Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(116,'2010-08-02 14:36:47',1,15,'14','Lime Graded Multi Stripe Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(117,'2010-08-02 14:37:01',1,15,'15','Pink Fine Bar Stripe Fitted Double Cuff Shirt',2,'Changed quantity, date_added and last_modified.'),(118,'2010-08-02 14:37:16',1,15,'16','Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed quantity, date_added and last_modified.'),(119,'2010-08-02 14:37:33',1,15,'17','Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)',2,'Changed quantity, date_added and last_modified.'),(120,'2010-08-02 14:37:50',1,15,'18','Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed quantity, date_added and last_modified.'),(121,'2010-08-02 14:38:03',1,15,'19','Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed quantity, date_added and last_modified.'),(122,'2010-08-02 14:38:21',1,15,'20','Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)',2,'Changed quantity, date_added and last_modified.'),(123,'2010-08-02 14:38:37',1,15,'21','PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)',2,'Changed quantity, date_added and last_modified.'),(124,'2010-08-02 14:38:54',1,15,'22','Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)',2,'Changed quantity, date_added and last_modified.'),(125,'2010-08-02 14:39:08',1,15,'23','Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)',2,'Changed quantity, date_added and last_modified.'),(126,'2010-08-02 14:39:22',1,15,'24','Nokia 5530 XpressMusic',2,'Changed quantity, date_added and last_modified.'),(127,'2010-08-02 14:39:48',1,15,'25','Nokia E5',2,'Changed quantity, date_added and last_modified.'),(128,'2010-08-02 14:40:03',1,15,'26','Nokia N85',2,'Changed quantity, date_added and last_modified.'),(129,'2010-08-02 14:40:16',1,15,'27','Nokia N900',2,'Changed quantity, date_added and last_modified.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(17,'account','account','account'),(11,'department','mall','department'),(12,'category','mall','category'),(20,'transaction','mall','transaction'),(14,'product group','store','productgroup'),(15,'product','store','product'),(16,'product detail','store','productdetail'),(18,'store','store','store'),(19,'store owner','store','storeowner'),(21,'ordered item','mall','ordereditem');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('e235221479ec081a7deac4fbbba9e7c6','gAJ9cQEuNTdjMTBlZmViZDc1Y2Y3YzYyM2U5ZTU3NTRhYjIyMDA=\n','2010-08-12 09:06:36'),('742d5046bcc017c7cf3550398a83b3b8','gAJ9cQEoWAIAAAAxMHECXXEDKEsIR0A5AAAAAAAAZVgCAAAAMTJxBF1xBShLBEdAOQAAAAAAAGVV\nDV9hdXRoX3VzZXJfaWRxBooBEVUSX2F1dGhfdXNlcl9iYWNrZW5kcQdVKWRqYW5nby5jb250cmli\nLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQhYAQAAADFdcQkoSwNHQDsAAAAAAABlWAEAAAAz\nXXEKKEsGR0A7AAAAAAAAZVgBAAAANV1xCyhLA0dAOwAAAAAAAGV1LmIwZDNjOGY0NjE2OWIwNzYy\nYmNjNzAxYWViMjUwN2Ex\n','2010-08-11 22:30:10'),('6df4c40264fb8f74cc833bebfd94f58a','gAJ9cQEoWAEAAAA5XXECKEsDR0A5AAAAAAAAZVgBAAAAOF1xAyhLAkdAOQAAAAAAAGVVEl9hdXRo\nX3VzZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2Vu\nZHEFVQ1fYXV0aF91c2VyX2lkcQaKARJ1LjdlN2I3YzEwNjcxZmMyN2FjNDhiZmFjOWY0Zjk4Nzg2\n','2010-08-12 10:17:37'),('a130893c1af23d8f9f987a42e8470054','gAJ9cQEoWAEAAAA4XXECKEsER0A5AAAAAAAAZVgBAAAAM11xAyhLA0dAOwAAAAAAAGVVEl9hdXRo\nX3VzZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2Vu\nZHEFVQ1fYXV0aF91c2VyX2lkcQaKARN1Ljk5ODU5ODZkYTU1ZjZjNTE5NDhhZGNiMjdiMTQzZTlm\n','2010-08-12 08:23:48'),('28191da21516b788385c518d868b5ac3','gAJ9cQEoWAEAAAAzXXECKEsCR0A7AAAAAAAAZVgCAAAAMTJxA11xBChLA0dAOQAAAAAAAGVVEl9h\ndXRoX3VzZXJfYmFja2VuZHEFVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFj\na2VuZHEGVQ1fYXV0aF91c2VyX2lkcQeKARR1LmJmZGMyZmI0ZDYyZjM4ZGQ5OThiM2I1MjJiMGRi\nMTM4\n','2010-08-12 09:51:20'),('7653aaa75ed03ac79af9184c7bd76b70','gAJ9cQEuZDQxNDg1ZDQyYTQwYjQxMTRmMjIxYzI2Y2M1N2M4MzM=\n','2010-08-17 13:57:22'),('1df853390006a86d3b1846b50dc86280','gAJ9cQEuZDQxNDg1ZDQyYTQwYjQxMTRmMjIxYzI2Y2M1N2M4MzM=\n','2010-08-16 17:39:17');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_category`
--

DROP TABLE IF EXISTS `mall_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `mall_category_2ae7390` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_category`
--

LOCK TABLES `mall_category` WRITE;
/*!40000 ALTER TABLE `mall_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_department`
--

DROP TABLE IF EXISTS `mall_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_department` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_department`
--

LOCK TABLES `mall_department` WRITE;
/*!40000 ALTER TABLE `mall_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `mall_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_ordereditem`
--

DROP TABLE IF EXISTS `mall_ordereditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_ordereditem` (
  `id` int(11) NOT NULL auto_increment,
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` decimal(20,2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `mall_ordereditem_transaction_id` (`transaction_id`),
  KEY `mall_ordereditem_user_id` (`user_id`),
  KEY `mall_ordereditem_product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_ordereditem`
--

LOCK TABLES `mall_ordereditem` WRITE;
/*!40000 ALTER TABLE `mall_ordereditem` DISABLE KEYS */;
INSERT INTO `mall_ordereditem` VALUES (1,1,31,21,2,'1020.00'),(2,1,31,18,3,'735.00'),(3,1,31,3,3,'81.00'),(4,1,31,9,2,'50.00');
/*!40000 ALTER TABLE `mall_ordereditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_transaction`
--

DROP TABLE IF EXISTS `mall_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_transaction` (
  `id` int(11) NOT NULL auto_increment,
  `transaction_id` varchar(20) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_transaction`
--

LOCK TABLES `mall_transaction` WRITE;
/*!40000 ALTER TABLE `mall_transaction` DISABLE KEYS */;
INSERT INTO `mall_transaction` VALUES (1,'20108313571617','1886.00',1);
/*!40000 ALTER TABLE `mall_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_product` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `product_group_id` int(11) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `large_image` varchar(100) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `store_product_product_group_id` (`product_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (1,'Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34441_mt.jpg','products/large/34441_n.jpg','27.00',5,'2010-08-02 14:32:27','2010-08-02 14:32:29'),(2,'Navy 4 Season Travel 2 Button Suit Jacket','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34215_mt.jpg','products/large/34215_n.jpg','239.00',10,'2010-08-02 14:32:50','2010-08-02 14:32:51'),(3,'Grey Blue Tonal Split Stripe John Francomb Roma Fitted Button Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34410_mt.jpg','products/large/34410_n.jpg','27.00',5,'2010-08-02 14:33:31','2010-08-02 14:33:33'),(4,'Blue Plain Luxury Twill Windsor Slim Fit Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/15859_t_1.jpg','products/large/15859_n_1.jpg','27.00',5,'2010-08-02 14:33:59','2010-08-02 14:34:00'),(5,'White Plain 2-Fold Poplin John Francomb Milan Slim Fit Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/26978_t.jpg','products/large/26978_n.jpg','27.00',5,'2010-08-02 14:34:14','2010-08-02 14:34:16'),(6,'Navy White Fine Stripe White Collar John Francomb Milan Slim Fit Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34400_t.jpg','products/large/34400_n.jpg','27.00',5,'2010-08-02 14:34:28','2010-08-02 14:34:30'),(7,'Black White Floral Print John Francomb Milan Slim Fit Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34402_t.jpg','products/large/34402_n.jpg','27.00',5,'2010-08-02 14:34:43','2010-08-02 14:34:45'),(8,'Blue Highlight Multi Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33966_t.jpg','products/large/15859_n_2.jpg','25.00',5,'2010-08-02 14:34:58','2010-08-02 14:35:00'),(9,'Black White Spaced Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33981_t.jpg','products/large/33981_n.jpg','25.00',5,'2010-08-02 14:35:16','2010-08-02 14:35:17'),(10,'Turquoise Floral Bunch Luxury Jacquard Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33986_t.jpg','products/large/33986_n.jpg','25.00',5,'2010-08-02 14:35:36','2010-08-02 14:35:38'),(11,'Blue Yellow Multi Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33951_t.jpg','products/large/33951_n.jpg','25.00',5,'2010-08-02 14:35:52','2010-08-02 14:35:54'),(12,'Pink Floral Bunch Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33944_t.jpg','products/large/33944_n.jpg','25.00',5,'2010-08-02 14:36:10','2010-08-02 14:36:12'),(13,'Lime Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33947_t.jpg','products/large/33947_n.jpg','25.00',5,'2010-08-02 14:36:25','2010-08-02 14:36:27'),(14,'Lime Graded Multi Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33948_t.jpg','products/large/33948_n.jpg','25.00',5,'2010-08-02 14:36:43','2010-08-02 14:36:45'),(15,'Pink Fine Bar Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/34175_t.jpg','products/large/34175_n.jpg','25.00',5,'2010-08-02 14:36:58','2010-08-02 14:36:59'),(16,'Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor',4,'products/thumbs/41LnP4kC5UL._SL160_AA160_.jpg','products/large/41LnP4kC5UL._SL500_AA300_.jpg','200.00',5,'2010-08-02 14:37:12','2010-08-02 14:37:14'),(17,'Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor.',4,'products/thumbs/41rpj8UX1ZL._SL160_AA160_.jpg','products/large/41rpj8UX1ZL._SL500_AA300_.jpg','250.00',5,'2010-08-02 14:37:29','2010-08-02 14:37:31'),(18,'Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)','',4,'products/thumbs/41Xm0Z6gOHL._SL160_AA160_.jpg','products/large/41Xm0Z6gOHL._SL500_AA300_.jpg','245.00',5,'2010-08-02 14:37:46','2010-08-02 14:37:48'),(19,'Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)','',4,'products/thumbs/413ezeSOr8L._SL160_AA160_.jpg','products/large/413ezeSOr8L._SL500_AA300_.jpg','280.00',5,'2010-08-02 14:38:00','2010-08-02 14:38:02'),(20,'Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,'products/thumbs/51VuLAPfcL._SL160_AA160_.jpg','products/large/51VuLAPfcL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','300.00',5,'2010-08-02 14:38:17','2010-08-02 14:38:18'),(21,'PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,'products/thumbs/51HZ9Y68N7L._SL160_AA160_.jpg','products/large/51HZ9Y68N7L._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','510.00',5,'2010-08-02 14:38:34','2010-08-02 14:38:36'),(22,'Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,'products/thumbs/51N7tMjcX3L._SL160_AA160_.jpg','products/large/51N7tMjcX3L._SL500_AA300_PIbundle-6TopRight00_AA300_SH20_.jpg','540.00',5,'2010-08-02 14:38:50','2010-08-02 14:38:52'),(23,'Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,'products/thumbs/51-eWIYiZXL._SL160_AA160_.jpg','products/large/51-eWIYiZXL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','600.00',5,'2010-08-02 14:39:05','2010-08-02 14:39:06'),(24,'Nokia 5530 XpressMusic','The Nokia 5530 XpressMusic is a thin music phone with an easy-to-use touch interface.',6,'products/thumbs/phone5.jpg','products/large/img2.jpg','55000.00',5,'2010-08-02 14:39:17','2010-08-02 14:39:19'),(25,'Nokia E5','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks.',6,'products/thumbs/phone1.jpg','products/large/img1.jpg','64650.00',5,'2010-08-02 14:39:33','2010-08-02 14:39:43'),(26,'Nokia N85','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks. ',6,'products/thumbs/phone3.jpg','products/large/img4.jpg','80500.00',5,'2010-08-02 14:39:59','2010-08-02 14:40:01'),(27,'Nokia N900','Experience the speed and raw power of the high-performance N900 mobile computer.',6,'products/thumbs/phone2.jpg','products/large/img3.jpg','90000.00',5,'2010-08-02 14:40:12','2010-08-02 14:40:14');
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_productdetail`
--

DROP TABLE IF EXISTS `store_productdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_productdetail` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `store_productdetail_44bdf3ee` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_productdetail`
--

LOCK TABLES `store_productdetail` WRITE;
/*!40000 ALTER TABLE `store_productdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_productdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_productgroup`
--

DROP TABLE IF EXISTS `store_productgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_productgroup` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `store_productgroup_47799232` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_productgroup`
--

LOCK TABLES `store_productgroup` WRITE;
/*!40000 ALTER TABLE `store_productgroup` DISABLE KEYS */;
INSERT INTO `store_productgroup` VALUES (1,'Men\'s','All men\'s shirts',1),(2,'Women\'s','All women\'s Shirts',1),(3,'Boy Toys','Toys for boys',2),(4,'Coffee','',3),(5,'Tea','',3),(6,'Nokia','',5);
/*!40000 ALTER TABLE `store_productgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_store`
--

DROP TABLE IF EXISTS `store_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_store` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `office_number` varchar(9) default NULL,
  `street_address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_store`
--

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (1,'Fashion Dealer','One-stop shop for all your fashion needs.',2,'fashiondealer','store/logos/fashion_dealer.jpg','012710003','2, Admiralty Way,','Lekki','Lagos'),(2,'Toy Shop','All toys!',3,'toyshop','store/logos/fashion_dealer_1.jpg','012710003','Sani Ade Way','Victoria Island','Lagos'),(3,'The Grocery Shop','All groceries at good prices!',24,'thegroceryshop','store/logos/grocery','','BIS road, Ikeja','Lagos','Lagos'),(4,'Chigo Electronics','',26,'chigoelectronics','store/logos/chigo.jpg','','BIS road, Ikeja','Lagos','Lagos'),(5,'Amaze Mobiles','',25,'amazemobiles','store/logos/mobiles.jpg','','BIS road, Ikeja','Lagos','Lagos');
/*!40000 ALTER TABLE `store_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_storeowner`
--

DROP TABLE IF EXISTS `store_storeowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_storeowner` (
  `id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `store_id` (`store_id`),
  UNIQUE KEY `mobile_number` (`mobile_number`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_storeowner`
--

LOCK TABLES `store_storeowner` WRITE;
/*!40000 ALTER TABLE `store_storeowner` DISABLE KEYS */;
INSERT INTO `store_storeowner` VALUES (1,1,'Male','08029299274');
/*!40000 ALTER TABLE `store_storeowner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-08-03 18:17:07
