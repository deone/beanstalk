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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_profile`
--

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
INSERT INTO `account_profile` VALUES (1,8,'Mr.','08029299274','9, Admiralty Way','9, Admiralty Way, Lekki, Lagos, Nigeria','Lekki','Lagos','Nigeria'),(2,9,'Mr.','08022244488','9, Admiralty Way,','100, Mushin Way, Oshodi, Lagos, Nigeria.','Lekki','Lagos','Nigeria'),(3,10,'Mr.','0702222222','9, Admiralty Way,','100, Victoria Island Way, Ikoyi','Lekki','Lagos','Nigeria');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Merchant');
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
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (102,2,31),(101,2,59),(100,2,39),(99,2,38),(98,2,37),(97,2,36),(96,2,35),(95,2,34),(94,2,33),(93,2,32);
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
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
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add profile',8,'add_profile'),(23,'Can change profile',8,'change_profile'),(24,'Can delete profile',8,'delete_profile'),(25,'Can add store',9,'add_store'),(26,'Can change store',9,'change_store'),(27,'Can delete store',9,'delete_store'),(62,'Can change note',21,'change_note'),(63,'Can delete note',21,'delete_note'),(31,'Can add product group',11,'add_productgroup'),(32,'Can change product group',11,'change_productgroup'),(33,'Can delete product group',11,'delete_productgroup'),(34,'Can add product',12,'add_product'),(35,'Can change product',12,'change_product'),(36,'Can delete product',12,'delete_product'),(37,'Can add product detail',13,'add_productdetail'),(38,'Can change product detail',13,'change_productdetail'),(39,'Can delete product detail',13,'delete_productdetail'),(40,'Can add department',14,'add_department'),(41,'Can change department',14,'change_department'),(42,'Can delete department',14,'delete_department'),(43,'Can add category',15,'add_category'),(44,'Can change category',15,'change_category'),(45,'Can delete category',15,'delete_category'),(46,'Can add transaction',16,'add_transaction'),(47,'Can change transaction',16,'change_transaction'),(48,'Can delete transaction',16,'delete_transaction'),(49,'Can add ordered item',17,'add_ordereditem'),(50,'Can change ordered item',17,'change_ordereditem'),(51,'Can delete ordered item',17,'delete_ordereditem'),(61,'Can add note',21,'add_note'),(55,'Can add ordered item',19,'add_ordereditem'),(56,'Can change ordered item',19,'change_ordereditem'),(57,'Can delete ordered item',19,'delete_ordereditem'),(58,'Can add order',20,'add_order'),(59,'Can change order',20,'change_order'),(60,'Can delete order',20,'delete_order');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'alwaysdeone@gmail.com','Oladayo','Osikoya','alwaysdeone@gmail.com','sha1$46282$94acc0d85cde3d2924651965dfc5e13847e44a87',1,1,1,'2010-08-24 09:28:40','2010-08-05 17:06:54'),(9,'segun@ade.co.uk','Segun','Ade','segun@ade.co.uk','sha1$8af64$ce332546917d7900b79ac54dfbbea68ccba50911',0,1,0,'2010-08-13 17:12:47','2010-08-13 17:12:47'),(3,'olu@olu.com','Olusegun','Obasanjo','olu@olu.com','sha1$2aad6$8534ba88d6e21aaedc6632ca08cb01ded5033c00',1,1,0,'2010-08-23 18:33:53','2010-08-06 09:32:14'),(10,'ade@olu.com','Ade','Olu','ade@olu.com','sha1$d9770$3f9dae1fe56c0794358dfe907bde04d6991e7d2e',0,1,0,'2010-08-13 17:30:40','2010-08-13 17:30:40'),(5,'seyi@seyi.com','Oluseyi','Adegoju','seyi@seyi.com','sha1$a2c5b$d48e941189e82eb111896cbf27725d19eab37cfc',1,1,0,'2010-08-16 16:07:11','2010-08-06 09:36:45'),(8,'deji@alade.com','Dayo','Ade','deji@alade.com','sha1$b5ed4$a8cdb3b47672ebf35299e0a4246295c8d953cf9c',0,1,0,'2010-08-23 15:52:28','2010-08-12 18:13:50');
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
INSERT INTO `auth_user_groups` VALUES (5,5,2),(4,3,2);
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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2010-08-05 17:19:32',1,3,'1','alwaysdeone@gmail.com',2,'Changed username, first_name and last_name.'),(2,'2010-08-06 09:26:37',1,2,'1','Merchant',1,''),(3,'2010-08-06 09:32:14',1,3,'3','olu@olu.com',1,''),(4,'2010-08-06 09:33:03',1,3,'3','olu@olu.com',2,'Changed first_name, last_name, email, is_staff and groups.'),(5,'2010-08-06 09:35:34',1,3,'4','ade@ade.com',1,''),(6,'2010-08-06 09:35:58',1,3,'4','ade@ade.com',2,'Changed first_name, last_name, email, is_staff and groups.'),(7,'2010-08-06 09:36:45',1,3,'5','seyi@seyi.com',1,''),(8,'2010-08-06 09:37:11',1,3,'5','seyi@seyi.com',2,'Changed first_name, last_name, email, is_staff and groups.'),(9,'2010-08-06 09:48:38',1,9,'2','Fashion Dealer',1,''),(10,'2010-08-06 09:50:40',1,11,'1','Men\'s',1,''),(11,'2010-08-06 09:50:47',1,11,'2','Women\'s',1,''),(12,'2010-08-06 10:19:48',1,11,'2','Women\'s',3,''),(13,'2010-08-06 10:19:48',1,11,'1','Men\'s',3,''),(14,'2010-08-06 10:22:06',1,11,'1','Men\'s',1,''),(15,'2010-08-06 10:22:52',1,11,'2','Women\'s',1,''),(16,'2010-08-06 10:23:28',1,11,'3','Boy Toys',1,''),(17,'2010-08-06 10:23:46',1,11,'4','Coffee',1,''),(18,'2010-08-06 10:23:55',1,11,'5','Tea',1,''),(19,'2010-08-06 10:24:09',1,11,'6','Nokia',1,''),(20,'2010-08-06 10:33:09',1,11,'3','Boy Toys',3,''),(21,'2010-08-06 10:40:52',1,3,'2','alade@yahoo.com',2,'Changed is_staff.'),(22,'2010-08-06 10:41:22',1,9,'1','Fashion Dealer',3,''),(23,'2010-08-06 11:55:16',1,3,'2','alade@yahoo.com',3,''),(24,'2010-08-06 12:44:47',1,9,'3','Chigo Electronics',3,''),(25,'2010-08-06 12:45:24',1,3,'4','ade@ade.com',3,''),(26,'2010-08-06 12:50:27',1,2,'1','Merchant',3,''),(27,'2010-08-06 12:56:08',1,2,'2','Merchant',1,''),(28,'2010-08-06 12:56:22',1,3,'3','olu@olu.com',2,'Changed groups.'),(29,'2010-08-06 12:56:31',1,3,'5','seyi@seyi.com',2,'Changed groups.'),(30,'2010-08-09 08:49:38',1,2,'2','Merchant',2,'Changed permissions.'),(31,'2010-08-10 14:42:02',1,9,'1','Amaze Mobiles',1,''),(32,'2010-08-10 14:42:56',1,9,'2','The Grocery Shop',1,''),(33,'2010-08-10 14:43:14',1,11,'6','Nokia',2,'Changed store.'),(34,'2010-08-10 14:43:20',1,11,'5','Tea',2,'No fields changed.'),(35,'2010-08-10 14:43:24',1,11,'4','Coffee',2,'No fields changed.'),(36,'2010-08-13 16:23:22',1,2,'2','Merchant',2,'Changed permissions.'),(37,'2010-08-13 16:30:09',1,2,'2','Merchant',2,'Changed permissions.'),(38,'2010-08-13 16:31:25',1,2,'2','Merchant',2,'Changed permissions.'),(39,'2010-08-13 16:33:05',1,2,'2','Merchant',2,'Changed permissions.'),(40,'2010-08-13 16:39:03',1,2,'2','Merchant',2,'Changed permissions.'),(41,'2010-08-16 16:06:53',1,2,'2','Merchant',2,'Changed permissions.'),(42,'2010-08-18 12:14:43',1,21,'1','The Lame Man\'s story',1,''),(43,'2010-08-20 09:45:18',1,2,'2','Merchant',2,'Changed permissions.'),(44,'2010-08-23 11:53:49',1,14,'1','Household Goods',1,''),(45,'2010-08-23 11:54:10',1,14,'2','Gadgets',1,''),(46,'2010-08-24 09:29:20',1,15,'1','Mobile Phones',1,''),(47,'2010-08-24 09:30:04',1,15,'2','Groceries',1,'');
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
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'profile','account','profile'),(9,'store','store','store'),(21,'note','myapp','note'),(11,'product group','store','productgroup'),(12,'product','store','product'),(13,'product detail','store','productdetail'),(14,'department','mall','department'),(15,'category','mall','category'),(20,'order','order','order'),(19,'ordered item','order','ordereditem');
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
INSERT INTO `django_session` VALUES ('8deff680023854e0e2d3c211259a8765','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS5iYzk4YTI3ODBhN2Y1YmQ3NjI5\nMWU3OGVmZjU5ZjMxNg==\n','2010-08-27 17:33:41'),('d4828fc242fbb1d489b21b3bb8aa19f0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5iNTZkMWU5ZmE0MmI5ZmVkMGUz\nNjgxNTM3YTZjZjU1OQ==\n','2010-09-07 09:28:40');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_category`
--

