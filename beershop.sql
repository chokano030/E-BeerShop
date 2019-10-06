-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: beershop
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `beers`
--

DROP TABLE IF EXISTS `beers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `brewery` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `style` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alcohol` decimal(4,1) DEFAULT NULL,
  `packing` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(1500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beers`
--

LOCK TABLES `beers` WRITE;
/*!40000 ALTER TABLE `beers` DISABLE KEYS */;
INSERT INTO `beers` VALUES (1,'Tripel Karmeliet',2,'Brasserie Bosteels','Belgium','Tripel',8.4,'33 cl','Not just a classic Belgian Ale, but our \r\nall-time best-selling beer!','https://img.saveur-biere.com/img/p/82-14662-v4_product_img.jpg',5),(2,'Brewdog Punk IPA',3,'Brewdog','Scotland','India Pale Ale',5.6,'33 cl','The original Craft IPA, bursting with \r\nhuge peachy hops and a big, bold bitter \r\nstreak','https://img.saveur-biere.com/img/p/1611-16087-v4_product_img.jpg',19),(3,'Weihenstephaner Vitus',4,'Weihenstephaner','Germany','Weizenbock',7.7,'50 cl','Weihenstephaner\'s crisp, fruity, spicy \r iconic Weizenbock ','https://img.saveur-biere.com/img/p/1697-16412-v4_product_img.jpg',0),(4,'Oedipus Mama',3,'Oedipus','Netherlands','American Pale Ale',5.0,'33 cl','A delicious American Pale Ale with \r\nlively hops notes','https://img.saveur-biere.com/img/p/9074-43384-v4_product_img.jpg',17),(5,'Cwtch',3,'Tiny Rebel','Wales','Amber Ale',4.6,'33 cl','It takes a few to get the name of this \r\nmalty and hoppy sensation right!','https://img.saveur-biere.com/img/p/7212-16622-v4_product_img.jpg',9),(6,'Thornbridge - Mango Halcyon',4,'Thornbridge','England','India Pale Ale',7.4,'33 cl','English IPA with elegant mango and \r\ntropical flavours  ','https://img.saveur-biere.com/img/p/28046-40418-v4_product_img.jpg',9),(7,'Sierra Nevada Pale Ale',4,'Sierra Nevada Brewing Company','USA','American Pale Ale',5.6,'35 cl','The most famous beer from the Sierra \r\nNevada Brewing Company!  ','https://img.saveur-biere.com/img/p/1004-16338-v4_product_img.jpg',10),(8,'Asahi',3,'Asahi','Japan','Lager',5.0,'33 cl','Crisp, clear, Japan\'s favourite blonde \r beer!','https://img.saveur-biere.com/img/p/251-16623-v4_product_img.jpg',23),(9,'Schneider Hopfenweisse Tap 5',4,'Schneider Weisse','Germany','Weizenbock',8.2,'50 cl','\"Meine Hopfenweisse\", the new jewel \r\nfrom Schneider!','https://img.saveur-biere.com/img/p/4356-14588-v4_product_img.jpg',9),(10,'Youngs Double Chocolate Stout',4,'Charles Wells Brewery','England','Stout',5.2,'50 cl','A delightful English beer brewed with \r\nchocolate squares, really delightful!','https://img.saveur-biere.com/img/p/1815-16129-v4_product_img.jpg',28),(11,'Motorhead Road Crew',5,'Camerons Brewery','England','American Pale Ale',4.5,'33 cl','A light American Pale Ale with fruity \r\nflavours, a new recipe for the beer from \r\nthe famous MotÃ¶rhead Group.','https://img.saveur-biere.com/img/p/27326-39605-v4_product_img.jpg',0);
/*!40000 ALTER TABLE `beers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `beer_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`beer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,1),(1,2,2),(1,7,3),(2,6,3),(2,7,2),(3,9,2),(3,10,4),(4,4,3),(4,5,2),(4,8,4),(5,1,2),(5,2,5),(6,2,3),(7,1,5),(7,5,4),(8,2,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` longtext COLLATE utf8_unicode_ci,
  `total_price` int(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'aca','nepoznata ulica bb','60234567',20),(2,'aca','ustanicka bb','62456123',20),(3,'boza','bozina ulica 123','604445552',24),(4,'boza','bozina ulica 123','604445552',27),(5,'marko','markova ulica bb','63555444',19),(6,'aca','acina ulica bb','625855152',9),(7,'marko','balkanska ulica bb','604784784',22),(8,'boza','dasdas','622651',6);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orders_view`
--

DROP TABLE IF EXISTS `orders_view`;
/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orders_view` AS SELECT 
 1 AS `order_id`,
 1 AS `username`,
 1 AS `address`,
 1 AS `tel`,
 1 AS `group_concat(beers.name)`,
 1 AS `group_concat(order_details.quantity)`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'boza','boza123',1),(2,'aca','aca123',0),(3,'marko','marko123',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'beershop'
--

--
-- Dumping routines for database 'beershop'
--

--
-- Final view structure for view `orders_view`
--

/*!50001 DROP VIEW IF EXISTS `orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_view` AS select `order_details`.`order_id` AS `order_id`,`orders`.`username` AS `username`,`orders`.`address` AS `address`,`orders`.`tel` AS `tel`,group_concat(`beers`.`name` separator ',') AS `group_concat(beers.name)`,group_concat(`order_details`.`quantity` separator ',') AS `group_concat(order_details.quantity)`,`orders`.`total_price` AS `total_price` from ((`orders` join `order_details` on((`order_details`.`order_id` = `orders`.`id`))) join `beers` on((`order_details`.`beer_id` = `beers`.`id`))) group by `order_details`.`order_id` */;
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

-- Dump completed on 2018-09-27 10:38:31
