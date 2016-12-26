/*
Navicat MySQL Data Transfer

Source Server         : 232
Source Server Version : 50173
Source Host           : 192.168.9.232:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-26 13:20:39
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='年龄阶梯参数设置';

-- ----------------------------
-- Records of spa_age_level
-- ----------------------------
INSERT INTO `spa_age_level` VALUES ('32', '1', '7', '8', '9.000', '2016-11-05 00:29:23', '2016-11-05 00:29:23');
INSERT INTO `spa_age_level` VALUES ('48', '4', '20', '50', '78.000', '2016-11-09 22:01:59', '2016-11-09 22:01:59');
INSERT INTO `spa_age_level` VALUES ('53', '17', '20', '40', '80.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_age_level` VALUES ('54', '17', '40', '50', '60.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='检查品项信息';

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='检测记录';

-- ----------------------------
-- Records of spa_check_record
-- ----------------------------
INSERT INTO `spa_check_record` VALUES ('62', '6', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('63', '7', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('64', '7', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('65', '7', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('66', '7', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('67', '6', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('68', '6', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('69', '7', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('70', '7', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('71', '6', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('72', '7', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('73', '7', '2016-11-15 09:56:27', '2016-11-15 09:57:19', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('74', '7', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('75', '7', '2016-11-15 09:57:52', '2016-11-15 09:58:44', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('76', '7', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('77', '6', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('78', '6', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('79', '6', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '0000-00-00 00:00:00', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8 COMMENT='检查结果';

-- ----------------------------
-- Records of spa_check_result
-- ----------------------------
INSERT INTO `spa_check_result` VALUES ('385', '6', '4', '37.910', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '62', '78.000');
INSERT INTO `spa_check_result` VALUES ('386', '6', '30', '35.372', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '62', '78.000');
INSERT INTO `spa_check_result` VALUES ('387', '6', '31', '34.667', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '62', '78.000');
INSERT INTO `spa_check_result` VALUES ('388', '6', '17', '42.768', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '62', '80.000');
INSERT INTO `spa_check_result` VALUES ('389', '6', '35', '42.389', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '62', '80.000');
INSERT INTO `spa_check_result` VALUES ('390', '6', '36', '43.286', '2016-11-14 18:08:57', '2016-11-14 18:09:49', '62', '80.000');
INSERT INTO `spa_check_result` VALUES ('391', '7', '4', '40.694', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '63', '78.000');
INSERT INTO `spa_check_result` VALUES ('392', '7', '30', '43.072', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '63', '78.000');
INSERT INTO `spa_check_result` VALUES ('393', '7', '31', '42.494', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '63', '78.000');
INSERT INTO `spa_check_result` VALUES ('394', '7', '17', '46.829', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '63', '80.000');
INSERT INTO `spa_check_result` VALUES ('395', '7', '35', '49.618', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '63', '80.000');
INSERT INTO `spa_check_result` VALUES ('396', '7', '36', '45.433', '2016-11-14 18:11:27', '2016-11-14 18:12:19', '63', '80.000');
INSERT INTO `spa_check_result` VALUES ('397', '7', '4', '42.729', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '64', '78.000');
INSERT INTO `spa_check_result` VALUES ('398', '7', '30', '45.226', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '64', '78.000');
INSERT INTO `spa_check_result` VALUES ('399', '7', '31', '44.619', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '64', '78.000');
INSERT INTO `spa_check_result` VALUES ('400', '7', '17', '51.512', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '64', '80.000');
INSERT INTO `spa_check_result` VALUES ('401', '7', '35', '54.580', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '64', '80.000');
INSERT INTO `spa_check_result` VALUES ('402', '7', '36', '49.976', '2016-11-14 18:13:00', '2016-11-14 18:13:52', '64', '80.000');
INSERT INTO `spa_check_result` VALUES ('403', '7', '4', '44.865', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '65', '78.000');
INSERT INTO `spa_check_result` VALUES ('404', '7', '30', '47.487', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '65', '78.000');
INSERT INTO `spa_check_result` VALUES ('405', '7', '31', '46.850', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '65', '78.000');
INSERT INTO `spa_check_result` VALUES ('406', '7', '17', '56.663', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '65', '80.000');
INSERT INTO `spa_check_result` VALUES ('407', '7', '35', '60.038', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '65', '80.000');
INSERT INTO `spa_check_result` VALUES ('408', '7', '36', '54.974', '2016-11-14 18:13:18', '2016-11-14 18:14:10', '65', '80.000');
INSERT INTO `spa_check_result` VALUES ('409', '7', '4', '47.108', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '66', '78.000');
INSERT INTO `spa_check_result` VALUES ('410', '7', '30', '49.861', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '66', '78.000');
INSERT INTO `spa_check_result` VALUES ('411', '7', '31', '49.193', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '66', '78.000');
INSERT INTO `spa_check_result` VALUES ('412', '7', '17', '62.329', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '66', '80.000');
INSERT INTO `spa_check_result` VALUES ('413', '7', '35', '66.042', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '66', '80.000');
INSERT INTO `spa_check_result` VALUES ('414', '7', '36', '60.471', '2016-11-14 18:13:46', '2016-11-14 18:14:38', '66', '80.000');
INSERT INTO `spa_check_result` VALUES ('415', '6', '4', '39.806', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '67', '78.000');
INSERT INTO `spa_check_result` VALUES ('416', '6', '30', '37.141', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '67', '78.000');
INSERT INTO `spa_check_result` VALUES ('417', '6', '31', '36.400', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '67', '78.000');
INSERT INTO `spa_check_result` VALUES ('418', '6', '17', '47.045', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '67', '80.000');
INSERT INTO `spa_check_result` VALUES ('419', '6', '35', '46.628', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '67', '80.000');
INSERT INTO `spa_check_result` VALUES ('420', '6', '36', '47.615', '2016-11-14 18:34:48', '2016-11-14 18:35:40', '67', '80.000');
INSERT INTO `spa_check_result` VALUES ('421', '6', '4', '41.796', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '68', '78.000');
INSERT INTO `spa_check_result` VALUES ('422', '6', '30', '38.998', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '68', '78.000');
INSERT INTO `spa_check_result` VALUES ('423', '6', '31', '38.220', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '68', '78.000');
INSERT INTO `spa_check_result` VALUES ('424', '6', '17', '51.750', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '68', '80.000');
INSERT INTO `spa_check_result` VALUES ('425', '6', '35', '51.291', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '68', '80.000');
INSERT INTO `spa_check_result` VALUES ('426', '6', '36', '52.377', '2016-11-14 18:57:39', '2016-11-14 18:58:31', '68', '80.000');
INSERT INTO `spa_check_result` VALUES ('427', '7', '4', '35.615', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '69', '78.000');
INSERT INTO `spa_check_result` VALUES ('428', '7', '30', '37.657', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '69', '78.000');
INSERT INTO `spa_check_result` VALUES ('429', '7', '31', '33.525', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '69', '78.000');
INSERT INTO `spa_check_result` VALUES ('430', '7', '17', '39.278', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '69', '80.000');
INSERT INTO `spa_check_result` VALUES ('431', '7', '35', '42.361', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '69', '80.000');
INSERT INTO `spa_check_result` VALUES ('432', '7', '36', '42.152', '2016-11-15 09:45:29', '2016-11-15 09:46:21', '69', '80.000');
INSERT INTO `spa_check_result` VALUES ('433', '7', '4', '37.396', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '70', '78.000');
INSERT INTO `spa_check_result` VALUES ('434', '7', '30', '39.540', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '70', '78.000');
INSERT INTO `spa_check_result` VALUES ('435', '7', '31', '35.201', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '70', '78.000');
INSERT INTO `spa_check_result` VALUES ('436', '7', '17', '43.206', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '70', '80.000');
INSERT INTO `spa_check_result` VALUES ('437', '7', '35', '46.597', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '70', '80.000');
INSERT INTO `spa_check_result` VALUES ('438', '7', '36', '46.367', '2016-11-15 09:46:29', '2016-11-15 09:47:21', '70', '80.000');
INSERT INTO `spa_check_result` VALUES ('439', '6', '4', '44.767', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '71', '78.000');
INSERT INTO `spa_check_result` VALUES ('440', '6', '30', '44.338', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '71', '78.000');
INSERT INTO `spa_check_result` VALUES ('441', '6', '31', '43.074', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '71', '78.000');
INSERT INTO `spa_check_result` VALUES ('442', '6', '17', '38.297', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '71', '80.000');
INSERT INTO `spa_check_result` VALUES ('443', '6', '35', '36.774', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '71', '80.000');
INSERT INTO `spa_check_result` VALUES ('444', '6', '36', '35.216', '2016-11-15 09:47:51', '2016-11-15 09:48:43', '71', '80.000');
INSERT INTO `spa_check_result` VALUES ('445', '7', '4', '39.266', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '72', '78.000');
INSERT INTO `spa_check_result` VALUES ('446', '7', '30', '41.517', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '72', '78.000');
INSERT INTO `spa_check_result` VALUES ('447', '7', '31', '36.961', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '72', '78.000');
INSERT INTO `spa_check_result` VALUES ('448', '7', '17', '47.527', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '72', '80.000');
INSERT INTO `spa_check_result` VALUES ('449', '7', '35', '51.257', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '72', '80.000');
INSERT INTO `spa_check_result` VALUES ('450', '7', '36', '51.004', '2016-11-15 09:53:45', '2016-11-15 09:54:37', '72', '80.000');
INSERT INTO `spa_check_result` VALUES ('451', '7', '4', '41.229', '2016-11-15 09:56:27', '2016-11-15 09:57:20', '73', '78.000');
INSERT INTO `spa_check_result` VALUES ('452', '7', '30', '43.593', '2016-11-15 09:56:27', '2016-11-15 09:57:20', '73', '78.000');
INSERT INTO `spa_check_result` VALUES ('453', '7', '31', '38.809', '2016-11-15 09:56:27', '2016-11-15 09:57:20', '73', '78.000');
INSERT INTO `spa_check_result` VALUES ('454', '7', '17', '52.280', '2016-11-15 09:56:27', '2016-11-15 09:57:20', '73', '80.000');
INSERT INTO `spa_check_result` VALUES ('455', '7', '35', '56.383', '2016-11-15 09:56:27', '2016-11-15 09:57:20', '73', '80.000');
INSERT INTO `spa_check_result` VALUES ('456', '7', '36', '56.104', '2016-11-15 09:56:27', '2016-11-15 09:57:20', '73', '80.000');
INSERT INTO `spa_check_result` VALUES ('457', '7', '4', '43.290', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '74', '78.000');
INSERT INTO `spa_check_result` VALUES ('458', '7', '30', '45.773', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '74', '78.000');
INSERT INTO `spa_check_result` VALUES ('459', '7', '31', '40.749', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '74', '78.000');
INSERT INTO `spa_check_result` VALUES ('460', '7', '17', '57.508', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '74', '80.000');
INSERT INTO `spa_check_result` VALUES ('461', '7', '35', '62.021', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '74', '80.000');
INSERT INTO `spa_check_result` VALUES ('462', '7', '36', '61.714', '2016-11-15 09:57:41', '2016-11-15 09:58:33', '74', '80.000');
INSERT INTO `spa_check_result` VALUES ('463', '7', '4', '45.455', '2016-11-15 09:57:52', '2016-11-15 09:58:44', '75', '78.000');
INSERT INTO `spa_check_result` VALUES ('464', '7', '30', '48.062', '2016-11-15 09:57:52', '2016-11-15 09:58:44', '75', '78.000');
INSERT INTO `spa_check_result` VALUES ('465', '7', '31', '42.786', '2016-11-15 09:57:52', '2016-11-15 09:58:45', '75', '78.000');
INSERT INTO `spa_check_result` VALUES ('466', '7', '17', '63.259', '2016-11-15 09:57:52', '2016-11-15 09:58:45', '75', '80.000');
INSERT INTO `spa_check_result` VALUES ('467', '7', '35', '68.223', '2016-11-15 09:57:52', '2016-11-15 09:58:45', '75', '80.000');
INSERT INTO `spa_check_result` VALUES ('468', '7', '36', '67.885', '2016-11-15 09:57:52', '2016-11-15 09:58:45', '75', '80.000');
INSERT INTO `spa_check_result` VALUES ('469', '7', '4', '47.728', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '76', '78.000');
INSERT INTO `spa_check_result` VALUES ('470', '7', '30', '50.465', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '76', '78.000');
INSERT INTO `spa_check_result` VALUES ('471', '7', '31', '44.925', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '76', '78.000');
INSERT INTO `spa_check_result` VALUES ('472', '7', '17', '69.585', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '76', '80.000');
INSERT INTO `spa_check_result` VALUES ('473', '7', '35', '75.045', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '76', '80.000');
INSERT INTO `spa_check_result` VALUES ('474', '7', '36', '74.674', '2016-11-15 09:59:38', '2016-11-15 10:00:31', '76', '80.000');
INSERT INTO `spa_check_result` VALUES ('475', '6', '4', '47.005', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '77', '78.000');
INSERT INTO `spa_check_result` VALUES ('476', '6', '30', '46.555', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '77', '78.000');
INSERT INTO `spa_check_result` VALUES ('477', '6', '31', '45.228', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '77', '78.000');
INSERT INTO `spa_check_result` VALUES ('478', '6', '17', '42.127', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '77', '80.000');
INSERT INTO `spa_check_result` VALUES ('479', '6', '35', '40.451', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '77', '80.000');
INSERT INTO `spa_check_result` VALUES ('480', '6', '36', '38.738', '2016-11-15 11:35:51', '2016-11-15 11:36:43', '77', '80.000');
INSERT INTO `spa_check_result` VALUES ('481', '6', '4', '49.355', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '78', '78.000');
INSERT INTO `spa_check_result` VALUES ('482', '6', '30', '48.883', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '78', '78.000');
INSERT INTO `spa_check_result` VALUES ('483', '6', '31', '47.489', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '78', '78.000');
INSERT INTO `spa_check_result` VALUES ('484', '6', '17', '46.340', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '78', '80.000');
INSERT INTO `spa_check_result` VALUES ('485', '6', '35', '44.496', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '78', '80.000');
INSERT INTO `spa_check_result` VALUES ('486', '6', '36', '42.612', '2016-11-15 12:06:24', '2016-11-15 12:07:16', '78', '80.000');
INSERT INTO `spa_check_result` VALUES ('487', '6', '4', '51.823', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '79', '78.000');
INSERT INTO `spa_check_result` VALUES ('488', '6', '30', '51.327', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '79', '78.000');
INSERT INTO `spa_check_result` VALUES ('489', '6', '31', '49.863', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '79', '78.000');
INSERT INTO `spa_check_result` VALUES ('490', '6', '17', '50.974', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '79', '80.000');
INSERT INTO `spa_check_result` VALUES ('491', '6', '35', '48.946', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '79', '80.000');
INSERT INTO `spa_check_result` VALUES ('492', '6', '36', '46.873', '2016-11-15 12:08:23', '2016-11-15 12:09:15', '79', '80.000');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户信息';

-- ----------------------------
-- Records of spa_client
-- ----------------------------
INSERT INTO `spa_client` VALUES ('6', 'lingz', '30', '2016-11-04 23:21:52', '2016-11-04 23:21:51', '0000-00-00 00:00:00', '', '0', '', '0');
INSERT INTO `spa_client` VALUES ('7', 'duheyu', '25', '2016-11-14 14:05:26', '2016-12-24 13:18:10', '0000-00-00 00:00:00', '广州天河区', '0', '13360579100', '7');

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
