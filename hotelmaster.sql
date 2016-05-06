/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : hotelmaster

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2011-06-24 23:34:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tb_balancement`
-- ----------------------------
DROP TABLE IF EXISTS `tb_balancement`;
CREATE TABLE `tb_balancement` (
  `bmId` varchar(32) NOT NULL,
  `bmCheckinOrderId` varchar(32) NOT NULL,
  `bmCreateTime` datetime NOT NULL,
  `bmGuestId` varchar(32) default NULL,
  `bmOperator` varchar(20) NOT NULL,
  `bmPaidMoney` decimal(19,2) NOT NULL,
  `bmPaymentModel` varchar(16) NOT NULL,
  `bmReceivMoney` decimal(19,2) NOT NULL,
  `bmRemark` varchar(100) default NULL,
  `bmTotalRate` decimal(19,2) NOT NULL,
  `bmType` varchar(16) NOT NULL,
  PRIMARY KEY  (`bmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_balancement
-- ----------------------------
INSERT INTO `tb_balancement` VALUES ('001', '001', '2011-05-29 12:14:33', '001', '001', '1.00', '454', '120.00', '124', '120.00', '1');
INSERT INTO `tb_balancement` VALUES ('40288199303baebc01303bbe15fb0003', '40288199303baebc01303bb08af10001', '2011-05-29 20:32:51', '40288199303a771101303a8326ff0002', 'admin', '410.00', '信用卡', '0.00', '', '120.00', '结单');