LOCK TABLES `mall_category` WRITE;
/*!40000 ALTER TABLE `mall_category` DISABLE KEYS */;
INSERT INTO `mall_category` VALUES (1,'Mobile Phones','',2),(2,'Groceries','',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_department`
--

LOCK TABLES `mall_department` WRITE;
/*!40000 ALTER TABLE `mall_department` DISABLE KEYS */;
INSERT INTO `mall_department` VALUES (1,'Household Goods',''),(2,'Gadgets','');
/*!40000 ALTER TABLE `mall_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_note`
--

DROP TABLE IF EXISTS `myapp_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_note` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `pub_date` datetime NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `myapp_note_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_note`
--

LOCK TABLES `myapp_note` WRITE;
/*!40000 ALTER TABLE `myapp_note` DISABLE KEYS */;
INSERT INTO `myapp_note` VALUES (1,3,'2010-08-18 12:14:15','The Lame Man\'s story','Story, story, Once upon a time.');
/*!40000 ALTER TABLE `myapp_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `date_paid` datetime default NULL,
  `validation_number` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `order_order_47799232` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,1,'201081115321227','260500.00',0,'2010-08-17 12:36:38','2010-08-11 15:32:39','7366679184'),(2,2,'201081115321227','2530.00',0,'2010-08-17 12:36:38','2010-08-11 15:32:39','7366679184'),(3,2,'20108188175927','1080.00',1,'2010-08-18 08:17:59',NULL,NULL),(4,2,'201081881854571','600.00',1,'2010-08-18 08:18:54',NULL,NULL),(5,2,'2010823183320553','1020.00',1,'2010-08-23 18:33:21',NULL,NULL);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordereditem`
--

DROP TABLE IF EXISTS `order_ordereditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ordereditem` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` decimal(20,2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `order_ordereditem_7cc8fcf5` (`order_id`),
  KEY `order_ordereditem_e99ab0` (`buyer_id`),
  KEY `order_ordereditem_44bdf3ee` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordereditem`
--

LOCK TABLES `order_ordereditem` WRITE;
/*!40000 ALTER TABLE `order_ordereditem` DISABLE KEYS */;
INSERT INTO `order_ordereditem` VALUES (1,1,8,26,1,'80500.00'),(2,1,8,27,2,'180000.00'),(3,2,8,17,4,'1000.00'),(4,2,8,21,3,'1530.00'),(11,5,8,21,2,'1020.00'),(10,4,8,16,3,'600.00'),(9,3,8,22,2,'1080.00');
/*!40000 ALTER TABLE `order_ordereditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (16,'Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor',4,2,'products/thumbs/41LnP4kC5UL._SL160_AA160_.jpg','products/large/41LnP4kC5UL._SL500_AA300_.jpg','200.00',5,'2010-08-02 14:37:12','2010-08-02 14:37:14'),(17,'Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor.',4,2,'products/thumbs/41rpj8UX1ZL._SL160_AA160_.jpg','products/large/41rpj8UX1ZL._SL500_AA300_.jpg','250.00',5,'2010-08-02 14:37:29','2010-08-02 14:37:31'),(18,'Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)','',4,2,'products/thumbs/41Xm0Z6gOHL._SL160_AA160_.jpg','products/large/41Xm0Z6gOHL._SL500_AA300_.jpg','245.00',5,'2010-08-02 14:37:46','2010-08-02 14:37:48'),(19,'Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)','',4,2,'products/thumbs/413ezeSOr8L._SL160_AA160_.jpg','products/large/413ezeSOr8L._SL500_AA300_.jpg','280.00',5,'2010-08-02 14:38:00','2010-08-02 14:38:02'),(20,'Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,2,'products/thumbs/51VuLAPfcL._SL160_AA160_.jpg','products/large/51VuLAPfcL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','300.00',5,'2010-08-02 14:38:17','2010-08-02 14:38:18'),(21,'PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,2,'products/thumbs/51HZ9Y68N7L._SL160_AA160_.jpg','products/large/51HZ9Y68N7L._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','510.00',5,'2010-08-02 14:38:34','2010-08-02 14:38:36'),(22,'Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,2,'products/thumbs/51N7tMjcX3L._SL160_AA160_.jpg','products/large/51N7tMjcX3L._SL500_AA300_PIbundle-6TopRight00_AA300_SH20_.jpg','540.00',5,'2010-08-02 14:38:50','2010-08-02 14:38:52'),(23,'Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,2,'products/thumbs/51-eWIYiZXL._SL160_AA160_.jpg','products/large/51-eWIYiZXL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','600.00',5,'2010-08-02 14:39:05','2010-08-02 14:39:06'),(24,'Nokia 5530 XpressMusic','The Nokia 5530 XpressMusic is a thin music phone with an easy-to-use touch interface.',6,1,'products/thumbs/phone5.jpg','products/large/img2.jpg','55000.00',5,'2010-08-02 14:39:17','2010-08-02 14:39:19'),(25,'Nokia E5','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks.',6,1,'products/thumbs/phone1.jpg','products/large/img1.jpg','64650.00',5,'2010-08-02 14:39:33','2010-08-02 14:39:43'),(26,'Nokia N85','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks. ',6,1,'products/thumbs/phone3.jpg','products/large/img4.jpg','80500.00',5,'2010-08-02 14:39:59','2010-08-02 14:40:01'),(27,'Nokia N900','Experience the speed and raw power of the high-performance N900 mobile computer.',6,1,'products/thumbs/phone2.jpg','products/large/img3.jpg','90000.00',5,'2010-08-02 14:40:12','2010-08-02 14:40:14');
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
INSERT INTO `store_productgroup` VALUES (4,'Coffee','',2),(5,'Tea','',2),(6,'Nokia','',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2010-08-24  9:30:59
