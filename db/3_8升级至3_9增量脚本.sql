SET FOREIGN_KEY_CHECKS=0;
-- ===================  配置中心配置修改  ===================
UPDATE `pigxx_config`.`config_info` SET `data_id` = 'application-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = 'jasypt:\n  encryptor:\n    password: pigx\n    \nspring:\n  redis:\n    host: pigx-redis\n  servlet:\n    multipart:\n      max-file-size: 100MB\n      max-request-size: 100MB\n  cloud:\n    sentinel:\n      eager: true\n      filter:\n        url-patterns: /** \n      transport:\n        dashboard: pigx-sentinel:5020\n                \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n#开启灰度\ngray:\n  rule:\n    enabled: true\n\nmybatis-plus:\n  tenant-enable: ture\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      field-strategy: NOT_EMPTY\n  type-handlers-package:  com.pig4cloud.pigx.common.data.handler\n\nswagger:\n  title: PigX Swagger API\n  license: Powered By PigX\n  licenseUrl: https://pig4cloud.com/\n  terms-of-service-url: https://pig4cloud.com/\n  contact:\n    email: wangiegie@gmail.com\n    url: https://pig4cloud.com/about.html\n  authorization:\n    name: pigX OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:pigx-gateway}:${GATEWAY_PORT:9999}/auth/oauth/token\n\nsecurity:\n  oauth2:\n    client:\n      ignore-urls:\n        - /actuator/**\n        - /v2/api-docs\n    resource:\n      loadBalanced: true\n      token-info-uri: http://pigx-auth/oauth/check_token', `md5` = '49acefd4a4f32805e0f0c71cd6c3c925', `gmt_create` = '2019-04-18 02:10:20', `gmt_modified` = '2020-06-06 11:27:34', `src_user` = NULL, `src_ip` = '172.17.0.156', `app_name` = '', `tenant_id` = '', `c_desc` = '通用配置文件', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 1;
UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-upms-biz-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      client-secret: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      scope: server\n      ignore-urls:\n        - /druid/**\n        - /actuator/**\n        - /v2/api-docs\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n      stat-view-servlet:\n        enabled: true\n        url-pattern: /druid/*\n        #login-username: admin\n        #login-password: admin\n      filter:\n        stat:\n          enabled: true\n          log-slow-sql: true\n          slow-sql-millis: 10000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n\n# 文件系统 (提供测试环境，不要乱传)\noss:\n  endpoint: http://minio.pig4cloud.com\n  access-key: lengleng\n  secret-key: lengleng\n  bucket-name: lengleng\n\n# Logger Config\nlogging:\n  level:\n    com.pig4cloud.pigx.admin.mapper: debug\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_user\n      - sys_role\n      - sys_menu\n      - sys_dept\n      - sys_log\n      - sys_social_details\n      - sys_dict\n      - sys_dict_item\n      - sys_public_param\n      - sys_log\n      - sys_file\n      - sys_oauth_client_details', `md5` = '28050ed1a6ec147346048fd444a94dc0', `gmt_create` = '2019-04-18 02:32:44', `gmt_modified` = '2020-05-30 12:25:59', `src_user` = NULL, `src_ip` = '172.17.0.156', `app_name` = '', `tenant_id` = '', `c_desc` = 'admin 服务配置', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 7;
UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-mp-platform-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(vW+Nup9LaTfIFwgufUBsYg==)\n      client-secret: ENC(vW+Nup9LaTfIFwgufUBsYg==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL-USER:root}\n      password: ${MYSQL-PWD:root}\n      url: jdbc:mysql://${MYSQL-HOST:pigx-mysql}:${MYSQL-PORT:3306}/${MYSQL-DB:pigxx_mp}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - wx_mp_menu\n      - wx_account\n      - wx_account_fans\n      - wx_msg\n      - wx_auto_reply', `md5` = 'b179debedf55403402031192824a251e', `gmt_create` = '2019-10-21 08:58:24', `gmt_modified` = '2020-06-09 15:04:07', `src_user` = NULL, `src_ip` = '172.17.0.156', `app_name` = '', `tenant_id` = '', `c_desc` = 'null', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 12;

-- =================== 通用数据权限修改   ===================

INSERT INTO `sys_menu` VALUES (6204, '粉丝同步', 'mp_wxaccountfans_sync', NULL, 6200, '1', 3, '0', '1', '2018-05-15 21:35:18', '2020-03-24 08:58:31', '0', 1);
INSERT INTO `sys_menu` VALUES (6403, '删除', 'mp_wxmenu_del', NULL, 6400, NULL, 1, '0', '1', '2019-03-29 15:43:54', '2020-03-24 08:58:39', '0', 1);
INSERT INTO `sys_menu` VALUES (6600, '素材管理', NULL, '/mp/wxmaterial/index', 6000, 'icon-sucaisads', 999, '0', '0', '2020-04-27 15:25:17', '2020-05-09 03:16:13', '0', 1);
INSERT INTO `sys_menu` VALUES (6601, '素材维护', 'mp_wxmaterial_add', NULL, 6600, NULL, 1, '0', '1', '2019-03-29 15:43:54', '2020-03-24 08:58:39', '0', 1);
INSERT INTO `sys_menu` VALUES (6602, '素材删除', 'mp_wxmaterial_del', NULL, 6600, NULL, 1, '0', '1', '2019-03-29 15:43:54', '2020-03-24 08:58:39', '0', 1);
INSERT INTO `sys_menu` VALUES (6700, '自动回复', NULL, '/mp/wxautoreply/index', 6000, 'icon-huifu', 998, '0', '0', '2020-04-27 15:25:17', '2020-05-09 03:16:16', '0', 1);
INSERT INTO `sys_menu` VALUES (6701, '新增回复', 'mp_wxautoreply_add', NULL, 6700, NULL, 1, '0', '1', '2019-03-29 15:43:54', '2020-03-24 08:58:39', '0', 1);
INSERT INTO `sys_menu` VALUES (6702, '编辑回复', 'mp_wxautoreply_edit', NULL, 6700, NULL, 1, '0', '1', '2019-03-29 15:43:54', '2020-03-24 08:58:39', '0', 1);
INSERT INTO `sys_menu` VALUES (6703, '删除回复', 'mp_wxautoreply_del', NULL, 6700, NULL, 1, '0', '1', '2019-03-29 15:43:54', '2020-03-24 08:58:39', '0', 1);


INSERT INTO `sys_role_menu` VALUES (1, 6600);
INSERT INTO `sys_role_menu` VALUES (1, 6601);
INSERT INTO `sys_role_menu` VALUES (1, 6602);
INSERT INTO `sys_role_menu` VALUES (1, 6700);
INSERT INTO `sys_role_menu` VALUES (1, 6701);
INSERT INTO `sys_role_menu` VALUES (1, 6702);
INSERT INTO `sys_role_menu` VALUES (1, 6703);


INSERT INTO `sys_public_param` VALUES (1, '租户默认来源', 'TENANT_DEFAULT_ID', '1', '0', '', '2020-05-12 04:03:46', '2020-06-20 08:56:30', '2', '0', '1', 1);
INSERT INTO `sys_public_param` VALUES (2, '租户默认部门名称', 'TENANT_DEFAULT_DEPTNAME', '租户默认部门', '0', '', '2020-05-12 03:36:32', NULL, '2', '1', '0', 1);
INSERT INTO `sys_public_param` VALUES (3, '租户默认账户', 'TENANT_DEFAULT_USERNAME', 'admin', '0', '', '2020-05-12 04:05:04', NULL, '2', '1', '0', 1);
INSERT INTO `sys_public_param` VALUES (4, '租户默认密码', 'TENANT_DEFAULT_PASSWORD', '123456', '0', '', '2020-05-12 04:05:24', NULL, '2', '1', '0', 1);
INSERT INTO `sys_public_param` VALUES (5, '租户默认角色编码', 'TENANT_DEFAULT_ROLECODE', 'ROLE_ADMIN', '0', '', '2020-05-12 04:05:57', NULL, '2', '1', '0', 1);
INSERT INTO `sys_public_param` VALUES (6, '租户默认角色名称', 'TENANT_DEFAULT_ROLENAME', '租户默认角色', '0', '', '2020-05-12 04:06:19', NULL, '2', '1', '0', 1);
INSERT INTO `sys_public_param` VALUES (7, '表前缀', 'GEN_TABLE_PREFIX', 'tb_', '0', '', '2020-05-12 04:23:04', NULL, '9', '1', '0', 1);
INSERT INTO `sys_public_param` VALUES (8, '接口文档不显示的字段', 'GEN_HIDDEN_COLUMNS', 'tenant_id', '0', '', '2020-05-12 04:25:19', NULL, '9', '1', '0', 1);


-- ===================  微信模块增量数据  ===================
ALTER TABLE `pigxx_mp`.`wx_account` AUTO_INCREMENT = 1;

ALTER TABLE `pigxx_mp`.`wx_account` MODIFY COLUMN `id` int(0) NOT NULL COMMENT '主键' FIRST;

ALTER TABLE `pigxx_mp`.`wx_account` MODIFY COLUMN `tenant_id` int(0) NULL DEFAULT NULL COMMENT '租户Id' AFTER `del_flag`;

ALTER TABLE `pigxx_mp`.`wx_account` MODIFY COLUMN `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键';

ALTER TABLE `pigxx_mp`.`wx_account_fans` MODIFY COLUMN `id` int(0) NOT NULL COMMENT '主键' FIRST;

ALTER TABLE `pigxx_mp`.`wx_account_fans` MODIFY COLUMN `wx_account_id` int(0) NULL DEFAULT NULL COMMENT '微信公众号ID' AFTER `remark`;

ALTER TABLE `pigxx_mp`.`wx_account_fans` MODIFY COLUMN `tenant_id` int(0) NULL DEFAULT NULL AFTER `del_flag`;

ALTER TABLE `pigxx_mp`.`wx_account_fans` MODIFY COLUMN `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键';

CREATE TABLE `pigxx_mp`.`wx_auto_reply`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（1、关注时回复；2、消息回复；3、关键词回复）',
  `req_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `req_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求消息类型（text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置）',
  `rep_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复消息类型（text：文本；image：图片；voice：语音；video：视频；music：音乐；news：图文）',
  `rep_mate` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复类型文本匹配类型（1、全匹配，2、半匹配）',
  `rep_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回复类型文本保存文字',
  `rep_media_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复类型imge、voice、news、video的mediaID或音乐缩略图的媒体id',
  `rep_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复的素材名、视频和音乐的标题',
  `rep_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频和音乐的描述',
  `rep_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `rep_hq_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高质量链接',
  `rep_thumb_media_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图的媒体id',
  `rep_thumb_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图url',
  `content` json NULL COMMENT '图文消息的内容',
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号ID',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `tenant_id` int(0) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信自动回复' ROW_FORMAT = Dynamic;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `id` int(0) NOT NULL COMMENT '主键' FIRST;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `wx_account_id` int(0) NULL DEFAULT NULL COMMENT '公众号ID' AFTER `menu`;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `wx_account_appid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号APPID' AFTER `wx_account_id`;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `wx_account_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号名称' AFTER `wx_account_appid`;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记' AFTER `update_time`;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `pub_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '发布标志' AFTER `del_flag`;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `tenant_id` int(0) NULL DEFAULT NULL COMMENT '租户ID' AFTER `pub_flag`;

ALTER TABLE `pigxx_mp`.`wx_mp_menu` MODIFY COLUMN `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键';

CREATE TABLE `pigxx_mp`.`wx_msg`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号名称',
  `app_logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号logo',
  `wx_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信用户ID',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户昵称',
  `headimg_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户头像',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息分类（1、用户发给公众号；2、公众号发给用户；）',
  `rep_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型（text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置；music：音乐；news：图文；event：推送事件）',
  `rep_event` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件类型（subscribe：关注；unsubscribe：取关；CLICK、VIEW：菜单事件）',
  `rep_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回复类型文本保存文字、地理位置信息',
  `rep_media_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复类型imge、voice、news、video的mediaID或音乐缩略图的媒体id',
  `rep_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复的素材名、视频和音乐的标题',
  `rep_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频和音乐的描述',
  `rep_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `rep_hq_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高质量链接',
  `content` json NULL COMMENT '图文消息的内容',
  `rep_thumb_media_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图的媒体id',
  `rep_thumb_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图url',
  `rep_location_x` double NULL DEFAULT NULL COMMENT '地理位置维度',
  `rep_location_y` double NULL DEFAULT NULL COMMENT '地理位置经度',
  `rep_scale` double NULL DEFAULT NULL COMMENT '地图缩放大小',
  `read_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '已读标记（1：是；0：否）',
  `app_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号ID',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信唯一标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `tenant_id` int(0) NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信消息' ROW_FORMAT = Dynamic;

DROP TABLE `pigxx_mp`.`wx_fans_msg`;

DROP TABLE `pigxx_mp`.`wx_fans_msg_res`;

SET FOREIGN_KEY_CHECKS=1;