-- ----------------------------
-- Table structure for `tb_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tb_baseinfo`;
CREATE TABLE `tb_baseinfo` (
  `bioId` varchar(32) NOT NULL,
  `bioName` varchar(32) NOT NULL,
  `bioValue` varchar(200) NOT NULL,
  PRIMARY KEY  (`bioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_baseinfo
-- ----------------------------
INSERT INTO `tb_baseinfo` VALUES ('001', 'CheckinOrderID', '129');
INSERT INTO `tb_baseinfo` VALUES ('002', 'ReservOrderID', '547');

-- ----------------------------
-- Table structure for `tb_checkinitem`
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkinitem`;
CREATE TABLE `tb_checkinitem` (
  `cimId` varchar(32) NOT NULL,
  `cimDiscount` decimal(19,2) default NULL,
  `cimInDatetime` datetime NOT NULL,
  `cimOutDatetime` datetime NOT NULL,
  `cimPrctPrice` decimal(19,2) NOT NULL,
  `cimState` varchar(16) NOT NULL,
  `checkinOrder_cioId` varchar(32) NOT NULL,
  `room_rmId` varchar(32) NOT NULL,
  PRIMARY KEY  (`cimId`),
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
-- Table structure for `tb_checkinorder`
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkinorder`;
CREATE TABLE `tb_checkinorder` (
  `cioId` varchar(32) NOT NULL,
  `cioBedRate` decimal(19,2) default NULL,
  `cioCause` varchar(100) default NULL,
  `cioGroupName` varchar(32) default NULL,
  `cioGuestCardCatalog` varchar(16) NOT NULL,
  `cioGuestCardId` varchar(32) NOT NULL,
  `cioGuestCatalog` varchar(16) NOT NULL,
  `cioGuestGender` varchar(6) NOT NULL,
  `cioGuestName` varchar(20) NOT NULL,
  `cioGuestType` varchar(16) NOT NULL,
  `cioInDateTime` datetime NOT NULL,
  `cioIsReservId` varchar(32) default NULL,
  `cioManNumber` int(11) NOT NULL,
  `cioOperator` varchar(20) NOT NULL,
  `cioOrderId` varchar(32) NOT NULL,
  `cioPaidMoney` decimal(19,2) NOT NULL,
  `cioPaymentModel` varchar(16) NOT NULL,
  `cioPrctOutDateTime` datetime NOT NULL,
  `cioPreOutDateTime` datetime NOT NULL,
  `cioState` varchar(255) NOT NULL,
  `cioTotalRate` decimal(19,2) NOT NULL,
  PRIMARY KEY  (`cioId`)
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
-- Table structure for `tb_guest`
-- ----------------------------
DROP TABLE IF EXISTS `tb_guest`;
CREATE TABLE `tb_guest` (
  `gtId` varchar(32) NOT NULL,
  `gtAddress` varchar(100) default NULL,
  `gtCardCatalog` varchar(16) NOT NULL,
  `gtCardId` varchar(32) NOT NULL,
  `gtCompany` varchar(50) default NULL,
  `gtCountry` varchar(32) default NULL,
  `gtCreateTime` datetime NOT NULL,
  `gtEmail` varchar(32) default NULL,
  `gtGender` varchar(4) NOT NULL,
  `gtMobile` varchar(16) default NULL,
  `gtName` varchar(20) NOT NULL,
  `gtTelphone` varchar(16) default NULL,
  `gtType` varchar(255) NOT NULL,
  `gtZip` varchar(10) default NULL,
  PRIMARY KEY  (`gtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guest
-- ----------------------------
INSERT INTO `tb_guest` VALUES ('001', '12', '121', '001', '1212', '12', '2011-05-29 12:12:18', '4121', '124', '121', 'ad', '12', '1', '1');
INSERT INTO `tb_guest` VALUES ('40288199303a771101303a8326ff0002', '4454', '学生证', '123456789123456', '4545', 'zhongguo', '2011-05-29 14:48:51', '', '男', '454545', 'aaa', '454564564', '普通客人', '4545');
INSERT INTO `tb_guest` VALUES ('40288199303a771101303a9e9a860004', 'sfdsf', '身份证', '123456789123456', 'sdfdsf', '纵谷', '2011-05-29 15:18:50', 'sjfsk@163.com', '男', '5654165165', '001', '4549451654654', '普通客人', '510520');

-- ----------------------------
-- Table structure for `tb_guesthistory`
-- ----------------------------
DROP TABLE IF EXISTS `tb_guesthistory`;
CREATE TABLE `tb_guesthistory` (
  `ghId` varchar(32) NOT NULL,
  `ghBalancementId` varchar(32) NOT NULL,
  `ghGuestId` varchar(32) NOT NULL,
  `ghGuestName` varchar(32) default NULL,
  `ghRemark` varchar(255) default NULL,
  PRIMARY KEY  (`ghId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_guesthistory
-- ----------------------------
INSERT INTO `tb_guesthistory` VALUES ('001', '001', '001', '001', '001');
INSERT INTO `tb_guesthistory` VALUES ('40288199303baebc01303bbe163a0004', '40288199303baebc01303bbe15fb0003', '40288199303a771101303a8326ff0002', 'aaa', '<font color=\"#ff6600\">&nbsp;你好</font>');

-- ----------------------------
-- Table structure for `tb_operator`
-- ----------------------------
DROP TABLE IF EXISTS `tb_operator`;
CREATE TABLE `tb_operator` (
  `opUserName` varchar(20) NOT NULL,
  `opAddress` varchar(100) default NULL,
  `opCreateTime` datetime NOT NULL,
  `opMobile` varchar(16) default NULL,
  `opName` varchar(20) NOT NULL,
  `opPassword` varchar(32) NOT NULL,
  `opPrivilege` int(11) NOT NULL,
  `opTelephone` varchar(16) default NULL,
  `opZip` varchar(10) default NULL,
  PRIMARY KEY  (`opUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_operator
-- ----------------------------
INSERT INTO `tb_operator` VALUES ('admin', 'a', '2011-05-29 12:03:18', '12346', 'admin', '123456', '255', '156212', '1');
INSERT INTO `tb_operator` VALUES ('sfds', 'sa', '2011-05-29 14:38:52', '0', 'a', '123', '0', '0', '0');
INSERT INTO `tb_operator` VALUES ('xiaolian', 'sdf', '2011-05-29 13:08:38', '0', 'sfdd', '123', '0', '0', '0');

-- ----------------------------
-- Table structure for `tb_reservitem`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reservitem`;
CREATE TABLE `tb_reservitem` (
  `rimId` varchar(32) NOT NULL,
  `rimInDateTime` datetime NOT NULL,
  `rimOutDateTime` datetime NOT NULL,
  `rimState` varchar(16) NOT NULL,
  `reservOrder_roId` varchar(32) NOT NULL,
  `room_rmId` varchar(32) NOT NULL,
  PRIMARY KEY  (`rimId`),
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

-- ----------------------------
-- Table structure for `tb_reservorder`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reservorder`;
CREATE TABLE `tb_reservorder` (
  `roId` varchar(32) NOT NULL,
  `roCreateTime` datetime NOT NULL,
  `roEarliestTime` time default NULL,
  `roEmail` varchar(45) default NULL,
  `roFax` varchar(255) default NULL,
  `roGroupName` varchar(50) default NULL,
  `roGuestCardCatalog` varchar(16) default NULL,
  `roGuestCardId` varchar(32) default NULL,
  `roGuestGender` varchar(6) NOT NULL,
  `roGuestName` varchar(20) NOT NULL,
  `roInDateTime` datetime NOT NULL,
  `roLatestTime` time default NULL,
  `roOperator` varchar(32) NOT NULL,
  `roOrderId` varchar(32) NOT NULL,
  `roPaidMoney` decimal(19,2) NOT NULL,
  `roPaymentModel` varchar(255) NOT NULL,
  `roPreAssignRoom` varchar(32) default NULL,
  `roPreOutDateTime` datetime NOT NULL,
  `roRemark` varchar(200) default NULL,
  `roReservModel` varchar(255) NOT NULL,
  `roReservState` varchar(255) NOT NULL,
  `roTelphone` varchar(16) NOT NULL,
  `roTotalRate` decimal(19,2) NOT NULL,
  PRIMARY KEY  (`roId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reservorder
-- ----------------------------
INSERT INTO `tb_reservorder` VALUES ('001', '2011-05-29 12:09:47', '12:09:51', '1214', '121', 'ad', '122', '001', '1212', 'ad', '2011-05-29 12:10:10', '12:10:12', 'admin', '001', '120.00', '1', '123', '2011-05-31 12:11:06', '12', '12', '12', '12', '12.00');
INSERT INTO `tb_reservorder` VALUES ('40288199303a771101303ac4eaa10009', '2011-05-29 16:00:41', '12:00:00', '', '', '', '身份证', '', '男', 'sfdf', '2011-05-29 12:00:00', '12:00:00', 'Admin', 'RO00000546', '0.00', '现金', '', '2011-05-30 12:00:00', '', '电话预定', '预定中', '15154964444', '0.00');

-- ----------------------------
-- Table structure for `tb_room`
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room` (
  `rmId` varchar(32) NOT NULL,
  `rmArea` varchar(10) default NULL,
  `rmAvailable` bit(1) NOT NULL,
  `rmCatalog` varchar(32) NOT NULL,
  `rmFloor` varchar(10) NOT NULL,
  `rmPicture` varchar(100) NOT NULL,
  `rmPrctDiscount` decimal(19,2) NOT NULL,
  `rmPrctPrice` decimal(19,2) default NULL,
  `rmState` int(11) NOT NULL,
  `rmTelphone` varchar(24) default NULL,
  PRIMARY KEY  (`rmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_room
-- ----------------------------
INSERT INTO `tb_room` VALUES ('001', '120', '', '普通间', '12', 'public/images/rooms/single.gif', '140.00', '120.00', '140', '1212');
INSERT INTO `tb_room` VALUES ('002', '1200', '', '标准间', '8', 'public/images/rooms/standardroom.gif', '400.00', '500.00', '0', '45424214');
INSERT INTO `tb_room` VALUES ('10000', '0', '', '标准间', '0', 'public/images/rooms/standardroom.gif', '0.00', '0.00', '3', '0');
INSERT INTO `tb_room` VALUES ('10001', '1', '', '标准间', '1', 'public/images/rooms/standardroom.gif', '1.00', '1.00', '0', '1');
INSERT INTO `tb_room` VALUES ('10002', '400', '', 'df', '5', 'public/images/rooms/single.gif', '400.00', '500.00', '0', '7575');
INSERT INTO `tb_room` VALUES ('10005', '500', '', '标准间', '5', 'public/images/rooms/standardroom.gif', '150.00', '200.00', '2', '5455');
INSERT INTO `tb_room` VALUES ('10012', '120', '', '豪华间', '13', 'public/images/rooms/standardroom.gif', '0.00', '120.00', '0', '0');
INSERT INTO `tb_room` VALUES ('45245', '0', '', '标准间', '0', 'public/images/rooms/standardroom.gif', '0.00', '0.00', '0', '0');
INSERT INTO `tb_room` VALUES ('4545', '45', '', '普通间', '1', 'public/images/rooms/standardroom.gif', '0.00', '0.00', '0', '0');

-- ----------------------------
-- Table structure for `tb_roomcatalog`
-- ----------------------------
DROP TABLE IF EXISTS `tb_roomcatalog`;
CREATE TABLE `tb_roomcatalog` (
  `rcId` varchar(32) NOT NULL,
  `rcBedNumber` int(11) NOT NULL,
  `rcHourBasePrice` decimal(19,2) default NULL,
  `rcName` varchar(12) NOT NULL,
  `rcPerHourPrice` decimal(19,2) default NULL,
  `rcPreDiscount` decimal(19,2) default NULL,
  `rcPrePrice` decimal(19,2) NOT NULL,
  PRIMARY KEY  (`rcId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roomcatalog
-- ----------------------------
INSERT INTO `tb_roomcatalog` VALUES ('1', '1', '120.00', 'df', '120.00', '120.00', '120.00');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a046a01303a26ea630001', '2', '10.00', '标准间', '1.00', '450.00', '200.00');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a046a01303a2c78810002', '4', '360.00', '豪华间', '40.00', '400.00', '500.00');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a046a01303a34823f0003', '4', '130.00', 'as', '10.00', '400.00', '420.00');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a771101303a7d51b60001', '1', '10.00', '普通间', '1.00', '20.00', '20.00');
INSERT INTO `tb_roomcatalog` VALUES ('40288199303a771101303a9b15f30003', '0', '0.00', '5456', '0.00', '0.00', '0.00');
