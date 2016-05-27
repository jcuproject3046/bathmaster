/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bathmaster

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-05-27 23:36:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('Northen Bathroom will not open this weekend ');
INSERT INTO `news` VALUES ('Merry Chirsmas!');

-- ----------------------------
-- Table structure for tb_balancement
-- ----------------------------
DROP TABLE IF EXISTS `tb_balancement`;
CREATE TABLE `tb_balancement` (
  `bmId` varchar(32) NOT NULL,
  `bmCheckinOrderId` varchar(32) NOT NULL,
  `bmCreateTime` datetime NOT NULL,
  `bmGuestId` varchar(32) DEFAULT NULL,
  `bmOperator` varchar(20) NOT NULL,
  `bmPaidMoney` decimal(19,2) NOT NULL,
  `bmPaymentModel` varchar(16) NOT NULL,
  `bmReceivMoney` decimal(19,2) NOT NULL,
  `bmRemark` varchar(100) DEFAULT NULL,
  `bmTotalRate` decimal(19,2) NOT NULL,
  `bmType` varchar(16) NOT NULL,
  PRIMARY KEY (`bmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_balancement
-- ----------------------------
INSERT INTO `tb_balancement` VALUES ('001', '001', '2011-05-29 12:14:33', '001', '001', '1.00', '454', '120.00', '124', '120.00', '1');
INSERT INTO `tb_balancement` VALUES ('40288199303baebc01303bbe15fb0003', '40288199303baebc01303bb08af10001', '2011-05-29 20:32:51', '40288199303a771101303a8326ff0002', 'admin', '410.00', '信用卡', '0.00', '', '120.00', '结单');

-- ----------------------------
-- Table structure for tb_baseinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_baseinfo`;
CREATE TABLE `tb_baseinfo` (
  `bioId` varchar(32) NOT NULL,
  `bioName` varchar(32) NOT NULL,
  `bioValue` varchar(200) NOT NULL,
  PRIMARY KEY (`bioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_baseinfo
-- ----------------------------
INSERT INTO `tb_baseinfo` VALUES ('001', 'CheckinOrderID', '129');
INSERT INTO `tb_baseinfo` VALUES ('002', 'ReservOrderID', '548');

-- ----------------------------
-- Table structure for tb_checkinitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkinitem`;
CREATE TABLE `tb_checkinitem` (
  `cimId` varchar(32) NOT NULL,
  `cimDiscount` decimal(19,2) DEFAULT NULL,
  `cimInDatetime` datetime NOT NULL,
  `cimOutDatetime` datetime NOT NULL,
  `cimPrctPrice` decimal(19,2) NOT NULL,
  `cimState` varchar(16) NOT NULL,
  `checkinOrder_cioId` varchar(32) NOT NULL,
  `room_rmId` varchar(32) NOT NULL,
  PRIMARY KEY (`cimId`),
  KEY `FKD496A46F6C8CB43F` (`room_rmId`),
  KEY `FKD496A46FF6EFFC31` (`checkinOrder_cioId`),
  CONSTRAINT `FKD496A46F6C8CB43F` FOREIGN KEY (`room_rmId`) REFERENCES `tb_room` (`rmId`),
  CONSTRAINT `FKD496A46FF6EFFC31` FOREIGN KEY (`checkinOrder_cioId`) REFERENCES `tb_checkinorder` (`cioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_checkinitem
-- ----------------------------
INSERT INTO `tb_checkinitem` VALUES ('001', '120.00', '2011-05-29 12:13:56', '2011-05-29 12:13:57', '120.00', '120', '001', '001');
INSERT INTO `tb_checkinitem` VALUES ('40288199303a771101303ac0faf00006', '150.00', '2011-05-29 15:15:00', '2011-05-30 12:00:00', '200.00', '已入住', '40288199303a771101303ac0faf00005', '10005');
INSERT INTO `tb_checkinitem` VALUES ('40288199303a771101303ac150150008', '150.00', '2011-05-29 15:15:00', '2011-05-30 12:00:00', '200.00', '已入住', '40288199303a771101303ac150150007', '10005');
INSERT INTO `tb_checkinitem` VALUES ('40288199303ad9a601303b1628c90002', '1.00', '2011-05-29 12:00:00', '2011-05-30 12:00:00', '500.00', '已入住', '40288199303ad9a601303b1628b90001', '002');
INSERT INTO `tb_checkinitem` VALUES ('40288199303baebc01303bb08b010002', '0.00', '2011-05-29 20:16:00', '2011-05-30 12:00:00', '0.00', '已结账', '40288199303baebc01303bb08af10001', '10000');

-- ----------------------------
-- Table structure for tb_checkinorder
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkinorder`;
CREATE TABLE `tb_checkinorder` (
  `cioId` varchar(32) NOT NULL,
  `cioBedRate` decimal(19,2) DEFAULT NULL,
  `cioCause` varchar(100) DEFAULT NULL,
  `cioGroupName` varchar(32) DEFAULT NULL,
  `cioGuestCardCatalog` varchar(16) NOT NULL,
  `cioGuestCardId` varchar(32) NOT NULL,
  `cioGuestCatalog` varchar(16) NOT NULL,
  `cioGuestGender` varchar(6) NOT NULL,
  `cioGuestName` varchar(20) NOT NULL,
  `cioGuestType` varchar(16) NOT NULL,
  `cioInDateTime` datetime NOT NULL,
  `cioIsReservId` varchar(32) DEFAULT NULL,
  `cioManNumber` int(11) NOT NULL,
  `cioOperator` varchar(20) NOT NULL,
  `cioOrderId` varchar(32) NOT NULL,
  `cioPaidMoney` decimal(19,2) NOT NULL,
  `cioPaymentModel` varchar(16) NOT NULL,
  `cioPrctOutDateTime` datetime NOT NULL,
  `cioPreOutDateTime` datetime NOT NULL,
  `cioState` varchar(255) NOT NULL,
  `cioTotalRate` decimal(19,2) NOT NULL,
  PRIMARY KEY (`cioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_checkinorder
-- ----------------------------
INSERT INTO `tb_checkinorder` VALUES ('001', '1.00', '12', '12', '12', '001', '001', '001', '001', '1', '2011-05-29 12:13:18', '001', '1', '001', '001', '1.00', '1', '2011-05-29 12:13:37', '2011-05-29 12:13:39', '001', '1.00');
INSERT INTO `tb_checkinorder` VALUES ('40288199303a771101303ac0faf00005', '0.00', null, null, '身份证', '123456789123456', '散客', '男', '001', '普通客人', '2011-05-29 15:15:00', null, '2', 'Admin', 'CIO00000125', '0.00', '现金', '2011-05-30 12:00:00', '2011-05-30 12:00:00', '已入住', '200.00');
INSERT INTO `tb_checkinorder` VALUES ('40288199303a771101303ac150150007', '0.00', null, null, '身份证', '123456789123456', '散客', '男', '001', '普通客人', '2011-05-29 15:15:00', null, '2', 'Admin', 'CIO00000126', '0.00', '现金', '2011-05-30 12:00:00', '2011-05-30 12:00:00', '已入住', '200.00');
INSERT INTO `tb_checkinorder` VALUES ('40288199303ad9a601303b1628b90001', '0.00', null, null, '散客', '123456789123456', '散客', '男', 'aaa', '普通客人', '2011-05-29 12:00:00', null, '2', 'Admin', 'CIO00000127', '0.00', '现金', '2011-05-30 12:00:00', '2011-05-30 12:00:00', '已入住', '0.00');
INSERT INTO `tb_checkinorder` VALUES ('40288199303baebc01303bb08af10001', '120.00', null, null, '身份证', '123456789123456', '散客', '男', 'aaa', '普通客人', '2011-05-29 20:16:00', null, '2', 'Admin', 'CIO00000128', '0.00', '现金', '2011-05-29 20:32:51', '2011-05-30 12:00:00', '已结账', '120.00');

-- ----------------------------
-- Table structure for tb_guest
-- ----------------------------
DROP TABLE IF EXISTS `tb_guest`;
CREATE TABLE `tb_guest` (
  `gtId` varchar(32) NOT NULL,
  `gtAddress` varchar(100) DEFAULT NULL,
  `gtCardCatalog` varchar(16) NOT NULL,
  `gtCardId` varchar(32) NOT NULL,
  `gtCompany` varchar(50) DEFAULT NULL,
  `gtCountry` varchar(32) DEFAULT NULL,
  `gtCreateTime` datetime NOT NULL,
  `gtEmail` varchar(32) DEFAULT NULL,
  `gtGender` varchar(4) NOT NULL,
  `gtMobile` varchar(16) DEFAULT NULL,
  `gtName` varchar(20) NOT NULL,
  `gtTelphone` varchar(16) DEFAULT NULL,
  `gtType` varchar(255) NOT NULL,
  `gtZip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`gtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guest
-- ----------------------------
INSERT INTO `tb_guest` VALUES ('001', '', '学生证', '53010312928392340', '', 'Chinese', '2011-05-29 12:12:18', '', '男', '121333', 'test1', '', '普通', '');
INSERT INTO `tb_guest` VALUES ('40288199303a771101303a9e9a860004', 'BJUT', '学生证', '123456789123456', 'sdfdsf', 'chinese', '2011-05-29 15:18:50', 'sjfsk@163.com', '男', '5654165165', 'test2', '4549451654654', '普通', '510520');
INSERT INTO `tb_guest` VALUES ('402881ed54d1d2390154d1da515b0001', '', '学生证', '123123123123123', '', 'Chinese', '2016-05-21 13:47:06', '', '女', '', 'test3', '', '普通', '');
INSERT INTO `tb_guest` VALUES ('402881ed54d1d2390154d1db95aa0002', '', '学生证', '1238834737477344', '', 'Chinese', '2016-05-21 13:48:29', '', '女', '', 'test4', '', '普通', '');

-- ----------------------------
-- Table structure for tb_guesthistory
-- ----------------------------
DROP TABLE IF EXISTS `tb_guesthistory`;
CREATE TABLE `tb_guesthistory` (
  `ghId` varchar(32) NOT NULL,
  `ghBalancementId` varchar(32) NOT NULL,
  `ghGuestId` varchar(32) NOT NULL,
  `ghGuestName` varchar(32) DEFAULT NULL,
  `ghRemark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ghId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guesthistory
-- ----------------------------
INSERT INTO `tb_guesthistory` VALUES ('001', '001', '001', '001', '001');
INSERT INTO `tb_guesthistory` VALUES ('40288199303baebc01303bbe163a0004', '40288199303baebc01303bbe15fb0003', '40288199303a771101303a8326ff0002', 'aaa', '<font color=\"#ff6600\">&nbsp;你好</font>');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `logid` int(11) NOT NULL COMMENT '序列',
  `pathid` bigint(20) DEFAULT NULL COMMENT '序列2',
  `studentid` bigint(20) DEFAULT NULL COMMENT '序列3',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `enddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  `seatid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `FK_Relationship_1` (`pathid`),
  KEY `FK_Relationship_2` (`studentid`),
  KEY `createdate` (`createdate`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`pathid`) REFERENCES `tb_path` (`pathid`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`studentid`) REFERENCES `tb_student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='洗澡日志表';

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('3', '2', '7', '2015-12-22 16:19:00', '2015-12-22 16:19:00', '0', '2_3');
INSERT INTO `tb_log` VALUES ('4', '1', '8', '2015-12-22 16:19:00', '2015-12-22 16:19:00', '0', '2_5');
INSERT INTO `tb_log` VALUES ('5', '1', '9', '2015-12-22 16:34:30', '2015-12-22 16:34:30', '0', '1_6');
INSERT INTO `tb_log` VALUES ('6', '1', '9', '2015-12-22 16:55:30', '2015-12-22 16:55:30', '0', '3_6');
INSERT INTO `tb_log` VALUES ('7', '1', '10', '2015-12-22 17:47:00', '2015-12-22 17:47:00', '0', '1_6');
INSERT INTO `tb_log` VALUES ('8', '1', '9', '2015-12-22 17:49:00', '2015-12-22 17:49:00', '0', '2_7');
INSERT INTO `tb_log` VALUES ('9', '1', '11', '2015-12-22 17:51:00', '2015-12-22 17:51:00', '0', '2_9');
INSERT INTO `tb_log` VALUES ('10', '1', '9', '2015-12-23 12:07:00', '2015-12-23 12:07:00', '0', '1_5');
INSERT INTO `tb_log` VALUES ('11', '1', '9', '2015-12-24 00:14:06', '2015-12-24 00:14:06', '0', '2_3');
INSERT INTO `tb_log` VALUES ('12', '1', '10', '2015-12-24 00:15:30', '2015-12-24 00:15:30', '0', '2_7');
INSERT INTO `tb_log` VALUES ('13', '1', '11', '2015-12-24 00:16:30', '2015-12-24 00:16:30', '0', '1_4');
INSERT INTO `tb_log` VALUES ('14', '1', '8', '2015-12-24 00:22:00', '2015-12-24 00:22:00', '0', '2_10');
INSERT INTO `tb_log` VALUES ('15', '1', '12', '2015-12-24 00:24:30', '2015-12-24 00:24:30', '0', '3_6');
INSERT INTO `tb_log` VALUES ('16', '1', '9', '2015-12-25 09:30:00', '2015-12-25 09:30:00', '0', '2_8');
INSERT INTO `tb_log` VALUES ('17', '1', '10', '2015-12-27 13:53:00', '2015-12-27 13:53:00', '0', '1_10');
INSERT INTO `tb_log` VALUES ('18', '1', '11', '2015-12-27 19:55:30', '2015-12-27 19:55:30', '0', '2_1');
INSERT INTO `tb_log` VALUES ('19', '1', '11', '2015-12-27 21:48:00', '2015-12-27 21:48:00', '0', '2_10');
INSERT INTO `tb_log` VALUES ('20', '1', '10', '2016-04-20 09:49:30', '2016-04-20 09:49:30', '0', '1_10');
INSERT INTO `tb_log` VALUES ('21', '1', '10', '2016-04-20 14:51:30', '2016-04-20 14:51:30', '0', '1_4');
INSERT INTO `tb_log` VALUES ('22', '1', '11', '2016-04-20 14:51:30', '2016-04-20 14:51:30', '0', '1_3');
INSERT INTO `tb_log` VALUES ('23', '1', '10', '2016-05-19 13:16:30', '2016-05-19 13:16:30', '0', '1_3');
INSERT INTO `tb_log` VALUES ('24', '1', '10', '2016-05-19 16:21:30', '2016-05-19 16:21:30', '0', '1_5');
INSERT INTO `tb_log` VALUES ('25', '1', '10', '2016-05-21 12:31:30', '2016-05-21 12:31:30', '0', '1_6');
INSERT INTO `tb_log` VALUES ('26', '1', '10', '2016-05-21 13:13:00', '2016-05-21 13:13:00', '0', '1_6');
INSERT INTO `tb_log` VALUES ('27', '1', '11', '2016-05-21 12:54:00', '2016-05-21 12:54:00', '0', '1_7');
INSERT INTO `tb_log` VALUES ('28', '2', '12', '2016-05-21 13:08:30', '2016-05-21 13:08:30', '0', '1_1');
INSERT INTO `tb_log` VALUES ('29', '2', '12', '2016-05-26 12:06:31', '2016-05-26 12:06:31', '0', '1_2');
INSERT INTO `tb_log` VALUES ('30', '1', '10', '2016-05-21 13:24:00', '2016-05-21 13:24:00', '0', '1_4');
INSERT INTO `tb_log` VALUES ('31', '1', '10', '2016-05-21 13:36:02', '2016-05-21 13:36:02', '0', '1_5');
INSERT INTO `tb_log` VALUES ('32', '1', '11', '2016-05-26 14:38:30', '2016-05-26 14:38:30', '0', '1_7');
INSERT INTO `tb_log` VALUES ('33', '1', '10', '2016-05-26 14:38:30', '2016-05-26 14:38:30', '0', '1_1');
INSERT INTO `tb_log` VALUES ('34', '1', '10', '2016-05-26 15:03:13', '2016-05-26 15:03:13', '2', '1_1');

-- ----------------------------
-- Table structure for tb_operator
-- ----------------------------
DROP TABLE IF EXISTS `tb_operator`;
CREATE TABLE `tb_operator` (
  `opUserName` varchar(20) NOT NULL,
  `opAddress` varchar(100) DEFAULT NULL,
  `opCreateTime` datetime NOT NULL,
  `opMobile` varchar(16) DEFAULT NULL,
  `opName` varchar(20) NOT NULL,
  `opPassword` varchar(32) NOT NULL,
  `opPrivilege` int(11) NOT NULL,
  `opTelephone` varchar(16) DEFAULT NULL,
  `opZip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`opUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_operator
-- ----------------------------
INSERT INTO `tb_operator` VALUES ('admin', 'a', '2011-05-29 12:03:18', '12346', 'admin', '123456', '255', '156212', '1');
INSERT INTO `tb_operator` VALUES ('admin1', '', '2016-05-21 11:29:47', '0', '', '123456', '0', '0', '0');
INSERT INTO `tb_operator` VALUES ('sfds', 'sa', '2011-05-29 14:38:52', '0', 'a', '123', '0', '0', '0');
INSERT INTO `tb_operator` VALUES ('test1', '', '2016-04-19 23:29:30', '0', '', '123', '0', '0', '0');
INSERT INTO `tb_operator` VALUES ('xiaolian', 'sdf', '2011-05-29 13:08:38', '0', 'sfdd', '123', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_path
-- ----------------------------
DROP TABLE IF EXISTS `tb_path`;
CREATE TABLE `tb_path` (
  `pathid` bigint(20) NOT NULL COMMENT '序列',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `volume` int(11) DEFAULT NULL COMMENT '容积',
  `leftnum` int(11) DEFAULT NULL COMMENT '剩余数量',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`pathid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='草堂表';

-- ----------------------------
-- Records of tb_path
-- ----------------------------
INSERT INTO `tb_path` VALUES ('1', 'North(Male only)', '30', null, 'male');
INSERT INTO `tb_path` VALUES ('2', 'South(Female only)', '30', null, 'female');

-- ----------------------------
-- Table structure for tb_research
-- ----------------------------
DROP TABLE IF EXISTS `tb_research`;
CREATE TABLE `tb_research` (
  `pathid` int(1) NOT NULL,
  `dateselect` datetime(6) DEFAULT NULL,
  `num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_research
-- ----------------------------

-- ----------------------------
-- Table structure for tb_reservitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_reservitem`;
CREATE TABLE `tb_reservitem` (
  `rimId` varchar(32) NOT NULL,
  `rimInDateTime` datetime NOT NULL,
  `rimOutDateTime` datetime NOT NULL,
  `rimState` varchar(16) NOT NULL,
  `reservOrder_roId` varchar(32) NOT NULL,
  `room_rmId` varchar(32) NOT NULL,
  PRIMARY KEY (`rimId`),
  KEY `FKE02811CD6C8CB43F` (`room_rmId`),
  KEY `FKE02811CDA1DD4ACD` (`reservOrder_roId`),
  CONSTRAINT `FKE02811CD6C8CB43F` FOREIGN KEY (`room_rmId`) REFERENCES `tb_room` (`rmId`),
  CONSTRAINT `FKE02811CDA1DD4ACD` FOREIGN KEY (`reservOrder_roId`) REFERENCES `tb_reservorder` (`roId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reservitem
-- ----------------------------
INSERT INTO `tb_reservitem` VALUES ('001', '2011-05-17 12:11:44', '2011-05-30 12:11:40', '131', '001', '001');
INSERT INTO `tb_reservitem` VALUES ('40288199303a771101303ac4eaa1000a', '2011-05-29 12:00:00', '2011-05-30 12:00:00', '预定中', '40288199303a771101303ac4eaa10009', '002');
INSERT INTO `tb_reservitem` VALUES ('402881ed54d1d2390154d1eb738c0004', '2016-05-21 12:00:00', '2016-05-22 12:00:00', '???', '402881ed54d1d2390154d1eb738a0003', '002');

-- ----------------------------
-- Table structure for tb_reservorder
-- ----------------------------
DROP TABLE IF EXISTS `tb_reservorder`;
CREATE TABLE `tb_reservorder` (
  `roId` varchar(32) NOT NULL,
  `roCreateTime` datetime NOT NULL,
  `roEarliestTime` time DEFAULT NULL,
  `roEmail` varchar(45) DEFAULT NULL,
  `roFax` varchar(255) DEFAULT NULL,
  `roGroupName` varchar(50) DEFAULT NULL,
  `roGuestCardCatalog` varchar(16) DEFAULT NULL,
  `roGuestCardId` varchar(32) DEFAULT NULL,
  `roGuestGender` varchar(6) NOT NULL,
  `roGuestName` varchar(20) NOT NULL,
  `roInDateTime` datetime NOT NULL,
  `roLatestTime` time DEFAULT NULL,
  `roOperator` varchar(32) NOT NULL,
  `roOrderId` varchar(32) NOT NULL,
  `roPaidMoney` decimal(19,2) NOT NULL,
  `roPaymentModel` varchar(255) NOT NULL,
  `roPreAssignRoom` varchar(32) DEFAULT NULL,
  `roPreOutDateTime` datetime NOT NULL,
  `roRemark` varchar(200) DEFAULT NULL,
  `roReservModel` varchar(255) NOT NULL,
  `roReservState` varchar(255) NOT NULL,
  `roTelphone` varchar(16) NOT NULL,
  `roTotalRate` decimal(19,2) NOT NULL,
  PRIMARY KEY (`roId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reservorder
-- ----------------------------
INSERT INTO `tb_reservorder` VALUES ('001', '2011-05-29 12:09:47', '12:09:51', '1214', '121', 'ad', '122', '001', '1212', 'ad', '2011-05-29 12:10:10', '12:10:12', 'admin', '001', '120.00', '1', '123', '2011-05-31 12:11:06', '12', '12', '12', '12', '12.00');
INSERT INTO `tb_reservorder` VALUES ('40288199303a771101303ac4eaa10009', '2011-05-29 16:00:41', '12:00:00', '', '', '', '身份证', '', '男', 'sfdf', '2011-05-29 12:00:00', '12:00:00', 'Admin', 'RO00000546', '0.00', '现金', '', '2011-05-30 12:00:00', '', '电话预定', '预定中', '15154964444', '0.00');
INSERT INTO `tb_reservorder` VALUES ('402881ed54d1d2390154d1eb738a0003', '2016-05-21 14:05:49', '12:00:00', '', '', '', '???', '', '?', 'test4', '2016-05-21 12:00:00', '12:00:00', 'Admin', 'RO00000547', '0.00', '??', '', '2016-05-22 12:00:00', '', '????', '???', '1388099933', '0.00');

-- ----------------------------
-- Table structure for tb_room
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room` (
  `rmId` varchar(32) NOT NULL,
  `rmArea` varchar(10) DEFAULT NULL,
  `rmAvailable` bit(1) NOT NULL,
  `rmCatalog` varchar(32) NOT NULL,
  `rmFloor` varchar(10) NOT NULL,
  `rmPicture` varchar(100) NOT NULL,
  `rmPrctDiscount` decimal(19,2) NOT NULL,
  `rmPrctPrice` decimal(19,2) DEFAULT NULL,
  `rmState` int(11) NOT NULL,
  `rmTelphone` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`rmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_room
-- ----------------------------
INSERT INTO `tb_room` VALUES ('001', '1', '', 'Male', '1', 'public/images/rooms/single.gif', '140.00', '120.00', '4', '1212');
INSERT INTO `tb_room` VALUES ('002', '2', '', 'Female', '1', 'public/images/rooms/standardroom.gif', '400.00', '500.00', '5', '45424214');
INSERT INTO `tb_room` VALUES ('10000', '2', '', 'Female', '1', 'public/images/rooms/standardroom.gif', '0.00', '0.00', '0', '0');
INSERT INTO `tb_room` VALUES ('10001', '1', '', 'Female', '1', 'public/images/rooms/standardroom.gif', '1.00', '1.00', '0', '1');
INSERT INTO `tb_room` VALUES ('10005', '2', '', 'Female', '2', 'public/images/rooms/standardroom.gif', '150.00', '200.00', '5', '5455');
INSERT INTO `tb_room` VALUES ('10012', '2', '', 'Reserved', '2', 'public/images/rooms/standardroom.gif', '0.00', '120.00', '0', '0');
INSERT INTO `tb_room` VALUES ('45245', '2', '', 'Female', '1', 'public/images/rooms/standardroom.gif', '0.00', '0.00', '0', '0');
INSERT INTO `tb_room` VALUES ('4545', '1', '', 'Male', '1', 'public/images/rooms/single.gif', '0.00', '0.00', '0', '0');

-- ----------------------------
-- Table structure for tb_roomcatalog
-- ----------------------------
DROP TABLE IF EXISTS `tb_roomcatalog`;
CREATE TABLE `tb_roomcatalog` (
  `rcId` varchar(32) NOT NULL,
  `rcBedNumber` int(11) NOT NULL,
  `rcHourBasePrice` decimal(19,2) DEFAULT NULL,
  `rcName` varchar(12) NOT NULL,
  `rcPerHourPrice` decimal(19,2) DEFAULT NULL,
  `rcPreDiscount` decimal(19,2) DEFAULT NULL,
  `rcPrePrice` decimal(19,2) NOT NULL,
  PRIMARY KEY (`rcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roomcatalog
-- ----------------------------
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a046a01303a26ea630001', '0', '0.80', 'Female', '1.00', '0.20', '0.60');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a046a01303a2c78810002', '0', '0.00', 'Reserved', '0.00', '0.00', '0.00');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a771101303a7d51b60001', '0', '0.70', 'Male', '0.80', '0.20', '0.50');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `studentid` bigint(20) NOT NULL COMMENT '序列',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `account` varchar(200) DEFAULT NULL COMMENT '帐号',
  `code` varchar(200) DEFAULT NULL COMMENT '学校编号',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tb_student';

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('7', 'hhy', 'hhy', 'hhy', 'hhy', 'female', '2015-12-22 14:06:06');
INSERT INTO `tb_student` VALUES ('8', 'lfc', 'lfc', 'lfc', 'lfc', 'male', '2015-12-22 14:54:55');
INSERT INTO `tb_student` VALUES ('9', 'Shichengnan', 'Shichengnan', '123456', '123', 'male', '2015-12-22 16:22:24');
INSERT INTO `tb_student` VALUES ('10', 'test1', 'test1', 'test1', '123', 'male', '2015-12-22 17:36:19');
INSERT INTO `tb_student` VALUES ('11', 'test2', 'test2', 'test2', '123', 'male', '2015-12-22 17:39:26');
INSERT INTO `tb_student` VALUES ('12', 'test3', 'test3', '112233', '123', 'female', '2016-05-21 12:54:39');
INSERT INTO `tb_student` VALUES ('13', 'student11', 'test4', '12998733', '123', 'female', '2016-05-21 12:57:50');
