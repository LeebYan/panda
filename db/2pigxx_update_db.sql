
-- ----------------------------
--  Table structure for `sys_route_conf`
-- ----------------------------

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
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
INSERT INTO `sys_file` VALUES ('402847035f012c2d015f0130f5160006', 'j8k6fmcs2nl.jpg', '/image/2019-5-09/j8k6fmcs2nl.jpg', '/user/app/resources/upload//image/2017-10-09/j8k6fmcs2nl.jpg', '/test-demo/dl', '欢迎扫描.jpg', '73d4281e46a68222934403627e5b4e19', '.jpg', 'image', 516424, '504.32KB', 'admin', '2019-05-09 16:55:04', '', '0000-00-00 00:00:00', 0, 1);
INSERT INTO `sys_file` VALUES ('5c43db6a9004a7547b5409592675f2f9', 'bigdata-8676f56c7f6047579f2832744fc3d7d7.png', NULL, NULL, NULL, '6水费查询.png', '297c0cbd903535763e910e78adb4c5c2', '.png', 'image', 7976, '7.79KB', 'admin', '2019-06-18 16:47:13', NULL, NULL, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
--  添加数据
-- ----------------------------
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (2900, '文件管理', '', 'sysfile', 2000, 'icon-wendang', 'views/admin/file/index', 8, '0', '0', '2018-01-20 13:17:19', '2019-06-18 17:53:24', '0');
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (2901, '文件管理新增', 'admin_sysfile_add', NULL, 2900, '1', NULL, 0, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (2902, '文件管理修改', 'admin_sysfile_edit', NULL, 2900, '1', NULL, 1, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (2903, '文件管理删除', 'admin_sysfile_del', NULL, 2900, '1', NULL, 2, '0', '1', '2018-05-15 21:35:18', '2018-07-29 13:38:59', '0');
