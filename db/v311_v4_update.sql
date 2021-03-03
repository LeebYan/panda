BEGIN;
-- 配置中心

SET FOREIGN_KEY_CHECKS = 0;

UPDATE `pigxx_config`.`config_info` SET `data_id` = 'application-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = '# 配置文件加密根密码\njasypt:\n  encryptor:\n    password: pigx\n    algorithm: PBEWithMD5AndDES\n    iv-generator-classname: org.jasypt.iv.NoIvGenerator\n\nspring:\n  autoconfigure:\n    exclude: org.springframework.cloud.netflix.ribbon.RibbonAutoConfiguration  #非常重要 sca 兼容sc2020 重要配置\n  redis:\n    host: pigx-redis\n  servlet:\n    multipart:\n      max-file-size: 100MB\n      max-request-size: 100MB\n  cloud:\n    sentinel:\n      eager: true\n      filter:\n        url-patterns: /** \n      transport:\n        dashboard: pigx-sentinel:5020\n\n# 端点对外暴露          \nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\n# feign 相关配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 20000\n        readTimeout: 20000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n#开启灰度\ngray:\n  rule:\n    enabled: true\n\n# mybatis-plus 配置\nmybatis-plus:\n  tenant-enable: ture\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      field-strategy: NOT_EMPTY\n  type-handlers-package:  com.pig4cloud.pigx.common.data.handler\n\n# swagger 全局配置\nswagger:\n  title: PigX Swagger API\n  license: Powered By PigX\n  licenseUrl: https://pig4cloud.com/\n  terms-of-service-url: https://pig4cloud.com/\n  contact:\n    email: wangiegie@gmail.com\n    url: https://pig4cloud.com/about.html\n  authorization:\n    name: oauth2\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:pigx-gateway}:${GATEWAY_PORT:9999}/auth/oauth/token\n\n# oauth2 资源服务器相关配置\nsecurity:\n  oauth2:\n    client:\n      ignore-urls:\n        - /error\n        - /actuator/**\n        - /v2/api-docs\n    resource:\n      loadBalanced: true\n      token-info-uri: http://pigx-auth/oauth/check_token', `md5` = 'ef961ab96720fb8091f6e20758e8c6fd', `gmt_create` = '2019-04-18 02:10:20', `gmt_modified` = '2021-02-18 10:31:55', `src_user` = NULL, `src_ip` = '10.1.1.58', `app_name` = '', `tenant_id` = '', `c_desc` = '通用配置文件', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 1;

UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-gateway-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = 'gateway:\n  encode-key: \'pigxpigxpigxpigx\'\n\nswagger:\n  ignore-providers:\n    - pigx-auth\n    - pigx-tx-manager\n\nribbon:\n  rule:\n    gray-enabled: true\n\n# 验证码相关配置参考： http://t.cn/A647jEdu\naj:\n  captcha:\n    cache-type: redis\n    water-mark: pig4cloud', `md5` = 'c9c6c4268b5df12740d28d5aeffb49ea', `gmt_create` = '2019-04-18 02:13:52', `gmt_modified` = '2021-01-11 17:37:42', `src_user` = NULL, `src_ip` = '172.16.1.105', `app_name` = '', `tenant_id` = '', `c_desc` = '', `c_use` = '', `effect` = '', `type` = 'yaml', `c_schema` = '' WHERE `id` = 5;

UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-monitor-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(rZHA4LW5hHmhLAAzJoFNag==)     # pigx\n      password: ENC(bjeyh+Aeii3kHXkoo00ZUw==) # pigx\n  autoconfigure:\n    exclude: com.pig4cloud.pigx.common.core.config.JacksonConfig\n  boot:\n    admin:\n      ui:\n        title: \'pigx 服务状态监控\'\n        brand: \'pigx 服务状态监控\'\n        external-views:\n          - label: \"SQL监控\"\n            url: /druid/sql.html\n            order: 2000\n            iframe: true\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS  #显示详细信息\n\n\n# druid 监控的服务\nmonitor:\n  applications:\n    - pigx-upms-biz', `md5` = 'bafb4b4e1c86115d15be0bf23ec48a6c', `gmt_create` = '2019-04-18 02:14:17', `gmt_modified` = '2021-02-10 21:32:49', `src_user` = NULL, `src_ip` = '10.1.1.42', `app_name` = '', `tenant_id` = '', `c_desc` = '监控配置文件', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 6;

UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-upms-biz-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      client-secret: ENC(ltJPpR50wT0oIY9kfOe1Iw==)\n      scope: server\n      ignore-urls:\n        - /error\n        - /druid/**\n        - /actuator/**\n        - /v2/api-docs\n\n# 数据源\nspring:\n  autoconfigure:\n    exclude: org.springframework.cloud.gateway.config.GatewayAutoConfiguration,org.springframework.cloud.gateway.config.GatewayClassPathWarningAutoConfiguration\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n      stat-view-servlet:\n        enabled: true\n        allow: \"\"\n        url-pattern: /druid/*\n        #login-username: admin\n        #login-password: admin\n      filter:\n        stat:\n          enabled: true\n          log-slow-sql: true\n          slow-sql-millis: 10000\n          merge-sql: false\n        wall:\n          config:\n            multi-statement-allow: true\n\n# 文件系统 (提供测试环境，不要乱传)\noss:\n  endpoint: http://minio.pig4cloud.com\n  access-key: lengleng\n  secret-key: lengleng\n  bucket-name: lengleng\n\n# Logger Config\nlogging:\n  level:\n    com.pig4cloud.pigx.admin.mapper: debug\n\n# 租户表维护\npigx:\n  tenant:\n    column: tenant_id\n    tables:\n      - sys_user\n      - sys_role\n      - sys_menu\n      - sys_dept\n      - sys_log\n      - sys_social_details\n      - sys_dict\n      - sys_dict_item\n      - sys_public_param\n      - sys_log\n      - sys_file\n      - sys_oauth_client_details', `md5` = 'ef3968c8268783f233bec0d657dbaaab', `gmt_create` = '2019-04-18 02:32:44', `gmt_modified` = '2021-02-18 12:46:02', `src_user` = NULL, `src_ip` = '10.1.1.60', `app_name` = '', `tenant_id` = '', `c_desc` = 'admin 服务配置', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 7;

UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-pay-platform-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)\n      scope: server\n# 数据源\nspring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    druid:\n      driver-class-name: com.mysql.cj.jdbc.Driver\n      username: ${MYSQL_USER:root}\n      password: ${MYSQL_PWD:root}\n      url: jdbc:mysql://${MYSQL_HOST:pigx-mysql}:${MYSQL_PORT:3306}/${MYSQL_DB:pigxx_pay}?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/\n# 租户表维护\npigx:\n  pay:\n    test: lengleng\n    aliPayConfig:\n      expire-time: 30\n      return-url: http://pig4cloud.com\n      notify-url: http://wechat.pigx.top/pay/notify/ali/callbak\n    wxPayConfig:\n      notify-url: https://admin.pig4cloud.com/pay/notify/wx/callbak\n    mergePayConfig:\n      return-url: http://pig4cloud.com\n      notify-url: http://wechat.pigx.top/pay/notify/merge/callbak\n  xsequence:    #发号器相关配置\n    db:\n      retry-times: 3\n      table-name: pay_sequence\n  tenant:\n    column: tenant_id\n    tables:\n      - pay_channel\n      - pay_trade_order\n      - pay_goods_order\n      - pay_notify_record', `md5` = '5ae561216eef67b9fc83a2b077c0adb0', `gmt_create` = '2019-05-28 11:46:27', `gmt_modified` = '2021-01-04 22:16:41', `src_user` = NULL, `src_ip` = '10.1.1.163', `app_name` = '', `tenant_id` = '', `c_desc` = '支付模块配置', `c_use` = 'null', `effect` = 'null', `type` = 'yaml', `c_schema` = 'null' WHERE `id` = 10;

UPDATE `pigxx_config`.`config_info` SET `data_id` = 'pigx-bi-platform-dev.yml', `group_id` = 'DEFAULT_GROUP', `content` = 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(rZHA4LW5hHmhLAAzJoFNag==)     # pigx\n      password: ENC(bjeyh+Aeii3kHXkoo00ZUw==) # pigx\n      \n# ureport 报表相关设置\nureport:\n  debug: false\n  disableFileProvider: true\n  disableHttpSessionReportCache: true\n\n# oss 保存报表设计文件\noss:\n  bucket-name: lengleng\n  access-key: lengleng\n  secret-key: lengleng\n  endpoint: http://minio.pig4cloud.com', `md5` = '77e5829593e85d395aafdd88e662c036', `gmt_create` = '2020-10-15 18:18:13', `gmt_modified` = '2021-02-03 19:12:08', `src_user` = NULL, `src_ip` = '172.16.1.92', `app_name` = '', `tenant_id` = '', `c_desc` = '', `c_use` = '', `effect` = '', `type` = 'yaml', `c_schema` = '' WHERE `id` = 13;

SET FOREIGN_KEY_CHECKS = 1;

--  代码生成
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` ADD COLUMN `ds_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库类型' AFTER `tenant_id`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` ADD COLUMN `conf_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置类型' AFTER `ds_type`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` ADD COLUMN `ds_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称' AFTER `conf_type`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` ADD COLUMN `instance` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实例' AFTER `ds_name`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` ADD COLUMN `port` int NULL DEFAULT NULL COMMENT '端口' AFTER `instance`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` ADD COLUMN `host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机' AFTER `port`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `id` int NOT NULL COMMENT '主键' FIRST;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名' AFTER `id`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'jdbcurl' AFTER `name`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名' AFTER `url`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码' AFTER `username`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记' AFTER `update_date`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '租户ID' AFTER `del_flag`;

ALTER TABLE `pigxx_codegen`.`gen_datasource_conf` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT COMMENT '主键';

ALTER TABLE `pigxx_codegen`.`gen_form_conf` MODIFY COLUMN `id` int NOT NULL COMMENT 'ID' FIRST;

ALTER TABLE `pigxx_codegen`.`gen_form_conf` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '所属租户' AFTER `del_flag`;

ALTER TABLE `pigxx_codegen`.`gen_form_conf` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID';

SET FOREIGN_KEY_CHECKS=1;

-- job 更新

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pigxx_job`.`sys_job` MODIFY COLUMN `job_id` int NOT NULL COMMENT '任务id' FIRST;

ALTER TABLE `pigxx_job`.`sys_job` MODIFY COLUMN `tenant_id` int NULL DEFAULT 1 COMMENT '租户' AFTER `next_time`;

ALTER TABLE `pigxx_job`.`sys_job` MODIFY COLUMN `job_id` int NOT NULL AUTO_INCREMENT COMMENT '任务id';

ALTER TABLE `pigxx_job`.`sys_job_log` MODIFY COLUMN `job_log_id` int NOT NULL COMMENT '任务日志ID' FIRST;

ALTER TABLE `pigxx_job`.`sys_job_log` MODIFY COLUMN `job_id` int NOT NULL COMMENT '任务id' AFTER `job_log_id`;

ALTER TABLE `pigxx_job`.`sys_job_log` MODIFY COLUMN `tenant_id` int NOT NULL DEFAULT 1 COMMENT '租户id' AFTER `create_time`;

ALTER TABLE `pigxx_job`.`sys_job_log` MODIFY COLUMN `job_log_id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志ID';

ALTER TABLE `pigxx_job`.`xxl_job_group` ADD COLUMN `update_time` datetime NULL DEFAULT NULL AFTER `address_list`;

ALTER TABLE `pigxx_job`.`xxl_job_group` MODIFY COLUMN `id` int NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_group` MODIFY COLUMN `address_type` tinyint NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入' AFTER `title`;

ALTER TABLE `pigxx_job`.`xxl_job_group` MODIFY COLUMN `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行器地址列表，多地址逗号分隔' AFTER `address_type`;

ALTER TABLE `pigxx_job`.`xxl_job_group` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_job`.`xxl_job_group` DROP COLUMN `order`;

ALTER TABLE `pigxx_job`.`xxl_job_info` ADD COLUMN `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型' AFTER `alarm_email`;

ALTER TABLE `pigxx_job`.`xxl_job_info` ADD COLUMN `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型' AFTER `schedule_type`;

ALTER TABLE `pigxx_job`.`xxl_job_info` ADD COLUMN `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略' AFTER `schedule_conf`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `id` int NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `job_group` int NOT NULL COMMENT '执行器主键ID' AFTER `id`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒' AFTER `executor_block_strategy`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数' AFTER `executor_timeout`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `trigger_status` tinyint NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行' AFTER `child_jobid`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `trigger_last_time` bigint NOT NULL DEFAULT 0 COMMENT '上次调度时间' AFTER `trigger_status`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `trigger_next_time` bigint NOT NULL DEFAULT 0 COMMENT '下次调度时间' AFTER `trigger_last_time`;

ALTER TABLE `pigxx_job`.`xxl_job_info` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_job`.`xxl_job_info` DROP COLUMN `job_cron`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `id` bigint NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `job_group` int NOT NULL COMMENT '执行器主键ID' AFTER `id`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `job_id` int NOT NULL COMMENT '任务，主键ID' AFTER `job_group`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数' AFTER `executor_sharding_param`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `trigger_code` int NOT NULL COMMENT '调度-结果' AFTER `trigger_time`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `handle_code` int NOT NULL COMMENT '执行-状态' AFTER `handle_time`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `alarm_status` tinyint NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败' AFTER `handle_msg`;

ALTER TABLE `pigxx_job`.`xxl_job_log` MODIFY COLUMN `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_job`.`xxl_job_log_report` ADD COLUMN `update_time` datetime NULL DEFAULT NULL AFTER `fail_count`;

ALTER TABLE `pigxx_job`.`xxl_job_log_report` MODIFY COLUMN `id` int NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_log_report` MODIFY COLUMN `running_count` int NOT NULL DEFAULT 0 COMMENT '运行中-日志数量' AFTER `trigger_day`;

ALTER TABLE `pigxx_job`.`xxl_job_log_report` MODIFY COLUMN `suc_count` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量' AFTER `running_count`;

ALTER TABLE `pigxx_job`.`xxl_job_log_report` MODIFY COLUMN `fail_count` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量' AFTER `suc_count`;

ALTER TABLE `pigxx_job`.`xxl_job_log_report` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_job`.`xxl_job_logglue` MODIFY COLUMN `id` int NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_logglue` MODIFY COLUMN `job_id` int NOT NULL COMMENT '任务，主键ID' AFTER `id`;

ALTER TABLE `pigxx_job`.`xxl_job_logglue` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_job`.`xxl_job_registry` MODIFY COLUMN `id` int NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_registry` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_job`.`xxl_job_user` MODIFY COLUMN `id` int NOT NULL FIRST;

ALTER TABLE `pigxx_job`.`xxl_job_user` MODIFY COLUMN `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员' AFTER `password`;

ALTER TABLE `pigxx_job`.`xxl_job_user` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT;

SET FOREIGN_KEY_CHECKS=1;

-- 支付模块
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pigxx_pay`.`pay_channel` DROP INDEX `IDX_MchId_MchOrderNo`;

ALTER TABLE `pigxx_pay`.`pay_channel` ADD COLUMN `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端回调地址' AFTER `channel_mch_id`;

ALTER TABLE `pigxx_pay`.`pay_channel` ADD COLUMN `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后端回调地址' AFTER `return_url`;

ALTER TABLE `pigxx_pay`.`pay_channel` MODIFY COLUMN `id` int NOT NULL COMMENT '渠道主键ID' FIRST;

ALTER TABLE `pigxx_pay`.`pay_channel` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '租户ID' AFTER `update_time`;

ALTER TABLE `pigxx_pay`.`pay_channel` MODIFY COLUMN `id` int NOT NULL AUTO_INCREMENT COMMENT '渠道主键ID';

ALTER TABLE `pigxx_pay`.`pay_goods_order` MODIFY COLUMN `goods_order_id` int NOT NULL COMMENT '商品订单ID' FIRST;

ALTER TABLE `pigxx_pay`.`pay_goods_order` MODIFY COLUMN `status` tinyint NOT NULL DEFAULT 0 COMMENT '订单状态,订单生成(0),支付成功(1),处理完成(2),处理失败(-1)' AFTER `user_id`;

ALTER TABLE `pigxx_pay`.`pay_goods_order` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '租户ID' AFTER `update_time`;

ALTER TABLE `pigxx_pay`.`pay_goods_order` MODIFY COLUMN `goods_order_id` int NOT NULL AUTO_INCREMENT COMMENT '商品订单ID';

ALTER TABLE `pigxx_pay`.`pay_notify_record` MODIFY COLUMN `id` bigint NOT NULL COMMENT 'ID' FIRST;

ALTER TABLE `pigxx_pay`.`pay_notify_record` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '租户ID' AFTER `update_time`;

ALTER TABLE `pigxx_pay`.`pay_notify_record` MODIFY COLUMN `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID';

ALTER TABLE `pigxx_pay`.`pay_refund_order` MODIFY COLUMN `refund_amount` bigint NOT NULL COMMENT '退款金额,单位分' AFTER `pay_amount`;

ALTER TABLE `pigxx_pay`.`pay_refund_order` MODIFY COLUMN `status` tinyint NOT NULL DEFAULT 0 COMMENT '退款状态:0-订单生成,1-退款中,2-退款成功,3-退款失败,4-业务处理完成' AFTER `currency`;

ALTER TABLE `pigxx_pay`.`pay_refund_order` MODIFY COLUMN `result` tinyint NOT NULL DEFAULT 0 COMMENT '退款结果:0-不确认结果,1-等待手动处理,2-确认成功,3-确认失败' AFTER `status`;

ALTER TABLE `pigxx_pay`.`pay_refund_order` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '租户ID' AFTER `update_time`;

ALTER TABLE `pigxx_pay`.`pay_sequence` MODIFY COLUMN `id` bigint NOT NULL FIRST;

ALTER TABLE `pigxx_pay`.`pay_sequence` MODIFY COLUMN `value` bigint NOT NULL AFTER `id`;

ALTER TABLE `pigxx_pay`.`pay_sequence` MODIFY COLUMN `id` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `pigxx_pay`.`pay_trade_order` MODIFY COLUMN `notify_count` tinyint NULL DEFAULT 0 COMMENT '通知次数' AFTER `notify_url`;

ALTER TABLE `pigxx_pay`.`pay_trade_order` MODIFY COLUMN `last_notify_time` bigint NULL DEFAULT NULL COMMENT '最后一次通知时间' AFTER `notify_count`;

ALTER TABLE `pigxx_pay`.`pay_trade_order` MODIFY COLUMN `expire_time` bigint NULL DEFAULT NULL COMMENT '订单失效时间' AFTER `last_notify_time`;

ALTER TABLE `pigxx_pay`.`pay_trade_order` MODIFY COLUMN `pay_succ_time` bigint NULL DEFAULT NULL COMMENT '订单支付成功时间' AFTER `expire_time`;

ALTER TABLE `pigxx_pay`.`pay_trade_order` MODIFY COLUMN `tenant_id` int NULL DEFAULT NULL COMMENT '租户ID' AFTER `del_flag`;

SET FOREIGN_KEY_CHECKS=1;
COMMIT;