
/*
Navicat MySQL Data Transfer

Source Server         : fcs
Source Server Version : 50112
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50112
File Encoding         : 65001

Date: 2014-08-04 17:06:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publishId` int(11) DEFAULT NULL,
  `imgName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book` (`publishId`),
  CONSTRAINT `fk_book` FOREIGN KEY (`publishId`) REFERENCES `publish` (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'think in java', 'stvten', '1', '1');
INSERT INTO `book` VALUES ('2', 'think in c++', 'Bruck', '2', 'ly');
INSERT INTO `book` VALUES ('6', '妹妹坐船头', '我写的', '1', '3');
INSERT INTO `book` VALUES ('9', '马航', '詹姆斯', '2', '4');
INSERT INTO `book` VALUES ('12', 'Java之父', '詹姆斯格林', '3', '5');
INSERT INTO `book` VALUES ('13', '风清扬', '格林', '1', '6');
INSERT INTO `book` VALUES ('14', '风神', '盛大', '2', '7');
INSERT INTO `book` VALUES ('15', '风雷镇', 'ssd', '4', '8');
INSERT INTO `book` VALUES ('17', 'wepull', '冯飞', '3', '9');
INSERT INTO `book` VALUES ('18', 'java编程思想', 'Bruck', '3', '10');
INSERT INTO `book` VALUES ('20', 'C专家编程', '国外', '2', '11');
INSERT INTO `book` VALUES ('21', 'C程序设计', '马士兵', '1', '12');
INSERT INTO `book` VALUES ('22', '铁路修建方法', '刘铁男', '1', '13');
INSERT INTO `book` VALUES ('23', '逢赌必输', '冯长晟', '3', '14');
INSERT INTO `book` VALUES ('24', '风清扬', '疯长', '2', '15');
INSERT INTO `book` VALUES ('25', '好汉饶命', '刘永泰', '2', 'ly');
INSERT INTO `book` VALUES ('26', '未眠', '豆腐哥', '3', '17');

-- ----------------------------
-- Table structure for `publish`
-- ----------------------------
DROP TABLE IF EXISTS `publish`;
CREATE TABLE `publish` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publish
-- ----------------------------
INSERT INTO `publish` VALUES ('1', '中信出版社');
INSERT INTO `publish` VALUES ('2', '清华大学出版社');
INSERT INTO `publish` VALUES ('3', '华章出版社');
INSERT INTO `publish` VALUES ('4', '铁道出版社');
INSERT INTO `publish` VALUES ('5', '高等教育出版社');
INSERT INTO `publish` VALUES ('6', '大晟出版社');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(11) NOT NULL,
  `r_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'nomal');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(50) NOT NULL,
  `u_pass` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`u_id`),
  KEY `pk_role` (`roleId`),
  CONSTRAINT `pk_role` FOREIGN KEY (`roleId`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', 'admin@qq.com', '1');
INSERT INTO `user` VALUES ('4', 'fcs', '123', 'fec@qq.com', '2');
INSERT INTO `user` VALUES ('6', 'lyt', '123', 'lyt@qq.com', '2');
INSERT INTO `user` VALUES ('7', '冯长晟', '123', 'fengcs@126.com', '2');
INSERT INTO `user` VALUES ('8', 'lff', '123', 'lff@qq.com', '2');
INSERT INTO `user` VALUES ('10', '留言', '123', 'ly@qq.com', '2');
INSERT INTO `user` VALUES ('11', '内马尔', '123', 'nmr@qq.com', '2');