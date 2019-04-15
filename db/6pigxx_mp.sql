/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost
 Source Database       : pigxx_mp

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : utf-8

 Date: 04/15/2019 22:16:01 PM
*/
USE pigxx_mp;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `wx_account`
-- ----------------------------
DROP TABLE IF EXISTS `wx_account`;
CREATE TABLE `wx_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '公众号名称',
  `account` varchar(100) DEFAULT NULL COMMENT '公众号账户',
  `appid` varchar(100) DEFAULT NULL COMMENT '公众号appid',
  `appsecret` varchar(100) DEFAULT NULL COMMENT '公众号密钥',
  `url` varchar(100) DEFAULT NULL COMMENT '公众号url',
  `token` varchar(100) DEFAULT NULL COMMENT '公众号token',
  `aeskey` varchar(300) DEFAULT NULL COMMENT '加密密钥',
  `qr_url` varchar(200) DEFAULT NULL COMMENT '二维码图片URL',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号账户表';

-- ----------------------------
--  Table structure for `wx_account_fans`
-- ----------------------------
DROP TABLE IF EXISTS `wx_account_fans`;
CREATE TABLE `wx_account_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户标识',
  `subscribe_status` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '订阅状态，0未关注，1已关注',
  `subscribe_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别，1男，2女，0未知',
  `language` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '语言',
  `country` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '国家',
  `province` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '省份',
  `city` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市',
  `headimg_url` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像地址',
  `remark` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `wx_account_id` int(11) DEFAULT NULL COMMENT '微信公众号ID',
  `wx_account_name` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `wx_account_appid` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信公众号appid',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_1` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信公众号粉丝表';

-- ----------------------------
--  Table structure for `wx_fans_msg`
-- ----------------------------
DROP TABLE IF EXISTS `wx_fans_msg`;
CREATE TABLE `wx_fans_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户标识',
  `nickname` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '昵称',
  `headimg_url` varchar(500) DEFAULT NULL COMMENT '头像地址',
  `wx_account_appid` varchar(255) DEFAULT NULL,
  `wx_account_name` varchar(255) DEFAULT NULL,
  `wx_account_id` int(11) DEFAULT NULL COMMENT '微信账号ID',
  `msg_id` bigint(20) DEFAULT NULL COMMENT '消息ID',
  `msg_type` varchar(32) DEFAULT NULL COMMENT '消息类型',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `res_content` varchar(3000) DEFAULT NULL COMMENT '最近一条回复内容',
  `is_res` char(1) DEFAULT '0' COMMENT '是否已回复',
  `media_id` varchar(100) DEFAULT NULL COMMENT '微信素材ID',
  `pic_url` varchar(500) DEFAULT NULL COMMENT '微信图片URL',
  `pic_path` varchar(500) DEFAULT NULL COMMENT '本地图片路径',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='粉丝消息表 ';

-- ----------------------------
--  Table structure for `wx_fans_msg_res`
-- ----------------------------
DROP TABLE IF EXISTS `wx_fans_msg_res`;
CREATE TABLE `wx_fans_msg_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fans_msg_id` int(11) DEFAULT NULL COMMENT '粉丝消息ID',
  `res_content` text COMMENT '回复内容',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标识',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回复粉丝消息历史表 ';

-- ----------------------------
--  Table structure for `wx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu` json DEFAULT NULL COMMENT '菜单',
  `wx_account_id` int(11) DEFAULT NULL,
  `wx_account_appid` varchar(100) DEFAULT NULL,
  `wx_account_name` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `pub_flag` char(1) DEFAULT '0' COMMENT '发布标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

SET FOREIGN_KEY_CHECKS = 1;
