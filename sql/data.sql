use pay4memall;
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(52,'Can add store',18,'add_store'),(51,'Can delete account',17,'delete_account'),(49,'Can add account',17,'add_account'),(50,'Can change account',17,'change_account'),(53,'Can change store',18,'change_store'),(31,'Can add department',11,'add_department'),(32,'Can change department',11,'change_department'),(33,'Can delete department',11,'delete_department'),(34,'Can add category',12,'add_category'),(35,'Can change category',12,'change_category'),(36,'Can delete category',12,'delete_category'),(40,'Can add product group',14,'add_productgroup'),(41,'Can change product group',14,'change_productgroup'),(42,'Can delete product group',14,'delete_productgroup'),(43,'Can add product',15,'add_product'),(44,'Can change product',15,'change_product'),(45,'Can delete product',15,'delete_product'),(46,'Can add product detail',16,'add_productdetail'),(47,'Can change product detail',16,'change_productdetail'),(48,'Can delete product detail',16,'delete_productdetail'),(54,'Can delete store',18,'delete_store'),(55,'Can add store owner',19,'add_storeowner'),(56,'Can change store owner',19,'change_storeowner'),(57,'Can delete store owner',19,'delete_storeowner');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'zedd','','','alwaysdeone@gmail.com','sha1$196ce$00f495c46f0d7352f58d59c8a1007f72dd37d9ce',1,1,1,'2010-07-22 02:06:26','2010-07-16 11:30:38'),(2,'fashiondealer@pay4memall.com','Olusegun','Obasanjo','segun@gov.ng','sha1$31adb$8212349a1d6642a299a91c5461833602e52982d0',1,1,0,'2010-07-21 04:14:27','2010-07-20 00:33:34'),(3,'toyshop@pay4memall.com','Namadi','Sambo','alwaysdeone@gmail.com','sha1$aab8c$136867083cc008f8d786dfd114a86853973cb1d8',1,1,0,'2010-07-22 02:13:24','2010-07-22 02:07:04');
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (4,2,1),(5,3,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2010-07-19 03:59:15',1,11,'1','Books',1,''),(2,'2010-07-19 03:59:29',1,11,'2','Movies, Music & Games',1,''),(3,'2010-07-19 04:00:22',1,12,'1','Textbooks',1,''),(4,'2010-07-19 04:00:33',1,12,'2','Novels',1,''),(5,'2010-07-19 04:00:46',1,12,'3','Magazines',1,''),(6,'2010-07-19 04:01:03',1,12,'4','Movies & TV',1,''),(7,'2010-07-19 04:01:12',1,12,'5','Video Games',1,''),(8,'2010-07-19 04:01:25',1,12,'6','Musical Instruments',1,''),(10,'2010-07-20 00:33:34',1,3,'2','shop@pay4memall.com',1,''),(11,'2010-07-20 00:37:23',1,2,'1','Merchant',1,''),(12,'2010-07-20 00:37:34',1,3,'2','shop@pay4memall.com',2,'Changed first_name, last_name, email and groups.'),(13,'2010-07-20 00:39:39',1,3,'2','shop@pay4memall.com',2,'Changed is_staff.'),(26,'2010-07-20 11:18:17',2,14,'2','Women\'s Shirts',1,''),(16,'2010-07-20 00:54:53',1,17,'1','Account object',1,''),(25,'2010-07-20 11:15:11',2,14,'1','Men\'s Shirts',1,''),(18,'2010-07-20 01:01:27',1,3,'2','game@pay4memall.com',2,'Changed username.'),(19,'2010-07-20 02:02:28',2,14,'1','Laptops',1,''),(20,'2010-07-20 02:02:50',2,14,'2','Televisions',1,''),(24,'2010-07-20 11:12:05',1,18,'1','Fashion Dealer',1,''),(22,'2010-07-20 08:41:08',1,2,'1','Merchant',2,'Changed permissions.'),(23,'2010-07-20 08:42:24',1,3,'2','fashiondealer@pay4memall.com',2,'Changed username.'),(27,'2010-07-21 03:49:37',2,15,'1','Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt',1,''),(28,'2010-07-21 03:52:11',2,15,'2','Navy 4 Season Travel 2 Button Suit Jacket',1,''),(29,'2010-07-21 03:54:07',2,15,'3','Grey Blue Tonal Split Stripe John Francomb Roma Fitted Button Cuff Shirt',1,''),(30,'2010-07-21 03:55:39',2,15,'4','Blue Plain Luxury Twill Windsor Slim Fit Double Cuff Shirt',1,''),(31,'2010-07-21 03:57:36',2,15,'5','White Plain 2-Fold Poplin John Francomb Milan Slim Fit Shirt',1,''),(32,'2010-07-21 03:58:46',2,15,'6','Navy White Fine Stripe White Collar John Francomb Milan Slim Fit Shirt',1,''),(33,'2010-07-21 03:59:55',2,15,'7','Black White Floral Print John Francomb Milan Slim Fit Shirt',1,''),(34,'2010-07-21 04:00:43',2,14,'1','Men\'s',2,'Changed name.'),(35,'2010-07-21 04:00:50',2,14,'2','Women\'s',2,'Changed name.'),(36,'2010-07-21 04:04:01',2,15,'8','Blue Highlight Multi Stripe Fitted Double Cuff Shirt',1,''),(37,'2010-07-21 04:04:56',2,15,'9','Black White Spaced Stripe Fitted Double Cuff Shirt',1,''),(38,'2010-07-21 04:06:09',2,15,'10','Turquoise Floral Bunch Luxury Jacquard Fitted Double Cuff Shirt',1,''),(39,'2010-07-21 04:07:06',2,15,'11','Blue Yellow Multi Stripe Fitted Double Cuff Shirt',1,''),(40,'2010-07-21 04:08:07',2,15,'12','Pink Floral Bunch Fitted Double Cuff Shirt',1,''),(41,'2010-07-21 04:09:39',2,15,'13','Lime Stripe Fitted Double Cuff Shirt',1,''),(42,'2010-07-21 04:10:56',2,15,'14','Lime Graded Multi Stripe Fitted Double Cuff Shirt',1,''),(43,'2010-07-21 04:11:56',2,15,'15','Pink Fine Bar Stripe Fitted Double Cuff Shirt',1,''),(44,'2010-07-21 09:36:16',2,15,'1','Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt',2,'Changed thumbnail and large_image.'),(45,'2010-07-22 02:07:04',1,3,'3','toyshop@pay4memall.com',1,''),(46,'2010-07-22 02:07:58',1,3,'3','toyshop@pay4memall.com',2,'Changed first_name, last_name, email, is_staff and groups.'),(47,'2010-07-22 02:10:54',1,18,'2','Toy Shop',1,''),(48,'2010-07-22 02:16:03',3,14,'3','Boy Toys',1,'');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(17,'account','account','account'),(11,'department','mall','department'),(12,'category','mall','category'),(14,'product group','store','productgroup'),(15,'product','store','product'),(16,'product detail','store','productdetail'),(18,'store','store','store'),(19,'store owner','store','storeowner');
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
INSERT INTO `django_session` VALUES ('582f67dacfe8842d97a7dd3ee4f86b3c','gAJ9cQFYAQAAADRdcQIoigEBSzlHQDsAAAAAAABlcy40ZjRkYzFlMzUwZjU5NTZhY2E3MmZjZmU3\nMDRjMzg2Zg==\n','2010-08-06 10:59:33');
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
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `store_product_67dad9bc` (`product_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (1,'Blue End On End Spaced Stripe White Collar St. James Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34441_mt.jpg','products/large/34441_n.jpg','27.00'),(2,'Navy 4 Season Travel 2 Button Suit Jacket','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34215_mt.jpg','products/large/34215_n.jpg','239.00'),(3,'Grey Blue Tonal Split Stripe John Francomb Roma Fitted Button Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34410_mt.jpg','products/large/34410_n.jpg','27.00'),(4,'Blue Plain Luxury Twill Windsor Slim Fit Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/15859_t_1.jpg','products/large/15859_n_1.jpg','27.00'),(5,'White Plain 2-Fold Poplin John Francomb Milan Slim Fit Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/26978_t.jpg','products/large/26978_n.jpg','27.00'),(6,'Navy White Fine Stripe White Collar John Francomb Milan Slim Fit Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34400_t.jpg','products/large/34400_n.jpg','27.00'),(7,'Black White Floral Print John Francomb Milan Slim Fit Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',1,'products/thumbs/34402_t.jpg','products/large/34402_n.jpg','27.00'),(8,'Blue Highlight Multi Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33966_t.jpg','products/large/15859_n_2.jpg','25.00'),(9,'Black White Spaced Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33981_t.jpg','products/large/33981_n.jpg','25.00'),(10,'Turquoise Floral Bunch Luxury Jacquard Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33986_t.jpg','products/large/33986_n.jpg','25.00'),(11,'Blue Yellow Multi Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33951_t.jpg','products/large/33951_n.jpg','25.00'),(12,'Pink Floral Bunch Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33944_t.jpg','products/large/33944_n.jpg','25.00'),(13,'Lime Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33947_t.jpg','products/large/33947_n.jpg','25.00'),(14,'Lime Graded Multi Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/33948_t.jpg','products/large/33948_n.jpg','25.00'),(15,'Pink Fine Bar Stripe Fitted Double Cuff Shirt','The St. James Collar is a contemporary take on the classic cutaway collar. It has a full cutaway collar which gives a sharp look. Cut on a slim fit body with back darts and a Double Cuff. For the man that wants the sharper look!',2,'products/thumbs/34175_t.jpg','products/large/34175_n.jpg','25.00');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_productgroup`
--

LOCK TABLES `store_productgroup` WRITE;
/*!40000 ALTER TABLE `store_productgroup` DISABLE KEYS */;
INSERT INTO `store_productgroup` VALUES (1,'Men\'s','All men\'s shirts',1),(2,'Women\'s','All women\'s Shirts',1),(3,'Boy Toys','Toys for boys',2);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_store`
--

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (1,'Fashion Dealer','One-stop shop for all your fashion needs.',2,'fashiondealer','store/logos/fashion_dealer.jpg','012710003','2, Admiralty Way,','Lekki','Lagos'),(2,'Toy Shop','All toys!',3,'toyshop','store/logos/fashion_dealer_1.jpg','012710003','Sani Ade Way','Victoria Island','Lagos');
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

-- Dump completed on 2010-07-26 10:57:54
