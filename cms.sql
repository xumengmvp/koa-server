/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 23/05/2022 00:49:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` int NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` (`id`, `user`, `password`, `avatar`, `update_time`, `create_time`, `role`) VALUES (13, 'superAdmin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '/api/avatar/13', '2022-05-22 22:18:30', '2022-05-21 10:01:41', 3);
INSERT INTO `account` (`id`, `user`, `password`, `avatar`, `update_time`, `create_time`, `role`) VALUES (14, 'vastio', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '/api/avatar/14', '2022-05-22 22:15:25', '2022-05-21 12:48:42', 3);
COMMIT;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `originalname` varchar(256) NOT NULL,
  `mimetype` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `filename` varchar(256) NOT NULL,
  `path` varchar(256) NOT NULL,
  `size` int NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `avatar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of avatar
-- ----------------------------
BEGIN;
INSERT INTO `avatar` (`id`, `user_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (1, 14, 'WechatIMG35.jpeg', 'image/jpeg', '98d8fb78e252b49eebc96942d97d7610', 'uploads/avatar/98d8fb78e252b49eebc96942d97d7610', 33465, '2022-05-22 21:33:49', '2022-05-22 21:33:49');
INSERT INTO `avatar` (`id`, `user_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (2, 14, 'WechatIMG35.jpeg', 'image/jpeg', 'fcf1b2191ee95c8ba39c3def030b2b98', 'uploads/avatar/fcf1b2191ee95c8ba39c3def030b2b98', 33465, '2022-05-22 21:33:52', '2022-05-22 21:33:52');
INSERT INTO `avatar` (`id`, `user_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (3, 14, 'src=http___img.jj20.com_up_allimg_1114_113020142315_201130142315-1-1200.jpg&refer=http___img.jj20.webp', 'image/webp', '00ffdc0a484ee5b7e6b5902d22720593', 'uploads/avatar/00ffdc0a484ee5b7e6b5902d22720593', 35150, '2022-05-22 22:15:25', '2022-05-22 22:15:25');
INSERT INTO `avatar` (`id`, `user_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (4, 13, 'WechatIMG35.jpeg', 'image/jpeg', 'f9773532b93e8c1b12a0cb54ded22a75', 'uploads/avatar/f9773532b93e8c1b12a0cb54ded22a75', 33465, '2022-05-22 22:18:30', '2022-05-22 22:18:30');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (2, 13, '天朗气清', '天朗气清, 风和日丽！', '2022-05-21 10:52:33', '2022-05-21 10:52:33');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (3, 13, '天朗气清', '天朗气清, 风和日丽！', '2022-05-21 10:52:37', '2022-05-21 10:52:37');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (4, 13, '天朗气清', '天朗气清, 风和日丽！', '2022-05-21 10:56:55', '2022-05-21 10:56:55');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (5, 13, '你好世界', '天朗气清, 风和日丽！', '2022-05-21 10:57:12', '2022-05-21 10:57:12');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (6, 13, '好日子还在后面呢！', '天朗气清, 风和日丽！', '2022-05-21 10:57:38', '2022-05-21 10:57:38');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (7, 13, '今天天气晴朗！', '天朗气清, 风和日丽！', '2022-05-21 10:58:15', '2022-05-21 10:58:15');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (8, 13, '今天天气不错！', '天朗气清, 惠风和畅！', '2022-05-21 12:42:57', '2022-05-21 12:42:57');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (9, 13, '枫叶', '枫叶好漂亮！', '2022-05-21 12:50:33', '2022-05-21 12:50:33');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (11, 14, '风和日丽', 'happly brithday!', '2022-05-21 21:12:57', '2022-05-21 21:12:57');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (12, 14, '风和日丽2', 'happly brithday2!', '2022-05-21 21:13:19', '2022-05-21 21:13:19');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (13, 14, '风和日丽3', 'happly brithday3!', '2022-05-21 21:13:33', '2022-05-21 21:13:33');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (14, 14, '风和日丽3', 'happly brithday3!', '2022-05-21 21:14:36', '2022-05-21 21:14:36');
INSERT INTO `comment` (`id`, `user_id`, `title`, `content`, `create_time`, `update_time`) VALUES (15, 14, '风和日丽3', 'happly brithday3!', '2022-05-21 21:14:38', '2022-05-21 21:14:38');
COMMIT;

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judge_content` varchar(200) NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `self_id` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  KEY `self_id` (`self_id`),
  CONSTRAINT `judge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `judge_ibfk_3` FOREIGN KEY (`self_id`) REFERENCES `judge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of judge
-- ----------------------------
BEGIN;
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (1, '你好，美女！', 14, 2, NULL, '2022-05-21 17:27:35', '2022-05-21 17:27:35');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (2, '你好，帅哥！', 14, 2, NULL, '2022-05-21 17:28:38', '2022-05-21 17:28:38');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (3, '你好，帅哥！', 13, 2, NULL, '2022-05-21 17:29:14', '2022-05-21 17:29:14');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (4, '你好，Romeo！', 13, 2, NULL, '2022-05-21 20:36:22', '2022-05-21 20:36:22');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (5, '你好，Romeo！', 13, 2, NULL, '2022-05-21 20:48:51', '2022-05-21 20:48:51');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (6, '你好，Romeo！', 13, 2, NULL, '2022-05-21 20:48:52', '2022-05-21 20:48:52');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (7, '你好，Romeo！', 13, 2, NULL, '2022-05-21 20:48:53', '2022-05-21 20:48:53');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (8, '功成名就不是目的！', 14, 3, NULL, '2022-05-22 09:23:32', '2022-05-22 09:23:32');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (9, '切克闹！', 14, 5, NULL, '2022-05-22 09:24:06', '2022-05-22 09:24:06');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (10, 'who is your', 14, 3, NULL, '2022-05-22 09:24:46', '2022-05-22 09:24:46');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (11, '你好，美女！', 14, 4, NULL, '2022-05-22 09:25:08', '2022-05-22 09:25:08');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (12, '你好，美女！', 14, 4, NULL, '2022-05-22 09:25:11', '2022-05-22 09:25:11');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (13, '问苍茫大地， 谁主沉浮！', 14, 6, NULL, '2022-05-22 09:25:35', '2022-05-22 09:25:35');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (14, 'is OK OK？！', 14, 9, NULL, '2022-05-22 09:26:02', '2022-05-22 09:26:02');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (15, 'is OK OK？！', 14, 2, 1, '2022-05-22 10:52:17', '2022-05-22 10:53:01');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (17, '一起坐时光机！', 14, 3, 8, '2022-05-22 10:54:55', '2022-05-22 11:27:22');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (18, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:36:22', '2022-05-22 11:36:22');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (19, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:40:34', '2022-05-22 11:40:34');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (20, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:40:35', '2022-05-22 11:40:35');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (21, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:40:36', '2022-05-22 11:40:36');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (22, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:40:36', '2022-05-22 11:40:36');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (23, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:40:37', '2022-05-22 11:40:37');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (24, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:41:48', '2022-05-22 11:41:48');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (25, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:41:49', '2022-05-22 11:41:49');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (26, 'romeo && juliet', 14, 3, 17, '2022-05-22 11:42:21', '2022-05-22 11:42:21');
INSERT INTO `judge` (`id`, `judge_content`, `user_id`, `comment_id`, `self_id`, `create_time`, `update_time`) VALUES (27, 'romeo && juliet', 14, 3, 17, '2022-05-22 22:15:10', '2022-05-22 22:15:10');
COMMIT;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of label
-- ----------------------------
BEGIN;
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (1, 'c语言', '2022-05-22 14:54:44', '2022-05-22 14:54:44');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (3, '前端', '2022-05-22 14:55:16', '2022-05-22 14:55:16');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (4, '后端', '2022-05-22 14:55:22', '2022-05-22 14:55:22');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (5, 'java', '2022-05-22 14:55:27', '2022-05-22 14:55:27');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (6, 'javascript', '2022-05-22 14:55:34', '2022-05-22 14:55:34');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (7, 'node', '2022-05-22 14:55:39', '2022-05-22 14:55:39');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (8, 'vue', '2022-05-22 14:55:44', '2022-05-22 14:55:44');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (9, 'react', '2022-05-22 14:55:48', '2022-05-22 14:55:48');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (10, 'spring boot', '2022-05-22 14:55:56', '2022-05-22 14:55:56');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (11, 'spring cloud', '2022-05-22 14:56:05', '2022-05-22 14:56:05');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (12, 'spring MVC', '2022-05-22 14:56:11', '2022-05-22 14:56:11');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (13, 'element ui', '2022-05-22 14:56:27', '2022-05-22 14:56:27');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (14, 'element ui+', '2022-05-22 14:56:31', '2022-05-22 14:56:31');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (15, 'react native', '2022-05-22 14:56:43', '2022-05-22 14:56:43');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (16, 'fluter', '2022-05-22 14:57:00', '2022-05-22 14:57:00');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (17, 'uniapp', '2022-05-22 14:57:05', '2022-05-22 14:57:05');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (18, 'mysql', '2022-05-22 14:57:11', '2022-05-22 14:57:11');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (19, 'DB2', '2022-05-22 14:57:17', '2022-05-22 14:57:17');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (20, 'sql server', '2022-05-22 14:57:35', '2022-05-22 14:57:35');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (21, 'redis', '2022-05-22 14:57:41', '2022-05-22 14:57:41');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (22, 'mongodb', '2022-05-22 14:57:54', '2022-05-22 14:57:54');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (23, 'c++', '2022-05-22 15:29:13', '2022-05-22 15:29:13');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (24, 'php', '2022-05-22 15:29:13', '2022-05-22 15:29:13');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (25, 'backbone', '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (26, 'jquery', '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (27, 'iview', '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `label` (`id`, `name`, `create_time`, `update_time`) VALUES (28, 'c#', '2022-05-22 15:47:12', '2022-05-22 15:47:12');
COMMIT;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `originalname` varchar(256) NOT NULL,
  `mimetype` varchar(256) NOT NULL,
  `filename` varchar(256) NOT NULL,
  `path` varchar(256) NOT NULL,
  `size` int NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`),
  CONSTRAINT `picture_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of picture
-- ----------------------------
BEGIN;
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (1, 13, 2, 'WechatIMG35.jpeg', 'image/jpeg', '391e37940fff7e4144f611b8a7aefa50', 'uploads/picture/391e37940fff7e4144f611b8a7aefa50', 33465, '2022-05-22 23:53:45', '2022-05-22 23:53:45');
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (4, 13, 2, 'WechatIMG35.jpeg', 'image/jpeg', 'c5a78efb403fcd7cee9c658b8ff19da1', 'uploads/picture/c5a78efb403fcd7cee9c658b8ff19da1', 33465, '2022-05-23 00:06:19', '2022-05-23 00:06:19');
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (5, 13, 2, 'WechatIMG35.jpeg', 'image/jpeg', '4e2e32203376fa41d4447c31d73e4c77', 'uploads/picture/4e2e32203376fa41d4447c31d73e4c77', 33465, '2022-05-23 00:06:19', '2022-05-23 00:06:19');
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (6, 13, 2, 'WechatIMG35.jpeg', 'image/jpeg', '6d8ddef6cfed9b40f65dbfe42065f0ba', 'uploads/picture/6d8ddef6cfed9b40f65dbfe42065f0ba', 33465, '2022-05-23 00:32:17', '2022-05-23 00:32:17');
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (7, 13, 2, 'src=http___img.jj20.com_up_allimg_1114_113020142315_201130142315-1-1200.jpg&refer=http___img.jj20.webp', 'image/webp', '5fca65043276bae84d9d202bac882cf9', 'uploads/picture/5fca65043276bae84d9d202bac882cf9', 35150, '2022-05-23 00:32:17', '2022-05-23 00:32:17');
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (8, 13, 2, 'WechatIMG35.jpeg', 'image/jpeg', 'd41c21d480f6c5ef780d875f0812050e', 'uploads/picture/d41c21d480f6c5ef780d875f0812050e', 33465, '2022-05-23 00:45:44', '2022-05-23 00:45:44');
INSERT INTO `picture` (`id`, `user_id`, `comment_id`, `originalname`, `mimetype`, `filename`, `path`, `size`, `create_time`, `update_time`) VALUES (9, 13, 2, 'src=http___img.jj20.com_up_allimg_1114_113020142315_201130142315-1-1200.jpg&refer=http___img.jj20.webp', 'image/webp', '364709751e072acd2e6cc3052ae086f8', 'uploads/picture/364709751e072acd2e6cc3052ae086f8', 35150, '2022-05-23 00:45:44', '2022-05-23 00:45:44');
COMMIT;

-- ----------------------------
-- Table structure for rlabel
-- ----------------------------
DROP TABLE IF EXISTS `rlabel`;
CREATE TABLE `rlabel` (
  `comment_id` int NOT NULL,
  `label_id` int NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`,`label_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `rlabel_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rlabel_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of rlabel
-- ----------------------------
BEGIN;
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (2, 1, '2022-05-22 15:40:06', '2022-05-22 15:40:06');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (2, 23, '2022-05-22 15:40:06', '2022-05-22 15:40:06');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (2, 24, '2022-05-22 15:40:06', '2022-05-22 15:40:06');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (3, 8, '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (3, 25, '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (3, 26, '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (3, 27, '2022-05-22 15:41:13', '2022-05-22 15:41:13');
INSERT INTO `rlabel` (`comment_id`, `label_id`, `create_time`, `update_time`) VALUES (3, 28, '2022-05-22 15:47:12', '2022-05-22 15:47:12');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
