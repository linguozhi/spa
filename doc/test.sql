/*
Navicat MySQL Data Transfer

Source Server         : 232
Source Server Version : 50173
Source Host           : 192.168.9.232:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-02-23 18:25:41
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='年龄阶梯参数设置';

-- ----------------------------
-- Records of spa_age_level
-- ----------------------------
INSERT INTO `spa_age_level` VALUES ('32', '1', '7', '8', '9.000', '2016-11-05 00:29:23', '2016-11-05 00:29:23');
INSERT INTO `spa_age_level` VALUES ('48', '4', '20', '50', '78.000', '2016-11-09 22:01:59', '2016-11-09 22:01:59');
INSERT INTO `spa_age_level` VALUES ('53', '17', '20', '40', '80.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_age_level` VALUES ('54', '17', '40', '50', '60.000', '2016-11-10 22:53:20', '2016-11-10 22:53:20');
INSERT INTO `spa_age_level` VALUES ('60', '37', '0', '20', '90.000', '2016-12-30 11:19:44', '2016-12-30 11:19:43');
INSERT INTO `spa_age_level` VALUES ('61', '37', '21', '30', '85.000', '2016-12-30 11:19:44', '2016-12-30 11:19:43');
INSERT INTO `spa_age_level` VALUES ('62', '37', '31', '40', '80.000', '2016-12-30 11:19:44', '2016-12-30 11:19:43');
INSERT INTO `spa_age_level` VALUES ('63', '37', '41', '80', '70.000', '2016-12-30 11:19:44', '2016-12-30 11:19:43');
INSERT INTO `spa_age_level` VALUES ('64', '37', '81', '120', '60.000', '2016-12-30 11:19:44', '2016-12-30 11:19:43');

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
INSERT INTO `spa_check_item` VALUES ('37', '紧致', '4', '30.000', '0.400', '0.100', '0.100', '0.010', '0.100', '0', '0.000', '2016-12-28 10:05:04', '2016-12-30 11:19:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='检测记录';

-- ----------------------------
-- Records of spa_check_record
-- ----------------------------
INSERT INTO `spa_check_record` VALUES ('80', '7', '2016-12-27 17:36:48', '2016-12-27 17:38:57', '0000-00-00 00:00:00', '0');
INSERT INTO `spa_check_record` VALUES ('81', '6', '2016-12-27 17:41:03', '2016-12-27 17:43:12', '0000-00-00 00:00:00', '1');
INSERT INTO `spa_check_record` VALUES ('82', '6', '2016-12-27 17:41:36', '2016-12-27 17:43:46', '2016-12-27 17:41:03', '2');
INSERT INTO `spa_check_record` VALUES ('83', '6', '2016-12-28 10:13:41', '2016-12-28 10:15:50', '2016-12-27 17:41:36', '3');
INSERT INTO `spa_check_record` VALUES ('84', '6', '2016-12-29 17:21:07', '2016-12-29 17:23:22', '2016-12-28 10:13:41', '4');
INSERT INTO `spa_check_record` VALUES ('85', '6', '2016-12-29 17:22:09', '2016-12-29 17:24:24', '2016-12-29 17:21:07', '5');
INSERT INTO `spa_check_record` VALUES ('86', '6', '2016-12-29 17:22:39', '2016-12-29 17:24:54', '2016-12-29 17:22:09', '6');
INSERT INTO `spa_check_record` VALUES ('87', '6', '2016-12-29 17:24:02', '2016-12-29 17:26:17', '2016-12-29 17:22:39', '7');
INSERT INTO `spa_check_record` VALUES ('88', '6', '2016-12-29 17:26:59', '2016-12-29 17:29:14', '2016-12-29 17:24:02', '8');
INSERT INTO `spa_check_record` VALUES ('89', '6', '2016-12-29 17:28:12', '2016-12-29 17:30:27', '2016-12-29 17:26:59', '9');
INSERT INTO `spa_check_record` VALUES ('90', '6', '2016-12-29 17:29:01', '2016-12-29 17:31:16', '2016-12-29 17:28:12', '10');
INSERT INTO `spa_check_record` VALUES ('91', '6', '2016-12-29 22:34:37', '2016-12-29 22:34:37', '2016-12-29 17:29:01', '11');
INSERT INTO `spa_check_record` VALUES ('92', '6', '2016-12-29 22:34:55', '2016-12-29 22:34:55', '2016-12-29 22:34:37', '12');
INSERT INTO `spa_check_record` VALUES ('93', '6', '2016-12-29 22:36:24', '2016-12-29 22:36:24', '2016-12-29 22:34:55', '13');
INSERT INTO `spa_check_record` VALUES ('94', '6', '2016-12-29 22:37:00', '2016-12-29 22:36:59', '2016-12-29 22:36:24', '14');
INSERT INTO `spa_check_record` VALUES ('95', '6', '2016-12-29 22:38:22', '2016-12-29 22:38:21', '2016-12-29 22:37:00', '15');
INSERT INTO `spa_check_record` VALUES ('96', '7', '2016-12-29 22:38:44', '2016-12-29 22:38:43', '2016-12-27 17:36:48', '1');
INSERT INTO `spa_check_record` VALUES ('97', '6', '2016-12-29 22:38:48', '2016-12-29 22:38:47', '2016-12-29 22:38:22', '16');
INSERT INTO `spa_check_record` VALUES ('98', '7', '2016-12-29 22:38:51', '2016-12-29 22:38:50', '2016-12-29 22:38:44', '2');
INSERT INTO `spa_check_record` VALUES ('99', '6', '2016-12-29 22:39:07', '2016-12-29 22:39:06', '2016-12-29 22:38:48', '17');
INSERT INTO `spa_check_record` VALUES ('100', '6', '2016-12-29 22:39:09', '2016-12-29 22:39:08', '2016-12-29 22:39:07', '18');
INSERT INTO `spa_check_record` VALUES ('101', '6', '2016-12-29 22:39:11', '2016-12-29 22:39:10', '2016-12-29 22:39:09', '19');
INSERT INTO `spa_check_record` VALUES ('102', '7', '2016-12-29 22:39:13', '2016-12-29 22:39:13', '2016-12-29 22:38:51', '3');
INSERT INTO `spa_check_record` VALUES ('103', '7', '2016-12-29 22:39:15', '2016-12-29 22:39:15', '2016-12-29 22:39:13', '4');
INSERT INTO `spa_check_record` VALUES ('104', '7', '2016-12-29 22:39:16', '2016-12-29 22:39:16', '2016-12-29 22:39:15', '5');
INSERT INTO `spa_check_record` VALUES ('105', '7', '2016-12-29 22:39:18', '2016-12-29 22:39:17', '2016-12-29 22:39:16', '6');
INSERT INTO `spa_check_record` VALUES ('106', '6', '2016-12-29 22:39:43', '2016-12-29 22:39:43', '2016-12-29 22:39:11', '20');
INSERT INTO `spa_check_record` VALUES ('107', '7', '2016-12-29 23:02:23', '2016-12-29 23:02:22', '2016-12-29 22:39:18', '7');
INSERT INTO `spa_check_record` VALUES ('108', '7', '2016-12-29 23:04:31', '2016-12-29 23:04:31', '2016-12-29 23:02:23', '8');
INSERT INTO `spa_check_record` VALUES ('109', '7', '2016-12-29 23:04:34', '2016-12-29 23:04:33', '2016-12-29 23:04:31', '9');
INSERT INTO `spa_check_record` VALUES ('110', '7', '2016-12-29 23:05:56', '2016-12-29 23:05:55', '2016-12-29 23:04:34', '10');
INSERT INTO `spa_check_record` VALUES ('111', '7', '2016-12-30 10:26:18', '2016-12-30 10:26:17', '2016-12-29 23:05:56', '11');
INSERT INTO `spa_check_record` VALUES ('112', '6', '2016-12-30 10:41:41', '2016-12-30 10:41:41', '2016-12-29 22:39:43', '21');
INSERT INTO `spa_check_record` VALUES ('113', '7', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '2016-12-30 10:26:18', '12');
INSERT INTO `spa_check_record` VALUES ('114', '7', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '13');
INSERT INTO `spa_check_record` VALUES ('115', '6', '2016-12-30 11:28:26', '2016-12-30 11:28:25', '2016-12-30 10:41:41', '22');
INSERT INTO `spa_check_record` VALUES ('116', '6', '2016-12-30 11:36:57', '2016-12-30 11:36:56', '2016-12-30 11:28:26', '23');
INSERT INTO `spa_check_record` VALUES ('117', '6', '2016-12-30 11:43:12', '2016-12-30 11:45:29', '2016-12-30 11:36:57', '24');
INSERT INTO `spa_check_record` VALUES ('118', '8', '2016-12-30 11:48:16', '2016-12-30 11:50:33', '0000-00-00 00:00:00', '1');
INSERT INTO `spa_check_record` VALUES ('119', '6', '2016-12-30 11:48:41', '2016-12-30 11:50:58', '2016-12-30 11:43:12', '25');

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
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8 COMMENT='检查结果';

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
INSERT INTO `spa_check_result` VALUES ('502', '7', '4', '42.336', '2016-12-29 22:38:44', '2016-12-29 22:38:43', '96', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('503', '7', '17', '45.930', '2016-12-29 22:38:44', '2016-12-29 22:38:43', '96', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('504', '7', '37', '41.134', '2016-12-29 22:38:44', '2016-12-29 22:38:43', '96', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('505', '7', '4', '44.453', '2016-12-29 22:38:51', '2016-12-29 22:38:50', '98', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('506', '7', '17', '50.523', '2016-12-29 22:38:51', '2016-12-29 22:38:50', '98', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('507', '7', '37', '45.247', '2016-12-29 22:38:51', '2016-12-29 22:38:50', '98', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('508', '7', '4', '46.676', '2016-12-29 22:39:13', '2016-12-29 22:39:13', '102', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('509', '7', '17', '55.575', '2016-12-29 22:39:13', '2016-12-29 22:39:13', '102', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('510', '7', '37', '49.772', '2016-12-29 22:39:13', '2016-12-29 22:39:13', '102', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('511', '7', '4', '49.010', '2016-12-29 22:39:15', '2016-12-29 22:39:15', '103', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('512', '7', '17', '61.133', '2016-12-29 22:39:15', '2016-12-29 22:39:15', '103', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('513', '7', '37', '54.749', '2016-12-29 22:39:15', '2016-12-29 22:39:15', '103', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('514', '7', '4', '51.461', '2016-12-29 22:39:16', '2016-12-29 22:39:16', '104', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('515', '7', '17', '67.246', '2016-12-29 22:39:16', '2016-12-29 22:39:16', '104', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('516', '7', '37', '60.224', '2016-12-29 22:39:16', '2016-12-29 22:39:16', '104', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('517', '7', '4', '54.034', '2016-12-29 22:39:18', '2016-12-29 22:39:17', '105', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('518', '7', '17', '73.971', '2016-12-29 22:39:18', '2016-12-29 22:39:17', '105', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('519', '7', '37', '66.246', '2016-12-29 22:39:18', '2016-12-29 22:39:17', '105', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('520', '7', '4', '56.736', '2016-12-29 23:02:23', '2016-12-29 23:02:22', '107', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('521', '7', '17', '81.368', '2016-12-29 23:02:23', '2016-12-29 23:02:22', '107', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('522', '7', '37', '72.871', '2016-12-29 23:02:23', '2016-12-29 23:02:22', '107', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('523', '7', '4', '59.573', '2016-12-29 23:04:31', '2016-12-29 23:04:31', '108', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('524', '7', '17', '89.505', '2016-12-29 23:04:31', '2016-12-29 23:04:31', '108', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('525', '7', '37', '80.158', '2016-12-29 23:04:31', '2016-12-29 23:04:31', '108', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('526', '7', '4', '62.552', '2016-12-29 23:04:34', '2016-12-29 23:04:33', '109', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('527', '7', '17', '98.456', '2016-12-29 23:04:34', '2016-12-29 23:04:33', '109', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('528', '7', '37', '88.174', '2016-12-29 23:04:34', '2016-12-29 23:04:33', '109', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('529', '7', '4', '65.680', '2016-12-29 23:05:56', '2016-12-29 23:05:55', '110', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('530', '7', '17', '108.302', '2016-12-29 23:05:56', '2016-12-29 23:05:55', '110', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('531', '7', '37', '96.991', '2016-12-29 23:05:56', '2016-12-29 23:05:55', '110', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('532', '7', '4', '32.047', '2016-12-30 10:26:18', '2016-12-30 10:26:17', '111', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('533', '7', '17', '39.918', '2016-12-30 10:26:18', '2016-12-30 10:26:17', '111', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('534', '7', '37', '30.065', '2016-12-30 10:26:18', '2016-12-30 10:26:17', '111', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('535', '6', '4', '34.583', '2016-12-30 10:41:41', '2016-12-30 10:41:41', '112', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('536', '6', '17', '37.275', '2016-12-30 10:41:41', '2016-12-30 10:41:41', '112', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('537', '6', '37', '33.996', '2016-12-30 10:41:41', '2016-12-30 10:41:41', '112', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('538', '7', '4', '33.649', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '113', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('539', '7', '17', '43.910', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '113', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('540', '7', '37', '33.072', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '113', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('541', '7', '4', '35.331', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '114', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('542', '7', '17', '48.301', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '114', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('543', '7', '37', '36.379', '2016-12-30 10:41:48', '2016-12-30 10:41:48', '114', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('544', '6', '4', '36.312', '2016-12-30 11:28:26', '2016-12-30 11:28:25', '115', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('545', '6', '17', '41.003', '2016-12-30 11:28:26', '2016-12-30 11:28:25', '115', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('546', '6', '37', '37.396', '2016-12-30 11:28:26', '2016-12-30 11:28:25', '115', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('547', '6', '4', '38.128', '2016-12-30 11:36:57', '2016-12-30 11:36:56', '116', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('548', '6', '17', '45.103', '2016-12-30 11:36:57', '2016-12-30 11:36:56', '116', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('549', '6', '37', '41.136', '2016-12-30 11:36:57', '2016-12-30 11:36:56', '116', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('550', '6', '4', '40.034', '2016-12-30 11:47:19', '2016-12-30 11:49:36', '117', '78.000', '0');
INSERT INTO `spa_check_result` VALUES ('551', '6', '17', '49.613', '2016-12-30 11:47:19', '2016-12-30 11:49:36', '117', '80.000', '0');
INSERT INTO `spa_check_result` VALUES ('552', '6', '37', '45.250', '2016-12-30 11:47:19', '2016-12-30 11:49:36', '117', '85.000', '0');
INSERT INTO `spa_check_result` VALUES ('553', '8', '37', '32.002', '2016-12-30 11:48:19', '2016-12-30 11:50:36', '118', '90.000', '65');
INSERT INTO `spa_check_result` VALUES ('554', '6', '4', '42.036', '2016-12-30 11:48:44', '2016-12-30 11:51:01', '119', '78.000', '61');
INSERT INTO `spa_check_result` VALUES ('555', '6', '17', '54.574', '2016-12-30 11:48:44', '2016-12-30 11:51:01', '119', '80.000', '70');
INSERT INTO `spa_check_result` VALUES ('556', '6', '37', '49.775', '2016-12-30 11:48:44', '2016-12-30 11:51:01', '119', '85.000', '65');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='品项阶梯设置';

-- ----------------------------
-- Records of spa_item_level
-- ----------------------------
INSERT INTO `spa_item_level` VALUES ('60', '极度缺水性肌肤', '4', '0.000', '25.000', '0000-00-00 00:00:00', '2016-12-30 11:21:49');
INSERT INTO `spa_item_level` VALUES ('61', '缺水性肌肤', '4', '26.000', '50.000', '0000-00-00 00:00:00', '2016-12-30 11:22:00');
INSERT INTO `spa_item_level` VALUES ('62', '轻度缺水性肌肤', '4', '51.000', '75.000', '0000-00-00 00:00:00', '2016-12-30 11:22:09');
INSERT INTO `spa_item_level` VALUES ('63', '水润肌肤', '4', '76.000', '100.000', '0000-00-00 00:00:00', '2016-12-30 11:22:38');
INSERT INTO `spa_item_level` VALUES ('64', '轻度松弛皮肤', '37', '0.000', '25.000', '0000-00-00 00:00:00', '2016-12-30 11:22:22');
INSERT INTO `spa_item_level` VALUES ('65', '松弛皮肤', '37', '26.000', '50.000', '0000-00-00 00:00:00', '2016-12-30 11:22:27');
INSERT INTO `spa_item_level` VALUES ('66', '紧致度一般', '37', '51.000', '75.000', '0000-00-00 00:00:00', '2016-12-30 11:22:32');
INSERT INTO `spa_item_level` VALUES ('67', '紧致度良好', '37', '76.000', '10.000', '0000-00-00 00:00:00', '2016-12-30 11:22:43');
INSERT INTO `spa_item_level` VALUES ('68', '非常暗淡', '17', '0.000', '25.000', '0000-00-00 00:00:00', '2016-12-30 11:23:42');
INSERT INTO `spa_item_level` VALUES ('69', '略显暗淡', '17', '26.000', '50.000', '0000-00-00 00:00:00', '2016-12-30 11:23:59');
INSERT INTO `spa_item_level` VALUES ('70', '肤色红润', '17', '51.000', '75.000', '0000-00-00 00:00:00', '2016-12-30 11:24:47');
INSERT INTO `spa_item_level` VALUES ('71', '非常红润', '17', '76.000', '100.000', '0000-00-00 00:00:00', '2016-12-30 11:25:00');

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
  `image_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='产品图片';

-- ----------------------------
-- Records of spa_product_image
-- ----------------------------

-- ----------------------------
-- Table structure for `spa_product_image_copy`
-- ----------------------------
DROP TABLE IF EXISTS `spa_product_image_copy`;
CREATE TABLE `spa_product_image_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `short_url` varchar(255) NOT NULL DEFAULT '' COMMENT '短地址',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整地址',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='产品图片';

-- ----------------------------
-- Records of spa_product_image_copy
-- ----------------------------
INSERT INTO `spa_product_image_copy` VALUES ('13', '0', '/public/images/spa/G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265406393.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265406393.jpg', '2016-11-16 11:04:06', '2016-11-16 11:04:58');
INSERT INTO `spa_product_image_copy` VALUES ('14', '2', '/public/images/spa/1479265638993.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1479265638993.jpg', '2016-11-16 11:07:19', '2016-11-16 11:08:14');
INSERT INTO `spa_product_image_copy` VALUES ('15', '0', '/public/images/spa/1482552147854.jpg', 'G:\\project\\spa\\src\\main\\webapp\\public\\images\\spa\\1482552147854.jpg', '2016-12-24 12:02:27', '2016-12-24 12:04:33');

-- ----------------------------
-- Table structure for `u_permission`
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_permission
-- ----------------------------
INSERT INTO `u_permission` VALUES ('4', '/permission/index.shtml', '权限列表');
INSERT INTO `u_permission` VALUES ('6', '/permission/addPermission.shtml', '权限添加');
INSERT INTO `u_permission` VALUES ('7', '/permission/deletePermissionById.shtml', '权限删除');
INSERT INTO `u_permission` VALUES ('8', '/member/list.shtml', '用户列表');
INSERT INTO `u_permission` VALUES ('9', '/member/online.shtml', '在线用户');
INSERT INTO `u_permission` VALUES ('10', '/member/changeSessionStatus.shtml', '用户Session踢出');
INSERT INTO `u_permission` VALUES ('11', '/member/forbidUserById.shtml', '用户激活&禁止');
INSERT INTO `u_permission` VALUES ('12', '/member/deleteUserById.shtml', '用户删除');
INSERT INTO `u_permission` VALUES ('13', '/permission/addPermission2Role.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('14', '/role/clearRoleByUserIds.shtml', '用户角色分配清空');
INSERT INTO `u_permission` VALUES ('15', '/role/addRole2User.shtml', '角色分配保存');
INSERT INTO `u_permission` VALUES ('16', '/role/deleteRoleById.shtml', '角色列表删除');
INSERT INTO `u_permission` VALUES ('17', '/role/addRole.shtml', '角色列表添加');
INSERT INTO `u_permission` VALUES ('18', '/role/index.shtml', '角色列表');
INSERT INTO `u_permission` VALUES ('19', '/permission/allocation.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('20', '/role/allocation.shtml', '角色分配');

-- ----------------------------
-- Table structure for `u_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `type` varchar(10) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '系统管理员', '888888');
INSERT INTO `u_role` VALUES ('3', '权限角色', '100003');
INSERT INTO `u_role` VALUES ('4', '用户中心', '100002');

-- ----------------------------
-- Table structure for `u_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_permission
-- ----------------------------
INSERT INTO `u_role_permission` VALUES ('4', '8');
INSERT INTO `u_role_permission` VALUES ('4', '9');
INSERT INTO `u_role_permission` VALUES ('4', '10');
INSERT INTO `u_role_permission` VALUES ('4', '11');
INSERT INTO `u_role_permission` VALUES ('4', '12');
INSERT INTO `u_role_permission` VALUES ('3', '4');
INSERT INTO `u_role_permission` VALUES ('3', '6');
INSERT INTO `u_role_permission` VALUES ('3', '7');
INSERT INTO `u_role_permission` VALUES ('3', '13');
INSERT INTO `u_role_permission` VALUES ('3', '14');
INSERT INTO `u_role_permission` VALUES ('3', '15');
INSERT INTO `u_role_permission` VALUES ('3', '16');
INSERT INTO `u_role_permission` VALUES ('3', '17');
INSERT INTO `u_role_permission` VALUES ('3', '18');
INSERT INTO `u_role_permission` VALUES ('3', '19');
INSERT INTO `u_role_permission` VALUES ('3', '20');
INSERT INTO `u_role_permission` VALUES ('1', '4');
INSERT INTO `u_role_permission` VALUES ('1', '6');
INSERT INTO `u_role_permission` VALUES ('1', '7');
INSERT INTO `u_role_permission` VALUES ('1', '8');
INSERT INTO `u_role_permission` VALUES ('1', '9');
INSERT INTO `u_role_permission` VALUES ('1', '10');
INSERT INTO `u_role_permission` VALUES ('1', '11');
INSERT INTO `u_role_permission` VALUES ('1', '12');
INSERT INTO `u_role_permission` VALUES ('1', '13');
INSERT INTO `u_role_permission` VALUES ('1', '14');
INSERT INTO `u_role_permission` VALUES ('1', '15');
INSERT INTO `u_role_permission` VALUES ('1', '16');
INSERT INTO `u_role_permission` VALUES ('1', '17');
INSERT INTO `u_role_permission` VALUES ('1', '18');
INSERT INTO `u_role_permission` VALUES ('1', '19');
INSERT INTO `u_role_permission` VALUES ('1', '20');

-- ----------------------------
-- Table structure for `u_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` bigint(1) DEFAULT '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', '管理员', 'admin', '57eb72e6b78a87a12d46a7f5e9315138', '2016-06-16 11:15:33', '2016-06-16 11:24:10', '1');
INSERT INTO `u_user` VALUES ('11', 'soso', '8446666@qq.com', 'd57ffbe486910dd5b26d0167d034f9ad', '2016-05-26 20:50:54', '2016-06-16 11:24:35', '1');
INSERT INTO `u_user` VALUES ('12', '8446666', '8446666', '4afdc875a67a55528c224ce088be2ab8', '2016-05-27 22:34:19', '2016-06-15 17:03:16', '1');
INSERT INTO `u_user` VALUES ('15', 'lingz', 'lingz', 'e10adc3949ba59abbe56e057f20f883e', null, '2017-02-23 18:09:25', '1');

-- ----------------------------
-- Table structure for `u_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `rid` bigint(20) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO `u_user_role` VALUES ('12', '4');
INSERT INTO `u_user_role` VALUES ('11', '3');
INSERT INTO `u_user_role` VALUES ('11', '4');
INSERT INTO `u_user_role` VALUES ('1', '1');
