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

 Date: 05/18/2019 15:25:48 PM
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
  `sort` int(11) DEFAULT '1' COMMENT '排序',
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
INSERT INTO `sys_dept` VALUES ('1', '山东', '1', '2018-01-22 19:00:23', '2019-05-18 14:56:06', '0', '0', '1'), ('2', '沙县国际', '2', '2018-01-22 19:00:38', '2019-05-18 14:12:07', '0', '0', '1'), ('3', '潍坊', '3', '2018-01-22 19:00:44', '2019-05-18 14:56:11', '0', '1', '1'), ('4', '高新', '4', '2018-01-22 19:00:52', '2019-05-18 14:56:09', '0', '3', '1'), ('5', '院校', '5', '2018-01-22 19:00:57', '2019-05-18 14:56:13', '0', '4', '1'), ('6', '潍院', '6', '2018-01-22 19:01:06', '2019-05-18 14:56:16', '1', '5', '1'), ('7', '山东沙县', '7', '2018-01-22 19:01:57', '2019-05-18 14:12:17', '0', '2', '1'), ('8', '潍坊沙县', '8', '2018-01-22 19:02:03', '2019-05-18 14:12:19', '0', '7', '1'), ('9', '高新沙县', '9', '2018-01-22 19:02:14', '2019-05-18 14:12:22', '1', '8', '1'), ('10', '租户部门', '1', '2018-11-18 13:27:11', '2019-06-06 16:22:58', '0', '0', '2'), ('11', '院校沙县', '2', '2018-12-10 21:19:26', '2019-05-18 14:12:33', '0', '8', '1'), ('12', '小院沙县', '3', '2019-04-28 17:33:31', '2019-05-18 14:12:36', '0', '11', '1');
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
  `system` char(1) NOT NULL DEFAULT '0' COMMENT '0-否|1-是',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', 'log_type', '日志类型', '2019-03-19 11:06:44', '2019-03-19 11:06:44', '异常、正常', '1', '0', '1'), ('2', 'social_type', '社交登录', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '微信、QQ', '1', '0', '1'), ('3', 'leave_status', '请假状态', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '未提交、审批中、完成、驳回', '1', '0', '1'), ('4', 'job_type', '定时任务类型', '2019-03-19 11:22:21', '2019-03-19 11:22:21', 'quartz', '1', '0', '1'), ('5', 'job_status', '定时任务状态', '2019-03-19 11:24:57', '2019-03-19 11:24:57', '发布状态、运行状态', '1', '0', '1'), ('6', 'job_execute_status', '定时任务执行状态', '2019-03-19 11:26:15', '2019-03-19 11:26:15', '正常、异常', '1', '0', '1'), ('7', 'misfire_policy', '定时任务错失执行策略', '2019-03-19 11:27:19', '2019-03-19 11:27:19', '周期', '1', '0', '1'), ('8', 'gender', '性别', '2019-03-27 13:44:06', '2019-03-27 13:44:06', '微信用户性别', '1', '0', '1'), ('9', 'subscribe', '订阅状态', '2019-03-27 13:48:33', '2019-03-27 13:48:33', '公众号订阅状态', '1', '0', '1'), ('10', 'response_type', '回复', '2019-03-28 21:29:21', '2019-03-28 21:29:21', '微信消息是否已回复', '1', '0', '1'), ('11', 'param_type', '参数配置', '2019-04-29 18:20:47', '2019-04-29 18:20:47', '检索、原文、报表、安全、文档、消息、其他', '1', '0', '1'), ('12', 'tenant_status_type', '租户状态', '2019-05-15 16:31:08', '2019-05-15 16:31:08', '租户状态', '1', '0', '1'), ('13', 'dict_type', '字典类型', '2019-05-16 14:16:20', '2019-05-16 14:20:16', '系统类不能修改', '1', '0', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典项';

