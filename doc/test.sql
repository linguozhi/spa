/*
Navicat MySQL Data Transfer

Source Server         : 232
Source Server Version : 50173
Source Host           : 192.168.9.232:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-28 17:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `spa_age_level`
-- ----------------------------
DROP TABLE IF EXISTS `spa_age_level`;
CREATE TABLE `spa_age_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '品项id',
  `gt_age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄(左开)',
  `lt_age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄(右闭)',
  `score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='年龄阶梯参数设置';

-- ----------------------------
-- Records of spa_age_level
-- ----------------------------
INSERT INTO `spa_age_level` VALUES ('32', '1', '7', '8', '9.000', '2016-11-05 00:29:23', '2016-11-05 00:29:23');
INSERT INTO `spa_age_level` VALUES ('48', '4', '20', '50', '78.000', '2016-11-09 22:01:59', '2016-11-09 22:01:59');
INSERT INTO `spa_age_level` VALUES ('53', '17', '20', '40', '80.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_age_level` VALUES ('54', '17', '40', '50', '60.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_age_level` VALUES ('55', '37', '0', '20', '90.000', '2016-12-28 10:05:04', '2016-12-28 10:07:13');
INSERT INTO `spa_age_level` VALUES ('56', '37', '21', '30', '85.000', '2016-12-28 10:05:04', '2016-12-28 10:07:13');
INSERT INTO `spa_age_level` VALUES ('57', '37', '31', '40', '80.000', '2016-12-28 10:05:04', '2016-12-28 10:07:13');
INSERT INTO `spa_age_level` VALUES ('58', '37', '41', '80', '70.000', '2016-12-28 10:05:04', '2016-12-28 10:07:13');
INSERT INTO `spa_age_level` VALUES ('59', '37', '81', '120', '60.000', '2016-12-28 10:05:04', '2016-12-28 10:07:13');

-- ----------------------------
-- Table structure for `spa_check_item`
-- ----------------------------
DROP TABLE IF EXISTS `spa_check_item`;
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

-- ----------------------------
-- Records of spa_check_item
-- ----------------------------
INSERT INTO `spa_check_item` VALUES ('2', 'www', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0000-00-00 00:00:00', '2016-11-05 00:29:28');
INSERT INTO `spa_check_item` VALUES ('3', 'ssds', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0000-00-00 00:00:00', '2016-11-05 00:29:28');
INSERT INTO `spa_check_item` VALUES ('4', '水分', '1', '0.500', '0.500', '0.100', '0.050', '0.050', '0.050', '0', '0.000', '2016-11-05 01:01:01', '2016-11-09 22:00:15');
INSERT INTO `spa_check_item` VALUES ('17', '光泽', '2', '0.500', '0.500', '0.100', '0.100', '0.010', '0.100', '0', '0.000', '2016-11-08 21:57:20', '2016-11-09 22:04:48');
INSERT INTO `spa_check_item` VALUES ('30', '水分1', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '4', '0.000', '2016-11-09 22:01:59', '2016-11-09 22:01:59');
INSERT INTO `spa_check_item` VALUES ('31', '水分2', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '4', '0.000', '2016-11-09 22:01:59', '2016-11-09 22:01:59');
INSERT INTO `spa_check_item` VALUES ('35', '光泽2', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '17', '0.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_check_item` VALUES ('36', '光泽3', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '17', '0.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_check_item` VALUES ('37', '水分3', '4', '30.000', '0.400', '0.100', '0.100', '0.010', '0.100', '0', '0.000', '2016-12-28 10:05:04', '2016-12-28 10:07:13');

-- ----------------------------
-- Table structure for `spa_check_record`
-- ----------------------------
DROP TABLE IF EXISTS `spa_check_record`;
CREATE TABLE `spa_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `client_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `prev_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次检测时间',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '第几次检测',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='检测记录';

-- ----------------------------
-- Records of spa_check_record
-- ----------------------------
INSERT INTO `spa_check_record` VALUES ('80', '7', '2016-12-27 17:36:48', '2016-12-27 17:38:57', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('81', '6', '2016-12-27 17:41:03', '2016-12-27 17:43:12', '0000-00-00 00:00:00', '1');
INSERT INTO `spa_check_record` VALUES ('82', '6', '2016-12-27 17:41:36', '2016-12-27 17:43:46', '2016-12-27 17:41:03', '2');
INSERT INTO `spa_check_record` VALUES ('83', '6', '2016-12-28 10:13:41', '2016-12-28 10:15:50', '2016-12-27 17:41:36', '3');

-- ----------------------------
-- Table structure for `spa_check_result`
-- ----------------------------
DROP TABLE IF EXISTS `spa_check_result`;
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
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8 COMMENT='检查结果';

-- ----------------------------
-- Records of spa_check_result
-- ----------------------------
INSERT INTO `spa_check_result` VALUES ('493', '7', '4', '45.117', '2016-12-27 17:36:48', '2016-12-27 17:38:57', '0', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('494', '7', '17', '45.987', '2016-12-27 17:36:48', '2016-12-27 17:38:57', '0', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('495', '6', '4', '42.182', '2016-12-27 17:41:03', '2016-12-27 17:43:12', '81', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('496', '6', '17', '35.673', '2016-12-27 17:41:03', '2016-12-27 17:43:12', '81', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('497', '6', '4', '44.291', '2016-12-27 17:41:36', '2016-12-27 17:43:46', '82', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('498', '6', '17', '39.240', '2016-12-27 17:41:36', '2016-12-27 17:43:46', '82', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('499', '6', '4', '44.610', '2016-12-28 10:13:41', '2016-12-28 10:15:50', '83', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('500', '6', '17', '43.687', '2016-12-28 10:13:41', '2016-12-28 10:15:50', '83', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('501', '6', '37', '36.041', '2016-12-28 10:13:41', '2016-12-28 10:15:50', '83', '85.000', '0');

-- ----------------------------
-- Table structure for `spa_client`
-- ----------------------------
DROP TABLE IF EXISTS `spa_client`;
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

-- ----------------------------
-- Records of spa_client
-- ----------------------------
INSERT INTO `spa_client` VALUES ('6', 'lingz', '30', '2016-11-04 23:21:52', '2016-12-28 10:00:50', '2016-12-28 09:54:49', '', '0', '', '7');
INSERT INTO `spa_client` VALUES ('7', 'duheyu', '25', '2016-11-14 14:05:26', '2016-12-24 13:18:10', '0000-00-00 00:00:00', '广州天河区', '0', '13360579100', '7');
INSERT INTO `spa_client` VALUES ('8', 'hao', '8', '2016-12-26 18:44:33', '2016-12-26 18:46:43', '0000-00-00 00:00:00', '111111', '0', '13312345678', '0');

-- ----------------------------
-- Table structure for `spa_image`
-- ----------------------------
DROP TABLE IF EXISTS `spa_image`;
CREATE TABLE `spa_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='图片信息';

-- ----------------------------
-- Records of spa_image
-- ----------------------------
INSERT INTO `spa_image` VALUES ('1', '/public/images/spa/1482552266503.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552266503.jpg', '0000-00-00 00:00:00', '2016-12-24 12:06:32');
INSERT INTO `spa_image` VALUES ('2', '/public/images/spa/1482552366845.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552366845.jpg', '0000-00-00 00:00:00', '2016-12-24 12:08:12');
INSERT INTO `spa_image` VALUES ('3', '/public/images/spa/1482552733224.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552733224.jpg', '0000-00-00 00:00:00', '2016-12-24 12:14:19');
INSERT INTO `spa_image` VALUES ('4', '/public/images/spa/1482552750605.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552750605.jpg', '0000-00-00 00:00:00', '2016-12-24 12:14:36');
INSERT INTO `spa_image` VALUES ('5', '/public/images/spa/1482552848666.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552848666.jpg', '0000-00-00 00:00:00', '2016-12-24 12:16:14');
INSERT INTO `spa_image` VALUES ('6', '/public/images/spa/1482556393736.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482556393736.jpg', '0000-00-00 00:00:00', '2016-12-24 13:15:19');
INSERT INTO `spa_image` VALUES ('7', '/public/images/spa/1482556553552.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482556553552.jpg', '0000-00-00 00:00:00', '2016-12-24 13:17:59');

-- ----------------------------
-- Table structure for `spa_item_level`
-- ----------------------------
DROP TABLE IF EXISTS `spa_item_level`;
CREATE TABLE `spa_item_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '品项id',
  `gt_score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值(左开)',
  `lt_score` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '分值(右闭)',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='品项阶梯设置';

-- ----------------------------
-- Records of spa_item_level
-- ----------------------------
INSERT INTO `spa_item_level` VALUES ('60', '缺水性肌肤', '4', '20.000', '90.000', '0000-00-00 00:00:00', '2016-12-28 15:20:42');

-- ----------------------------
-- Table structure for `spa_product`
-- ----------------------------
DROP TABLE IF EXISTS `spa_product`;
CREATE TABLE `spa_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '产品名称',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应品项id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `order_no` int(11) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品信息';

-- ----------------------------
-- Records of spa_product
-- ----------------------------
INSERT INTO `spa_product` VALUES ('2', '补水套餐', '4', '2016-11-10 22:06:11', '2016-11-10 22:06:10', '1');

-- ----------------------------
-- Table structure for `spa_product_image`
-- ----------------------------
DROP TABLE IF EXISTS `spa_product_image`;
CREATE TABLE `spa_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='产品图片';

-- ----------------------------
-- Records of spa_product_image
-- ----------------------------
INSERT INTO `spa_product_image` VALUES ('13', '0', '/public/images/spa/G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265406393.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265406393.jpg', '2016-11-16 11:04:06', '2016-11-16 11:04:58');
INSERT INTO `spa_product_image` VALUES ('14', '2', '/public/images/spa/1479265638993.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265638993.jpg', '2016-11-16 11:07:19', '2016-11-16 11:08:14');
INSERT INTO `spa_product_image` VALUES ('15', '0', '/public/images/spa/1482552147854.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552147854.jpg', '2016-12-24 12:02:27', '2016-12-24 12:04:33');
