-- MySQL dump 10.13  Distrib 5.7.10, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.10

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='年龄阶梯参数设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_age_level`
--

LOCK TABLES `spa_age_level` WRITE;
/*!40000 ALTER TABLE `spa_age_level` DISABLE KEYS */;
INSERT INTO `spa_age_level` VALUES (32,1,7,8,9.000,'2016-11-04 16:29:23','2016-11-04 16:29:23'),(48,4,20,50,78.000,'2016-11-09 14:01:59','2016-11-09 14:01:59'),(53,17,20,40,80.000,'2016-11-10 14:53:20','2016-11-10 14:53:20'),(54,17,40,50,60.000,'2016-11-10 14:53:20','2016-11-10 14:53:20'),(60,37,0,20,90.000,'2016-12-30 03:19:44','2016-12-30 03:19:43'),(61,37,21,30,85.000,'2016-12-30 03:19:44','2016-12-30 03:19:43'),(62,37,31,40,80.000,'2016-12-30 03:19:44','2016-12-30 03:19:43'),(63,37,41,80,70.000,'2016-12-30 03:19:44','2016-12-30 03:19:43'),(64,37,81,120,60.000,'2016-12-30 03:19:44','2016-12-30 03:19:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='检查品项信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_check_item`
--

LOCK TABLES `spa_check_item` WRITE;
/*!40000 ALTER TABLE `spa_check_item` DISABLE KEYS */;
INSERT INTO `spa_check_item` VALUES (2,'www',0,0.000,0.000,0.000,0.000,0.000,0.000,1,0.000,'0000-00-00 00:00:00','2016-11-04 16:29:28'),(3,'ssds',0,0.000,0.000,0.000,0.000,0.000,0.000,1,0.000,'0000-00-00 00:00:00','2016-11-04 16:29:28'),(4,'水分',1,0.500,0.500,0.100,0.050,0.050,0.050,0,0.000,'2016-11-04 17:01:01','2016-11-09 14:00:15'),(17,'光泽',2,0.500,0.500,0.100,0.100,0.010,0.100,0,0.000,'2016-11-08 13:57:20','2016-11-09 14:04:48'),(30,'水分1',0,0.000,0.000,0.000,0.000,0.000,0.000,4,0.000,'2016-11-09 14:01:59','2016-11-09 14:01:59'),(31,'水分2',0,0.000,0.000,0.000,0.000,0.000,0.000,4,0.000,'2016-11-09 14:01:59','2016-11-09 14:01:59'),(35,'光泽2',0,0.000,0.000,0.000,0.000,0.000,0.000,17,0.000,'2016-11-10 14:53:20','2016-11-10 14:53:20'),(36,'光泽3',0,0.000,0.000,0.000,0.000,0.000,0.000,17,0.000,'2016-11-10 14:53:20','2016-11-10 14:53:20'),(37,'紧致',4,30.000,0.400,0.100,0.100,0.010,0.100,0,0.000,'2016-12-28 02:05:04','2016-12-30 03:19:43');
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
  `prev_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次检测时间',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '第几次检测',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='检测记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_check_record`
--

LOCK TABLES `spa_check_record` WRITE;
/*!40000 ALTER TABLE `spa_check_record` DISABLE KEYS */;
INSERT INTO `spa_check_record` VALUES (80,7,'2016-12-27 09:36:48','2016-12-27 09:38:57','0000-00-00 00:00:00',0),(81,6,'2016-12-27 09:41:03','2016-12-27 09:43:12','0000-00-00 00:00:00',1),(82,6,'2016-12-27 09:41:36','2016-12-27 09:43:46','2016-12-27 09:41:03',2),(83,6,'2016-12-28 02:13:41','2016-12-28 02:15:50','2016-12-27 09:41:36',3),(84,6,'2016-12-29 09:21:07','2016-12-29 09:23:22','2016-12-28 02:13:41',4),(85,6,'2016-12-29 09:22:09','2016-12-29 09:24:24','2016-12-29 09:21:07',5),(86,6,'2016-12-29 09:22:39','2016-12-29 09:24:54','2016-12-29 09:22:09',6),(87,6,'2016-12-29 09:24:02','2016-12-29 09:26:17','2016-12-29 09:22:39',7),(88,6,'2016-12-29 09:26:59','2016-12-29 09:29:14','2016-12-29 09:24:02',8),(89,6,'2016-12-29 09:28:12','2016-12-29 09:30:27','2016-12-29 09:26:59',9),(90,6,'2016-12-29 09:29:01','2016-12-29 09:31:16','2016-12-29 09:28:12',10),(91,6,'2016-12-29 14:34:37','2016-12-29 14:34:37','2016-12-29 09:29:01',11),(92,6,'2016-12-29 14:34:55','2016-12-29 14:34:55','2016-12-29 14:34:37',12),(93,6,'2016-12-29 14:36:24','2016-12-29 14:36:24','2016-12-29 14:34:55',13),(94,6,'2016-12-29 14:37:00','2016-12-29 14:36:59','2016-12-29 14:36:24',14),(95,6,'2016-12-29 14:38:22','2016-12-29 14:38:21','2016-12-29 14:37:00',15),(96,7,'2016-12-29 14:38:44','2016-12-29 14:38:43','2016-12-27 09:36:48',1),(97,6,'2016-12-29 14:38:48','2016-12-29 14:38:47','2016-12-29 14:38:22',16),(98,7,'2016-12-29 14:38:51','2016-12-29 14:38:50','2016-12-29 14:38:44',2),(99,6,'2016-12-29 14:39:07','2016-12-29 14:39:06','2016-12-29 14:38:48',17),(100,6,'2016-12-29 14:39:09','2016-12-29 14:39:08','2016-12-29 14:39:07',18),(101,6,'2016-12-29 14:39:11','2016-12-29 14:39:10','2016-12-29 14:39:09',19),(102,7,'2016-12-29 14:39:13','2016-12-29 14:39:13','2016-12-29 14:38:51',3),(103,7,'2016-12-29 14:39:15','2016-12-29 14:39:15','2016-12-29 14:39:13',4),(104,7,'2016-12-29 14:39:16','2016-12-29 14:39:16','2016-12-29 14:39:15',5),(105,7,'2016-12-29 14:39:18','2016-12-29 14:39:17','2016-12-29 14:39:16',6),(106,6,'2016-12-29 14:39:43','2016-12-29 14:39:43','2016-12-29 14:39:11',20),(107,7,'2016-12-29 15:02:23','2016-12-29 15:02:22','2016-12-29 14:39:18',7),(108,7,'2016-12-29 15:04:31','2016-12-29 15:04:31','2016-12-29 15:02:23',8),(109,7,'2016-12-29 15:04:34','2016-12-29 15:04:33','2016-12-29 15:04:31',9),(110,7,'2016-12-29 15:05:56','2016-12-29 15:05:55','2016-12-29 15:04:34',10),(111,7,'2016-12-30 02:26:18','2016-12-30 02:26:17','2016-12-29 15:05:56',11),(112,6,'2016-12-30 02:41:41','2016-12-30 02:41:41','2016-12-29 14:39:43',21),(113,7,'2016-12-30 02:41:48','2016-12-30 02:41:48','2016-12-30 02:26:18',12),(114,7,'2016-12-30 02:41:48','2016-12-30 02:41:48','2016-12-30 02:41:48',13),(115,6,'2016-12-30 03:28:26','2016-12-30 03:28:25','2016-12-30 02:41:41',22),(116,6,'2016-12-30 03:36:57','2016-12-30 03:36:56','2016-12-30 03:28:26',23);
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
  `item_level_id` int(11) NOT NULL DEFAULT '0' COMMENT '品项阶梯id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8 COMMENT='检查结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_check_result`
--

LOCK TABLES `spa_check_result` WRITE;
/*!40000 ALTER TABLE `spa_check_result` DISABLE KEYS */;
INSERT INTO `spa_check_result` VALUES (493,7,4,45.117,'2016-12-27 09:36:48','2016-12-27 09:38:57',0,78.000,0),(494,7,17,45.987,'2016-12-27 09:36:48','2016-12-27 09:38:57',0,80.000,0),(495,6,4,42.182,'2016-12-27 09:41:03','2016-12-27 09:43:12',81,78.000,0),(496,6,17,35.673,'2016-12-27 09:41:03','2016-12-27 09:43:12',81,80.000,0),(497,6,4,44.291,'2016-12-27 09:41:36','2016-12-27 09:43:46',82,78.000,0),(498,6,17,39.240,'2016-12-27 09:41:36','2016-12-27 09:43:46',82,80.000,0),(499,6,4,44.610,'2016-12-28 02:13:41','2016-12-28 02:15:50',83,78.000,0),(500,6,17,43.687,'2016-12-28 02:13:41','2016-12-28 02:15:50',83,80.000,0),(501,6,37,36.041,'2016-12-28 02:13:41','2016-12-28 02:15:50',83,85.000,0),(502,7,4,42.336,'2016-12-29 14:38:44','2016-12-29 14:38:43',96,78.000,0),(503,7,17,45.930,'2016-12-29 14:38:44','2016-12-29 14:38:43',96,80.000,0),(504,7,37,41.134,'2016-12-29 14:38:44','2016-12-29 14:38:43',96,85.000,0),(505,7,4,44.453,'2016-12-29 14:38:51','2016-12-29 14:38:50',98,78.000,0),(506,7,17,50.523,'2016-12-29 14:38:51','2016-12-29 14:38:50',98,80.000,0),(507,7,37,45.247,'2016-12-29 14:38:51','2016-12-29 14:38:50',98,85.000,0),(508,7,4,46.676,'2016-12-29 14:39:13','2016-12-29 14:39:13',102,78.000,0),(509,7,17,55.575,'2016-12-29 14:39:13','2016-12-29 14:39:13',102,80.000,0),(510,7,37,49.772,'2016-12-29 14:39:13','2016-12-29 14:39:13',102,85.000,0),(511,7,4,49.010,'2016-12-29 14:39:15','2016-12-29 14:39:15',103,78.000,0),(512,7,17,61.133,'2016-12-29 14:39:15','2016-12-29 14:39:15',103,80.000,0),(513,7,37,54.749,'2016-12-29 14:39:15','2016-12-29 14:39:15',103,85.000,0),(514,7,4,51.461,'2016-12-29 14:39:16','2016-12-29 14:39:16',104,78.000,0),(515,7,17,67.246,'2016-12-29 14:39:16','2016-12-29 14:39:16',104,80.000,0),(516,7,37,60.224,'2016-12-29 14:39:16','2016-12-29 14:39:16',104,85.000,0),(517,7,4,54.034,'2016-12-29 14:39:18','2016-12-29 14:39:17',105,78.000,0),(518,7,17,73.971,'2016-12-29 14:39:18','2016-12-29 14:39:17',105,80.000,0),(519,7,37,66.246,'2016-12-29 14:39:18','2016-12-29 14:39:17',105,85.000,0),(520,7,4,56.736,'2016-12-29 15:02:23','2016-12-29 15:02:22',107,78.000,0),(521,7,17,81.368,'2016-12-29 15:02:23','2016-12-29 15:02:22',107,80.000,0),(522,7,37,72.871,'2016-12-29 15:02:23','2016-12-29 15:02:22',107,85.000,0),(523,7,4,59.573,'2016-12-29 15:04:31','2016-12-29 15:04:31',108,78.000,0),(524,7,17,89.505,'2016-12-29 15:04:31','2016-12-29 15:04:31',108,80.000,0),(525,7,37,80.158,'2016-12-29 15:04:31','2016-12-29 15:04:31',108,85.000,0),(526,7,4,62.552,'2016-12-29 15:04:34','2016-12-29 15:04:33',109,78.000,0),(527,7,17,98.456,'2016-12-29 15:04:34','2016-12-29 15:04:33',109,80.000,0),(528,7,37,88.174,'2016-12-29 15:04:34','2016-12-29 15:04:33',109,85.000,0),(529,7,4,65.680,'2016-12-29 15:05:56','2016-12-29 15:05:55',110,78.000,0),(530,7,17,108.302,'2016-12-29 15:05:56','2016-12-29 15:05:55',110,80.000,0),(531,7,37,96.991,'2016-12-29 15:05:56','2016-12-29 15:05:55',110,85.000,0),(532,7,4,32.047,'2016-12-30 02:26:18','2016-12-30 02:26:17',111,78.000,0),(533,7,17,39.918,'2016-12-30 02:26:18','2016-12-30 02:26:17',111,80.000,0),(534,7,37,30.065,'2016-12-30 02:26:18','2016-12-30 02:26:17',111,85.000,0),(535,6,4,34.583,'2016-12-30 02:41:41','2016-12-30 02:41:41',112,78.000,0),(536,6,17,37.275,'2016-12-30 02:41:41','2016-12-30 02:41:41',112,80.000,0),(537,6,37,33.996,'2016-12-30 02:41:41','2016-12-30 02:41:41',112,85.000,0),(538,7,4,33.649,'2016-12-30 02:41:48','2016-12-30 02:41:48',113,78.000,0),(539,7,17,43.910,'2016-12-30 02:41:48','2016-12-30 02:41:48',113,80.000,0),(540,7,37,33.072,'2016-12-30 02:41:48','2016-12-30 02:41:48',113,85.000,0),(541,7,4,35.331,'2016-12-30 02:41:48','2016-12-30 02:41:48',114,78.000,0),(542,7,17,48.301,'2016-12-30 02:41:48','2016-12-30 02:41:48',114,80.000,0),(543,7,37,36.379,'2016-12-30 02:41:48','2016-12-30 02:41:48',114,85.000,0),(544,6,4,36.312,'2016-12-30 03:28:26','2016-12-30 03:28:25',115,78.000,0),(545,6,17,41.003,'2016-12-30 03:28:26','2016-12-30 03:28:25',115,80.000,0),(546,6,37,37.396,'2016-12-30 03:28:26','2016-12-30 03:28:25',115,85.000,0),(547,6,4,38.128,'2016-12-30 03:36:57','2016-12-30 03:36:56',116,78.000,0),(548,6,17,45.103,'2016-12-30 03:36:57','2016-12-30 03:36:56',116,80.000,0),(549,6,37,41.136,'2016-12-30 03:36:57','2016-12-30 03:36:56',116,85.000,0);
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
  `birthday` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生日',
  `addr` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `sex` int(2) NOT NULL DEFAULT '0' COMMENT '性别。0：女：1：男：3：其他',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `head_image_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_client`
--

LOCK TABLES `spa_client` WRITE;
/*!40000 ALTER TABLE `spa_client` DISABLE KEYS */;
INSERT INTO `spa_client` VALUES (6,'lingz',30,'2016-11-04 15:21:52','2016-12-28 02:00:50','2016-12-28 01:54:49','',0,'',7),(7,'duheyu',25,'2016-11-14 06:05:26','2016-12-24 05:18:10','0000-00-00 00:00:00','广州天河区',0,'13360579100',7),(8,'hao',8,'2016-12-26 10:44:33','2016-12-26 10:46:43','0000-00-00 00:00:00','111111',0,'13312345678',0);
/*!40000 ALTER TABLE `spa_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_image`
--

DROP TABLE IF EXISTS `spa_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='图片信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_image`
--

LOCK TABLES `spa_image` WRITE;
/*!40000 ALTER TABLE `spa_image` DISABLE KEYS */;
INSERT INTO `spa_image` VALUES (1,'/public/images/spa/1482552266503.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552266503.jpg','0000-00-00 00:00:00','2016-12-24 04:06:32'),(2,'/public/images/spa/1482552366845.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552366845.jpg','0000-00-00 00:00:00','2016-12-24 04:08:12'),(3,'/public/images/spa/1482552733224.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552733224.jpg','0000-00-00 00:00:00','2016-12-24 04:14:19'),(4,'/public/images/spa/1482552750605.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552750605.jpg','0000-00-00 00:00:00','2016-12-24 04:14:36'),(5,'/public/images/spa/1482552848666.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552848666.jpg','0000-00-00 00:00:00','2016-12-24 04:16:14'),(6,'/public/images/spa/1482556393736.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482556393736.jpg','0000-00-00 00:00:00','2016-12-24 05:15:19'),(7,'/public/images/spa/1482556553552.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482556553552.jpg','0000-00-00 00:00:00','2016-12-24 05:17:59');
/*!40000 ALTER TABLE `spa_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_item_level`
--

DROP TABLE IF EXISTS `spa_item_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_item_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '品项id',
  `gt_score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值(左开)',
  `lt_score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值(右闭)',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='品项阶梯设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_item_level`
--

LOCK TABLES `spa_item_level` WRITE;
/*!40000 ALTER TABLE `spa_item_level` DISABLE KEYS */;
INSERT INTO `spa_item_level` VALUES (60,'极度缺水性肌肤',4,0.000,25.000,'0000-00-00 00:00:00','2016-12-30 03:21:49'),(61,'缺水性肌肤',4,26.000,50.000,'0000-00-00 00:00:00','2016-12-30 03:22:00'),(62,'轻度缺水性肌肤',4,51.000,75.000,'0000-00-00 00:00:00','2016-12-30 03:22:09'),(63,'水润肌肤',4,76.000,100.000,'0000-00-00 00:00:00','2016-12-30 03:22:38'),(64,'轻度松弛皮肤',37,0.000,25.000,'0000-00-00 00:00:00','2016-12-30 03:22:22'),(65,'松弛皮肤',37,26.000,50.000,'0000-00-00 00:00:00','2016-12-30 03:22:27'),(66,'紧致度一般',37,51.000,75.000,'0000-00-00 00:00:00','2016-12-30 03:22:32'),(67,'紧致度良好',37,76.000,10.000,'0000-00-00 00:00:00','2016-12-30 03:22:43'),(68,'非常暗淡',17,0.000,25.000,'0000-00-00 00:00:00','2016-12-30 03:23:42'),(69,'略显暗淡',17,26.000,50.000,'0000-00-00 00:00:00','2016-12-30 03:23:59'),(70,'肤色红润',17,51.000,75.000,'0000-00-00 00:00:00','2016-12-30 03:24:47'),(71,'非常红润',17,76.000,100.000,'0000-00-00 00:00:00','2016-12-30 03:25:00');
/*!40000 ALTER TABLE `spa_item_level` ENABLE KEYS */;
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
  `image_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_product_image`
--

LOCK TABLES `spa_product_image` WRITE;
/*!40000 ALTER TABLE `spa_product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `spa_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spa_product_image_copy`
--

DROP TABLE IF EXISTS `spa_product_image_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spa_product_image_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='产品图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spa_product_image_copy`
--

LOCK TABLES `spa_product_image_copy` WRITE;
/*!40000 ALTER TABLE `spa_product_image_copy` DISABLE KEYS */;
INSERT INTO `spa_product_image_copy` VALUES (13,0,'/public/images/spa/G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265406393.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265406393.jpg','2016-11-16 03:04:06','2016-11-16 03:04:58'),(14,2,'/public/images/spa/1479265638993.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265638993.jpg','2016-11-16 03:07:19','2016-11-16 03:08:14'),(15,0,'/public/images/spa/1482552147854.jpg','G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552147854.jpg','2016-12-24 04:02:27','2016-12-24 04:04:33');
/*!40000 ALTER TABLE `spa_product_image_copy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-30 11:39:58
