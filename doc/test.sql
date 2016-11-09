/*
Navicat MySQL Data Transfer

Source Server         : 232
Source Server Version : 50173
Source Host           : 192.168.9.232:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-11-09 18:54:27
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='年龄阶梯参数设置';

-- ----------------------------
-- Records of spa_age_level
-- ----------------------------
INSERT INTO `spa_age_level` VALUES ('32', '1', '7', '8', '9.000', '2016-11-05 00:29:23', '2016-11-05 00:29:23');
INSERT INTO `spa_age_level` VALUES ('38', '4', '20', '50', '78.000', '2016-11-08 21:55:59', '2016-11-08 21:55:58');
INSERT INTO `spa_age_level` VALUES ('39', '17', '20', '40', '80.000', '2016-11-08 21:57:20', '2016-11-08 21:57:19');
INSERT INTO `spa_age_level` VALUES ('40', '17', '40', '50', '60.000', '2016-11-08 21:57:20', '2016-11-08 21:57:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='检查品项信息';

-- ----------------------------
-- Records of spa_check_item
-- ----------------------------
INSERT INTO `spa_check_item` VALUES ('2', 'www', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0000-00-00 00:00:00', '2016-11-05 00:29:28');
INSERT INTO `spa_check_item` VALUES ('3', 'ssds', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '1', '0.000', '0000-00-00 00:00:00', '2016-11-05 00:29:28');
INSERT INTO `spa_check_item` VALUES ('4', '水分', '2', '0.050', '0.500', '0.100', '0.050', '0.050', '0.050', '0', '0.000', '2016-11-05 01:01:01', '2016-11-08 21:55:58');
INSERT INTO `spa_check_item` VALUES ('15', '11', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '4', '0.000', '0000-00-00 00:00:00', '2016-11-08 21:55:58');
INSERT INTO `spa_check_item` VALUES ('16', '22', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '4', '0.000', '0000-00-00 00:00:00', '2016-11-08 21:55:58');
INSERT INTO `spa_check_item` VALUES ('17', '光泽', '2', '0.500', '0.400', '0.100', '0.100', '0.010', '0.100', '0', '0.000', '2016-11-08 21:57:20', '2016-11-08 21:57:19');
INSERT INTO `spa_check_item` VALUES ('18', '光泽1', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '17', '0.000', '0000-00-00 00:00:00', '2016-11-08 21:57:19');
INSERT INTO `spa_check_item` VALUES ('19', '光泽2', '0', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '17', '0.000', '0000-00-00 00:00:00', '2016-11-08 21:57:19');

-- ----------------------------
-- Table structure for `spa_check_record`
-- ----------------------------
DROP TABLE IF EXISTS `spa_check_record`;
CREATE TABLE `spa_check_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `client_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检测记录';

-- ----------------------------
-- Records of spa_check_record
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='检查结果';

-- ----------------------------
-- Records of spa_check_result
-- ----------------------------
INSERT INTO `spa_check_result` VALUES ('13', '6', '4', '35.311', '2016-11-08 21:58:17', '2016-11-08 21:58:17', '0');
INSERT INTO `spa_check_result` VALUES ('14', '6', '15', '32.688', '2016-11-08 21:58:23', '2016-11-08 21:58:23', '0');
INSERT INTO `spa_check_result` VALUES ('15', '6', '16', '38.294', '2016-11-08 21:58:23', '2016-11-08 21:58:23', '0');
INSERT INTO `spa_check_result` VALUES ('16', '6', '17', '38.507', '2016-11-08 21:58:23', '2016-11-08 21:58:23', '0');
INSERT INTO `spa_check_result` VALUES ('17', '6', '18', '41.584', '2016-11-08 21:58:23', '2016-11-08 21:58:23', '0');
INSERT INTO `spa_check_result` VALUES ('18', '6', '19', '35.264', '2016-11-08 21:58:23', '2016-11-08 21:58:23', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客户信息';

-- ----------------------------
-- Records of spa_client
-- ----------------------------
INSERT INTO `spa_client` VALUES ('4', 'miss liu', '22', '2016-11-03 17:31:26', '2016-11-03 17:31:57');
INSERT INTO `spa_client` VALUES ('5', 'miss liu', '22', '2016-11-03 17:32:09', '2016-11-03 17:32:40');
INSERT INTO `spa_client` VALUES ('6', 'lingz', '30', '2016-11-04 23:21:52', '2016-11-04 23:21:51');
