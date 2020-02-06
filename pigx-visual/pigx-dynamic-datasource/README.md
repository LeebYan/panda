## 快速入门
### 创建测试数据库
```
create database `test1` default character set utf8mb4 collate utf8mb4_general_ci;
create database `test2` default character set utf8mb4 collate utf8mb4_general_ci;
create database `test3` default character set utf8mb4 collate utf8mb4_general_ci;
```
### 创建测试表
```
   CREATE TABLE `user` (
     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
     `username` varchar(255) DEFAULT NULL COMMENT '用户名',
     `password` varchar(255) DEFAULT NULL COMMENT '密码',
     PRIMARY KEY (`id`) USING BTREE
   ) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='用户测试表';
```
### 插入测试数据
```
use test1;
BEGIN;
INSERT INTO `user` VALUES (1, 'test1测试一', '123');
INSERT INTO `user` VALUES (2, 'test1测试二', '123');
INSERT INTO `user` VALUES (3, 'test1测试三', '123');
COMMIT;
use test2;
BEGIN;
INSERT INTO `user` VALUES (1, 'test2测试一', '123');
INSERT INTO `user` VALUES (2, 'test2测试二', '123');
INSERT INTO `user` VALUES (3, 'test2测试三', '123');
COMMIT;
use test3;
BEGIN;
INSERT INTO `user` VALUES (1, 'test3测试一', '123');
INSERT INTO `user` VALUES (2, 'test3测试二', '123');
INSERT INTO `user` VALUES (3, 'test3测试三', '123');
COMMIT;
```
### Nocas新增配置
```
## pigx-dynamic-datasource-biz.yml
## spring security 配置
security:
  oauth2:
    client:
      client-id: ENC(ltJPpR50wT0oIY9kfOe1Iw==)
      client-secret: ENC(ltJPpR50wT0oIY9kfOe1Iw==)
      scope: server

# 数据源
spring:
  datasource:
    dynamic:
      primary: test1 #设置默认的数据源
      druid:
        filters: stat
      datasource:
        test1:
          username: ${MYSQL-USER:root}
          password: ${MYSQL-USER:root}
          url: jdbc:mysql://${MYSQL-HOST:pigx-mysql}:${MYSQL-PORT:3306}/test1?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true
          driver-class-name: com.mysql.cj.jdbc.Driver
        test2:
          username: ${MYSQL-USER:root}
          password: ${MYSQL-USER:root}
          url: jdbc:mysql://${MYSQL-HOST:pigx-mysql}:${MYSQL-PORT:3306}/test2?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true
          driver-class-name: com.mysql.cj.jdbc.Driver
        test3:
          username: ${MYSQL-USER:root}
          password: ${MYSQL-USER:root}
          url: jdbc:mysql://${MYSQL-HOST:pigx-mysql}:${MYSQL-PORT:3306}/test3?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true
          driver-class-name: com.mysql.cj.jdbc.Driver
```
### 启动以下应用
+ PigxNacosApplication
+ PigxSentinelApplication
+ PigxAuthApplication
+ PigxAdminApplication
+ PigxGatewayApplication
+ PigxDynamicDatasourceApplication
### Postman看效果
```
http://localhost:6060/test/getTest1
http://localhost:6060/test/getTest2?current=1&size=5
http://localhost:6060/test/getTest3?current=1&size=5
```
![test1数据库](http://i1.fuimg.com/704023/83e168e45242e135.png "test1数据库")
![test2数据库](http://i1.fuimg.com/704023/cf8c42fbc3512c32.png "test2数据库")
![test3数据库](http://i1.fuimg.com/704023/534483515e3f7cd0.png "test3数据库")
### 切换数据源
```
请参考：com/pig4cloud/pigx/dynamic/mapper/TestMapper.java
```
### 联系我
QQ：55215085