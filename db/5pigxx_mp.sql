USE pigxx_mp;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wx_account
-- ----------------------------
DROP TABLE IF EXISTS `wx_account`;
CREATE TABLE `wx_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `appid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `appsecret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aeskey` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qr_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公众号账户表';

-- ----------------------------
-- Records of wx_account
-- ----------------------------
BEGIN;
INSERT INTO `pay_channel` VALUES (1, NULL, 'ALIPAY_WAP', 'WAP', '2016102000727659', '0', '{\n    \"privateKey\":\"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCkejVpiLJlece9KLb8gG/+WODkpe5SRfr65n3aUAvRPoouDUp/URBAtt24mzHFdGkaU/Il7ZxG7KUjLaFNTfq8t/bHEF7HBt7MZidpEjVaDxeG/hkA+xc+X2ePAJXVhy7v1tH+XRrxuggTj+d4q7vVGD7r1mtgX4d5hK9TTKnyhO6IUcthPOUSn07wx+5wlbv4/51ggj4Ku4AWCGaCWiebDFy4VZ/FmOMP5u3O7TocCGSy5UtaFZaVMM1nH603DG6NJ8fG+zKum9IvrdQMMmBWPT8rpy0U9ztchcd+0gTNrTfE/NOCgl/RF6z7Qic7NiTKjLxkGRq73XPzfJx0hyfpAgMBAAECggEAa2/sndAN/90JjNUgmlVnUnRKCvEceJ9/rw6KXOV2oqrAZg6GgB26iRsqP6EYZMuCsBDvlrjcITQJNq5is/Vg+I8OYr+duVISjN+ZlLexI+/BxYsLWCmr6DE3myCdvwn7rezb5NR6ejWzetvALoG3Qx4AU9sO7rfX7ZevUrE8Pc5pa/rTCHOIec9P7Hfm4xrXd0DPmbAwFvUQ4spcC9xjcBhLJ3tfmkoEU11jC6Y/J7N0/TZZxqNC+HcYftSNEmbO3vxYfz/9mbabx7Uzp8xs4qHPJACmaP5tcWOCf1qJVOwP53Cd3H9J9Be9cAvlxKfT48s1ghoxLn7QB27p0UwntQKBgQDzTpCCFDoUH328B3iGTkwZq24DOUh5ZwhMG6VIFPLHwJYK6HVM473SX0nJWkbiBYFG4WiQWUZnOhz/qjTH1vvE/nzJwQ79zZahren2b8XulXKM6S/mafiBAHKl/FArcr14iAWkh+scZKWFKrNf6Hp8rQ6zu0fWdwzUOlaQFaSnTwKBgQCtDtpIagRPyNj0J39uMRJqsaY0TdJ53TD4bflf5UiFhNFH2Dikgw/uX8Pom2qtIvf3xnO2bzmJW2+OSkF7U0fL+UXkAaBHW+7YVcs8pWARSd5LWBXGWysV2wUALwynZSdwtgpgrzMQnuzklQ3hNR9LBSEGN7yJwkU83ZRWPzbvRwKBgQDU3E8g/oExSbu+3Opc1fNOIeTFfUAitjlUHHulbG5aw+qA8I5vDm/rtOHg/tI0u4w2bs4EO5aUiQsFwesbSsJJvjt+ZyCue0blfDnMGE2aRbVKAlidxOhcNAAZp3ycBm4tHROStjbDSGpm7syvg7xlhyHtrFNVFiJrKf7BX64FkQKBgCA8lAzJMuRp1YAlm2c7XOLjFMLJfFuXCHg+hCWI4Gl+xD1N2b9LarxMuoGp8cUurmJJZWSmc2FS1wT6cBg4+zbTyGEgrGqehW9nC+TQKYUO7Ym7btL0SKJZmiTenszP2vjz8Bryh+CguiAaY+t/qcSfv/cYitZeiec8n1UxkVohAoGAa8YwnzkEGBgz0TpdrGFxVBCqMIriMH4PQs2tWZ1nEBk6A7GrODRcRL0FQnRpHyf3mY5N/iEiNQ5GhQ5p1lifTvolTkVkdHpTGFhVfnYegaEAOznigi7dWJPoYlloN36AROxirGJKRIm+Od2bsybM/dNPJfoTDBDPFWGBH/klEBs=\",\n    \"publicKey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuPkP2VJMR6vWCX8RwSFqNIa3klCdvRFJbuS1PN1anzQeeL9eOwtU7kGdI85yxb0dcdPzOYlG+jf9go8W9hBlgjxSRoXxLx03Yfl7cLmzJO9l9vIM1+HmNF0Ctm+el4Yi9dGs/P6q7lcHPUqs/RXGfeLrg33GMVwJbLmRcDZYeIcqPAA1OVF/4SHYr+f+O7glDOd60z+veOOexyoHmvUzYWlEz5+R4kOCNM/Z0w7KGgEYvHbZopexuTuFgUWy/9tYlNrnX+cZUWXVTskLUgD1UGWM1dS5+qfriqY9MPEwJjetcPJkoCK7A4IReE4q1DffUY9KS50/1ML+7na3R/p/UQIDAQAB\",\n    \"serviceUrl\":\"https://openapi.alipaydev.com/gateway.do\"\n}', '111111/11111', '0', '2019-06-19 03:01:21', '2019-06-19 03:01:21', 1, '2016102000727659');
INSERT INTO `pay_channel` VALUES (2, NULL, 'WEIXIN_MP', 'WEIXIN_MP', '1517442541', '0', '{\n\"secret\":\"a6025f38ce4a3115e53bf7980c761f48\",\n\"token\":\"oat\",\n\"paternerKey\":\"4054e1e1f4f1decc0055acbbe04a70ae\",\n\"subMchId\":\"1531309091\"\n}', '', '0', '2019-06-19 03:59:18', '2019-06-19 08:02:34', 1, 'wx35c5d0711cbdcd01');
COMMIT;

-- ----------------------------
-- Table structure for wx_account_fans
-- ----------------------------
DROP TABLE IF EXISTS `wx_account_fans`;
CREATE TABLE `wx_account_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subscribe_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `subscribe_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `language` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `headimg_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx_account_id` int(11) DEFAULT NULL COMMENT '微信公众号ID',
  `wx_account_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx_account_appid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_1` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='微信公众号粉丝表';

-- ----------------------------
-- Table structure for wx_fans_msg
-- ----------------------------
DROP TABLE IF EXISTS `wx_fans_msg`;
CREATE TABLE `wx_fans_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `headimg_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx_account_appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx_account_id` int(11) DEFAULT NULL COMMENT '微信账号ID',
  `msg_id` bigint(20) DEFAULT NULL COMMENT '消息ID',
  `msg_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `res_content` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_res` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `media_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pic_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pic_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='粉丝消息表 ';

-- ----------------------------
-- Table structure for wx_fans_msg_res
-- ----------------------------
DROP TABLE IF EXISTS `wx_fans_msg_res`;
CREATE TABLE `wx_fans_msg_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fans_msg_id` int(11) DEFAULT NULL COMMENT '粉丝消息ID',
  `res_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='回复粉丝消息历史表 ';

-- ----------------------------
-- Table structure for wx_mp_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_menu`;
CREATE TABLE `wx_mp_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu` json DEFAULT NULL COMMENT '菜单',
  `wx_account_id` int(11) DEFAULT NULL,
  `wx_account_appid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx_account_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户ID',
  `pub_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='微信菜单表';

SET FOREIGN_KEY_CHECKS = 1;