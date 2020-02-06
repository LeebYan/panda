## 使用说明
```
本模块是pigx-codegen的重写版本，使用dynamic-datasource实现，去除pigx-common-datasource依赖，功能未做扩展。
```
### pigx-code-dev.yml
```
## spring security 配置
security:
  oauth2:
    client:
      client-id: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)
      client-secret: ENC(gPFcUOmJm8WqM3k3eSqS0Q==)
      scope: server
  resources:
    static-locations: classpath:/static/,classpath:/views/

# 数据源
spring:
  datasource:
    dynamic:
      username: ${MYSQL-USER:root}
      password: ${MYSQL-USER:root}
      url: jdbc:mysql://${MYSQL-HOST:pigx-mysql}:${MYSQL-PORT:3306}/pigxx_codegen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true
      driverClassName: com.mysql.cj.jdbc.Driver
      sql: select * from gen_datasource_conf


pigx:
  tenant:
    column: tenant_id
    tables:
      - sys_datasource_conf
```
### 示例中的pigxx_codegen数据库及sql说明
```
pigxx_codegen数据库中gen_datasource_conf表必须存在一个name为master的数据库连接配置

INSERT INTO `gen_datasource_conf` VALUES ('8', 'master', 'jdbc:mysql://pigx-mysql:3306/pigxx_codegen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true', 'root', 'ZkxR9PxP6sWvasdc9CG9Ww==', '2019-09-18 09:44:55', '2019-12-17 17:07:17', '0', null);
```
### 修改菜单的url
```
开发平台菜单下的/gen全部改为/code
如 /gen/datasource 改为 /code/datasource
```
### 修改动态路由
```
{
    "routeId": "pigx-codegen",
    "routeName": "代码生成模块",
    "predicates": [
      {
        "args": {
          "_genkey_0": "/gen/**"
        },
        "name": "Path"
      }
    ],
    "filters": [],
    "uri": "lb://pigx-codegen",
    "order": 0,
    "createTime": "2019-10-16 16:44:41",
    "updateTime": "2019-11-05 22:36:58",
    "delFlag": "0"
  },
改为
{
    "routeId": "pigx-code",
    "routeName": "多数据源代码生成模块",
    "predicates": [
      {
        "args": {
          "_genkey_0": "/code/**"
        },
        "name": "Path"
      }
    ],
    "filters": [],
    "uri": "lb://pigx-code",
    "order": 0,
    "createTime": "2019-10-16 16:44:41",
    "updateTime": "2019-11-05 22:36:58",
    "delFlag": "0"
  },
```
### yml配置文件切换数据源
```
请参考：https://git.pig4cloud.com/pigx/pigx/src/liuyes_dev/pigx-visual/pigx-dynamic-datasource
```
### 联系我
QQ：55215085