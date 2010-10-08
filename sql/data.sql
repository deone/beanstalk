use pay4memall;

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
INSERT INTO `account_profile` VALUES (1,8,'Mr.','2348029299274','9, Admiralty Way','9, Admiralty Way, Lekki, Lagos, Nigeria','Lekki','Lagos','Nigeria'),(2,9,'Mr.','2348022244488','9, Admiralty Way,','100, Mushin Way, Oshodi, Lagos, Nigeria.','Lekki','Lagos','Nigeria'),(3,10,'Mr.','23407022222221','9, Admiralty Way,','100, Victoria Island Way, Ikoyi','Lekki','Lagos','Nigeria'),(4,46,'Mr.','2348029299274','9, Admiralty Way','Olukoyi Avenue, Off Awolowo road, Ikeja','Lekki','Lagos','Nigeria');
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Merchant');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,32),(2,1,33),(3,1,34),(4,1,35),(5,1,36),(6,1,38),(7,1,28),(8,1,29),(9,1,30),(10,1,31);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (9,'segun@ade.co.uk','Segun','Ade','segun@ade.co.uk','sha1$8af64$ce332546917d7900b79ac54dfbbea68ccba50911',0,1,0,'2010-08-13 17:12:47','2010-08-13 17:12:47'),(3,'alwaysdeone@gmail.com','Olusegun','Obasanjo','alwaysdeone@gmail.com','sha1$2aad6$8534ba88d6e21aaedc6632ca08cb01ded5033c00',1,1,0,'2010-09-30 09:36:32','2010-08-06 09:32:14'),(10,'ade@olu.com','Ade','Olu','ade@olu.com','sha1$d9770$3f9dae1fe56c0794358dfe907bde04d6991e7d2e',0,1,0,'2010-08-13 17:30:40','2010-08-13 17:30:40'),(5,'alwaysdeone@yahoo.com','Oluseyi','Adegoju','alwaysdeone@yahoo.com','sha1$a2c5b$d48e941189e82eb111896cbf27725d19eab37cfc',1,1,0,'2010-10-06 06:56:40','2010-08-06 09:36:45'),(8,'deji@alade.com','Dayo','Ade','deji@alade.com','sha1$b5ed4$a8cdb3b47672ebf35299e0a4246295c8d953cf9c',0,1,0,'2010-09-28 12:34:44','2010-08-12 18:13:50'),(11,'ayo@ayo.com','Ayo','Ade','ayo@ayo.com','sha1$6d76b$0fa36c078d868ac0e70656cf27422d07a613ee53',1,1,0,'2010-09-21 11:13:48','2010-09-21 11:13:48'),(46,'oosikoya@pay4me.com','Oladayo','Osikoya','oosikoya@pay4me.com','sha1$834fe$e066e2af98ef4a4bc123b05aa24056abc4d552eb',0,1,0,'2010-09-24 19:01:43','2010-09-24 07:33:50');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,11,1),(2,3,1),(5,5,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `mall_category` WRITE;
/*!40000 ALTER TABLE `mall_category` DISABLE KEYS */;
INSERT INTO `mall_category` VALUES (1,'Mobile Phones','',2),(2,'Groceries','',1),(3,'Laptops & Netbooks','',3),(4,'Desktops & Servers','',3),(5,'Computer Components','',3),(6,'TV & Video','',2),(7,'Home Appliances','',2),(8,'Exercise & Fitness','',4),(9,'Outdoor Recreation','',4),(10,'Automotive Parts & Accessories','',5),(11,'Wheels & Tires','',5),(12,'Furniture & Decor','',1);
/*!40000 ALTER TABLE `mall_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `mall_department` WRITE;
/*!40000 ALTER TABLE `mall_department` DISABLE KEYS */;
INSERT INTO `mall_department` VALUES (1,'Household Goods','','household-goods'),(2,'Electronics','','electronics'),(3,'Computers & Office','','computers-office'),(4,'Sports & Outdoors','','sports-outdoors'),(5,'Automotive & Industrial','','automotive-industrial'),(9,'Cars','','cars');
/*!40000 ALTER TABLE `mall_department` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (16,'Tassimo T-Disk: Starbucks Coffee (Case of 5 packages; 60 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor',4,2,'products/41LnP4kC5UL._SL500_AA300_.jpg','200.00','10.00',10,'2010-08-02 14:37:12','2010-08-02 14:37:14'),(17,'Tassimo T-Disk: Gevalia Coffee (Case of 5 packages; 80 T-Discs Total)','The ingenious Tassimo Disc (T-DISC) is designed to work exclusively with the Tassimo Hot Beverage System. Sealed to protect the precious flavors inside. Blend produces a medium bodied, smooth and well-balanced coffee with that distinct nutty flavor.',4,2,'products/41rpj8UX1ZL._SL500_AA300_.jpg','250.00','10.00',10,'2010-08-02 14:37:29','2010-08-02 14:37:31'),(18,'Tassimo T-Disk: Verona Coffee (Case of 5 packages; 60 T-Discs Total)','',4,2,'products/41Xm0Z6gOHL._SL500_AA300_.jpg','245.00','10.00',10,'2010-08-02 14:37:46','2010-08-02 14:37:48'),(19,'Tassimo T-Disk: House Blend Coffee (Case of 5 packages; 60 T-Discs Total)','',4,2,'products/413ezeSOr8L._SL500_AA300_.jpg','280.00','10.00',10,'2010-08-02 14:38:00','2010-08-02 14:38:02'),(20,'Twinings English Breakfast Tea, K-Cups for Keurig Brewers, 25-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,2,'products/51VuLAPfcL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','300.00','10.00',-59,'2010-08-02 14:38:17','2010-08-02 14:38:18'),(21,'PG Tips Black Tea, Pyramid Tea Bags, 240-Count Boxes (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee.',5,2,'products/51HZ9Y68N7L._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','510.00','10.00',8,'2010-08-02 14:38:34','2010-08-02 14:38:36'),(22,'Organic Mother\'s Milk Herbal Tea, 16-Count Wrapped Tea Bags (Pack of 6)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,2,'products/51N7tMjcX3L._SL500_AA300_PIbundle-6TopRight00_AA300_SH20_.jpg','540.00','10.00',10,'2010-08-02 14:38:50','2010-08-02 14:38:52'),(23,'Twinings Earl Grey Tea K-Cups for Keurig Brewers, 25-Count Box (Pack of 2)','Case of two boxes, each containing 240 bags of black tea (total of 480 tea bags). Made from a blend of Assam, Ceylon, and Kenyan black teas. Pyramid-shaped tea bags allow more room for tea leaves to soak into water. Brews a refreshing, robust cup with little caffeine and plenty of antioxidants. Contains about half the caffeine of a similar amount of coffee',5,2,'products/51-eWIYiZXL._SL500_AA300_PIbundle-2TopRight00_AA300_SH20_.jpg','600.00','10.00',4,'2010-08-02 14:39:05','2010-08-02 14:39:06'),(24,'Nokia 5530 XpressMusic','The Nokia 5530 XpressMusic is a thin music phone with an easy-to-use touch interface.',6,1,'products/img2.jpg','55000.00','10.00',-130,'2010-08-02 14:39:17','2010-08-02 14:39:19'),(25,'Nokia E5','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks.',6,1,'products/img1.jpg','64650.00','10.00',8,'2010-08-02 14:39:33','2010-08-02 14:39:43'),(26,'Nokia N85','Connect seamlessly to the people in your professional and personal lives through IM, email and social networks. ',6,1,'products/img4.jpg','80500.00','10.00',5,'2010-08-02 14:39:59','2010-08-02 14:40:01'),(27,'Nokia N900','Experience the speed and raw power of the high-performance N900 mobile computer.',6,1,'products/Shirts.jpg','90000.00','10.00',8,'2010-08-02 14:40:12','2010-08-02 14:40:14');
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `store_productgroup` WRITE;
/*!40000 ALTER TABLE `store_productgroup` DISABLE KEYS */;
INSERT INTO `store_productgroup` VALUES (4,'Coffee','',2),(5,'Tea','',2),(6,'Nokia','',1),(19,'Toiletries','',2);
/*!40000 ALTER TABLE `store_productgroup` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (1,'Amaze Mobiles','',3,'store/logos/amazeLogo.jpg','store/banners/amazeBanner.jpg','012710003','93, Falomo road','Ikoyi','Lagos'),(2,'The Grocery Shop','',5,'thegroceryshop','store/logos/groceryLogo.jpg','store/banners/groceryBanner.jpg','012710003','93, Falomo road','Ikoyi','Lagos');
/*!40000 ALTER TABLE `store_store` ENABLE KEYS */;
UNLOCK TABLES;
