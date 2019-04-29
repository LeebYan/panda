/*
公共参数 SysPublicParam
在我们写需求过程中，经常会遇到在一个集合中，许多都是公共的参数，
我们每次创建集合对象时，都得重新添加一遍，太麻烦了。怎么解决呢？
其实我们可以把这些公共参数封装到表里，这样初始化缓存当中，
就不用再次进行添加了，优先到缓存中获取对象里已经有这些参数了。
*/
use pigxx;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 公共参数设计表
-- ----------------------------
DROP TABLE IF EXISTS `sys_public_param`;
CREATE TABLE `sys_public_param`  (
  `public_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `public_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公共参数名称',
  `public_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键,英文大写+下划线',
  `public_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '值',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态：1有效；2无效；',
  `delete_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '删除状态：0-正常；1-已删除',
  `validate_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公共参数编码',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `public_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '配置类型：0-默认；1-检索；2-原文；3-报表；4-安全；5-文档；6-消息；9-其他',
  PRIMARY KEY (`public_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公共参数配置表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- 公共参数数据
-- ----------------------------
INSERT INTO `pigxx`.`sys_public_param`(`public_id`, `public_name`, `public_key`, `public_value`, `status`, `delete_flag`, `validate_code`, `create_time`, `update_time`, `public_type`) 
VALUES (1, '系统首页参数配置', 'INDEX_MSG_CONFIG', '运维电话： 18888888888', '0', '0', NULL, '2019-04-28 18:24:38', '2019-04-28 18:31:10', '9');
INSERT INTO `pigxx`.`sys_public_param`(`public_id`, `public_name`, `public_key`, `public_value`, `status`, `delete_flag`, `validate_code`, `create_time`, `update_time`, `public_type`) 
VALUES (2, '版本信息说明', 'VERSION_INSTRUCTIONS', 'PIGX平台3.1版本', '0', '0', NULL, '2019-04-28 18:24:38', '2019-04-28 18:31:10', '9');
INSERT INTO `pigxx`.`sys_public_param`(`public_id`, `public_name`, `public_key`, `public_value`, `status`, `delete_flag`, `validate_code`, `create_time`, `update_time`, `public_type`) 
VALUES (3, '办公安全支持文件类型', 'OFFICE_SAFETY_FILETYPE', 'PDF,CEB,CEBX,DOC,DOCX,XLS,XLSX,PPT,PPTX,WPS', '0', '0', NULL, '2019-04-28 18:24:38', '2019-04-28 18:31:10', '4');


-- ----------------------------
-- 公共参数菜单
-- ----------------------------
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (1700, '参数配置', '', 'param', 1000, 'icon-navicon-zdgl', 'views/admin/param/index', 8, '0', '0', '2019-03-29 13:17:19', '2019-03-29 13:38:19', '0');
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (1701, '参数配置新增', 'admin_syspublicparam_add', NULL, 1700, '1', NULL, 0, '0', '1', '2019-03-29 21:35:18', '2019-03-29 13:38:59', '0');
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (1702, '参数配置修改', 'admin_syspublicparam_edit', NULL, 1700, '1', NULL, 1, '0', '1', '2019-03-29 21:35:18', '2019-03-29 13:38:59', '0');
INSERT INTO `pigxx`.`sys_menu`(`menu_id`, `name`, `permission`, `path`, `parent_id`, `icon`, `component`, `sort`, `keep_alive`, `type`, `create_time`, `update_time`, `del_flag`) VALUES (1703, '参数配置删除', 'admin_syspublicparam_del', NULL, 1700, '1', NULL, 2, '0', '1', '2019-03-29 21:35:18', '2019-03-29 13:38:59', '0');

-- ----------------------------
-- 公共参数字典类型
-- ----------------------------
INSERT INTO `pigxx`.`sys_dict`(`id`, `type`, `description`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (11, 'param_type', '参数配置', '2019-04-29 18:20:47', '2019-04-29 18:20:47', '检索、原文、报表、安全、文档、消息、其他', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (36, 11, '0', '默认', 'param_type', '默认', 0, '2019-04-29 18:23:30', '2019-04-29 18:23:30', '默认', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (35, 11, '9', '其他', 'param_type', '其他', 0, '2019-04-29 18:23:16', '2019-04-29 18:23:16', '其他', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (34, 11, '6', '消息', 'param_type', '消息', 0, '2019-04-29 18:23:05', '2019-04-29 18:23:05', '消息', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (33, 11, '5', '文档', 'param_type', '文档', 0, '2019-04-29 18:22:56', '2019-04-29 18:22:56', '文档', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (32, 11, '4', '安全', 'param_type', '安全', 0, '2019-04-29 18:22:46', '2019-04-29 18:22:46', '安全', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (31, 11, '3', '报表', 'param_type', '报表', 0, '2019-04-29 18:22:36', '2019-04-29 18:22:36', '报表', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (30, 11, '2', '原文', 'param_type', '原文', 0, '2019-04-29 18:22:27', '2019-04-29 18:22:27', '原文', '0', 1);
INSERT INTO `pigxx`.`sys_dict_item`(`id`, `dict_id`, `value`, `label`, `type`, `description`, `sort`, `create_time`, `update_time`, `remarks`, `del_flag`, `tenant_id`) VALUES (29, 11, '1', '检索', 'param_type', '检索', 0, '2019-04-29 18:22:17', '2019-04-29 18:22:17', '检索', '0', 1);