-- ----------------------------
--  Records of `sys_dict_item`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_item` VALUES ('1', '1', '9', '异常', 'log_type', '日志异常', '1', '2019-03-19 11:08:59', '2019-03-25 12:49:13', '', '0', '1'), ('2', '1', '0', '正常', 'log_type', '日志正常', '0', '2019-03-19 11:09:17', '2019-03-25 12:49:18', '', '0', '1'), ('3', '2', 'WX', '微信', 'social_type', '微信登录', '0', '2019-03-19 11:10:02', '2019-03-25 12:49:36', '', '0', '1'), ('4', '2', 'QQ', 'QQ', 'social_type', 'QQ登录', '1', '2019-03-19 11:10:14', '2019-03-25 12:49:36', '', '0', '1'), ('5', '3', '0', '未提交', 'leave_status', '未提交', '0', '2019-03-19 11:18:34', '2019-03-25 12:49:36', '', '0', '1'), ('6', '3', '1', '审批中', 'leave_status', '审批中', '1', '2019-03-19 11:18:45', '2019-03-25 12:49:36', '', '0', '1'), ('7', '3', '2', '完成', 'leave_status', '完成', '2', '2019-03-19 11:19:02', '2019-03-25 12:49:36', '', '0', '1'), ('8', '3', '9', '驳回', 'leave_status', '驳回', '9', '2019-03-19 11:19:20', '2019-03-25 12:49:36', '', '0', '1'), ('9', '4', '1', 'java类', 'job_type', 'java类', '1', '2019-03-19 11:22:37', '2019-03-25 12:49:36', '', '0', '1'), ('10', '4', '2', 'spring bean', 'job_type', 'spring bean容器实例', '2', '2019-03-19 11:23:05', '2019-03-25 12:49:36', '', '0', '1'), ('11', '4', '9', '其他', 'job_type', '其他类型', '9', '2019-03-19 11:23:31', '2019-03-25 12:49:36', '', '0', '1'), ('12', '4', '3', 'Rest 调用', 'job_type', 'Rest 调用', '3', '2019-03-19 11:23:57', '2019-03-25 12:49:36', '', '0', '1'), ('13', '4', '4', 'jar', 'job_type', 'jar类型', '4', '2019-03-19 11:24:20', '2019-03-25 12:49:36', '', '0', '1'), ('14', '5', '1', '未发布', 'job_status', '未发布', '1', '2019-03-19 11:25:18', '2019-03-25 12:49:36', '', '0', '1'), ('15', '5', '2', '运行中', 'job_status', '运行中', '2', '2019-03-19 11:25:31', '2019-03-25 12:49:36', '', '0', '1'), ('16', '5', '3', '暂停', 'job_status', '暂停', '3', '2019-03-19 11:25:42', '2019-03-25 12:49:36', '', '0', '1'), ('17', '6', '0', '正常', 'job_execute_status', '正常', '0', '2019-03-19 11:26:27', '2019-03-25 12:49:36', '', '0', '1'), ('18', '6', '1', '异常', 'job_execute_status', '异常', '1', '2019-03-19 11:26:41', '2019-03-25 12:49:36', '', '0', '1'), ('19', '7', '1', '错失周期立即执行', 'misfire_policy', '错失周期立即执行', '1', '2019-03-19 11:27:45', '2019-03-25 12:49:36', '', '0', '1'), ('20', '7', '2', '错失周期执行一次', 'misfire_policy', '错失周期执行一次', '2', '2019-03-19 11:27:57', '2019-03-25 12:49:36', '', '0', '1'), ('21', '7', '3', '下周期执行', 'misfire_policy', '下周期执行', '3', '2019-03-19 11:28:08', '2019-03-25 12:49:36', '', '0', '1'), ('22', '8', '1', '男', 'gender', '微信-男', '0', '2019-03-27 13:45:13', '2019-03-27 13:45:13', '微信-男', '0', '1'), ('23', '8', '2', '女', 'gender', '女-微信', '1', '2019-03-27 13:45:34', '2019-03-27 13:45:34', '女-微信', '0', '1'), ('24', '8', '0', '未知', 'gender', 'x性别未知', '3', '2019-03-27 13:45:57', '2019-03-27 13:45:57', 'x性别未知', '0', '1'), ('25', '9', '0', '未关注', 'subscribe', '公众号-未关注', '0', '2019-03-27 13:49:07', '2019-03-27 13:49:07', '公众号-未关注', '0', '1'), ('26', '9', '1', '已关注', 'subscribe', '公众号-已关注', '1', '2019-03-27 13:49:26', '2019-03-27 13:49:26', '公众号-已关注', '0', '1'), ('27', '10', '0', '未回复', 'response_type', '微信消息-未回复', '0', '2019-03-28 21:29:47', '2019-03-28 21:29:47', '微信消息-未回复', '0', '1'), ('28', '10', '1', '已回复', 'response_type', '微信消息-已回复', '1', '2019-03-28 21:30:08', '2019-03-28 21:30:08', '微信消息-已回复', '0', '1'), ('29', '11', '1', '检索', 'param_type', '检索', '0', '2019-04-29 18:22:17', '2019-04-29 18:22:17', '检索', '0', '1'), ('30', '11', '2', '原文', 'param_type', '原文', '0', '2019-04-29 18:22:27', '2019-04-29 18:22:27', '原文', '0', '1'), ('31', '11', '3', '报表', 'param_type', '报表', '0', '2019-04-29 18:22:36', '2019-04-29 18:22:36', '报表', '0', '1'), ('32', '11', '4', '安全', 'param_type', '安全', '0', '2019-04-29 18:22:46', '2019-04-29 18:22:46', '安全', '0', '1'), ('33', '11', '5', '文档', 'param_type', '文档', '0', '2019-04-29 18:22:56', '2019-04-29 18:22:56', '文档', '0', '1'), ('34', '11', '6', '消息', 'param_type', '消息', '0', '2019-04-29 18:23:05', '2019-04-29 18:23:05', '消息', '0', '1'), ('35', '11', '9', '其他', 'param_type', '其他', '0', '2019-04-29 18:23:16', '2019-04-29 18:23:16', '其他', '0', '1'), ('36', '11', '0', '默认', 'param_type', '默认', '0', '2019-04-29 18:23:30', '2019-04-29 18:23:30', '默认', '0', '1'), ('37', '12', '0', '正常', 'status_type', '状态正常', '0', '2019-05-15 16:31:34', '2019-05-16 22:30:46', '状态正常', '0', '1'), ('38', '12', '9', '冻结', 'status_type', '状态冻结', '1', '2019-05-15 16:31:56', '2019-05-16 22:30:50', '状态冻结', '0', '1'), ('39', '13', '1', '系统类', 'dict_type', '系统类字典', '0', '2019-05-16 14:20:40', '2019-05-16 14:20:40', '不能修改删除', '0', '1'), ('40', '13', '0', '业务类', 'dict_type', '业务类字典', '0', '2019-05-16 14:20:59', '2019-05-16 14:20:59', '可以修改', '0', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存路径',
  `absolute_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绝对路径',
  `prefix` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传服务器前缀地址',
  `original` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原文件名',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MD5值',
  `suffix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀名',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint(50) NULL DEFAULT NULL COMMENT '文件大小',
  `display_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示大小',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识：1-删除，0-正常',
  `tenant_id` int(11) NULL DEFAULT NULL COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES ('402847035f012c2d015f0130f5160006', 'j8k6fmcs2nl.jpg', '/image/2019-5-09/j8k6fmcs2nl.jpg', '/user/app/resources/upload/image/2019-5-09/j8k6fmcs2nl.jpg', '/test-demo/dl', '欢迎扫描.jpg', '73d4281e46a68222934403627e5b4e19', '.jpg', 'image', 516424, '504.32KB', 'admin', '2019-05-09 16:55:04', '', '2018-01-01 01:01:00', 0, 1);
