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
-- Table structure for table `account_profile`
--

DROP TABLE IF EXISTS `account_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_profile` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `title` varchar(4) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `delivery_address` varchar(200) default NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_profile`
--

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
INSERT INTO `account_profile` VALUES (1,8,'Mr.','08029299274','9, Admiralty Way','9, Admiralty Way, Lekki, Lagos, Nigeria','Lekki','Lagos','Nigeria'),(2,9,'Mr.','08022244488','9, Admiralty Way,','100, Mushin Way, Oshodi, Lagos, Nigeria.','Lekki','Lagos','Nigeria'),(3,10,'Mr.','0702222222','9, Admiralty Way,','100, Victoria Island Way, Ikoyi','Lekki','Lagos','Nigeria'),(37,46,'Mr.','08029299274','9, Admiralty Way','Olukoyi Avenue, Off Awolowo road, Ikeja','Lekki','Lagos','Nigeria');
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,32),(2,1,33),(3,1,34),(4,1,35),(5,1,36),(6,1,38),(7,1,28),(8,1,29),(9,1,30),(10,1,31);
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add profile',8,'add_profile'),(23,'Can change profile',8,'change_profile'),(24,'Can delete profile',8,'delete_profile'),(25,'Can add store',9,'add_store'),(26,'Can change store',9,'change_store'),(27,'Can delete store',9,'delete_store'),(28,'Can add product group',10,'add_productgroup'),(29,'Can change product group',10,'change_productgroup'),(30,'Can delete product group',10,'delete_productgroup'),(31,'Can add product',11,'add_product'),(32,'Can change product',11,'change_product'),(33,'Can delete product',11,'delete_product'),(34,'Can add product detail',12,'add_productdetail'),(35,'Can change product detail',12,'change_productdetail'),(36,'Can delete product detail',12,'delete_productdetail'),(37,'Can add order',13,'add_order'),(38,'Can change order',13,'change_order'),(39,'Can delete order',13,'delete_order'),(40,'Can add ordered item',14,'add_ordereditem'),(41,'Can change ordered item',14,'change_ordereditem'),(42,'Can delete ordered item',14,'delete_ordereditem'),(43,'Can add department',15,'add_department'),(44,'Can change department',15,'change_department'),(45,'Can delete department',15,'delete_department'),(46,'Can add category',16,'add_category'),(47,'Can change category',16,'change_category'),(48,'Can delete category',16,'delete_category'),(49,'Can add site',17,'add_site'),(50,'Can change site',17,'change_site'),(51,'Can delete site',17,'delete_site');
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'dayo@aerixnigeria.com','','','dayo@aerixnigeria.com','sha1$7cf44$abfcdf6ac0165d42226934295d2a19f1abe2cbab',1,1,1,'2010-09-28 09:16:56','2010-09-20 19:12:10'),(9,'segun@ade.co.uk','Segun','Ade','segun@ade.co.uk','sha1$8af64$ce332546917d7900b79ac54dfbbea68ccba50911',0,1,0,'2010-08-13 17:12:47','2010-08-13 17:12:47'),(3,'olu@olu.com','Olusegun','Obasanjo','olu@olu.com','sha1$2aad6$8534ba88d6e21aaedc6632ca08cb01ded5033c00',1,1,0,'2010-09-16 14:24:50','2010-08-06 09:32:14'),(10,'ade@olu.com','Ade','Olu','ade@olu.com','sha1$d9770$3f9dae1fe56c0794358dfe907bde04d6991e7d2e',0,1,0,'2010-08-13 17:30:40','2010-08-13 17:30:40'),(5,'seyi@seyi.com','Oluseyi','Adegoju','seyi@seyi.com','sha1$a2c5b$d48e941189e82eb111896cbf27725d19eab37cfc',1,1,0,'2010-09-16 14:07:58','2010-08-06 09:36:45'),(8,'deji@alade.com','Dayo','Ade','deji@alade.com','sha1$b5ed4$a8cdb3b47672ebf35299e0a4246295c8d953cf9c',0,1,0,'2010-09-27 12:11:54','2010-08-12 18:13:50'),(11,'ayo@ayo.com','Ayo','Ade','ayo@ayo.com','sha1$6d76b$0fa36c078d868ac0e70656cf27422d07a613ee53',1,1,0,'2010-09-21 11:13:48','2010-09-21 11:13:48'),(46,'oosikoya@pay4me.com','Oladayo','Osikoya','oosikoya@pay4me.com','sha1$834fe$e066e2af98ef4a4bc123b05aa24056abc4d552eb',0,1,0,'2010-09-24 19:01:43','2010-09-24 07:33:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,11,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2010-09-21 11:13:48',1,3,'11','ayo@ayo.com',1,''),(2,'2010-09-21 11:16:23',1,2,'1','Merchant',1,''),(3,'2010-09-21 11:17:06',1,3,'11','ayo@ayo.com',2,'Changed first_name, last_name, email, is_staff and groups.'),(4,'2010-09-21 11:19:19',1,9,'3','njvhgh',1,''),(5,'2010-09-21 11:26:15',1,9,'3','njvhgh',2,'Changed logo.'),(6,'2010-09-22 09:06:31',1,9,'3','njvhgh',2,'Changed logo.'),(7,'2010-09-22 09:07:48',1,9,'3','njvhgh',2,'Changed logo.'),(8,'2010-09-22 09:22:51',1,9,'3','njvhgh',2,'Changed logo.'),(9,'2010-09-22 09:56:05',1,9,'3','njvhgh',3,''),(10,'2010-09-22 09:58:11',1,9,'4','dfhafh',1,''),(11,'2010-09-22 09:58:48',1,9,'4','dfhafh',3,''),(12,'2010-09-23 10:01:40',1,3,'44','shegs@yahoo.com',1,''),(13,'2010-09-23 10:01:55',1,3,'44','shegs@yahoo.com',2,'No fields changed.'),(14,'2010-09-24 12:26:35',1,3,'1','dayo@aerixnigeria.com',2,'Changed username and email.'),(15,'2010-09-24 12:37:35',1,3,'46','vnweke@pay4me.com',2,'Changed username, first_name, last_name and email.'),(16,'2010-09-24 12:38:01',1,11,'27','Nokia N900',2,'Changed quantity.'),(17,'2010-09-24 12:38:07',1,11,'26','Nokia N85',2,'Changed quantity.'),(18,'2010-09-24 12:38:12',1,11,'25','Nokia E5',2,'Changed quantity.'),(19,'2010-09-24 12:38:18',1,11,'24','Nokia 5530 XpressMusic',2,'Changed quantity.'),(20,'2010-09-24 12:38:25',1,11,'23','Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)',2,'Changed quantity.'),(21,'2010-09-24 12:38:45',1,11,'22','Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)',2,'Changed quantity.'),(22,'2010-09-24 12:38:52',1,11,'21','PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)',2,'Changed quantity.'),(23,'2010-09-24 12:39:03',1,11,'20','Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)',2,'Changed quantity.'),(24,'2010-09-24 12:39:10',1,11,'19','Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed quantity.'),(25,'2010-09-24 12:39:16',1,11,'18','Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed quantity.'),(26,'2010-09-24 12:39:22',1,11,'17','Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)',2,'Changed quantity.'),(27,'2010-09-24 12:39:28',1,11,'16','Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)',2,'Changed quantity.'),(28,'2010-09-24 12:39:56',1,3,'46','oosikoya@pay4me.com',2,'Changed username, first_name, last_name and email.');
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'profile','account','profile'),(9,'store','store','store'),(10,'product group','store','productgroup'),(11,'product','store','product'),(12,'product detail','store','productdetail'),(13,'order','store','order'),(14,'ordered item','store','ordereditem'),(15,'department','mall','department'),(16,'category','mall','category'),(17,'site','sites','site');
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
INSERT INTO `django_session` VALUES ('3c5d60bc1b6bb41e5664b920775af56c','gAJ9cQEoWAIAAAAxOXECXXEDKEtIR0BxgAAAAAAAZVUNX2F1dGhfdXNlcl9pZHEEigEBVRJfYXV0\naF91c2VyX2JhY2tlbmRxBVUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tl\nbmRxBlgCAAAAMTZxB11xCChLA0dAaQAAAAAAAGV1LjY4YjI1NmE2OTZjYzhmOTgyMTYxOGExZDYw\nYTc4NWY0\n','2010-10-05 08:40:26'),('3badef00db76bdb1d921ddeb45b8f6aa','gAJ9cQEuZDQxNDg1ZDQyYTQwYjQxMTRmMjIxYzI2Y2M1N2M4MzM=\n','2010-10-11 12:13:14'),('08d4a4200f5dfe917245dbdadbfe65ea','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5iNTZkMWU5ZmE0MmI5ZmVkMGUz\nNjgxNTM3YTZjZjU1OQ==\n','2010-10-12 09:16:56');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_category`
--

