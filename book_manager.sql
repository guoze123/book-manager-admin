/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : book_manager

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 17/01/2021 22:00:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminmanager
-- ----------------------------
DROP TABLE IF EXISTS `adminmanager`;
CREATE TABLE `adminmanager`  (
  `am_id` int(11) NOT NULL AUTO_INCREMENT,
  `am_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `am_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `am_state` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`am_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminmanager
-- ----------------------------
INSERT INTO `adminmanager` VALUES (1, 'admin', '123456', 0);
INSERT INTO `adminmanager` VALUES (2, 'admin1', '123456', 0);
INSERT INTO `adminmanager` VALUES (3, 'admin2', '123456', 0);
INSERT INTO `adminmanager` VALUES (4, 'admin3', '123456', 1);
INSERT INTO `adminmanager` VALUES (5, 'admin4', '123456', 0);
INSERT INTO `adminmanager` VALUES (6, 'admin5', '123456', 0);
INSERT INTO `adminmanager` VALUES (7, 'admin6', '123456', 0);
INSERT INTO `adminmanager` VALUES (8, 'admin7', '123456', 0);
INSERT INTO `adminmanager` VALUES (9, 'admin8', '123456', 0);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `b_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书名',
  `b_author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `b_btid` int(11) NULL DEFAULT NULL COMMENT '类型编号',
  `b_isbn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'isbn 码',
  `b_introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容介绍',
  `b_pages` int(11) NULL DEFAULT NULL COMMENT '页数',
  `b_fontnumber` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字数',
  `b_publisher` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `b_intime` datetime(0) NULL DEFAULT NULL COMMENT '存入时间',
  `b_newbooks` int(11) NULL DEFAULT 0 COMMENT '是否新书',
  `b_bookstate` int(11) NULL DEFAULT 0 COMMENT '状态',
  `b_booknum` int(11) NULL DEFAULT NULL COMMENT '剩余数量',
  `b_booknumall` int(11) NULL DEFAULT 1 COMMENT '总数量',
  `b_imgPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书封面',
  PRIMARY KEY (`b_id`) USING BTREE,
  INDEX `b_btid`(`b_btid`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`b_btid`) REFERENCES `booktype` (`bt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '狂人日记', '路人甲', 1, 'K12131', '这是鲁迅的一部中长篇小说', 2000, '50000', '北京出版社', '2017-10-11 00:00:00', 1, 1, 10, 30, NULL);
INSERT INTO `book` VALUES (2, '狂人', '鲁迅', 1, 'K12138', '这是一本书', 1000, '5000', '北京出版社', '2017-10-17 12:47:34', 1, 1, 10, 10, NULL);
INSERT INTO `book` VALUES (3, '呐喊', '鲁迅', 1, 'K12134', '这是鲁迅的一本写实小说，巨好看，不看后悔一辈子', 404, '4326754', '北京出版社', '2017-10-17 12:55:22', 1, 0, 10, 21, NULL);
INSERT INTO `book` VALUES (4, '朝花夕拾1', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 1, 5, 25, NULL);
INSERT INTO `book` VALUES (5, '朝花夕拾2', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 1, 15, 25, NULL);
INSERT INTO `book` VALUES (6, '朝花夕拾3', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 1, 15, 25, NULL);
INSERT INTO `book` VALUES (7, '朝花夕拾4', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 0, 10, 25, NULL);
INSERT INTO `book` VALUES (8, '朝花夕拾5', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 0, 12, 25, NULL);
INSERT INTO `book` VALUES (9, '朝花夕拾6', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 0, 13, 25, NULL);
INSERT INTO `book` VALUES (10, '朝花夕拾7', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 0, 14, 25, NULL);
INSERT INTO `book` VALUES (11, '朝花夕拾8', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 0, 15, 25, NULL);
INSERT INTO `book` VALUES (12, '朝花夕拾9', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 0, 11, 25, NULL);
INSERT INTO `book` VALUES (13, '朝花夕拾10', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 1, 16, 25, NULL);
INSERT INTO `book` VALUES (14, '朝花夕拾11', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 0, 17, 25, NULL);
INSERT INTO `book` VALUES (15, '朝花夕拾12', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 0, 18, 25, NULL);
INSERT INTO `book` VALUES (16, '朝花夕拾13', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 1, 25, 25, NULL);
INSERT INTO `book` VALUES (17, '朝花夕拾14', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 0, 0, 13, 25, NULL);
INSERT INTO `book` VALUES (18, '朝花夕拾15', '大奔', 3, 'K12345', '本书集合了世界上所有的可能与不可能的事情', 404, '4326754', '北京出版社', '2017-10-17 13:02:52', 1, 0, 14, 25, NULL);
INSERT INTO `book` VALUES (19, '钢铁是怎样炼成的1', '诺夫拉丝机', 1, 'K13241', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '54645111', '大象出版社', '2017-10-17 13:07:03', 0, 0, 8, 34, NULL);
INSERT INTO `book` VALUES (20, '钢铁是怎样炼成的2', '诺夫拉丝机', 1, 'K13242', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '546451112', '大象出版社', '2017-10-17 13:07:03', 1, 0, 7, 34, NULL);
INSERT INTO `book` VALUES (21, '钢铁是怎样炼成的3', '诺夫拉丝机', 1, 'K13243', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 1, 6, 34, NULL);
INSERT INTO `book` VALUES (22, '钢铁是怎样炼成的4', '诺夫拉丝机', 1, 'K13244', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '54645111234', '大象出版社', '2017-10-17 13:07:03', 0, 0, 5, 34, NULL);
INSERT INTO `book` VALUES (23, '钢铁是怎样炼成的5', '诺夫拉丝机', 1, 'K13245', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '546451112345', '大象出版社', '2017-10-17 13:07:03', 1, 1, 4, 34, NULL);
INSERT INTO `book` VALUES (24, '钢铁是怎样炼成的6', '诺夫拉丝机', 1, 'K13246', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 0, 12, 34, NULL);
INSERT INTO `book` VALUES (25, '钢铁是怎样炼成的7', '诺夫拉丝机', 1, 'K13247', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 0, 1, 3, 34, NULL);
INSERT INTO `book` VALUES (26, '钢铁是怎样炼成的8', '诺夫拉丝机', 1, 'K13248', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 0, 15, 34, NULL);
INSERT INTO `book` VALUES (27, '钢铁是怎样炼成的9', '诺夫拉丝机', 1, 'K13249', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 0, 12, 34, NULL);
INSERT INTO `book` VALUES (28, '钢铁是怎样炼成的10', '诺夫拉丝机', 1, 'K132410', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 1, 17, 34, NULL);
INSERT INTO `book` VALUES (29, '钢铁是怎样炼成的11', '诺夫拉丝机', 1, 'K132411', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 0, 0, 19, 34, NULL);
INSERT INTO `book` VALUES (30, '钢铁是怎样炼成的12', '诺夫拉丝机', 1, 'K132412', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 1, 16, 34, NULL);
INSERT INTO `book` VALUES (31, '钢铁是怎样炼成的13', '诺夫拉丝机', 1, 'K132413', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 0, 0, 13, 34, NULL);
INSERT INTO `book` VALUES (32, '钢铁是怎样炼成的14', '诺夫拉丝机', 1, 'K132414', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 1, 0, 11, 34, NULL);
INSERT INTO `book` VALUES (33, '钢铁是怎样炼成的15', '诺夫拉丝机', 1, 'K132415', '诺夫拉丝机的一本成名书，讲述了钢铁的制造过程', 521, '5464511123', '大象出版社', '2017-10-17 13:07:03', 0, 0, 15, 34, NULL);
INSERT INTO `book` VALUES (34, '大海捞针', '酸辣', 3, 'L65478', '讲的是孙悟空大闹天宫的故事', 654, '4568974', '新华出版社', '2017-10-18 15:09:22', 0, 0, 0, 6, NULL);
INSERT INTO `book` VALUES (35, '大闹天宫', '吴承恩', 1, 'L123456', '猪八戒，唐三藏，孙悟空', 4561, '789465416', '新华出版社', '2017-10-18 15:14:00', 0, 0, 0, 10, NULL);
INSERT INTO `book` VALUES (36, '错题本', '慈吉中学', 1, 'I45621', '全椒慈吉中学唯一出版，学科自选', 400, '500006', '北京出版社', '2017-10-19 11:01:43', 0, 1, 21, 21, NULL);

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype`  (
  `bt_id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  PRIMARY KEY (`bt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES (1, '文学类');
INSERT INTO `booktype` VALUES (2, '历史类');
INSERT INTO `booktype` VALUES (3, '教育类');
INSERT INTO `booktype` VALUES (4, '幼儿类');

-- ----------------------------
-- Table structure for ebook
-- ----------------------------
DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook`  (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_time` datetime(0) NULL DEFAULT NULL,
  `e_count` int(11) NULL DEFAULT NULL,
  `e_size` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`e_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ebook
-- ----------------------------
INSERT INTO `ebook` VALUES (1, '朝花夕拾.docx', '1507872823385.docx', '2017-10-13 13:33:43', 580, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872823385.docx');
INSERT INTO `ebook` VALUES (2, '鲁迅文集.docx', '1507872823418.docx', '2017-10-13 13:33:43', 320, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872823418.docx');
INSERT INTO `ebook` VALUES (3, '狂人日记.docx', '1507872823431.docx', '2017-10-13 13:33:43', 530, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872823431.docx');
INSERT INTO `ebook` VALUES (4, '路遥.docx', '1507872823460.docx', '2017-10-13 13:33:43', 520, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872823460.docx');
INSERT INTO `ebook` VALUES (5, '呐喊.docx', '1507872852271.docx', '2017-10-13 13:34:12', 510, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872852271.docx');
INSERT INTO `ebook` VALUES (6, '彷徨.docx', '1507872852312.docx', '2017-10-13 13:34:12', 460, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872852312.docx');
INSERT INTO `ebook` VALUES (7, '新青年.docx', '1507872852362.docx', '2017-10-13 13:34:12', 460, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872852362.docx');
INSERT INTO `ebook` VALUES (8, '野草.docx', '1507872852404.docx', '2017-10-13 13:34:12', 454, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872852404.docx');
INSERT INTO `ebook` VALUES (9, '中国小说史略.docx', '1507872852443.docx', '2017-10-13 13:34:12', 324, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872852443.docx');
INSERT INTO `ebook` VALUES (10, '平凡的世界.docx', '1507872938189.docx', '2017-10-13 13:35:38', 584, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507872938189.docx');
INSERT INTO `ebook` VALUES (11, '平凡的世界2.docx', '1507873009732.docx', '2017-10-13 13:36:49', 124, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873009732.docx');
INSERT INTO `ebook` VALUES (12, '平凡的世界3.docx', '1507873009757.docx', '2017-10-13 13:36:49', 500, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873009757.docx');
INSERT INTO `ebook` VALUES (13, '平凡的世界4.docx', '1507873009792.docx', '2017-10-13 13:36:49', 123, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873009792.docx');
INSERT INTO `ebook` VALUES (14, '平凡的世界5.docx', '1507873009819.docx', '2017-10-13 13:36:49', 156, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873009819.docx');
INSERT INTO `ebook` VALUES (15, '平凡的世界6.docx', '1507873009851.docx', '2017-10-13 13:36:49', 185, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873009851.docx');
INSERT INTO `ebook` VALUES (16, '平凡的世界7.docx', '1507873041821.docx', '2017-10-13 13:37:21', 111, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873041821.docx');
INSERT INTO `ebook` VALUES (17, '平凡的世界8.docx', '1507873041844.docx', '2017-10-13 13:37:21', 245, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873041844.docx');
INSERT INTO `ebook` VALUES (18, '平凡的世界9.docx', '1507873041870.docx', '2017-10-13 13:37:21', 236, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873041870.docx');
INSERT INTO `ebook` VALUES (19, '平凡的世界10.docx', '1507873041890.docx', '2017-10-13 13:37:21', 245, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873041890.docx');
INSERT INTO `ebook` VALUES (20, '平凡的世界11.docx', '1507873070241.docx', '2017-10-13 13:37:50', 298, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873070241.docx');
INSERT INTO `ebook` VALUES (21, '平凡的世界12.docx', '1507873070276.docx', '2017-10-13 13:37:50', 154, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873070276.docx');
INSERT INTO `ebook` VALUES (22, '平凡的世界13.docx', '1507873070312.docx', '2017-10-13 13:37:50', 158, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873070312.docx');
INSERT INTO `ebook` VALUES (23, '平凡的世界14.docx', '1507873070352.docx', '2017-10-13 13:37:50', 897, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873070352.docx');
INSERT INTO `ebook` VALUES (24, '平凡的世界15.docx', '1507873105245.docx', '2017-10-13 13:38:25', 456, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873105245.docx');
INSERT INTO `ebook` VALUES (25, '平凡的世界16.docx', '1507873105288.docx', '2017-10-13 13:38:25', 156, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873105288.docx');
INSERT INTO `ebook` VALUES (26, '平凡的世界17.docx', '1507873105307.docx', '2017-10-13 13:38:25', 545, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873105307.docx');
INSERT INTO `ebook` VALUES (27, '平凡的世界18.docx', '1507873105340.docx', '2017-10-13 13:38:25', 564, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873105340.docx');
INSERT INTO `ebook` VALUES (28, '平凡的世界19.docx', '1507873133112.docx', '2017-10-13 13:38:53', 354, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873133112.docx');
INSERT INTO `ebook` VALUES (29, '平凡的世界20.docx', '1507873133126.docx', '2017-10-13 13:38:53', 641, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873133126.docx');
INSERT INTO `ebook` VALUES (30, '平凡的世界21.docx', '1507873133154.docx', '2017-10-13 13:38:53', 156, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873133154.docx');
INSERT INTO `ebook` VALUES (31, '平凡的世界22.docx', '1507873133199.docx', '2017-10-13 13:38:53', 498, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873133199.docx');
INSERT INTO `ebook` VALUES (32, '平凡的世界23.docx', '1507873133218.docx', '2017-10-13 13:38:53', 465, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873133218.docx');
INSERT INTO `ebook` VALUES (33, '平凡的世界24.docx', '1507873166261.docx', '2017-10-13 13:39:26', 159, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873166261.docx');
INSERT INTO `ebook` VALUES (34, '平凡的世界25.docx', '1507873166327.docx', '2017-10-13 13:39:26', 158, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873166327.docx');
INSERT INTO `ebook` VALUES (35, '平凡的世界26.docx', '1507873166368.docx', '2017-10-13 13:39:26', 156, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873166368.docx');
INSERT INTO `ebook` VALUES (36, '平凡的世界27.docx', '1507873166378.docx', '2017-10-13 13:39:26', 578, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1507873166378.docx');
INSERT INTO `ebook` VALUES (37, '朝花夕拾.docx', '1508114810847.docx', '2017-10-16 08:46:50', NULL, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1508114810847.docx');
INSERT INTO `ebook` VALUES (38, '鲁迅文集.docx', '1508313015956.docx', '2017-10-18 15:50:15', NULL, 'C:UsersAdministratorworkspace.metadata.pluginsorg.eclipse.wst.server.core	mp0wtpwebappsBookManagerfile1508313015956.docx');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note`  (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `am_id` int(11) NULL DEFAULT NULL,
  `n_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `n_author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `n_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `n_time` datetime(0) NULL DEFAULT NULL,
  `n_state` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`n_id`) USING BTREE,
  INDEX `am_id`(`am_id`) USING BTREE,
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`am_id`) REFERENCES `adminmanager` (`am_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES (1, 1, '辞职申请0', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (2, 1, '辞职申请1', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (3, 1, '辞职申请2', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (4, 1, '辞职申请3', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (5, 1, '辞职申请4', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (6, 1, '辞职申请5', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (7, 1, '辞职申请6', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (8, 1, '辞职申请7', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (9, 1, '辞职申请8', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (10, 1, '辞职申请9', 'admin', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:41:57', 0);
INSERT INTO `note` VALUES (11, 2, '辞职申请0', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (12, 2, '辞职申请1', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (13, 2, '辞职申请2', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (14, 2, '辞职申请3', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (15, 2, '辞职申请4', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (16, 2, '辞职申请5', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (17, 2, '辞职申请6', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (18, 2, '辞职申请7', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (19, 2, '辞职申请8', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (20, 2, '辞职申请9', 'admin1', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:44:43', 0);
INSERT INTO `note` VALUES (21, 3, '辞职申请0', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (22, 3, '辞职申请1', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (23, 3, '辞职申请2', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (24, 3, '辞职申请3', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (25, 3, '辞职申请4', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (26, 3, '辞职申请5', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (27, 3, '辞职申请6', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (28, 3, '辞职申请7', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (29, 3, '辞职申请8', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (30, 3, '辞职申请9', 'admin2', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:45:22', 0);
INSERT INTO `note` VALUES (31, 4, '辞职申请0', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (32, 4, '辞职申请1', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (33, 4, '辞职申请2', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (34, 4, '辞职申请3', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (35, 4, '辞职申请4', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (36, 4, '辞职申请5', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (37, 4, '辞职申请6', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (38, 4, '辞职申请7', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (39, 4, '辞职申请8', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (40, 4, '辞职申请9', 'admin3', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:46:11', 0);
INSERT INTO `note` VALUES (41, 5, '辞职申请0', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:46:35', 0);
INSERT INTO `note` VALUES (42, 5, '辞职申请1', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:46:35', 0);
INSERT INTO `note` VALUES (43, 5, '辞职申请2', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:46:35', 0);
INSERT INTO `note` VALUES (44, 5, '辞职申请3', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (45, 5, '辞职申请4', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (46, 5, '辞职申请5', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (47, 5, '辞职申请6', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (48, 5, '辞职申请7', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (49, 5, '辞职申请8', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (50, 5, '辞职申请9', 'admin4', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:46:36', 0);
INSERT INTO `note` VALUES (51, 6, '辞职申请0', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (52, 6, '辞职申请1', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (53, 6, '辞职申请2', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (54, 6, '辞职申请3', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (55, 6, '辞职申请4', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (56, 6, '辞职申请5', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (57, 6, '辞职申请6', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (58, 6, '辞职申请7', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (59, 6, '辞职申请8', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (60, 6, '辞职申请9', 'admin5', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:47:09', 0);
INSERT INTO `note` VALUES (61, 7, '辞职申请0', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (62, 7, '辞职申请1', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (63, 7, '辞职申请2', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (64, 7, '辞职申请3', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (65, 7, '辞职申请4', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (66, 7, '辞职申请5', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (67, 7, '辞职申请6', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (68, 7, '辞职申请7', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (69, 7, '辞职申请8', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (70, 7, '辞职申请9', 'admin6', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:47:32', 0);
INSERT INTO `note` VALUES (71, 8, '辞职申请0', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:48:21', 0);
INSERT INTO `note` VALUES (72, 8, '辞职申请1', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (73, 8, '辞职申请2', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:48:22', 1);
INSERT INTO `note` VALUES (74, 8, '辞职申请3', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (75, 8, '辞职申请4', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (76, 8, '辞职申请5', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:48:22', 1);
INSERT INTO `note` VALUES (77, 8, '辞职申请6', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (78, 8, '辞职申请7', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (79, 8, '辞职申请8', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (80, 8, '辞职申请9', 'admin7', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:48:22', 0);
INSERT INTO `note` VALUES (81, 9, '辞职申请0', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过0', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (82, 9, '辞职申请1', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过1', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (83, 9, '辞职申请2', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过2', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (84, 9, '辞职申请3', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过3', '2017-10-20 11:48:56', 1);
INSERT INTO `note` VALUES (85, 9, '辞职申请4', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过4', '2017-10-20 11:48:56', 1);
INSERT INTO `note` VALUES (86, 9, '辞职申请5', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过5', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (87, 9, '辞职申请6', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过6', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (88, 9, '辞职申请7', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过7', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (89, 9, '辞职申请8', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过8', '2017-10-20 11:48:56', 0);
INSERT INTO `note` VALUES (90, 9, '辞职申请9', 'admin8', '由于将要毕业，所以决定辞去管理员一职，望通过9', '2017-10-20 11:48:56', 1);

-- ----------------------------
-- Table structure for supermanager
-- ----------------------------
DROP TABLE IF EXISTS `supermanager`;
CREATE TABLE `supermanager`  (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sm_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sm_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supermanager
-- ----------------------------
INSERT INTO `supermanager` VALUES (1, 'llh', '111111');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `us_userId` int(11) NOT NULL AUTO_INCREMENT,
  `us_userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `us_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `us_nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `us_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `us_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `us_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `us_certificateType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `us_certificateNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  PRIMARY KEY (`us_userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '46556', '男', '45665', NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, 'admin234234', '123', '234234', '男', '234234234', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