INSERT INTO `sys_file` VALUES ('5c43db6a9004a7547b5409592675f2f9', 'pigx-8676f56c7f6047579f2832744fc3d7d7.png', NULL, NULL, NULL, '6水费查询.png', '297c0cbd903535763e910e78adb4c5c2', '.png', 'image', 7976, '7.79KB', 'admin', '2019-06-18 16:47:13', NULL, NULL, 0, 1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1000', '权限管理', null, '/user', '-1', 'icon-quanxianguanli', '0', '0', '0', '2018-09-28 08:29:53', '2018-09-28 08:53:01', '0'), ('1100', '用户管理', null, '/admin/user/index', '1000', 'icon-yonghuguanli', '1', '1', '0', '2017-11-02 22:24:37', '2019-06-24 14:36:36', '0'), ('1101', '用户新增', 'sys_user_add', null, '1100', null, null, '0', '1', '2017-11-08 09:52:09', '2018-09-28 09:06:34', '0'), ('1102', '用户修改', 'sys_user_edit', null, '1100', null, null, '0', '1', '2017-11-08 09:52:48', '2018-09-28 09:06:37', '0'), ('1103', '用户删除', 'sys_user_del', null, '1100', null, null, '0', '1', '2017-11-08 09:54:01', '2018-09-28 09:06:42', '0'), ('1200', '菜单管理', null, '/admin/menu/index', '1000', 'icon-caidanguanli', '2', '0', '0', '2017-11-08 09:57:27', '2019-06-24 14:42:07', '0'), ('1201', '菜单新增', 'sys_menu_add', null, '1200', null, null, '0', '1', '2017-11-08 10:15:53', '2018-09-28 09:07:16', '0'), ('1202', '菜单修改', 'sys_menu_edit', null, '1200', null, null, '0', '1', '2017-11-08 10:16:23', '2018-09-28 09:07:18', '0'), ('1203', '菜单删除', 'sys_menu_del', null, '1200', null, null, '0', '1', '2017-11-08 10:16:43', '2018-09-28 09:07:22', '0'), ('1300', '角色管理', null, '/admin/role/index', '1000', 'icon-jiaoseguanli', '3', '0', '0', '2017-11-08 10:13:37', '2018-09-28 09:00:48', '0'), ('1301', '角色新增', 'sys_role_add', null, '1300', null, null, '0', '1', '2017-11-08 10:14:18', '2018-09-28 09:07:46', '0'), ('1302', '角色修改', 'sys_role_edit', null, '1300', null, null, '0', '1', '2017-11-08 10:14:41', '2018-09-28 09:07:49', '0'), ('1303', '角色删除', 'sys_role_del', null, '1300', null, null, '0', '1', '2017-11-08 10:14:59', '2018-09-28 09:07:53', '0'), ('1304', '分配权限', 'sys_role_perm', null, '1300', null, null, '0', '1', '2018-04-20 07:22:55', '2018-09-28 09:13:23', '0'), ('1400', '部门管理', null, '/admin/dept/index', '1000', 'icon-web-icon-', '4', '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:12', '0'), ('1401', '部门新增', 'sys_dept_add', null, '1400', null, null, '0', '1', '2018-01-20 14:56:16', '2018-09-28 09:08:13', '0'), ('1402', '部门修改', 'sys_dept_edit', null, '1400', null, null, '0', '1', '2018-01-20 14:56:59', '2018-09-28 09:08:16', '0'), ('1403', '部门删除', 'sys_dept_del', null, '1400', null, null, '0', '1', '2018-01-20 14:57:28', '2018-09-28 09:08:18', '0'), ('1500', '租户管理', '', '/admin/tenant/index', '1000', 'icon-erji-zuhushouye', '5', '0', '0', '2018-01-20 13:17:19', '2019-05-17 15:36:11', '0'), ('1501', '租户新增', 'admin_systenant_add', null, '1500', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-05-17 15:36:34', '0'), ('1502', '租户修改', 'admin_systenant_edit', null, '1500', '1', '1', '0', '1', '2018-05-15 21:35:18', '2019-05-17 15:36:53', '0'), ('1503', '租户删除', 'admin_systenant_del', null, '1500', '1', '2', '0', '1', '2018-05-15 21:35:18', '2019-05-17 15:37:00', '0'), ('2000', '系统管理', null, '/admin', '-1', 'icon-xitongguanli', '1', '0', '0', '2017-11-07 20:56:00', '2018-09-28 08:53:18', '0'), ('2100', '日志管理', null, '/admin/log/index', '2000', 'icon-rizhiguanli', '5', '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0'), ('2101', '日志删除', 'sys_log_del', null, '2100', null, null, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0'), ('2200', '字典管理', null, '/admin/dict/index', '2000', 'icon-navicon-zdgl', '6', '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0'), ('2201', '字典删除', 'sys_dict_del', null, '2200', null, null, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0'), ('2202', '字典新增', 'sys_dict_add', null, '2200', null, null, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0'), ('2203', '字典修改', 'sys_dict_edit', null, '2200', null, null, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0'), ('2210', '参数管理', null, '/admin/param/index', '2000', 'icon-canshu', '7', '1', '0', '2019-04-29 22:16:50', '2019-06-24 14:52:00', '0'), ('2211', '参数新增', 'admin_syspublicparam_add', null, '2210', null, '1', '0', '1', '2019-04-29 22:17:36', null, '0'), ('2212', '参数删除', 'admin_syspublicparam_del', null, '2210', null, '1', '0', '1', '2019-04-29 22:17:55', null, '0'), ('2213', '参数编辑', 'admin_syspublicparam_edit', null, '2210', null, '1', '0', '1', '2019-04-29 22:18:14', '2019-04-29 22:19:25', '0'), ('2300', '代码生成', '', '/admin/gen/index', '2000', 'icon-weibiaoti46', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 05:21:01', '0'), ('2400', '终端管理', '', '/admin/client/index', '2000', 'icon-shouji', '9', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0'), ('2401', '客户端新增', 'sys_client_add', null, '2400', '1', null, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:10:25', '0'), ('2402', '客户端修改', 'sys_client_edit', null, '2400', null, null, '0', '1', '2018-05-15 21:37:06', '2018-09-28 09:10:27', '0'), ('2403', '客户端删除', 'sys_client_del', null, '2400', null, null, '0', '1', '2018-05-15 21:39:16', '2018-09-28 09:10:30', '0'), ('2500', '密钥管理', '', '/admin/social/index', '2000', 'icon-miyue', '10', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:41', '0'), ('2501', '密钥新增', 'sys_social_details_add', null, '2500', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:52:18', '0'), ('2502', '密钥修改', 'sys_social_details_edit', null, '2500', '1', '1', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:36', '0'), ('2503', '密钥删除', 'sys_social_details_del', null, '2500', '1', '2', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:30', '0'), ('2600', '令牌管理', null, '/admin/token/index', '2000', 'icon-denglvlingpai', '11', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0'), ('2601', '令牌删除', 'sys_token_del', null, '2600', null, '1', '0', '1', '2018-09-04 05:59:50', '2018-09-28 09:11:24', '0'), ('2700', '动态路由', null, '/admin/route/index', '2000', 'icon-luyou', '12', '0', '0', '2018-09-04 05:58:41', '2019-06-24 15:14:28', '0'), ('2800', 'Quartz管理', '', '/daemon/job-manage/index', '2000', 'icon-guanwangfangwen', '8', '0', '0', '2018-01-20 13:17:19', '2019-03-25 13:52:14', '0'), ('2810', '任务新增', 'job_sys_job_add', null, '2800', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:23', '0'), ('2820', '任务修改', 'job_sys_job_edit', null, '2800', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:26', '0'), ('2830', '任务删除', 'job_sys_job_del', null, '2800', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:30', '0'), ('2840', '任务暂停', 'job_sys_job_shutdown_job', null, '2800', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:18', '0'), ('2850', '任务开始', 'job_sys_job_start_job', null, '2800', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:35', '0'), ('2860', '任务刷新', 'job_sys_job_refresh_job', null, '2800', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:39', '0'), ('3000', '系统监控', null, '/daemon', '-1', 'icon-msnui-supervise', '2', '0', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0'), ('3100', '服务监控', null, 'http://127.0.0.1:5001', '3000', 'icon-server', '0', '0', '0', '2018-06-26 10:50:32', '2019-05-01 23:54:05', '0'), ('3110', '缓存监控', null, '/monitor/redis/index', '3000', 'icon-qingchuhuancun', '1', '1', '0', '2019-05-08 23:51:27', '2019-06-24 15:17:45', '0'), ('3200', '接口文档', null, 'http://127.0.0.1:9999/swagger-ui.html', '3000', 'icon-wendang', '1', '0', '0', '2018-06-26 10:50:32', '2019-05-01 23:57:11', '0'), ('3300', '事务监控', null, '/tx/index', '3000', 'icon-gtsquanjushiwufuwuGTS', '5', '0', '0', '2018-08-19 11:02:39', '2019-06-24 15:18:04', '0'), ('3400', '在线事务', null, '/tx/model', '3000', 'icon-online', '6', '0', '0', '2018-08-19 11:32:04', '2019-06-24 15:18:13', '0'), ('3500', '文档扩展', null, 'http://127.0.0.1:9999/doc.html', '3000', 'icon-wendang', '2', '0', '0', '2018-06-26 10:50:32', '2019-05-01 23:57:42', '0'), ('3600', '任务轨迹', '', '/daemon/status-trace-log/index', '3000', 'icon-guiji', '8', '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:18:41', '0'), ('3601', '删除轨迹', 'daemon_status_trace_log_del', null, '3600', '1', '2', '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:31:06', '0'), ('3620', 'Quartz日志', '', '/daemon/joblog/index', '3000', 'icon-gtsquanjushiwufuwuGTS', '8', '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:18:54', '0'), ('3630', '任务日志', '', '/daemon/execution-log/index', '3000', 'icon-wendang', '7', '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:19:07', '0'), ('3631', '删除日志', 'daemon_execution_log_del', null, '3900', '1', '2', '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:30:45', '0'), ('3700', '注册配置', null, '', '3000', 'icon-line', '10', '0', '0', '2018-01-25 11:08:52', '2019-06-24 15:35:10', '1'), ('4000', '协同管理', null, '/activti', '-1', 'icon-kuaisugongzuoliu_o', '3', '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0'), ('4100', '模型管理', null, '/activiti/index', '4000', 'icon-weibiaoti13', '1', '0', '0', '2018-09-26 01:39:07', '2019-06-24 15:20:00', '0'), ('4101', '模型管理', 'act_model_manage', null, '4100', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4200', '流程管理', '/activiti/process', '/activiti/process', '4000', 'icon-liucheng', '2', '0', '0', '2018-09-26 06:41:05', '2019-06-24 08:31:07', '0'), ('4201', '流程管理', 'act_process_manage', null, '4200', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4300', '请假管理', '/activiti/leave', '/activiti/leave-bill', '4000', 'icon-qingjia', '3', '0', '0', '2018-01-20 13:17:19', '2019-06-24 08:31:11', '0'), ('4301', '请假新增', 'act_leavebill_add', null, '4300', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4302', '请假修改', 'act_leavebill_edit', null, '4300', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:09', '0'), ('4303', '请假删除', 'act_leavebill_del', null, '4300', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:14', '0'), ('4400', '待办任务', '/activiti/task', '/activiti/task', '4000', 'icon-renwu', '4', '0', '0', '2018-09-27 09:52:31', '2019-06-24 08:31:18', '0'), ('4401', '流程管理', 'act_task_manage', null, '4400', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('5000', '支付管理', null, '/pay', '-1', 'icon-pay6zhifu', '4', '1', '0', '2019-05-30 15:28:03', '2019-06-20 16:13:23', '0'), ('5100', '渠道管理', null, '/pay/paychannel/index', '5000', 'icon-zhifuqudaoguanli', '1', '1', '0', '2019-05-30 15:32:17', '2019-05-30 19:43:27', '0'), ('5110', '增加渠道', 'pay_paychannel_add', null, '5100', null, '1', '0', '1', '2019-05-30 15:46:14', null, '0'), ('5120', '编辑渠道', 'pay_paychannel_edit', null, '5100', null, '1', '0', '1', '2019-05-30 15:46:35', null, '0'), ('5130', '删除渠道', 'pay_paychannel_del', null, '5100', null, '1', '0', '1', '2019-05-30 15:47:08', null, '0'), ('5200', '收银台', null, '/pay/cd/index', '5000', 'icon-shouyintai', '0', '1', '0', '2019-05-30 19:44:00', '2019-05-30 19:45:05', '0'), ('5300', '商品订单', '', '/pay/goods/index', '5000', 'icon-dingdan', '2', '0', '0', '2018-01-20 13:17:19', '2019-06-16 18:02:21', '0'), ('5310', '商品订单新增', 'generator_paygoodsorder_add', null, '5300', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5320', '商品订单修改', 'generator_paygoodsorder_edit', null, '5300', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5330', '商品订单删除', 'generator_paygoodsorder_del', null, '5300', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5400', '支付订单', '', '/pay/orders/index', '5000', 'icon-zhifu', '3', '0', '0', '2018-01-20 13:17:19', '2019-06-16 18:02:06', '0'), ('5410', '支付订单新增', 'generator_paytradeorder_add', null, '5400', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5420', '支付订单修改', 'generator_paytradeorder_edit', null, '5400', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5430', '支付订单删除', 'generator_paytradeorder_del', null, '5400', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5500', '回调记录', '', '/pay/notify/index', '5000', 'icon-huitiao', '4', '0', '0', '2018-01-20 13:17:19', '2019-06-16 18:01:49', '0'), ('5510', '记录新增', 'generator_paynotifyrecord_add', null, '5500', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5520', '记录修改', 'generator_paynotifyrecord_edit', null, '5500', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('5530', '记录删除', 'generator_paynotifyrecord_del', null, '5500', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6000', '微信管理', null, '/mp', '-1', 'icon-gongzhonghao', '4', '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0'), ('6100', '账号管理', '', '/mp/wxaccount/index', '6000', 'icon-weixincaidan', '8', '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:24:36', '0'), ('6101', '公众号新增', 'mp_wxaccount_add', '', '6100', '1', '0', '0', '1', '2018-05-15 21:35:18', '2019-06-24 15:24:33', '0'), ('6102', '公众号修改', 'mp_wxaccount_edit', null, '6100', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6103', '公众号删除', 'mp_wxaccount_del', null, '6100', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6200', '粉丝管理', '', '/mp/wxaccountfans/index', '6000', 'icon-fensiguanli', '8', '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:24:46', '0'), ('6201', '粉丝新增', 'mp_wxaccountfans_add', null, '6200', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6202', '粉丝修改', 'mp_wxaccountfans_edit', null, '6200', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6203', '粉丝删除', 'mp_wxaccountfans_del', null, '6200', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6300', '消息管理', '', '/mp/wxfansmsg/index', '6000', 'icon-xiaoxiguanli', '8', '0', '0', '2018-01-20 13:17:19', '2019-06-24 15:24:57', '0'), ('6301', '消息新增', 'mp_wxfansmsg_add', null, '6300', '1', '0', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6302', '消息修改', 'mp_wxfansmsg_edit', null, '6300', '1', '1', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6303', '消息删除', 'mp_wxfansmsg_del', null, '6300', '1', '2', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6304', '消息回复', 'mp_wxfansmsgres_add', null, '6300', '1', '3', '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0'), ('6305', '回复删除', 'mp_wxfansmsgres_del', null, '6300', null, '1', '0', '1', '2019-03-28 22:53:49', null, '0'), ('6400', '菜单设置', null, '/mp/wxmenu/index', '6000', 'icon-anniu_weixincaidanlianjie', '6', '1', '0', '2019-03-29 15:20:12', '2019-06-24 15:25:07', '0'), ('6401', '保存', 'mp_wxmenu_add', null, '6400', null, '1', '0', '1', '2019-03-29 15:43:22', '2019-03-29 15:43:30', '0'), ('6402', '发布', 'mp_wxmenu_push', null, '6400', null, '1', '0', '1', '2019-03-29 15:43:54', null, '0'), ('6500', '运营数据', null, '/mp/wxstatistics/index', '6000', 'icon-zhexiantu', '7', '1', '0', '2019-04-14 00:15:35', '2019-06-24 15:25:15', '0'), ('9999', '系统官网', null, 'https://pig4cloud.com/#', '-1', 'icon-guanwangfangwen', '9', '0', '0', '2019-01-17 17:05:19', '2019-01-17 17:29:06', '0');
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
INSERT INTO `sys_oauth_client_details` VALUES ('app', null, 'app', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('daemon', null, 'daemon', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('gen', null, 'gen', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('mp', null, 'mp', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('pig', null, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', null, null, null, null, 'true', '1'), ('test', null, 'test', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');
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
  `system` char(1) NOT NULL DEFAULT '0' COMMENT '是否是系统默认',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除状态：0-正常；1-已删除',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`public_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='公共参数配置表';

-- ----------------------------
--  Records of `sys_public_param`
-- ----------------------------
BEGIN;
INSERT INTO `sys_public_param` VALUES ('1', '系统首页参数配置', 'INDEX_MSG_CONFIG', '运维电话： 18888888888', '0', null, '2019-04-28 18:24:38', '2019-05-16 21:41:28', '9', '0', '0', '1'), ('2', '版本信息说明', 'VERSION_INSTRUCTIONS', 'PIGX平台3.1版本', '0', null, '2019-04-28 18:24:38', '2019-05-16 21:41:29', '9', '0', '0', '1'), ('3', '办公安全支持文件类型', 'OFFICE_SAFETY_FILETYPE', 'PDF,CEB,CEBX,DOC,DOCX,XLS,XLSX,PPT,PPTX,WPS', '0', null, '2019-04-28 18:24:38', '2019-05-16 21:41:31', '4', '0', '0', '1');
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
  KEY `role_idx1_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', 'ROLE_ADMIN', '管理员', '0', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0', '1');
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
INSERT INTO `sys_role_menu` VALUES ('1', '1000'), ('1', '1100'), ('1', '1101'), ('1', '1102'), ('1', '1103'), ('1', '1200'), ('1', '1201'), ('1', '1202'), ('1', '1203'), ('1', '1300'), ('1', '1301'), ('1', '1302'), ('1', '1303'), ('1', '1304'), ('1', '1400'), ('1', '1401'), ('1', '1402'), ('1', '1403'), ('1', '1500'), ('1', '1501'), ('1', '1502'), ('1', '1503'), ('1', '2000'), ('1', '2100'), ('1', '2101'), ('1', '2200'), ('1', '2201'), ('1', '2202'), ('1', '2203'), ('1', '2210'), ('1', '2211'), ('1', '2212'), ('1', '2213'), ('1', '2300'), ('1', '2400'), ('1', '2401'), ('1', '2402'), ('1', '2403'), ('1', '2500'), ('1', '2501'), ('1', '2502'), ('1', '2503'), ('1', '2600'), ('1', '2601'), ('1', '2700'), ('1', '2800'), ('1', '2810'), ('1', '2820'), ('1', '2830'), ('1', '2840'), ('1', '2850'), ('1', '2860'), ('1', '3000'), ('1', '3100'), ('1', '3110'), ('1', '3200'), ('1', '3300'), ('1', '3400'), ('1', '3500'), ('1', '3600'), ('1', '3601'), ('1', '3620'), ('1', '3630'), ('1', '4000'), ('1', '4100'), ('1', '4101'), ('1', '4200'), ('1', '4201'), ('1', '4300'), ('1', '4301'), ('1', '4302'), ('1', '4303'), ('1', '4400'), ('1', '4401'), ('1', '6000'), ('1', '6100'), ('1', '6101'), ('1', '6102'), ('1', '6103'), ('1', '6200'), ('1', '6201'), ('1', '6202'), ('1', '6203'), ('1', '6300'), ('1', '6301'), ('1', '6302'), ('1', '6303'), ('1', '6304'), ('1', '6305'), ('1', '6400'), ('1', '6401'), ('1', '6402'), ('1', '6500'), ('1', '9999');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='路由配置表';

-- ----------------------------
--  Records of `sys_route_conf`
-- ----------------------------
BEGIN;
INSERT INTO `sys_route_conf` VALUES ('1', '工作流管理模块', 'pigx-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:23', '0'), ('2', '认证中心', 'pigx-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://pigx-auth', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:25', '0'), ('3', '代码生成模块', 'pigx-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-codegen', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:28', '0'), ('4', 'elastic-job定时任务模块', 'pigx-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-elastic-job', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:30', '0'), ('5', 'quartz定时任务模块', 'pigx-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-quartz', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:33', '0'), ('6', '分布式事务模块', 'pigx-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-tx-manager', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:35', '0'), ('7', '通用权限模块', 'pigx-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://pigx-upms-biz', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:43', '0'), ('8', '工作流长链接支持1', 'pigx-activiti-ws-1', '[{\"args\": {\"_genkey_0\": \"/act/ws/info/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:47', '0'), ('9', '工作流长链接支持2', 'pigx-activiti-ws-2', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://pigx-activiti', '100', '2019-05-09 00:23:08', '2019-05-18 15:16:49', '0'), ('10', '微信公众号管理', 'pigx-mp-manager', '[{\"args\": {\"_genkey_0\": \"/mp/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-mp-manager', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:52', '0'), ('11', '监控管理', 'pigx-monitor', '[{\"args\": {\"_genkey_0\": \"/monitor/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-monitor', '0', '2019-05-09 00:23:08', '2019-05-18 15:16:55', '0');
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
--  Table structure for `sys_tenant`
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `name` varchar(255) DEFAULT NULL COMMENT '租户名称',
  `code` varchar(64) DEFAULT NULL COMMENT '租户编号',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '0正常 9-冻结',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='租户表';

-- ----------------------------
--  Records of `sys_tenant`
-- ----------------------------
BEGIN;
INSERT INTO `sys_tenant` VALUES ('1', '北京分公司', '1', '2019-05-15 00:00:00', '2020-05-15 00:00:00', '0', '0', '2019-05-15 15:44:57', '2019-05-18 14:47:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', '', '17034642889', 'lengleng-5b87318016954b6384e07ce10ba45030.jpg', '1', '2018-04-20 07:15:18', '2019-04-30 12:37:44', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', null, null, null, '1');
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
INSERT INTO `sys_user_role` VALUES ('1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