LOCK TABLES `mall_category` WRITE;
/*!40000 ALTER TABLE `mall_category` DISABLE KEYS */;
INSERT INTO `mall_category` VALUES (1,'Mobile Phones','',2),(2,'Groceries','',1),(3,'Laptops & Netbooks','',3),(4,'Desktops & Servers','',3),(5,'Computer Components','',3),(6,'TV & Video','',2),(7,'Home Appliances','',2),(8,'Exercise & Fitness','',4),(9,'Outdoor Recreation','',4),(10,'Automotive Parts & Accessories','',5),(11,'Wheels & Tires','',5),(12,'Furniture & Decor','',1);
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
  `slug` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_department`
--

LOCK TABLES `mall_department` WRITE;
/*!40000 ALTER TABLE `mall_department` DISABLE KEYS */;
INSERT INTO `mall_department` VALUES (1,'Household Goods','','household-goods'),(2,'Electronics','','electronics'),(3,'Computers & Office','','computers-office'),(4,'Sports & Outdoors','','sports-outdoors'),(5,'Automotive & Industrial','','automotive-industrial'),(9,'Cars','','cars');
/*!40000 ALTER TABLE `mall_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_order` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` varchar(20) NOT NULL,
  `store_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `date_paid` datetime default NULL,
  `validation_number` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `store_order_47799232` (`store_id`),
  KEY `store_order_e99ab0` (`buyer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES (1,'201092712138403',1,8,'145150.00',0,'2010-09-27 12:13:08','2010-08-11 15:32:39','7366679184'),(2,'201092712138403',2,8,'1380.00',0,'2010-09-27 12:13:08','2010-08-11 15:32:39','7366679184');
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_ordereditem`
--

DROP TABLE IF EXISTS `store_ordereditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_ordereditem` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` decimal(20,2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `store_ordereditem_7cc8fcf5` (`order_id`),
  KEY `store_ordereditem_44bdf3ee` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_ordereditem`
--

LOCK TABLES `store_ordereditem` WRITE;
/*!40000 ALTER TABLE `store_ordereditem` DISABLE KEYS */;
INSERT INTO `store_ordereditem` VALUES (1,1,25,1,'64650.00'),(2,1,26,1,'80500.00'),(3,2,20,1,'300.00'),(4,2,22,2,'1080.00');
/*!40000 ALTER TABLE `store_ordereditem` ENABLE KEYS */;
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
  `category_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `store_product_67dad9bc` (`product_group_id`),
  KEY `store_product_42dc49bc` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (16,'Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor',4,2,'products/41LnP4kC5UL._SL500_AA300_.jpg','200.00',10,'2010-08-02 14:37:12','2010-08-02 14:37:14'),(17,'Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor.',4,2,'products/41rpj8UX1ZL._SL500_AA300_.jpg','250.00',10,'2010-08-02 14:37:29','2010-08-02 14:37:31'),(18,'Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)','',4,2,'products/41Xm0Z6gOHL._SL500_AA300_.jpg','245.00',10,'2010-08-02 14:37:46','2010-08-02 14:37:48'),(19,'Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)','',4,2,'products/413ezeSOr8L._SL500_AA300_.jpg','280.00',10,'2010-08-02 14:38:00','2010-08-02 14:38:02'),(20,'Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,2,'products/51VuLAPfcL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','300.00',9,'2010-08-02 14:38:17','2010-08-02 14:38:18'),(21,'PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,2,'products/51HZ9Y68N7L._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','510.00',8,'2010-08-02 14:38:34','2010-08-02 14:38:36'),(22,'Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,2,'products/51N7tMjcX3L._SL500_AA300_PIbundle-6TopRight00_AA300_SH20_.jpg','540.00',5,'2010-08-02 14:38:50','2010-08-02 14:38:52'),(23,'Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,2,'products/51-eWIYiZXL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','600.00',4,'2010-08-02 14:39:05','2010-08-02 14:39:06'),(24,'Nokia 5530 XpressMusic','The Nokia 5530 XpressMusic is a thin music phone with an easy-to-use touch interface.',6,1,'products/img2.jpg','55000.00',10,'2010-08-02 14:39:17','2010-08-02 14:39:19'),(25,'Nokia E5','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks.',6,1,'products/img1.jpg','64650.00',8,'2010-08-02 14:39:33','2010-08-02 14:39:43'),(26,'Nokia N85','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks. ',6,1,'products/img4.jpg','80500.00',5,'2010-08-02 14:39:59','2010-08-02 14:40:01'),(27,'Nokia N900','Experience the speed and raw power of the high-performance N900 mobile computer.',6,1,'products/img3.jpg','90000.00',8,'2010-08-02 14:40:12','2010-08-02 14:40:14');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_productgroup`
--

LOCK TABLES `store_productgroup` WRITE;
/*!40000 ALTER TABLE `store_productgroup` DISABLE KEYS */;
INSERT INTO `store_productgroup` VALUES (4,'Coffee','',2),(5,'Tea','',2),(6,'Nokia','',1),(19,'Toiletries','',2);
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
  `owner_id` int(11) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `office_number` varchar(9) default NULL,
  `street_address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `owner_id` (`owner_id`),
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_store`
--

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (1,'Amaze Mobiles','',3,'amazemobiles','store/logos/amazeLogo.jpg','store/banners/amazeBanner.jpg','012710003','93, Falomo road','Ikoyi','Lagos'),(2,'The Grocery Shop','',5,'thegroceryshop','store/logos/groceryLogo.jpg','store/banners/groceryBanner.jpg','012710003','93, Falomo road','Ikoyi','Lagos');
/*!40000 ALTER TABLE `store_store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-28  9:21:34
