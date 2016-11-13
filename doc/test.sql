-- MySQL dump 10.13  Distrib 5.6.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `spa_age_level`
--

DROP TABLE IF EXISTS `spa_age_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_age_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '品项id',
  `gt_age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄(左开)',
  `lt_age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄(右闭)',
  `score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='年龄阶梯参数设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_age_level`
--

LOCK TABLES `spa_age_level` WRITE;
/*!40000 ALTER TABLE `spa_age_level` DISABLE KEYS */;
INSERT INTO `spa_age_level` VALUES (32,1,7,8,9.000,'2016-11-04 16:29:23','2016-11-04 16:29:23'),(48,4,20,50,78.000,'2016-11-09 14:01:59','2016-11-09 14:01:59'),(53,17,20,40,80.000,'2016-11-10 14:53:20','2016-11-10 14:53:20'),(54,17,40,50,60.000,'2016-11-10 14:53:20','2016-11-10 14:53:20');
/*!40000 ALTER TABLE `spa_age_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_check_item`
--

DROP TABLE IF EXISTS `spa_check_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_check_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '检查品项',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `weight` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '权重',
  `show_ratio` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '显示比例',
  `rand_ratio` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '随机比例',
  `add_ratio` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '体验后增益比例',
  `minus_ratio` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '天衰减比例',
  `max_minus_ratio` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '最大衰减比例',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父品项id',
  `score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='检查品项信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_check_item`
--

LOCK TABLES `spa_check_item` WRITE;
/*!40000 ALTER TABLE `spa_check_item` DISABLE KEYS */;
INSERT INTO `spa_check_item` VALUES (2,'www',0,0.000,0.000,0.000,0.000,0.000,0.000,1,0.000,'0000-00-00 00:00:00','2016-11-04 16:29:28'),(3,'ssds',0,0.000,0.000,0.000,0.000,0.000,0.000,1,0.000,'0000-00-00 00:00:00','2016-11-04 16:29:28'),(4,'水分',1,0.500,0.500,0.100,0.050,0.050,0.050,0,0.000,'2016-11-04 17:01:01','2016-11-09 14:00:15'),(17,'光泽',2,0.500,0.500,0.100,0.100,0.010,0.100,0,0.000,'2016-11-08 13:57:20','2016-11-09 14:04:48'),(30,'水分1',0,0.000,0.000,0.000,0.000,0.000,0.000,4,0.000,'2016-11-09 14:01:59','2016-11-09 14:01:59'),(31,'水分2',0,0.000,0.000,0.000,0.000,0.000,0.000,4,0.000,'2016-11-09 14:01:59','2016-11-09 14:01:59'),(35,'光泽2',0,0.000,0.000,0.000,0.000,0.000,0.000,17,0.000,'2016-11-10 14:53:20','2016-11-10 14:53:20'),(36,'光泽3',0,0.000,0.000,0.000,0.000,0.000,0.000,17,0.000,'2016-11-10 14:53:20','2016-11-10 14:53:20');
/*!40000 ALTER TABLE `spa_check_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_check_record`
--

DROP TABLE IF EXISTS `spa_check_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `client_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='检测记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_check_record`
--

LOCK TABLES `spa_check_record` WRITE;
/*!40000 ALTER TABLE `spa_check_record` DISABLE KEYS */;
INSERT INTO `spa_check_record` VALUES (7,6,'2016-11-13 04:04:41','2016-11-13 04:04:40');
/*!40000 ALTER TABLE `spa_check_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_check_result`
--

DROP TABLE IF EXISTS `spa_check_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_check_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `client_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '品项id',
  `score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `record_id` int(11) NOT NULL DEFAULT '0' COMMENT '检测记录id',
  `general_score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '参考值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='检查结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_check_result`
--

LOCK TABLES `spa_check_result` WRITE;
/*!40000 ALTER TABLE `spa_check_result` DISABLE KEYS */;
INSERT INTO `spa_check_result` VALUES (55,6,4,39.306,'2016-11-13 04:04:41','2016-11-13 04:04:40',7,78.000),(56,6,30,41.161,'2016-11-13 04:04:41','2016-11-13 04:04:40',7,78.000),(57,6,31,40.906,'2016-11-13 04:04:41','2016-11-13 04:04:40',7,78.000),(58,6,17,42.872,'2016-11-13 04:04:41','2016-11-13 04:04:40',7,80.000),(59,6,35,44.940,'2016-11-13 04:04:41','2016-11-13 04:04:40',7,80.000),(60,6,36,41.402,'2016-11-13 04:04:41','2016-11-13 04:04:40',7,80.000);
/*!40000 ALTER TABLE `spa_check_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_client`
--

DROP TABLE IF EXISTS `spa_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '客户姓名',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_client`
--

LOCK TABLES `spa_client` WRITE;
/*!40000 ALTER TABLE `spa_client` DISABLE KEYS */;
INSERT INTO `spa_client` VALUES (6,'lingz',30,'2016-11-04 15:21:52','2016-11-04 15:21:51');
/*!40000 ALTER TABLE `spa_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_product`
--

DROP TABLE IF EXISTS `spa_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '产品名称',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应品项id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_product`
--

LOCK TABLES `spa_product` WRITE;
/*!40000 ALTER TABLE `spa_product` DISABLE KEYS */;
INSERT INTO `spa_product` VALUES (2,'补水套餐',4,'2016-11-10 14:06:11','2016-11-10 14:06:10',1);
/*!40000 ALTER TABLE `spa_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_product_image`
--

DROP TABLE IF EXISTS `spa_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_product_image`
--

LOCK TABLES `spa_product_image` WRITE;
/*!40000 ALTER TABLE `spa_product_image` DISABLE KEYS */;
INSERT INTO `spa_product_image` VALUES (9,2,'/public/images/spa/1478789256810.JPG','/Users/lingz/Project/spa/src/main/webapp/public/images/spa/1478789256810.JPG','2016-11-10 14:47:37','2016-11-10 14:47:38'),(10,2,'/public/images/spa/1478789424101.JPG','/Users/lingz/Project/spa/src/main/webapp/public/images/spa/1478789424101.JPG','2016-11-10 14:50:24','2016-11-10 14:50:25');
/*!40000 ALTER TABLE `spa_product_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-13 23:52:18
