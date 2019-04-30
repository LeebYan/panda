/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost
 Source Database       : pigxx

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : utf-8

 Date: 04/29/2019 22:53:35 PM
*/
USE pigxx;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `sys_datasource_conf`
-- ----------------------------
DROP TABLE IF EXISTS `sys_datasource_conf`;
CREATE TABLE `sys_datasource_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新',
  `del_flag` char(50) DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='数据源表';

-- ----------------------------
--  Records of `sys_datasource_conf`
-- ----------------------------
BEGIN;
INSERT INTO `sys_datasource_conf` VALUES ('3', 'pigxx', 'jdbc:mysql://pigx-mysql:3306/pigxx?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true', 'root', 'Cx+ocw0iFCpae4Qo4IoFmQ==', '2019-03-31 16:40:43', '2019-04-11 20:57:06', '0', '1'), ('4', 'pigxx_ac', 'jdbc:mysql://pigx-mysql:3306/pigxx_ac?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'uzmKfiW1J8dcen1BH+yf8g==', '2019-03-31 17:53:25', '2019-04-11 20:57:28', '0', '1'), ('5', 'pigxx_job', 'jdbc:mysql://pigx-mysql:3306/pigxx_job?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'mSHzblMDiW3j/ZV+ZuDm1w==', '2019-03-31 17:53:25', '2019-04-11 20:57:54', '0', '1'), ('6', 'pigxx_zipkin', 'jdbc:mysql://pigx-mysql:3306/pigxx_zipkin?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'fH5Skf0hP/6+HCNnJdQYKg==', '2019-03-31 17:53:25', '2019-04-11 20:57:57', '0', '1'), ('9', 'pigxx_', 'jdbc:mysql://pigx-mysql:3306/pigxx?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8', 'root', 'vZ/xtaHxCOxl/vvpbpboTQ==', '2019-03-31 19:56:12', '2019-04-11 20:58:16', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '山东农信', null, '2018-01-22 19:00:23', '2018-09-13 01:46:29', '0', '0', '1'), ('2', '沙县国际', null, '2018-01-22 19:00:38', '2018-09-13 01:46:30', '0', '0', '1'), ('3', '潍坊农信', null, '2018-01-22 19:00:44', '2018-09-13 01:46:31', '0', '1', '1'), ('4', '高新农信', null, '2018-01-22 19:00:52', '2018-10-06 10:41:52', '0', '3', '1'), ('5', '院校农信', null, '2018-01-22 19:00:57', '2018-10-06 10:42:51', '0', '4', '1'), ('6', '潍院农信', null, '2018-01-22 19:01:06', '2019-01-09 10:58:18', '1', '5', '1'), ('7', '山东沙县', null, '2018-01-22 19:01:57', '2018-09-13 01:46:42', '0', '2', '1'), ('8', '潍坊沙县', null, '2018-01-22 19:02:03', '2018-09-13 01:46:43', '0', '7', '1'), ('9', '高新沙县', null, '2018-01-22 19:02:14', '2018-09-13 01:46:44', '1', '8', '1'), ('10', '租户2', null, '2018-11-18 13:27:11', '2018-11-18 13:42:19', '0', '0', '2'), ('11', '院校沙县', null, '2018-12-10 21:19:26', null, '0', '8', '1'), ('12', '小院沙县', '5', '2019-04-28 17:33:31', null, '0', '11', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`) USING BTREE,
  KEY `idx1` (`ancestor`) USING BTREE,
  KEY `idx2` (`descendant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
--  Records of `sys_dept_relation`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_relation` VALUES ('1', '1'), ('1', '3'), ('1', '4'), ('1', '5'), ('2', '2'), ('2', '7'), ('2', '8'), ('2', '11'), ('2', '12'), ('3', '3'), ('3', '4'), ('3', '5'), ('4', '4'), ('4', '5'), ('5', '5'), ('7', '7'), ('7', '8'), ('7', '11'), ('7', '12'), ('8', '8'), ('8', '11'), ('8', '12'), ('10', '10'), ('11', '11'), ('11', '12'), ('12', '12');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', 'log_type', '日志类型', '2019-03-19 11:06:44', '2019-03-19 11:06:44', '异常、正常', '0', '1'), ('2', 'social_type', '社交登录', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '微信、QQ', '0', '1'), ('3', 'leave_status', '请假状态', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '未提交、审批中、完成、驳回', '0', '1'), ('4', 'job_type', '定时任务类型', '2019-03-19 11:22:21', '2019-03-19 11:22:21', 'quartz', '0', '1'), ('5', 'job_status', '定时任务状态', '2019-03-19 11:24:57', '2019-03-19 11:24:57', '发布状态、运行状态', '0', '1'), ('6', 'job_execute_status', '定时任务执行状态', '2019-03-19 11:26:15', '2019-03-19 11:26:15', '正常、异常', '0', '1'), ('7', 'misfire_policy', '定时任务错失执行策略', '2019-03-19 11:27:19', '2019-03-19 11:27:19', '周期', '0', '1'), ('8', 'gender', '性别', '2019-03-27 13:44:06', '2019-03-27 13:44:06', '微信用户性别', '0', '1'), ('9', 'subscribe', '订阅状态', '2019-03-27 13:48:33', '2019-03-27 13:48:33', '公众号订阅状态', '0', '1'), ('10', 'response_type', '回复', '2019-03-28 21:29:21', '2019-03-28 21:29:21', '微信消息是否已回复', '0', '1'), ('11', 'param_type', '参数配置', '2019-04-29 18:20:47', '2019-04-29 18:20:47', '检索、原文、报表、安全、文档、消息、其他', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(11) NOT NULL,
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典项';

-- ----------------------------
--  Records of `sys_dict_item`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_item` VALUES ('1', '1', '9', '异常', 'log_type', '日志异常', '1', '2019-03-19 11:08:59', '2019-03-25 12:49:13', '', '0', '1'), ('2', '1', '0', '正常', 'log_type', '日志正常', '0', '2019-03-19 11:09:17', '2019-03-25 12:49:18', '', '0', '1'), ('3', '2', 'WX', '微信', 'social_type', '微信登录', '0', '2019-03-19 11:10:02', '2019-03-25 12:49:36', '', '0', '1'), ('4', '2', 'QQ', 'QQ', 'social_type', 'QQ登录', '1', '2019-03-19 11:10:14', '2019-03-25 12:49:36', '', '0', '1'), ('5', '3', '0', '未提交', 'leave_status', '未提交', '0', '2019-03-19 11:18:34', '2019-03-25 12:49:36', '', '0', '1'), ('6', '3', '1', '审批中', 'leave_status', '审批中', '1', '2019-03-19 11:18:45', '2019-03-25 12:49:36', '', '0', '1'), ('7', '3', '2', '完成', 'leave_status', '完成', '2', '2019-03-19 11:19:02', '2019-03-25 12:49:36', '', '0', '1'), ('8', '3', '9', '驳回', 'leave_status', '驳回', '9', '2019-03-19 11:19:20', '2019-03-25 12:49:36', '', '0', '1'), ('9', '4', '1', 'java类', 'job_type', 'java类', '1', '2019-03-19 11:22:37', '2019-03-25 12:49:36', '', '0', '1'), ('10', '4', '2', 'spring bean', 'job_type', 'spring bean容器实例', '2', '2019-03-19 11:23:05', '2019-03-25 12:49:36', '', '0', '1'), ('11', '4', '9', '其他', 'job_type', '其他类型', '9', '2019-03-19 11:23:31', '2019-03-25 12:49:36', '', '0', '1'), ('12', '4', '3', 'Rest 调用', 'job_type', 'Rest 调用', '3', '2019-03-19 11:23:57', '2019-03-25 12:49:36', '', '0', '1'), ('13', '4', '4', 'jar', 'job_type', 'jar类型', '4', '2019-03-19 11:24:20', '2019-03-25 12:49:36', '', '0', '1'), ('14', '5', '1', '未发布', 'job_status', '未发布', '1', '2019-03-19 11:25:18', '2019-03-25 12:49:36', '', '0', '1'), ('15', '5', '2', '运行中', 'job_status', '运行中', '2', '2019-03-19 11:25:31', '2019-03-25 12:49:36', '', '0', '1'), ('16', '5', '3', '暂停', 'job_status', '暂停', '3', '2019-03-19 11:25:42', '2019-03-25 12:49:36', '', '0', '1'), ('17', '6', '0', '正常', 'job_execute_status', '正常', '0', '2019-03-19 11:26:27', '2019-03-25 12:49:36', '', '0', '1'), ('18', '6', '1', '异常', 'job_execute_status', '异常', '1', '2019-03-19 11:26:41', '2019-03-25 12:49:36', '', '0', '1'), ('19', '7', '1', '错失周期立即执行', 'misfire_policy', '错失周期立即执行', '1', '2019-03-19 11:27:45', '2019-03-25 12:49:36', '', '0', '1'), ('20', '7', '2', '错失周期执行一次', 'misfire_policy', '错失周期执行一次', '2', '2019-03-19 11:27:57', '2019-03-25 12:49:36', '', '0', '1'), ('21', '7', '3', '下周期执行', 'misfire_policy', '下周期执行', '3', '2019-03-19 11:28:08', '2019-03-25 12:49:36', '', '0', '1'), ('22', '8', '1', '男', 'gender', '微信-男', '0', '2019-03-27 13:45:13', '2019-03-27 13:45:13', '微信-男', '0', '1'), ('23', '8', '2', '女', 'gender', '女-微信', '1', '2019-03-27 13:45:34', '2019-03-27 13:45:34', '女-微信', '0', '1'), ('24', '8', '0', '未知', 'gender', 'x性别未知', '3', '2019-03-27 13:45:57', '2019-03-27 13:45:57', 'x性别未知', '0', '1'), ('25', '9', '0', '未关注', 'subscribe', '公众号-未关注', '0', '2019-03-27 13:49:07', '2019-03-27 13:49:07', '公众号-未关注', '0', '1'), ('26', '9', '1', '已关注', 'subscribe', '公众号-已关注', '1', '2019-03-27 13:49:26', '2019-03-27 13:49:26', '公众号-已关注', '0', '1'), ('27', '10', '0', '未回复', 'response_type', '微信消息-未回复', '0', '2019-03-28 21:29:47', '2019-03-28 21:29:47', '微信消息-未回复', '0', '1'), ('28', '10', '1', '已回复', 'response_type', '微信消息-已回复', '1', '2019-03-28 21:30:08', '2019-03-28 21:30:08', '微信消息-已回复', '0', '1'), ('29', '11', '1', '检索', 'param_type', '检索', '0', '2019-04-29 18:22:17', '2019-04-29 18:22:17', '检索', '0', '1'), ('30', '11', '2', '原文', 'param_type', '原文', '0', '2019-04-29 18:22:27', '2019-04-29 18:22:27', '原文', '0', '1'), ('31', '11', '3', '报表', 'param_type', '报表', '0', '2019-04-29 18:22:36', '2019-04-29 18:22:36', '报表', '0', '1'), ('32', '11', '4', '安全', 'param_type', '安全', '0', '2019-04-29 18:22:46', '2019-04-29 18:22:46', '安全', '0', '1'), ('33', '11', '5', '文档', 'param_type', '文档', '0', '2019-04-29 18:22:56', '2019-04-29 18:22:56', '文档', '0', '1'), ('34', '11', '6', '消息', 'param_type', '消息', '0', '2019-04-29 18:23:05', '2019-04-29 18:23:05', '消息', '0', '1'), ('35', '11', '9', '其他', 'param_type', '其他', '0', '2019-04-29 18:23:16', '2019-04-29 18:23:16', '其他', '0', '1'), ('36', '11', '0', '默认', 'param_type', '默认', '0', '2019-04-29 18:23:30', '2019-04-29 18:23:30', '默认', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  `tenant_id` int(11) DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('3', '0', '删除用户token', 'pig', 'admin', '2019-04-19 14:07:45', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/token/ca3691bb-9a5e-4dda-9410-2c32624a4413', 'DELETE', '', '40', '0', null, '1'), ('4', '0', '删除用户token', 'pig', 'admin', '2019-04-19 14:10:29', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/token/f8ea1bb1-a839-445e-9e76-bb16aecbfa13', 'DELETE', '', '60', '0', null, '1'), ('5', '0', '删除用户token', 'pig', 'admin', '2019-04-19 14:11:03', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/token/f8ea1bb1-a839-445e-9e76-bb16aecbfa13', 'DELETE', '', '9', '0', null, '1'), ('6', '0', '删除用户token', 'pig', 'admin', '2019-04-19 14:15:18', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/token/f8ea1bb1-a839-445e-9e76-bb16aecbfa13', 'DELETE', '', '2061', '0', null, '1'), ('7', '0', '删除用户token', 'pig', 'admin', '2019-04-19 14:20:01', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/token/f8ea1bb1-a839-445e-9e76-bb16aecbfa13', 'DELETE', '', '20945', '0', null, '1'), ('8', '0', '删除用户token', 'pig', 'admin', '2019-04-19 14:42:12', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/token/f8ea1bb1-a839-445e-9e76-bb16aecbfa13', 'DELETE', '', '2584', '0', null, '1'), ('9', '0', '添加部门', 'pig', 'admin', '2019-04-28 17:33:32', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/dept', 'POST', '', '63', '0', null, '1'), ('10', '0', '添加角色', 'pig', 'admin', '2019-04-28 17:34:07', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role', 'POST', '', '9', '0', null, '1'), ('11', '0', '更新角色菜单', 'pig', 'admin', '2019-04-28 17:34:24', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3620%2C3630%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C6000%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6303%2C6304%2C6305%2C6400%2C6401%2C6402%2C6500%2C9999%2C%5D', '64', '0', null, '1'), ('12', '0', '添加用户', 'pig', 'admin', '2019-04-28 17:35:28', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/user', 'POST', '', '121', '0', null, '1'), ('13', '0', '更新角色菜单', 'pig', 'admin', '2019-04-28 17:38:40', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3620%2C3630%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C6000%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6303%2C6304%2C6305%2C6400%2C6401%2C6402%2C6500%2C9999%2C%5D', '39', '0', null, '1'), ('14', '0', '更新角色菜单', 'pig', 'admin', '2019-04-28 17:39:17', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3620%2C3630%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C6000%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6303%2C6304%2C6305%2C6400%2C6401%2C6402%2C6500%2C9999%2C%5D', '37', '0', null, '1'), ('15', '0', '更新角色菜单', 'pig', 'admin', '2019-04-28 17:40:22', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C%5D', '16', '0', null, '1'), ('16', '0', '更新角色菜单', 'pig', 'admin', '2019-04-28 18:02:14', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3620%2C3630%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C6000%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6303%2C6304%2C6305%2C6400%2C6401%2C6402%2C6500%2C9999%2C%5D', '110', '0', null, '1'), ('17', '0', '更新角色菜单', 'pig', 'admin', '2019-04-28 18:10:06', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B3%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2201%2C2202%2C2203%2C2300%2C2400%2C2401%2C2402%2C2403%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C2800%2C2810%2C2820%2C2830%2C2840%2C2850%2C2860%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3600%2C3601%2C3620%2C3630%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C6000%2C6100%2C6101%2C6102%2C6103%2C6200%2C6201%2C6202%2C6203%2C6300%2C6301%2C6302%2C6303%2C6304%2C6305%2C6400%2C6401%2C6402%2C6500%2C%5D', '122', '0', null, '1'), ('18', '0', '新增菜单', 'pig', 'admin', '2019-04-29 22:16:50', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '24', '0', null, '1'), ('19', '0', '新增菜单', 'pig', 'admin', '2019-04-29 22:17:36', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '12', '0', null, '1'), ('20', '0', '新增菜单', 'pig', 'admin', '2019-04-29 22:17:55', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '7', '0', null, '1'), ('21', '0', '新增菜单', 'pig', 'admin', '2019-04-29 22:18:14', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'POST', '', '12', '0', null, '1'), ('22', '0', '更新角色菜单', 'pig', 'admin', '2019-04-29 22:19:04', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C1700%2C1701%2C1702%2C1703%2C2100%2C2101%2C2200%2C2203%2C2202%2C2201%2C2800%2C2830%2C2860%2C2850%2C2840%2C2820%2C2810%2C2300%2C2400%2C2403%2C2402%2C2401%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3630%2C3620%2C3600%2C3601%2C3700%2C3800%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C6000%2C6400%2C6401%2C6402%2C6500%2C6200%2C6201%2C6202%2C6203%2C6100%2C6101%2C6102%2C6103%2C6300%2C6301%2C6305%2C6302%2C6303%2C6304%2C9999%2C2000%5D', '137', '0', null, '1'), ('23', '0', '更新菜单', 'pig', 'admin', '2019-04-29 22:19:25', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/menu', 'PUT', '', '18', '0', null, '1'), ('24', '0', '更新角色菜单', 'pig', 'admin', '2019-04-29 22:20:37', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/role/menu', 'PUT', 'roleId=%5B1%5D&menuIds=%5B1000%2C1100%2C1101%2C1102%2C1103%2C1200%2C1201%2C1202%2C1203%2C1300%2C1301%2C1302%2C1303%2C1304%2C1400%2C1401%2C1402%2C1403%2C2000%2C2100%2C2101%2C2200%2C2203%2C2202%2C2201%2C2210%2C2211%2C2212%2C2213%2C2800%2C2850%2C2860%2C2840%2C2830%2C2820%2C2810%2C2300%2C2400%2C2403%2C2402%2C2401%2C2500%2C2501%2C2502%2C2503%2C2600%2C2601%2C2700%2C3000%2C3100%2C3200%2C3300%2C3400%2C3500%2C3630%2C3620%2C3600%2C3601%2C3700%2C3800%2C6000%2C6400%2C6401%2C6402%2C6500%2C6200%2C6201%2C6202%2C6203%2C6100%2C6101%2C6102%2C6103%2C6300%2C6301%2C6305%2C6302%2C6303%2C6304%2C4000%2C4100%2C4101%2C4200%2C4201%2C4300%2C4301%2C4302%2C4303%2C4400%2C4401%2C9999%2C%5D', '44', '0', null, '1'), ('25', '0', '新增公共参数', 'pig', 'admin', '2019-04-29 22:25:15', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/param', 'POST', '', '11', '0', null, '1'), ('26', '0', '修改公共参数', 'pig', 'admin', '2019-04-29 22:25:26', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/param', 'PUT', '', '10', '0', null, '1'), ('27', '0', '删除公共参数', 'pig', 'admin', '2019-04-29 22:25:29', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/param/5', 'DELETE', '', '6', '0', null, '1'), ('28', '0', '新增公共参数', 'pig', 'admin', '2019-04-29 22:32:44', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/param', 'POST', '', '15', '0', null, '1'), ('29', '0', '修改公共参数', 'pig', 'admin', '2019-04-29 22:34:05', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/param', 'PUT', '', '18', '0', null, '1'), ('30', '0', '修改公共参数', 'pig', 'admin', '2019-04-29 22:34:10', null, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '/param', 'PUT', '', '5', '0', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1000', '权限管理', null, '/upms', '-1', 'icon-quanxianguanli', 'Layout', '0', '0', '0', '2018-09-28 08:29:53', '2018-09-28 08:53:01', '0'), ('1100', '用户管理', null, 'user', '1000', 'icon-yonghuguanli', 'views/admin/user/index', '1', '1', '0', '2017-11-02 22:24:37', '2018-09-28 09:00:41', '0'), ('1101', '用户新增', 'sys_user_add', null, '1100', null, null, null, '0', '1', '2017-11-08 09:52:09', '2018-09-28 09:06:34', '0'), ('1102', '用户修改', 'sys_user_edit', null, '1100', null, null, null, '0', '1', '2017-11-08 09:52:48', '2018-09-28 09:06:37', '0'), ('1103', '用户删除', 'sys_user_del', null, '1100', null, null, null, '0', '1', '2017-11-08 09:54:01', '2018-09-28 09:06:42', '0'), ('1200', '菜单管理', null, 'menu', '1000', 'icon-caidanguanli', 'views/admin/menu/index', '2', '0', '0', '2017-11-08 09:57:27', '2018-09-28 09:00:45', '0'), ('1201', '菜单新增', 'sys_menu_add', null, '1200', null, null, null, '0', '1', '2017-11-08 10:15:53', '2018-09-28 09:07:16', '0'), ('1202', '菜单修改', 'sys_menu_edit', null, '1200', null, null, null, '0', '1', '2017-11-08 10:16:23', '2018-09-28 09:07:18', '0'), ('1203', '菜单删除', 'sys_menu_del', null, '1200', null, null, null, '0', '1', '2017-11-08 10:16:43', '2018-09-28 09:07:22', '0'), ('1300', '角色管理', null, 'role', '1000', 'icon-jiaoseguanli', 'views/admin/role/index', '3', '0', '0', '2017-11-08 10:13:37', '2018-09-28 09:00:48', '0'), ('1301', '角色新增', 'sys_role_add', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:18', '2018-09-28 09:07:46', '0'), ('1302', '角色修改', 'sys_role_edit', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:41', '2018-09-28 09:07:49', '0'), ('1303', '角色删除', 'sys_role_del', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:59', '2018-09-28 09:07:53', '0'), ('1304', '分配权限', 'sys_role_perm', null, '1300', null, null, null, '0', '1', '2018-04-20 07:22:55', '2018-09-28 09:13:23', '0'), ('1400', '部门管理', null, 'dept', '1000', 'icon-web-icon-', 'views/admin/dept/index', '4', '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:12', '0'), ('1401', '部门新增', 'sys_dept_add', null, '1400', null, null, null, '0', '1', '2018-01-20 14:56:16', '2018-09-28 09:08:13', '0'), ('1402', '部门修改', 'sys_dept_edit', null, '1400', null, null, null, '0', '1', '2018-01-20 14:56:59', '2018-09-28 09:08:16', '0'), ('1403', '部门删除', 'sys_dept_del', null, '1400', null, null, null, '0', '1', '2018-01-20 14:57:28', '2018-09-28 09:08:18', '0'), ('2000', '系统管理', null, '/admin', '-1', 'icon-xitongguanli', 'Layout', '1', '0', '0', '2017-11-07 20:56:00', '2018-09-28 08:53:18', '0'), ('2100', '日志管理', null, 'log', '2000', 'icon-rizhiguanli', 'views/admin/log/index', '5', '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0'), ('2101', '日志删除', 'sys_log_del', null, '2100', null, null, null, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0'), ('2200', '字典管理', null, 'dict', '2000', 'icon-navicon-zdgl', 'views/admin/dict/index', '6', '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0'), ('2201', '字典删除', 'sys_dict_del', null, '2200', null, null, null, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0'), ('2202', '字典新增', 'sys_dict_add', null, '2200', null, null, null, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0'), ('2203', '字典修改', 'sys_dict_edit', null, '2200', null, null, null, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0'), ('2210', '参数管理', null, 'param', '2000', 'icon-canshu', 'views/admin/param/index', '7', '1', '0', '2019-04-29 22:16:50', null, '0'), ('2211', '参数新增', 'admin_syspublicparam_add', null, '2210', null, null, '1', '0', '1', '2019-04-29 22:17:36', null, '0'), ('2212', '参数删除', 'admin_syspublicparam_del', null, '2210', null, null, '1', '0', '1', '2019-04-29 22:17:55', null, '0'), ('2213', '参数编辑', 'admin_syspublicparam_edit', null, '2210', null, null, '1', '0', '1', '2019-04-29 22:18:14', '2019-04-29 22:19:25', '0'), ('2300', '代码生成', '', 'gen', '2000', 'icon-weibiaoti46', 'views/gen/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 05:21:01', '0'), ('2400', '终端管理', '', 'client', '2000', 'icon-shouji', 'views/admin/client/index', '9', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0'), ('2401', '客户端新增', 'sys_client_add', null, '2400', '1', null, null, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:10:25', '0'), ('2402', '客户端修改', 'sys_client_edit', null, '2400', null, null, null, '0', '1', '2018-05-15 21:37:06', '2018-09-28 09:10:27', '0'), ('2403', '客户端删除', 'sys_client_del', null, '2400', null, null, null, '0', '1', '2018-05-15 21:39:16', '2018-09-28 09:10:30', '0'), ('2500', '密钥管理', '', 'social', '2000', 'icon-miyue', 'views/admin/social/index', '10', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:41', '0'), ('2501', '密钥新增', 'sys_social_details_add', null, '2500', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:52:18', '0'), ('2502', '密钥修改', 'sys_social_details_edit', null, '2500', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:36', '0'), ('2503', '密钥删除', 'sys_social_details_del', null, '2500', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:30', '0'), ('2600', '令牌管理', null, 'token', '2000', 'icon-denglvlingpai', 'views/admin/token/index', '11', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0'), ('2601', '令牌删除', 'sys_token_del', null, '2600', null, null, '1', '0', '1', '2018-09-04 05:59:50', '2018-09-28 09:11:24', '0'), ('2700', '动态路由', null, 'route', '2000', 'icon-luyou', 'views/admin/route/index', '12', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0'), ('2800', 'Quartz管理', '', 'job-manage', '2000', 'icon-guanwangfangwen', 'views/daemon/job-manage/index', '8', '0', '0', '2018-01-20 13:17:19', '2019-03-25 13:52:14', '0'), ('2810', '任务新增', 'job_sys_job_add', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:23', '0'), ('2820', '任务修改', 'job_sys_job_edit', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:26', '0'), ('2830', '任务删除', 'job_sys_job_del', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:30', '0'), ('2840', '任务暂停', 'job_sys_job_shutdown_job', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:18', '0'), ('2850', '任务开始', 'job_sys_job_start_job', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:35', '0'), ('2860', '任务刷新', 'job_sys_job_refresh_job', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:39', '0'), ('3000', '系统监控', null, '/daemon', '-1', 'icon-msnui-supervise', 'Layout', '2', '0', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0'), ('3100', '服务监控', null, 'https://monitor.pig4cloud.com', '3000', 'icon-server', null, '0', '0', '0', '2018-06-26 10:50:32', '2018-12-11 17:17:07', '0'), ('3200', '接口文档', null, 'https://swagger.pig4cloud.com/swagger-ui.html', '3000', 'icon-wendang', null, '1', '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:05:16', '0'), ('3300', '事务监控', null, 'tx', '3000', 'icon-gtsquanjushiwufuwuGTS', 'views/tx/index', '5', '0', '0', '2018-08-19 11:02:39', '2018-11-23 14:25:08', '0'), ('3400', '在线事务', null, 'model', '3000', 'icon-online', 'views/tx/model', '6', '0', '0', '2018-08-19 11:32:04', '2018-11-23 14:25:14', '0'), ('3500', '任务监控', null, 'https://task.pig4cloud.com', '3000', 'icon-msnui-supervise', null, '7', '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:03:33', '0'), ('3600', '任务轨迹', '', 'status-trace-log', '3000', 'icon-guiji', 'views/daemon/status-trace-log/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0'), ('3601', '删除轨迹', 'daemon_status_trace_log_del', null, '3600', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:31:06', '0'), ('3620', 'Quartz日志', '', 'joblog', '3000', 'icon-gtsquanjushiwufuwuGTS', 'views/daemon/job-log/index', '8', '0', '0', '2018-01-20 13:17:19', '2019-03-25 11:49:36', '0'), ('3630', '任务日志', '', 'execution-log', '3000', 'icon-wendang', 'views/daemon/execution-log/index', '7', '0', '0', '2018-01-20 13:17:19', '2019-03-30 09:30:33', '0'), ('3631', '删除日志', 'daemon_execution_log_del', null, '3900', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:30:45', '0'), ('3700', '调用拓扑', null, 'https://zipkin.pig4cloud.com', '3000', 'icon-line', null, '10', '0', '0', '2018-01-25 11:08:52', '2018-09-28 09:04:29', '0'), ('3800', '缓存状态', null, 'https://cache.pig4cloud.com', '3000', 'icon-qingchuhuancun', null, '12', '0', '0', '2018-01-23 10:56:11', '2018-09-28 09:13:56', '0'), ('4000', '协同管理', null, '/activti', '-1', 'icon-kuaisugongzuoliu_o', 'Layout', '3', '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0'), ('4100', '模型管理', null, 'activiti', '4000', 'icon-weibiaoti13', 'views/activiti/index', '1', '0', '0', '2018-09-26 01:39:07', '2018-12-09 16:35:16', '0'), ('4101', '模型管理', 'act_model_manage', null, '4100', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4200', '流程管理', null, 'process', '4000', 'icon-liucheng', 'views/activiti/process', '2', '0', '0', '2018-09-26 06:41:05', '2018-11-23 14:25:33', '0'), ('4201', '流程管理', 'act_process_manage', null, '4200', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4300', '请假管理', '', 'leave-bill', '4000', 'icon-qingjia', 'views/activiti/leave', '3', '0', '0', '2018-01-20 13:17:19', '2019-03-25 13:52:10', '0'), ('4301', '请假新增', 'act_leavebill_add', null, '4300', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4302', '请假修改', 'act_leavebill_edit', null, '4300', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:09', '0'), ('4303', '请假删除', 'act_leavebill_del', null, '4300', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:14', '0'), ('4400', '待办任务', null, 'task', '4000', 'icon-renwu', 'views/activiti/task', '4', '0', '0', '2018-09-27 09:52:31', '2018-12-09 16:35:26', '0'), ('4401', '流程管理', 'act_task_manage', null, '4400', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('6000', '微信管理', null, '/mp', '-1', 'icon-gongzhonghao', 'Layout', '3', '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0'), ('6100', '账号管理', '', 'wxaccount', '6000', 'icon-weixincaidan', 'views/mp/wxaccount/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-07-29 13:38:19', '0'), ('6101', '公众号新增', 'mp_wxaccount_add', null, '6100', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6102', '公众号修改', 'mp_wxaccount_edit', null, '6100', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6103', '公众号删除', 'mp_wxaccount_del', null, '6100', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6200', '粉丝管理', '', 'wxaccountfans', '6000', 'icon-fensiguanli', 'views/mp/wxaccountfans/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-07-29 13:38:19', '0'), ('6201', '粉丝新增', 'mp_wxaccountfans_add', null, '6200', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6202', '粉丝修改', 'mp_wxaccountfans_edit', null, '6200', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6203', '粉丝删除', 'mp_wxaccountfans_del', null, '6200', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6300', '消息管理', '', 'wxfansmsg', '6000', 'icon-xiaoxiguanli', 'views/mp/wxfansmsg/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-07-29 13:38:19', '0'), ('6301', '消息新增', 'mp_wxfansmsg_add', null, '6300', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6302', '消息修改', 'mp_wxfansmsg_edit', null, '6300', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6303', '消息删除', 'mp_wxfansmsg_del', null, '6300', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6304', '消息回复', 'mp_wxfansmsgres_add', null, '6300', '1', null, '3', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6305', '回复删除', 'mp_wxfansmsgres_del', null, '6300', null, null, '1', '0', '1', '2019-03-28 22:53:49', null, '0'), ('6400', '菜单设置', null, 'menu', '6000', 'icon-anniu_weixincaidanlianjie', 'views/mp/wxmenu/index', '6', '1', '0', '2019-03-29 15:20:12', '2019-03-29 15:23:03', '0'), ('6401', '保存', 'mp_wxmenu_add', null, '6400', null, null, '1', '0', '1', '2019-03-29 15:43:22', '2019-03-29 15:43:30', '0'), ('6402', '发布', 'mp_wxmenu_push', null, '6400', null, null, '1', '0', '1', '2019-03-29 15:43:54', null, '0'), ('6500', '运营数据', null, 'wxstatistics', '6000', 'icon-zhexiantu', 'views/mp/wxstatistics/index', '7', '1', '0', '2019-04-14 00:15:35', null, '0'), ('9999', '系统官网', null, 'https://pig4cloud.com/#', '-1', 'icon-guanwangfangwen', null, '9', '0', '0', '2019-01-17 17:05:19', '2019-01-17 17:29:06', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oauth_client_details`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(32) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
--  Records of `sys_oauth_client_details`
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_details` VALUES ('app', null, 'app', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('daemon', null, 'daemon', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('gen', null, 'gen', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('pig', null, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', null, null, null, null, 'true', '1'), ('test', null, 'test', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_public_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_public_param`;
CREATE TABLE `sys_public_param` (
  `public_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `public_name` varchar(128) NOT NULL COMMENT '公共参数名称',
  `public_key` varchar(128) NOT NULL COMMENT '键,英文大写+下划线',
  `public_value` text COMMENT '值',
  `status` char(1) DEFAULT '1' COMMENT '状态：1有效；2无效；',
  `validate_code` varchar(64) DEFAULT NULL COMMENT '公共参数编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `public_type` char(1) DEFAULT '0' COMMENT '配置类型：0-默认；1-检索；2-原文；3-报表；4-安全；5-文档；6-消息；9-其他',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除状态：0-正常；1-已删除',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`public_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='公共参数配置表';

-- ----------------------------
--  Records of `sys_public_param`
-- ----------------------------
BEGIN;
INSERT INTO `sys_public_param` VALUES ('1', '系统首页参数配置', 'INDEX_MSG_CONFIG', '运维电话： 18888888888', '0', null, '2019-04-28 18:24:38', '2019-04-28 18:31:10', '9', '0', null), ('2', '版本信息说明', 'VERSION_INSTRUCTIONS', 'PIGX平台3.1版本', '0', null, '2019-04-28 18:24:38', '2019-04-28 18:31:10', '9', '0', null), ('3', '办公安全支持文件类型', 'OFFICE_SAFETY_FILETYPE', 'PDF,CEB,CEBX,DOC,DOCX,XLS,XLSX,PPT,PPTX,WPS', '0', null, '2019-04-28 18:24:38', '2019-04-28 18:31:10', '4', '0', null), ('6', 'TESTTEST', 'TESTTESTKEY', 'TESTTESTVALUE', '1', 'TESTTEST', '2019-04-29 22:32:43', '2019-04-29 22:33:52', '1', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ds_type` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限类型',
  `ds_scope` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `role_idx1_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', 'ROLE_ADMIN', '管理员', '0', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0', '1'), ('2', 'ROLE_CQQ', 'ROLE_CQQ', 'ROLE_CQQ', '2', null, '2018-11-11 19:42:26', '2018-12-26 14:09:07', '0', '2'), ('3', '测试角色', 'ROLE_TEST', '测试角色发版删除', '2', '', '2019-04-28 17:34:07', null, '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1000'), ('1', '1100'), ('1', '1101'), ('1', '1102'), ('1', '1103'), ('1', '1200'), ('1', '1201'), ('1', '1202'), ('1', '1203'), ('1', '1300'), ('1', '1301'), ('1', '1302'), ('1', '1303'), ('1', '1304'), ('1', '1400'), ('1', '1401'), ('1', '1402'), ('1', '1403'), ('1', '2000'), ('1', '2100'), ('1', '2101'), ('1', '2200'), ('1', '2201'), ('1', '2202'), ('1', '2203'), ('1', '2210'), ('1', '2211'), ('1', '2212'), ('1', '2213'), ('1', '2300'), ('1', '2400'), ('1', '2401'), ('1', '2402'), ('1', '2403'), ('1', '2500'), ('1', '2501'), ('1', '2502'), ('1', '2503'), ('1', '2600'), ('1', '2601'), ('1', '2700'), ('1', '2800'), ('1', '2810'), ('1', '2820'), ('1', '2830'), ('1', '2840'), ('1', '2850'), ('1', '2860'), ('1', '3000'), ('1', '3100'), ('1', '3200'), ('1', '3300'), ('1', '3400'), ('1', '3500'), ('1', '3600'), ('1', '3601'), ('1', '3620'), ('1', '3630'), ('1', '3700'), ('1', '3800'), ('1', '4000'), ('1', '4100'), ('1', '4101'), ('1', '4200'), ('1', '4201'), ('1', '4300'), ('1', '4301'), ('1', '4302'), ('1', '4303'), ('1', '4400'), ('1', '4401'), ('1', '6000'), ('1', '6100'), ('1', '6101'), ('1', '6102'), ('1', '6103'), ('1', '6200'), ('1', '6201'), ('1', '6202'), ('1', '6203'), ('1', '6300'), ('1', '6301'), ('1', '6302'), ('1', '6303'), ('1', '6304'), ('1', '6305'), ('1', '6400'), ('1', '6401'), ('1', '6402'), ('1', '6500'), ('1', '9999'), ('2', '1000'), ('2', '1100'), ('2', '1101'), ('2', '1102'), ('2', '1103'), ('2', '1200'), ('2', '1201'), ('2', '1202'), ('2', '1203'), ('2', '1300'), ('2', '1301'), ('2', '1302'), ('2', '1303'), ('2', '1304'), ('2', '1400'), ('2', '1401'), ('2', '1402'), ('2', '1403'), ('3', '1000'), ('3', '1100'), ('3', '1101'), ('3', '1102'), ('3', '1103'), ('3', '1200'), ('3', '1201'), ('3', '1202'), ('3', '1203'), ('3', '1300'), ('3', '1301'), ('3', '1302'), ('3', '1303'), ('3', '1304'), ('3', '1400'), ('3', '1401'), ('3', '1402'), ('3', '1403'), ('3', '2000'), ('3', '2100'), ('3', '2101'), ('3', '2200'), ('3', '2201'), ('3', '2202'), ('3', '2203'), ('3', '2300'), ('3', '2400'), ('3', '2401'), ('3', '2402'), ('3', '2403'), ('3', '2500'), ('3', '2501'), ('3', '2502'), ('3', '2503'), ('3', '2600'), ('3', '2601'), ('3', '2700'), ('3', '2800'), ('3', '2810'), ('3', '2820'), ('3', '2830'), ('3', '2840'), ('3', '2850'), ('3', '2860'), ('3', '3000'), ('3', '3100'), ('3', '3200'), ('3', '3300'), ('3', '3400'), ('3', '3500'), ('3', '3600'), ('3', '3601'), ('3', '3620'), ('3', '3630'), ('3', '3700'), ('3', '3800'), ('3', '4000'), ('3', '4100'), ('3', '4101'), ('3', '4200'), ('3', '4201'), ('3', '4300'), ('3', '4301'), ('3', '4302'), ('3', '4303'), ('3', '4400'), ('3', '4401'), ('3', '6000'), ('3', '6100'), ('3', '6101'), ('3', '6102'), ('3', '6103'), ('3', '6200'), ('3', '6201'), ('3', '6202'), ('3', '6203'), ('3', '6300'), ('3', '6301'), ('3', '6302'), ('3', '6303'), ('3', '6304'), ('3', '6305'), ('3', '6400'), ('3', '6401'), ('3', '6402'), ('3', '6500');
COMMIT;

-- ----------------------------
--  Table structure for `sys_route_conf`
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `route_name` varchar(30) DEFAULT NULL COMMENT '路由名称',
  `route_id` varchar(30) NOT NULL DEFAULT '' COMMENT '路由ID',
  `predicates` json DEFAULT NULL COMMENT '断言',
  `filters` json DEFAULT NULL COMMENT '过滤器',
  `uri` varchar(50) DEFAULT NULL,
  `order` int(2) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='路由配置表';

-- ----------------------------
--  Records of `sys_route_conf`
-- ----------------------------
BEGIN;
INSERT INTO `sys_route_conf` VALUES ('1', '工作流管理模块', 'pigx-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('2', '认证中心', 'pigx-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://pigx-auth', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('3', '代码生成模块', 'pigx-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-codegen', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('4', 'elastic-job定时任务模块', 'pigx-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-elastic-job', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('5', 'quartz定时任务模块', 'pigx-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-quartz', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('6', '分布式事务模块', 'pigx-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-tx-manager', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('7', '通用权限模块', 'pigx-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://pigx-upms-biz', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('8', '工作流长链接支持1', 'pigx-activiti-ws-1', '[{\"args\": {\"_genkey_0\": \"/act/ws/info/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('9', '工作流长链接支持2', 'pigx-activiti-ws-2', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://pigx-activiti', '100', '2019-03-26 22:46:09', '2019-04-14 00:02:58', '1'), ('10', '工作流管理模块', 'pigx-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-04-14 00:02:58', null, '0'), ('11', '认证中心', 'pigx-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://pigx-auth', '0', '2019-04-14 00:02:58', null, '0'), ('12', '代码生成模块', 'pigx-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-codegen', '0', '2019-04-14 00:02:58', null, '0'), ('13', 'elastic-job定时任务模块', 'pigx-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-elastic-job', '0', '2019-04-14 00:02:58', null, '0'), ('14', 'quartz定时任务模块', 'pigx-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-quartz', '0', '2019-04-14 00:02:58', null, '0'), ('15', '分布式事务模块', 'pigx-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-tx-manager', '0', '2019-04-14 00:02:58', null, '0'), ('16', '通用权限模块', 'pigx-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://pigx-upms-biz', '0', '2019-04-14 00:02:58', null, '0'), ('17', '工作流长链接支持1', 'pigx-activiti-ws-1', '[{\"args\": {\"_genkey_0\": \"/act/ws/info/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-04-14 00:02:58', null, '0'), ('18', '工作流长链接支持2', 'pigx-activiti-ws-2', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://pigx-activiti', '100', '2019-04-14 00:02:58', null, '0'), ('19', '微信公众号管理', 'pigx-mp-manager', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-mp-manager', '0', '2019-04-14 00:02:58', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_social_details`
-- ----------------------------
DROP TABLE IF EXISTS `sys_social_details`;
CREATE TABLE `sys_social_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type` varchar(16) NOT NULL COMMENT '类型',
  `remark` varchar(64) DEFAULT NULL COMMENT '描述',
  `app_id` varchar(64) NOT NULL COMMENT 'appid',
  `app_secret` varchar(64) NOT NULL COMMENT 'app_secret',
  `redirect_url` varchar(128) DEFAULT NULL COMMENT '回调地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统社交登录账号表';

-- ----------------------------
--  Records of `sys_social_details`
-- ----------------------------
BEGIN;
INSERT INTO `sys_social_details` VALUES ('1', 'WX', '微信互联参数', 'wxd1678d3f83b1d83a', '6ddb043f94da5d2172926abe8533504f', 'daoweicloud.com', '2018-08-16 14:24:25', '2019-03-02 09:43:13', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `lock_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `wx_openid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  `gitee_login` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `osc_id` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_wx_openid` (`wx_openid`) USING BTREE,
  KEY `user_qq_openid` (`qq_openid`) USING BTREE,
  KEY `user_idx1_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', '', '17034642889', 'lengleng-6f69b3917f1a47c58e805e3f0f33894c.jpeg', '1', '2018-04-20 07:15:18', '2019-03-30 08:23:55', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', null, null, null, '1'), ('2', 'admin', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', null, '17034642887', 'lengleng-6f69b3917f1a47c58e805e3f0f33894c.jpeg', '10', '2018-04-20 07:15:18', '2019-01-09 11:06:24', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', null, null, null, '2'), ('3', 'HHH', '$2a$10$fVh1KjZAVRtPEEp6/FFZXOReybXTDei35Ag5AgO2581R.yfthK7I6', null, '15315244022', null, '12', '2019-04-28 17:35:28', null, '0', '0', null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('2', '2'), ('3', '3');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
