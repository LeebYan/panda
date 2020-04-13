USE pigxx_config;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'jasypt:\n  encryptor:\n    password: pigx\n    \nspring:\n  redis:\n    host: pigx-redis\n  servlet:\n    multipart:\n      max-file-size: 100MB\n      max-request-size: 100MB\n  cloud:\n    sentinel:\n      eager: true\n      filter:\n        url-patterns: /** \n      transport:\n        dashboard: pigx-sentinel:5020\n                \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n#开启灰度\ngray:\n  rule:\n    enabled: true\n\nmybatis-plus:\n  tenant-enable: ture\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      field-strategy: NOT_EMPTY\n  type-handlers-package:  com.pig4cloud.pigx.common.data.handler\n\nswagger:\n  title: PigX Swagger API\n  license: Powered By PigX\n  licenseUrl: https://pig4cloud.com/\n  terms-of-service-url: https://pig4cloud.com/\n  contact:\n    email: wangiegie@gmail.com\n    url: https://pig4cloud.com/about.html\n  authorization:\n    name: pigX OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:pigx-gateway}:${GATEWAY_PORT:9999}/auth/oauth/token\n\nsecurity:\n  oauth2:\n    client:\n      ignore-urls:\n        - /actuator/**\n        - /v2/api-docs\n    resource:\n      loadBalanced: true\n      token-info-uri: http://pigx-auth/oauth/check_token', '954b56ac77f2691529aad5c497591b28', '2019-04-18 02:10:20', '2020-02-24 13:58:21', NULL, '172.17.0.125', '', '', '通用配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (2, 'pigx-auth-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', 'a6674e6747c1a0bb6c6d78e13706f8f0', '2019-04-18 02:11:32', '2019-08-27 18:24:04', NULL, '127.0.0.1', '', '', '认证中心配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (3, 'pigx-codegen-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_codegen}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - gen_datasource_conf', 'b7d132a3ecdfac4252c994adbb65b23a', '2019-04-18 02:12:10', '2019-08-27 18:24:18', NULL, '127.0.0.1', '', '', '代码生成', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (4, 'pigx-daemon-elastic-job-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      client-secret: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      scope: server\n## 定时任务\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_job}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\nxxl:\n  job:\n    admin:\n      addresses: http://${XXL-HOST:pigx-xxl}:${XXL-HOST:9080}/xxl-job-admin\n    executor:\n      port: 9988\n      appName: test-xxl', '9ce58242d57b57f737dcb59a41ee6e55', '2019-04-18 02:12:57', '2019-10-04 11:22:56', NULL, '127.0.0.1', '', '', '定时任务-elastic-job配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (5, 'pigx-gateway-dev.yml', 'DEFAULT_GROUP', 'security:\n  encode:\n    key: \'pigxpigxpigxpigx\'\n\nignore:\n  clients:\n    - test\n  swagger-providers:\n    - pigx-auth\n    - pigx-tx-manager\n\nribbon:\n  rule:\n    gray-enabled: true', '24403a5b205b1e9d320078e309584bbc', '2019-04-18 02:13:52', '2019-10-20 17:07:42', NULL, '127.0.0.1', '', '', '网关配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (6, 'pigx-monitor-dev.yml', 'DEFAULT_GROUP', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(rZHA4LW5hHmhLAAzJoFNag==)     # pigx\n      password: ENC(bjeyh+Aeii3kHXkoo00ZUw==) # pigx\n  boot:\n    admin:\n      ui:\n        title: \'pigx 服务状态监控\'\n        brand: \'pigx 服务状态监控\'\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS  #显示详细信息', '7925a0c734460526262319b6a189e39d', '2019-04-18 02:14:17', '2019-12-31 19:04:00', NULL, '172.17.0.157', '', '', '监控配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (7, 'pigx-upms-biz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      client-secret: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      scope: server\n      ignore-urls:\n        - /druid/**\n        - /actuator/**\n        - /v2/api-docs\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n      stat-view-servlet:\n        enabled: true\n        url-pattern: /druid/*\n        #login-username: admin\n        #login-password: admin\n      filter:\n        stat:\n          enabled: true\n          log-slow-sql: true\n          slow-sql-millis: 10000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n\n# 文件系统 (提供测试环境，不要乱传)\nminio:\n  url: http://minio.pig4cloud.com\n  access-key: lengleng\n  secret-key: lengleng\n\n# Logger Config\nlogging:\n  level:\n    com.pig4cloud.pigx.admin.mapper: debug\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_user\n      - sys_role\n      - sys_menu\n      - sys_dept\n      - sys_log\n      - sys_social_details\n      - sys_dict\n      - sys_dict_item\n      - sys_public_param\n      - sys_log\n      - sys_file\n      - sys_oauth_client_details', 'fab3a6b4cb292954d9841b22a41e3dab', '2019-04-18 02:32:44', '2019-11-01 12:22:38', NULL, '127.0.0.1', '', '', 'admin 服务配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (8, 'pigx-tx-manager-dev.yml', 'DEFAULT_GROUP', '# 页面配置\nspring:\n  mvc:\n    static-path-pattern: /**\n  resources:\n    static-locations: classpath:/static/\n\n\n# LCN 配置\ntm:\n  transaction:\n    netty:\n      delaytime: 5   # 客户端链接最大通讯时间 （秒）\n      hearttime: 15  # 客户端心跳时间   （秒）\n  redis:\n    savemaxtime: 30  # redis 保存时间  （秒）\n  socket:\n    port: 9998       # 通讯端口\n    maxconnection: 1000  #最大链接数\n  compensate:\n    auto: false   #是否自动补偿\n    notifyUrl: http://ip:port/path #补偿结果通知（配消息总线里面）\n    tryTime: 30     # z再次重试时间间隔\n    maxWaitTime: 5000   # 请求超时的最大时间 (毫秒)', '885f5c125f2df7a08692929ccce154be', '2019-04-18 02:54:03', '2019-04-18 02:54:03', NULL, '127.0.0.1', '', '', '分布式事务协调模块', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (9, 'pigx-daemon-quartz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      client-secret: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      scope: server\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_job}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n  quartz:\n    #相关属性配置\n    properties:\n      org:\n        quartz:\n          scheduler:\n            instanceName: clusteredScheduler\n            instanceId: AUTO\n          jobStore:\n            class: org.quartz.impl.jdbcjobstore.JobStoreTX\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n            tablePrefix: QRTZ_\n            isClustered: true\n            clusterCheckinInterval: 10000\n            useProperties: false\n          threadPool:\n            class: org.quartz.simpl.SimpleThreadPool\n            threadCount: 50\n            threadPriority: 5\n            threadsInheritContextClassLoaderOfInitializingThread: true\n    #数据库方式\n    job-store-type: jdbc\n    #初始化表结构\n    #jdbc:\n    #initialize-schema: never\n\n', '276cf549fb8b084e35dc07d1eb309932', '2019-04-18 03:08:34', '2019-08-27 18:25:41', NULL, '127.0.0.1', '', '', 'quartz 配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (10, 'pigx-pay-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_pay}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\n# 租户表维护\npigx:\n  pay:\n    test: lengleng\n    aliPayConfig:\n      expire-time: 30\n      return-url: http://pig4cloud.com\n      notify-url: https://admin.pig4cloud.com/pay/notify/ali/callbak\n    wxPayConfig:\n      notify-url: https://admin.pig4cloud.com/pay/notify/wx/callbak\n  xsequence:    #发号器相关配置\n    db:\n      retry-times: 3\n      table-name: pay_sequence\n  tenant:\n    column: tenant_id\n    tables:\n      - pay_channel\n      - pay_trade_order\n      - pay_goods_order\n      - pay_notify_record', 'bf185a74bb9af224bfe7f8f52ae3c9cb', '2019-05-28 11:46:27', '2019-08-27 18:26:01', NULL, '127.0.0.1', '', '', '支付模块配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (11, 'pigx-oa-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n      ignore-urls:\n        - \'/actuator/**\'\n        - \'/v2/api-docs\'\n        - \'/editor-app/**\'\n        - \'/modeler.html\'\n        - \'/ws/**\'\nspring:\n  autoconfigure:\n    exclude: org.activiti.spring.boot.SecurityAutoConfiguration\n  activiti:\n    check-process-definitions: false\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_ac}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - oa_leave_bill', 'bb2ee29e458875b0334e9f204f958272', '2019-10-16 16:38:52', '2019-10-16 16:38:52', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (12, 'pigx-mp-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(vW+Nup9LaTfIFwgufUBsYg==)\n      client-secret: ENC(vW+Nup9LaTfIFwgufUBsYg==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_mp}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - wx_mp_menu\n      - wx_account\n      - wx_account_fans\n      - wx_fans_msg_res', 'bf4f6943566ce47a98551923bc4c4f80', '2019-10-21 08:58:24', '2019-10-21 08:58:24', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(512) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `uk_username_role` (`username`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'jasypt:\n  encryptor:\n    password: pigx\n    \nspring:\n  redis:\n    host: pigx-redis\n  servlet:\n    multipart:\n      max-file-size: 100MB\n      max-request-size: 100MB\n  cloud:\n    sentinel:\n      eager: true\n      filter:\n        url-patterns: /** \n      transport:\n        dashboard: pigx-sentinel:5020\n                \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n#开启灰度\ngray:\n  rule:\n    enabled: true\n\nmybatis-plus:\n  tenant-enable: ture\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      field-strategy: NOT_EMPTY\n  type-handlers-package:  com.pig4cloud.pigx.common.data.handler\n\nswagger:\n  title: PigX Swagger API\n  license: Powered By PigX\n  licenseUrl: https://pig4cloud.com/\n  terms-of-service-url: https://pig4cloud.com/\n  contact:\n    email: wangiegie@gmail.com\n    url: https://pig4cloud.com/about.html\n  authorization:\n    name: pigX OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:pigx-gateway}:${GATEWAY_PORT:9999}/auth/oauth/token\n\nsecurity:\n  oauth2:\n    client:\n      ignore-urls:\n        - /actuator/**\n        - /v2/api-docs\n    resource:\n      loadBalanced: true\n      token-info-uri: http://pigx-auth/oauth/check_token', '954b56ac77f2691529aad5c497591b28', '2019-04-18 02:10:20', '2020-02-24 13:58:21', NULL, '172.17.0.125', '', '', '通用配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (2, 'pigx-auth-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', 'a6674e6747c1a0bb6c6d78e13706f8f0', '2019-04-18 02:11:32', '2019-08-27 18:24:04', NULL, '127.0.0.1', '', '', '认证中心配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (3, 'pigx-codegen-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_codegen}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - gen_datasource_conf', 'b7d132a3ecdfac4252c994adbb65b23a', '2019-04-18 02:12:10', '2019-08-27 18:24:18', NULL, '127.0.0.1', '', '', '代码生成', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (4, 'pigx-daemon-elastic-job-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      client-secret: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      scope: server\n## 定时任务\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_job}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\nxxl:\n  job:\n    admin:\n      addresses: http://${XXL-HOST:pigx-xxl}:${XXL-HOST:9080}/xxl-job-admin\n    executor:\n      port: 9988\n      appName: test-xxl', '9ce58242d57b57f737dcb59a41ee6e55', '2019-04-18 02:12:57', '2019-10-04 11:22:56', NULL, '127.0.0.1', '', '', '定时任务-elastic-job配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (5, 'pigx-gateway-dev.yml', 'DEFAULT_GROUP', 'security:\n  encode:\n    key: \'pigxpigxpigxpigx\'\n\nignore:\n  clients:\n    - test\n  swagger-providers:\n    - pigx-auth\n    - pigx-tx-manager\n\nribbon:\n  rule:\n    gray-enabled: true', '24403a5b205b1e9d320078e309584bbc', '2019-04-18 02:13:52', '2019-10-20 17:07:42', NULL, '127.0.0.1', '', '', '网关配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (6, 'pigx-monitor-dev.yml', 'DEFAULT_GROUP', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(rZHA4LW5hHmhLAAzJoFNag==)     # pigx\n      password: ENC(bjeyh+Aeii3kHXkoo00ZUw==) # pigx\n  boot:\n    admin:\n      ui:\n        title: \'pigx 服务状态监控\'\n        brand: \'pigx 服务状态监控\'\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS  #显示详细信息', '7925a0c734460526262319b6a189e39d', '2019-04-18 02:14:17', '2019-12-31 19:04:00', NULL, '172.17.0.157', '', '', '监控配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (7, 'pigx-upms-biz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      client-secret: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      scope: server\n      ignore-urls:\n        - /druid/**\n        - /actuator/**\n        - /v2/api-docs\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n      stat-view-servlet:\n        enabled: true\n        url-pattern: /druid/*\n        #login-username: admin\n        #login-password: admin\n      filter:\n        stat:\n          enabled: true\n          log-slow-sql: true\n          slow-sql-millis: 10000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n\n# 文件系统 (提供测试环境，不要乱传)\nminio:\n  url: http://minio.pig4cloud.com\n  access-key: lengleng\n  secret-key: lengleng\n\n# Logger Config\nlogging:\n  level:\n    com.pig4cloud.pigx.admin.mapper: debug\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_user\n      - sys_role\n      - sys_menu\n      - sys_dept\n      - sys_log\n      - sys_social_details\n      - sys_dict\n      - sys_dict_item\n      - sys_public_param\n      - sys_log\n      - sys_file\n      - sys_oauth_client_details', 'fab3a6b4cb292954d9841b22a41e3dab', '2019-04-18 02:32:44', '2019-11-01 12:22:38', NULL, '127.0.0.1', '', '', 'admin 服务配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (8, 'pigx-tx-manager-dev.yml', 'DEFAULT_GROUP', '# 页面配置\nspring:\n  mvc:\n    static-path-pattern: /**\n  resources:\n    static-locations: classpath:/static/\n\n\n# LCN 配置\ntm:\n  transaction:\n    netty:\n      delaytime: 5   # 客户端链接最大通讯时间 （秒）\n      hearttime: 15  # 客户端心跳时间   （秒）\n  redis:\n    savemaxtime: 30  # redis 保存时间  （秒）\n  socket:\n    port: 9998       # 通讯端口\n    maxconnection: 1000  #最大链接数\n  compensate:\n    auto: false   #是否自动补偿\n    notifyUrl: http://ip:port/path #补偿结果通知（配消息总线里面）\n    tryTime: 30     # z再次重试时间间隔\n    maxWaitTime: 5000   # 请求超时的最大时间 (毫秒)', '885f5c125f2df7a08692929ccce154be', '2019-04-18 02:54:03', '2019-04-18 02:54:03', NULL, '127.0.0.1', '', '', '分布式事务协调模块', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (9, 'pigx-daemon-quartz-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      client-secret: ENC(tz2NM4GcmnE7sNJTYL8ZSg==)\n      scope: server\n\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_job}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n  quartz:\n    #相关属性配置\n    properties:\n      org:\n        quartz:\n          scheduler:\n            instanceName: clusteredScheduler\n            instanceId: AUTO\n          jobStore:\n            class: org.quartz.impl.jdbcjobstore.JobStoreTX\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\n            tablePrefix: QRTZ_\n            isClustered: true\n            clusterCheckinInterval: 10000\n            useProperties: false\n          threadPool:\n            class: org.quartz.simpl.SimpleThreadPool\n            threadCount: 50\n            threadPriority: 5\n            threadsInheritContextClassLoaderOfInitializingThread: true\n    #数据库方式\n    job-store-type: jdbc\n    #初始化表结构\n    #jdbc:\n    #initialize-schema: never\n\n', '276cf549fb8b084e35dc07d1eb309932', '2019-04-18 03:08:34', '2019-08-27 18:25:41', NULL, '127.0.0.1', '', '', 'quartz 配置文件', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (10, 'pigx-pay-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_pay}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\n# 租户表维护\npigx:\n  pay:\n    test: lengleng\n    aliPayConfig:\n      expire-time: 30\n      return-url: http://pig4cloud.com\n      notify-url: https://admin.pig4cloud.com/pay/notify/ali/callbak\n    wxPayConfig:\n      notify-url: https://admin.pig4cloud.com/pay/notify/wx/callbak\n  xsequence:    #发号器相关配置\n    db:\n      retry-times: 3\n      table-name: pay_sequence\n  tenant:\n    column: tenant_id\n    tables:\n      - pay_channel\n      - pay_trade_order\n      - pay_goods_order\n      - pay_notify_record', 'bf185a74bb9af224bfe7f8f52ae3c9cb', '2019-05-28 11:46:27', '2019-08-27 18:26:01', NULL, '127.0.0.1', '', '', '支付模块配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (11, 'pigx-oa-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n      ignore-urls:\n        - \'/actuator/**\'\n        - \'/v2/api-docs\'\n        - \'/editor-app/**\'\n        - \'/modeler.html\'\n        - \'/ws/**\'\nspring:\n  autoconfigure:\n    exclude: org.activiti.spring.boot.SecurityAutoConfiguration\n  activiti:\n    check-process-definitions: false\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_ac}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - oa_leave_bill', 'bb2ee29e458875b0334e9f204f958272', '2019-10-16 16:38:52', '2019-10-16 16:38:52', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (12, 'pigx-mp-platform-dev.yml', 'DEFAULT_GROUP', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(vW+Nup9LaTfIFwgufUBsYg==)\n      client-secret: ENC(vW+Nup9LaTfIFwgufUBsYg==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_mp}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - wx_mp_menu\n      - wx_account\n      - wx_account_fans\n      - wx_fans_msg_res', 'bf4f6943566ce47a98551923bc4c4f80', '2019-10-21 08:58:24', '2019-10-21 08:58:24', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(512) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `uk_username_role` (`username`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE `pigxx`.`sys_menu` ADD COLUMN `tenant_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '租户ID' AFTER `del_flag`;

UPDATE `pigxx`.`sys_menu` SET `name` = '权限管理', `permission` = NULL, `path` = '/user', `parent_id` = -1, `icon` = 'icon-quanxianguanli', `sort` = 0, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-28 08:29:53', `update_time` = '2020-03-24 08:56:32', `del_flag` = '0' WHERE `menu_id` = 1000;

UPDATE `pigxx`.`sys_menu` SET `name` = '用户管理', `permission` = NULL, `path` = '/admin/user/index', `parent_id` = 1000, `icon` = 'icon-yonghuguanli', `sort` = 1, `keep_alive` = '1', `type` = '0', `create_time` = '2017-11-02 22:24:37', `update_time` = '2020-03-24 08:56:33', `del_flag` = '0' WHERE `menu_id` = 1100;

UPDATE `pigxx`.`sys_menu` SET `name` = '用户新增', `permission` = 'sys_user_add', `path` = NULL, `parent_id` = 1100, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 09:52:09', `update_time` = '2020-03-24 08:56:34', `del_flag` = '0' WHERE `menu_id` = 1101;

UPDATE `pigxx`.`sys_menu` SET `name` = '用户修改', `permission` = 'sys_user_edit', `path` = NULL, `parent_id` = 1100, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 09:52:48', `update_time` = '2020-03-24 08:56:35', `del_flag` = '0' WHERE `menu_id` = 1102;

UPDATE `pigxx`.`sys_menu` SET `name` = '用户删除', `permission` = 'sys_user_del', `path` = NULL, `parent_id` = 1100, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 09:54:01', `update_time` = '2020-03-24 08:56:37', `del_flag` = '0' WHERE `menu_id` = 1103;

UPDATE `pigxx`.`sys_menu` SET `name` = '菜单管理', `permission` = NULL, `path` = '/admin/menu/index', `parent_id` = 1000, `icon` = 'icon-caidanguanli', `sort` = 2, `keep_alive` = '0', `type` = '0', `create_time` = '2017-11-08 09:57:27', `update_time` = '2020-03-24 08:56:38', `del_flag` = '0' WHERE `menu_id` = 1200;

UPDATE `pigxx`.`sys_menu` SET `name` = '菜单新增', `permission` = 'sys_menu_add', `path` = NULL, `parent_id` = 1200, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 10:15:53', `update_time` = '2020-03-24 08:56:39', `del_flag` = '0' WHERE `menu_id` = 1201;

UPDATE `pigxx`.`sys_menu` SET `name` = '菜单修改', `permission` = 'sys_menu_edit', `path` = NULL, `parent_id` = 1200, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 10:16:23', `update_time` = '2020-03-24 08:56:40', `del_flag` = '0' WHERE `menu_id` = 1202;

UPDATE `pigxx`.`sys_menu` SET `name` = '菜单删除', `permission` = 'sys_menu_del', `path` = NULL, `parent_id` = 1200, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 10:16:43', `update_time` = '2020-03-24 08:56:41', `del_flag` = '0' WHERE `menu_id` = 1203;

UPDATE `pigxx`.`sys_menu` SET `name` = '角色管理', `permission` = NULL, `path` = '/admin/role/index', `parent_id` = 1000, `icon` = 'icon-jiaoseguanli', `sort` = 3, `keep_alive` = '0', `type` = '0', `create_time` = '2017-11-08 10:13:37', `update_time` = '2020-03-24 08:56:42', `del_flag` = '0' WHERE `menu_id` = 1300;

UPDATE `pigxx`.`sys_menu` SET `name` = '角色新增', `permission` = 'sys_role_add', `path` = NULL, `parent_id` = 1300, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 10:14:18', `update_time` = '2020-03-24 08:56:43', `del_flag` = '0' WHERE `menu_id` = 1301;

UPDATE `pigxx`.`sys_menu` SET `name` = '角色修改', `permission` = 'sys_role_edit', `path` = NULL, `parent_id` = 1300, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 10:14:41', `update_time` = '2020-03-24 08:56:43', `del_flag` = '0' WHERE `menu_id` = 1302;

UPDATE `pigxx`.`sys_menu` SET `name` = '角色删除', `permission` = 'sys_role_del', `path` = NULL, `parent_id` = 1300, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-08 10:14:59', `update_time` = '2020-03-24 08:56:45', `del_flag` = '0' WHERE `menu_id` = 1303;

UPDATE `pigxx`.`sys_menu` SET `name` = '分配权限', `permission` = 'sys_role_perm', `path` = NULL, `parent_id` = 1300, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-04-20 07:22:55', `update_time` = '2020-03-24 08:56:46', `del_flag` = '0' WHERE `menu_id` = 1304;

UPDATE `pigxx`.`sys_menu` SET `name` = '部门管理', `permission` = NULL, `path` = '/admin/dept/index', `parent_id` = 1000, `icon` = 'icon-web-icon-', `sort` = 4, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:56:47', `del_flag` = '0' WHERE `menu_id` = 1400;

UPDATE `pigxx`.`sys_menu` SET `name` = '部门新增', `permission` = 'sys_dept_add', `path` = NULL, `parent_id` = 1400, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-01-20 14:56:16', `update_time` = '2020-03-24 08:56:48', `del_flag` = '0' WHERE `menu_id` = 1401;

UPDATE `pigxx`.`sys_menu` SET `name` = '部门修改', `permission` = 'sys_dept_edit', `path` = NULL, `parent_id` = 1400, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-01-20 14:56:59', `update_time` = '2020-03-24 08:56:48', `del_flag` = '0' WHERE `menu_id` = 1402;

UPDATE `pigxx`.`sys_menu` SET `name` = '部门删除', `permission` = 'sys_dept_del', `path` = NULL, `parent_id` = 1400, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-01-20 14:57:28', `update_time` = '2020-03-24 08:56:51', `del_flag` = '0' WHERE `menu_id` = 1403;

UPDATE `pigxx`.`sys_menu` SET `name` = '租户管理', `permission` = '', `path` = '/admin/tenant/index', `parent_id` = 1000, `icon` = 'icon-erji-zuhushouye', `sort` = 5, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:56:49', `del_flag` = '0' WHERE `menu_id` = 1500;

UPDATE `pigxx`.`sys_menu` SET `name` = '租户新增', `permission` = 'admin_systenant_add', `path` = NULL, `parent_id` = 1500, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:56:52', `del_flag` = '0' WHERE `menu_id` = 1501;

UPDATE `pigxx`.`sys_menu` SET `name` = '租户修改', `permission` = 'admin_systenant_edit', `path` = NULL, `parent_id` = 1500, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:56:53', `del_flag` = '0' WHERE `menu_id` = 1502;

UPDATE `pigxx`.`sys_menu` SET `name` = '租户删除', `permission` = 'admin_systenant_del', `path` = NULL, `parent_id` = 1500, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:56:54', `del_flag` = '0' WHERE `menu_id` = 1503;

UPDATE `pigxx`.`sys_menu` SET `name` = '系统管理', `permission` = NULL, `path` = '/admin', `parent_id` = -1, `icon` = 'icon-xitongguanli', `sort` = 1, `keep_alive` = '0', `type` = '0', `create_time` = '2017-11-07 20:56:00', `update_time` = '2020-03-24 08:56:55', `del_flag` = '0' WHERE `menu_id` = 2000;

UPDATE `pigxx`.`sys_menu` SET `name` = '日志管理', `permission` = NULL, `path` = '/admin/log/index', `parent_id` = 2000, `icon` = 'icon-rizhiguanli', `sort` = 5, `keep_alive` = '0', `type` = '0', `create_time` = '2017-11-20 14:06:22', `update_time` = '2020-03-24 08:56:56', `del_flag` = '0' WHERE `menu_id` = 2100;

UPDATE `pigxx`.`sys_menu` SET `name` = '日志删除', `permission` = 'sys_log_del', `path` = NULL, `parent_id` = 2100, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-20 20:37:37', `update_time` = '2020-03-24 08:56:58', `del_flag` = '0' WHERE `menu_id` = 2101;

UPDATE `pigxx`.`sys_menu` SET `name` = '字典管理', `permission` = NULL, `path` = '/admin/dict/index', `parent_id` = 2000, `icon` = 'icon-navicon-zdgl', `sort` = 6, `keep_alive` = '0', `type` = '0', `create_time` = '2017-11-29 11:30:52', `update_time` = '2020-03-24 08:56:58', `del_flag` = '0' WHERE `menu_id` = 2200;

UPDATE `pigxx`.`sys_menu` SET `name` = '字典删除', `permission` = 'sys_dict_del', `path` = NULL, `parent_id` = 2200, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2017-11-29 11:30:11', `update_time` = '2020-03-24 08:56:59', `del_flag` = '0' WHERE `menu_id` = 2201;

UPDATE `pigxx`.`sys_menu` SET `name` = '字典新增', `permission` = 'sys_dict_add', `path` = NULL, `parent_id` = 2200, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-11 22:34:55', `update_time` = '2020-03-24 08:57:01', `del_flag` = '0' WHERE `menu_id` = 2202;

UPDATE `pigxx`.`sys_menu` SET `name` = '字典修改', `permission` = 'sys_dict_edit', `path` = NULL, `parent_id` = 2200, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-11 22:36:03', `update_time` = '2020-03-24 08:57:09', `del_flag` = '0' WHERE `menu_id` = 2203;

UPDATE `pigxx`.`sys_menu` SET `name` = '参数管理', `permission` = NULL, `path` = '/admin/param/index', `parent_id` = 2000, `icon` = 'icon-canshu', `sort` = 7, `keep_alive` = '1', `type` = '0', `create_time` = '2019-04-29 22:16:50', `update_time` = '2020-03-24 08:57:10', `del_flag` = '0' WHERE `menu_id` = 2210;

UPDATE `pigxx`.`sys_menu` SET `name` = '参数新增', `permission` = 'admin_syspublicparam_add', `path` = NULL, `parent_id` = 2210, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-04-29 22:17:36', `update_time` = '2020-03-24 08:57:11', `del_flag` = '0' WHERE `menu_id` = 2211;

UPDATE `pigxx`.`sys_menu` SET `name` = '参数删除', `permission` = 'admin_syspublicparam_del', `path` = NULL, `parent_id` = 2210, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-04-29 22:17:55', `update_time` = '2020-03-24 08:57:12', `del_flag` = '0' WHERE `menu_id` = 2212;

UPDATE `pigxx`.`sys_menu` SET `name` = '参数编辑', `permission` = 'admin_syspublicparam_edit', `path` = NULL, `parent_id` = 2210, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-04-29 22:18:14', `update_time` = '2020-03-24 08:57:13', `del_flag` = '0' WHERE `menu_id` = 2213;

UPDATE `pigxx`.`sys_menu` SET `name` = '代码生成', `permission` = '', `path` = '/gen/index', `parent_id` = 10006, `icon` = 'icon-weibiaoti46', `sort` = 1, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:57:14', `del_flag` = '0' WHERE `menu_id` = 2300;

UPDATE `pigxx`.`sys_menu` SET `name` = '终端管理', `permission` = '', `path` = '/admin/client/index', `parent_id` = 2000, `icon` = 'icon-shouji', `sort` = 9, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:57:15', `del_flag` = '0' WHERE `menu_id` = 2400;

UPDATE `pigxx`.`sys_menu` SET `name` = '客户端新增', `permission` = 'sys_client_add', `path` = NULL, `parent_id` = 2400, `icon` = '1', `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:16', `del_flag` = '0' WHERE `menu_id` = 2401;

UPDATE `pigxx`.`sys_menu` SET `name` = '客户端修改', `permission` = 'sys_client_edit', `path` = NULL, `parent_id` = 2400, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:37:06', `update_time` = '2020-03-24 08:57:16', `del_flag` = '0' WHERE `menu_id` = 2402;

UPDATE `pigxx`.`sys_menu` SET `name` = '客户端删除', `permission` = 'sys_client_del', `path` = NULL, `parent_id` = 2400, `icon` = NULL, `sort` = NULL, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:39:16', `update_time` = '2020-03-24 08:57:17', `del_flag` = '0' WHERE `menu_id` = 2403;

UPDATE `pigxx`.`sys_menu` SET `name` = '密钥管理', `permission` = '', `path` = '/admin/social/index', `parent_id` = 2000, `icon` = 'icon-miyue', `sort` = 10, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:57:18', `del_flag` = '0' WHERE `menu_id` = 2500;

UPDATE `pigxx`.`sys_menu` SET `name` = '密钥新增', `permission` = 'sys_social_details_add', `path` = NULL, `parent_id` = 2500, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:19', `del_flag` = '0' WHERE `menu_id` = 2501;

UPDATE `pigxx`.`sys_menu` SET `name` = '密钥修改', `permission` = 'sys_social_details_edit', `path` = NULL, `parent_id` = 2500, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:19', `del_flag` = '0' WHERE `menu_id` = 2502;

UPDATE `pigxx`.`sys_menu` SET `name` = '密钥删除', `permission` = 'sys_social_details_del', `path` = NULL, `parent_id` = 2500, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:23', `del_flag` = '0' WHERE `menu_id` = 2503;

UPDATE `pigxx`.`sys_menu` SET `name` = '令牌管理', `permission` = NULL, `path` = '/admin/token/index', `parent_id` = 2000, `icon` = 'icon-denglvlingpai', `sort` = 11, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-04 05:58:41', `update_time` = '2020-03-24 08:57:24', `del_flag` = '0' WHERE `menu_id` = 2600;

UPDATE `pigxx`.`sys_menu` SET `name` = '令牌删除', `permission` = 'sys_token_del', `path` = NULL, `parent_id` = 2600, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-09-04 05:59:50', `update_time` = '2020-03-24 08:57:24', `del_flag` = '0' WHERE `menu_id` = 2601;

UPDATE `pigxx`.`sys_menu` SET `name` = '动态路由', `permission` = NULL, `path` = '/admin/route/index', `parent_id` = 2000, `icon` = 'icon-luyou', `sort` = 12, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-04 05:58:41', `update_time` = '2020-03-24 08:57:25', `del_flag` = '0' WHERE `menu_id` = 2700;

UPDATE `pigxx`.`sys_menu` SET `name` = 'Quartz管理', `permission` = '', `path` = '/daemon/job-manage/index', `parent_id` = 2000, `icon` = 'icon-guanwangfangwen', `sort` = 8, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:57:26', `del_flag` = '0' WHERE `menu_id` = 2800;

UPDATE `pigxx`.`sys_menu` SET `name` = '任务新增', `permission` = 'job_sys_job_add', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:26', `del_flag` = '0' WHERE `menu_id` = 2810;

UPDATE `pigxx`.`sys_menu` SET `name` = '任务修改', `permission` = 'job_sys_job_edit', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:27', `del_flag` = '0' WHERE `menu_id` = 2820;

UPDATE `pigxx`.`sys_menu` SET `name` = '任务删除', `permission` = 'job_sys_job_del', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:28', `del_flag` = '0' WHERE `menu_id` = 2830;

UPDATE `pigxx`.`sys_menu` SET `name` = '任务暂停', `permission` = 'job_sys_job_shutdown_job', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:28', `del_flag` = '0' WHERE `menu_id` = 2840;

UPDATE `pigxx`.`sys_menu` SET `name` = '任务开始', `permission` = 'job_sys_job_start_job', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:29', `del_flag` = '0' WHERE `menu_id` = 2850;

UPDATE `pigxx`.`sys_menu` SET `name` = '任务刷新', `permission` = 'job_sys_job_refresh_job', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:30', `del_flag` = '0' WHERE `menu_id` = 2860;

UPDATE `pigxx`.`sys_menu` SET `name` = '执行任务', `permission` = 'job_sys_job_run_job', `path` = NULL, `parent_id` = 2800, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2019-08-08 15:35:18', `update_time` = '2020-03-24 08:57:31', `del_flag` = '0' WHERE `menu_id` = 2870;

UPDATE `pigxx`.`sys_menu` SET `name` = '系统监控', `permission` = NULL, `path` = '/daemon', `parent_id` = -1, `icon` = 'icon-msnui-supervise', `sort` = 2, `keep_alive` = '0', `type` = '0', `create_time` = '2018-07-27 01:13:21', `update_time` = '2020-03-24 08:57:31', `del_flag` = '0' WHERE `menu_id` = 3000;

UPDATE `pigxx`.`sys_menu` SET `name` = '服务监控', `permission` = NULL, `path` = 'http://127.0.0.1:5001', `parent_id` = 3000, `icon` = 'icon-server', `sort` = 0, `keep_alive` = '0', `type` = '0', `create_time` = '2018-06-26 10:50:32', `update_time` = '2020-03-24 08:57:32', `del_flag` = '0' WHERE `menu_id` = 3100;

UPDATE `pigxx`.`sys_menu` SET `name` = '缓存监控', `permission` = NULL, `path` = '/monitor/redis/index', `parent_id` = 3000, `icon` = 'icon-qingchuhuancun', `sort` = 1, `keep_alive` = '1', `type` = '0', `create_time` = '2019-05-08 23:51:27', `update_time` = '2020-03-24 08:57:33', `del_flag` = '0' WHERE `menu_id` = 3110;

UPDATE `pigxx`.`sys_menu` SET `name` = '接口文档', `permission` = NULL, `path` = 'http://127.0.0.1:9999/swagger-ui.html', `parent_id` = 3000, `icon` = 'icon-wendang', `sort` = 1, `keep_alive` = '0', `type` = '0', `create_time` = '2018-06-26 10:50:32', `update_time` = '2020-03-24 08:57:34', `del_flag` = '0' WHERE `menu_id` = 3200;

UPDATE `pigxx`.`sys_menu` SET `name` = '事务监控', `permission` = NULL, `path` = '/tx/index', `parent_id` = 3000, `icon` = 'icon-gtsquanjushiwufuwuGTS', `sort` = 5, `keep_alive` = '0', `type` = '0', `create_time` = '2018-08-19 11:02:39', `update_time` = '2020-03-24 08:57:34', `del_flag` = '0' WHERE `menu_id` = 3300;

UPDATE `pigxx`.`sys_menu` SET `name` = '在线事务', `permission` = NULL, `path` = '/tx/model', `parent_id` = 3000, `icon` = 'icon-online', `sort` = 6, `keep_alive` = '0', `type` = '0', `create_time` = '2018-08-19 11:32:04', `update_time` = '2020-03-24 08:57:35', `del_flag` = '0' WHERE `menu_id` = 3400;

UPDATE `pigxx`.`sys_menu` SET `name` = '文档扩展', `permission` = NULL, `path` = 'http://127.0.0.1:9999/doc.html', `parent_id` = 3000, `icon` = 'icon-wendang', `sort` = 2, `keep_alive` = '0', `type` = '0', `create_time` = '2018-06-26 10:50:32', `update_time` = '2020-03-24 08:57:36', `del_flag` = '0' WHERE `menu_id` = 3500;

UPDATE `pigxx`.`sys_menu` SET `name` = 'Quartz日志', `permission` = '', `path` = '/daemon/job-log/index', `parent_id` = 3000, `icon` = 'icon-gtsquanjushiwufuwuGTS', `sort` = 8, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:57:37', `del_flag` = '0' WHERE `menu_id` = 3600;

UPDATE `pigxx`.`sys_menu` SET `name` = '注册配置', `permission` = NULL, `path` = '', `parent_id` = 3000, `icon` = 'icon-line', `sort` = 10, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-25 11:08:52', `update_time` = '2020-03-24 08:57:37', `del_flag` = '1' WHERE `menu_id` = 3700;

UPDATE `pigxx`.`sys_menu` SET `name` = '协同管理', `permission` = NULL, `path` = '/activti', `parent_id` = -1, `icon` = 'icon-kuaisugongzuoliu_o', `sort` = 3, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-26 01:38:13', `update_time` = '2020-03-24 08:57:39', `del_flag` = '0' WHERE `menu_id` = 4000;

UPDATE `pigxx`.`sys_menu` SET `name` = '模型管理', `permission` = NULL, `path` = '/activiti/index', `parent_id` = 4000, `icon` = 'icon-weibiaoti13', `sort` = 1, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-26 01:39:07', `update_time` = '2020-03-24 08:57:40', `del_flag` = '0' WHERE `menu_id` = 4100;

UPDATE `pigxx`.`sys_menu` SET `name` = '模型管理', `permission` = 'act_model_manage', `path` = NULL, `parent_id` = 4100, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:41', `del_flag` = '0' WHERE `menu_id` = 4101;

UPDATE `pigxx`.`sys_menu` SET `name` = '流程管理', `permission` = '/activiti/process', `path` = '/activiti/process', `parent_id` = 4000, `icon` = 'icon-liucheng', `sort` = 2, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-26 06:41:05', `update_time` = '2020-03-24 08:57:42', `del_flag` = '0' WHERE `menu_id` = 4200;

UPDATE `pigxx`.`sys_menu` SET `name` = '流程管理', `permission` = 'act_process_manage', `path` = NULL, `parent_id` = 4200, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:42', `del_flag` = '0' WHERE `menu_id` = 4201;

UPDATE `pigxx`.`sys_menu` SET `name` = '请假管理', `permission` = '/activiti/leave', `path` = '/activiti/leave', `parent_id` = 4000, `icon` = 'icon-qingjia', `sort` = 3, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:57:43', `del_flag` = '0' WHERE `menu_id` = 4300;

UPDATE `pigxx`.`sys_menu` SET `name` = '请假新增', `permission` = 'act_leavebill_add', `path` = NULL, `parent_id` = 4300, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:44', `del_flag` = '0' WHERE `menu_id` = 4301;

UPDATE `pigxx`.`sys_menu` SET `name` = '请假修改', `permission` = 'act_leavebill_edit', `path` = NULL, `parent_id` = 4300, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:45', `del_flag` = '0' WHERE `menu_id` = 4302;

UPDATE `pigxx`.`sys_menu` SET `name` = '请假删除', `permission` = 'act_leavebill_del', `path` = NULL, `parent_id` = 4300, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:46', `del_flag` = '0' WHERE `menu_id` = 4303;

UPDATE `pigxx`.`sys_menu` SET `name` = '待办任务', `permission` = '/activiti/task', `path` = '/activiti/task', `parent_id` = 4000, `icon` = 'icon-renwu', `sort` = 4, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-27 09:52:31', `update_time` = '2020-03-24 08:57:48', `del_flag` = '0' WHERE `menu_id` = 4400;

UPDATE `pigxx`.`sys_menu` SET `name` = '流程管理', `permission` = 'act_task_manage', `path` = NULL, `parent_id` = 4400, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:57:50', `del_flag` = '0' WHERE `menu_id` = 4401;

UPDATE `pigxx`.`sys_menu` SET `name` = '支付管理', `permission` = NULL, `path` = '/pay', `parent_id` = -1, `icon` = 'icon-pay6zhifu', `sort` = 4, `keep_alive` = '1', `type` = '0', `create_time` = '2019-05-30 15:28:03', `update_time` = '2020-03-24 08:57:51', `del_flag` = '0' WHERE `menu_id` = 5000;

UPDATE `pigxx`.`sys_menu` SET `name` = '渠道管理', `permission` = NULL, `path` = '/pay/paychannel/index', `parent_id` = 5000, `icon` = 'icon-zhifuqudaoguanli', `sort` = 1, `keep_alive` = '1', `type` = '0', `create_time` = '2019-05-30 15:32:17', `update_time` = '2020-03-24 08:57:52', `del_flag` = '0' WHERE `menu_id` = 5100;

UPDATE `pigxx`.`sys_menu` SET `name` = '增加渠道', `permission` = 'pay_paychannel_add', `path` = NULL, `parent_id` = 5100, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-05-30 15:46:14', `update_time` = '2020-03-24 08:58:07', `del_flag` = '0' WHERE `menu_id` = 5110;

UPDATE `pigxx`.`sys_menu` SET `name` = '编辑渠道', `permission` = 'pay_paychannel_edit', `path` = NULL, `parent_id` = 5100, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-05-30 15:46:35', `update_time` = '2020-03-24 08:58:08', `del_flag` = '0' WHERE `menu_id` = 5120;

UPDATE `pigxx`.`sys_menu` SET `name` = '删除渠道', `permission` = 'pay_paychannel_del', `path` = NULL, `parent_id` = 5100, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-05-30 15:47:08', `update_time` = '2020-03-24 08:58:09', `del_flag` = '0' WHERE `menu_id` = 5130;

UPDATE `pigxx`.`sys_menu` SET `name` = '收银台', `permission` = NULL, `path` = '/pay/cd/index', `parent_id` = 5000, `icon` = 'icon-shouyintai', `sort` = 0, `keep_alive` = '1', `type` = '0', `create_time` = '2019-05-30 19:44:00', `update_time` = '2020-03-24 08:58:09', `del_flag` = '0' WHERE `menu_id` = 5200;

UPDATE `pigxx`.`sys_menu` SET `name` = '商品订单', `permission` = '', `path` = '/pay/goods/index', `parent_id` = 5000, `icon` = 'icon-dingdan', `sort` = 2, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:10', `del_flag` = '0' WHERE `menu_id` = 5300;

UPDATE `pigxx`.`sys_menu` SET `name` = '商品订单新增', `permission` = 'generator_paygoodsorder_add', `path` = NULL, `parent_id` = 5300, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:11', `del_flag` = '0' WHERE `menu_id` = 5310;

UPDATE `pigxx`.`sys_menu` SET `name` = '商品订单修改', `permission` = 'generator_paygoodsorder_edit', `path` = NULL, `parent_id` = 5300, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:13', `del_flag` = '0' WHERE `menu_id` = 5320;

UPDATE `pigxx`.`sys_menu` SET `name` = '商品订单删除', `permission` = 'generator_paygoodsorder_del', `path` = NULL, `parent_id` = 5300, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:14', `del_flag` = '0' WHERE `menu_id` = 5330;

UPDATE `pigxx`.`sys_menu` SET `name` = '支付订单', `permission` = '', `path` = '/pay/orders/index', `parent_id` = 5000, `icon` = 'icon-zhifu', `sort` = 3, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:14', `del_flag` = '0' WHERE `menu_id` = 5400;

UPDATE `pigxx`.`sys_menu` SET `name` = '支付订单新增', `permission` = 'generator_paytradeorder_add', `path` = NULL, `parent_id` = 5400, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:15', `del_flag` = '0' WHERE `menu_id` = 5410;

UPDATE `pigxx`.`sys_menu` SET `name` = '支付订单修改', `permission` = 'generator_paytradeorder_edit', `path` = NULL, `parent_id` = 5400, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:16', `del_flag` = '0' WHERE `menu_id` = 5420;

UPDATE `pigxx`.`sys_menu` SET `name` = '支付订单删除', `permission` = 'generator_paytradeorder_del', `path` = NULL, `parent_id` = 5400, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:18', `del_flag` = '0' WHERE `menu_id` = 5430;

UPDATE `pigxx`.`sys_menu` SET `name` = '回调记录', `permission` = '', `path` = '/pay/notify/index', `parent_id` = 5000, `icon` = 'icon-huitiao', `sort` = 4, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:19', `del_flag` = '0' WHERE `menu_id` = 5500;

UPDATE `pigxx`.`sys_menu` SET `name` = '记录新增', `permission` = 'generator_paynotifyrecord_add', `path` = NULL, `parent_id` = 5500, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:19', `del_flag` = '0' WHERE `menu_id` = 5510;

UPDATE `pigxx`.`sys_menu` SET `name` = '记录修改', `permission` = 'generator_paynotifyrecord_edit', `path` = NULL, `parent_id` = 5500, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:20', `del_flag` = '0' WHERE `menu_id` = 5520;

UPDATE `pigxx`.`sys_menu` SET `name` = '记录删除', `permission` = 'generator_paynotifyrecord_del', `path` = NULL, `parent_id` = 5500, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:21', `del_flag` = '0' WHERE `menu_id` = 5530;

UPDATE `pigxx`.`sys_menu` SET `name` = '微信管理', `permission` = NULL, `path` = '/mp', `parent_id` = -1, `icon` = 'icon-gongzhonghao', `sort` = 4, `keep_alive` = '0', `type` = '0', `create_time` = '2018-09-26 01:38:13', `update_time` = '2020-03-24 08:58:21', `del_flag` = '0' WHERE `menu_id` = 6000;

UPDATE `pigxx`.`sys_menu` SET `name` = '账号管理', `permission` = '', `path` = '/mp/wxaccount/index', `parent_id` = 6000, `icon` = 'icon-weixincaidan', `sort` = 8, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:22', `del_flag` = '0' WHERE `menu_id` = 6100;

UPDATE `pigxx`.`sys_menu` SET `name` = '公众号新增', `permission` = 'mp_wxaccount_add', `path` = '', `parent_id` = 6100, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:23', `del_flag` = '0' WHERE `menu_id` = 6101;

UPDATE `pigxx`.`sys_menu` SET `name` = '公众号修改', `permission` = 'mp_wxaccount_edit', `path` = NULL, `parent_id` = 6100, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:23', `del_flag` = '0' WHERE `menu_id` = 6102;

UPDATE `pigxx`.`sys_menu` SET `name` = '公众号删除', `permission` = 'mp_wxaccount_del', `path` = NULL, `parent_id` = 6100, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:25', `del_flag` = '0' WHERE `menu_id` = 6103;

UPDATE `pigxx`.`sys_menu` SET `name` = '粉丝管理', `permission` = '', `path` = '/mp/wxaccountfans/index', `parent_id` = 6000, `icon` = 'icon-fensiguanli', `sort` = 8, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:26', `del_flag` = '0' WHERE `menu_id` = 6200;

UPDATE `pigxx`.`sys_menu` SET `name` = '粉丝新增', `permission` = 'mp_wxaccountfans_add', `path` = NULL, `parent_id` = 6200, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:27', `del_flag` = '0' WHERE `menu_id` = 6201;

UPDATE `pigxx`.`sys_menu` SET `name` = '粉丝修改', `permission` = 'mp_wxaccountfans_edit', `path` = NULL, `parent_id` = 6200, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:30', `del_flag` = '0' WHERE `menu_id` = 6202;

UPDATE `pigxx`.`sys_menu` SET `name` = '粉丝删除', `permission` = 'mp_wxaccountfans_del', `path` = NULL, `parent_id` = 6200, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:31', `del_flag` = '0' WHERE `menu_id` = 6203;

UPDATE `pigxx`.`sys_menu` SET `name` = '消息管理', `permission` = '', `path` = '/mp/wxfansmsg/index', `parent_id` = 6000, `icon` = 'icon-xiaoxiguanli', `sort` = 8, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:31', `del_flag` = '0' WHERE `menu_id` = 6300;

UPDATE `pigxx`.`sys_menu` SET `name` = '消息新增', `permission` = 'mp_wxfansmsg_add', `path` = NULL, `parent_id` = 6300, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:32', `del_flag` = '0' WHERE `menu_id` = 6301;

UPDATE `pigxx`.`sys_menu` SET `name` = '消息修改', `permission` = 'mp_wxfansmsg_edit', `path` = NULL, `parent_id` = 6300, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:33', `del_flag` = '0' WHERE `menu_id` = 6302;

UPDATE `pigxx`.`sys_menu` SET `name` = '消息删除', `permission` = 'mp_wxfansmsg_del', `path` = NULL, `parent_id` = 6300, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:33', `del_flag` = '0' WHERE `menu_id` = 6303;

UPDATE `pigxx`.`sys_menu` SET `name` = '消息回复', `permission` = 'mp_wxfansmsgres_add', `path` = NULL, `parent_id` = 6300, `icon` = '1', `sort` = 3, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:37', `del_flag` = '0' WHERE `menu_id` = 6304;

UPDATE `pigxx`.`sys_menu` SET `name` = '回复删除', `permission` = 'mp_wxfansmsgres_del', `path` = NULL, `parent_id` = 6300, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-03-28 22:53:49', `update_time` = '2020-03-24 08:58:35', `del_flag` = '0' WHERE `menu_id` = 6305;

UPDATE `pigxx`.`sys_menu` SET `name` = '菜单设置', `permission` = NULL, `path` = '/mp/wxmenu/index', `parent_id` = 6000, `icon` = 'icon-anniu_weixincaidanlianjie', `sort` = 6, `keep_alive` = '1', `type` = '0', `create_time` = '2019-03-29 15:20:12', `update_time` = '2020-03-24 08:58:38', `del_flag` = '0' WHERE `menu_id` = 6400;

UPDATE `pigxx`.`sys_menu` SET `name` = '保存', `permission` = 'mp_wxmenu_add', `path` = NULL, `parent_id` = 6400, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-03-29 15:43:22', `update_time` = '2020-03-24 08:58:38', `del_flag` = '0' WHERE `menu_id` = 6401;

UPDATE `pigxx`.`sys_menu` SET `name` = '发布', `permission` = 'mp_wxmenu_push', `path` = NULL, `parent_id` = 6400, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-03-29 15:43:54', `update_time` = '2020-03-24 08:58:39', `del_flag` = '0' WHERE `menu_id` = 6402;

UPDATE `pigxx`.`sys_menu` SET `name` = '运营数据', `permission` = NULL, `path` = '/mp/wxstatistics/index', `parent_id` = 6000, `icon` = 'icon-zhexiantu', `sort` = 7, `keep_alive` = '1', `type` = '0', `create_time` = '2019-04-14 00:15:35', `update_time` = '2020-03-24 08:58:40', `del_flag` = '0' WHERE `menu_id` = 6500;

UPDATE `pigxx`.`sys_menu` SET `name` = '文件管理', `permission` = NULL, `path` = '/admin/file/index', `parent_id` = 2000, `icon` = 'icon-wenjianguanli', `sort` = 6, `keep_alive` = '1', `type` = '0', `create_time` = '2019-06-25 12:44:46', `update_time` = '2020-03-24 08:58:41', `del_flag` = '0' WHERE `menu_id` = 10000;

UPDATE `pigxx`.`sys_menu` SET `name` = '删除文件', `permission` = 'sys_file_del', `path` = NULL, `parent_id` = 10000, `icon` = NULL, `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2019-06-25 13:41:41', `update_time` = '2020-03-24 08:58:42', `del_flag` = '0' WHERE `menu_id` = 10001;

UPDATE `pigxx`.`sys_menu` SET `name` = '表单管理', `permission` = '', `path` = '/gen/form', `parent_id` = 10006, `icon` = 'icon-record', `sort` = 3, `keep_alive` = '0', `type` = '0', `create_time` = '2018-01-20 13:17:19', `update_time` = '2020-03-24 08:58:44', `del_flag` = '0' WHERE `menu_id` = 10002;

UPDATE `pigxx`.`sys_menu` SET `name` = '表单新增', `permission` = 'gen_form_add', `path` = NULL, `parent_id` = 10002, `icon` = '1', `sort` = 0, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:45', `del_flag` = '0' WHERE `menu_id` = 10003;

UPDATE `pigxx`.`sys_menu` SET `name` = '表单修改', `permission` = 'gen_form_edit', `path` = NULL, `parent_id` = 10002, `icon` = '1', `sort` = 1, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:46', `del_flag` = '0' WHERE `menu_id` = 10004;

UPDATE `pigxx`.`sys_menu` SET `name` = '表单删除', `permission` = 'gen_form_del', `path` = NULL, `parent_id` = 10002, `icon` = '1', `sort` = 2, `keep_alive` = '0', `type` = '1', `create_time` = '2018-05-15 21:35:18', `update_time` = '2020-03-24 08:58:47', `del_flag` = '0' WHERE `menu_id` = 10005;

UPDATE `pigxx`.`sys_menu` SET `name` = '开发平台', `permission` = NULL, `path` = '/gen', `parent_id` = -1, `icon` = 'icon-shejiyukaifa-', `sort` = 9, `keep_alive` = '1', `type` = '0', `create_time` = '2019-08-12 09:35:16', `update_time` = '2020-03-24 08:58:48', `del_flag` = '0' WHERE `menu_id` = 10006;

UPDATE `pigxx`.`sys_menu` SET `name` = '数据源管理', `permission` = NULL, `path` = '/gen/datasource', `parent_id` = 10006, `icon` = 'icon-mysql', `sort` = 0, `keep_alive` = '1', `type` = '0', `create_time` = '2019-08-12 09:42:11', `update_time` = '2020-03-24 08:58:49', `del_flag` = '0' WHERE `menu_id` = 10007;

UPDATE `pigxx`.`sys_menu` SET `name` = '表单设计', `permission` = NULL, `path` = '/gen/design', `parent_id` = 10006, `icon` = 'icon-biaodanbiaoqian', `sort` = 2, `keep_alive` = '1', `type` = '0', `create_time` = '2019-08-16 10:08:56', `update_time` = '2020-03-24 08:58:53', `del_flag` = '0' WHERE `menu_id` = 10008;

DELETE FROM `pigxx`.`sys_menu` WHERE `menu_id` = 3601;

DELETE FROM `pigxx`.`sys_menu` WHERE `menu_id` = 3620;

DELETE FROM `pigxx`.`sys_menu` WHERE `menu_id` = 3630;

DELETE FROM `pigxx`.`sys_menu` WHERE `menu_id` = 3631;

DELETE FROM `pigxx`.`sys_role_menu` WHERE `role_id` = 1 AND `menu_id` = 3601;

DELETE FROM `pigxx`.`sys_role_menu` WHERE `role_id` = 1 AND `menu_id` = 3620;

DELETE FROM `pigxx`.`sys_role_menu` WHERE `role_id` = 1 AND `menu_id` = 3630;

DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
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
  `del_flag` char(1) DEFAULT '0',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_details` VALUES (1, 'app', NULL, 'app', 'server', 'password,refresh_token,authorization_code,client_credentials,implicit', NULL, NULL, 43200, 2592001, NULL, 'true', '0', 1);
INSERT INTO `sys_oauth_client_details` VALUES (2, 'daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', '0', 1);
INSERT INTO `sys_oauth_client_details` VALUES (3, 'gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', '0', 1);
INSERT INTO `sys_oauth_client_details` VALUES (4, 'mp', NULL, 'mp', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', '0', 1);
INSERT INTO `sys_oauth_client_details` VALUES (5, 'pig', NULL, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login,http://localhost:8080/renren-admin/sys/oauth2-sso,http://localhost:8090/sys/oauth2-sso', NULL, NULL, NULL, NULL, 'false', '0', 1);
INSERT INTO `sys_oauth_client_details` VALUES (6, 'test', NULL, 'test', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', '0', 1);
COMMIT;


DROP TABLE `pigxx_job`.`job_execution_log`;

DROP TABLE `pigxx_job`.`job_status_trace_log`;
