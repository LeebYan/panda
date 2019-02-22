package com.pig4cloud.pigx.zipkin;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.context.annotation.Bean;
import zipkin.storage.mysql.MySQLStorage;
import zipkin2.server.internal.EnableZipkinServer;

import javax.sql.DataSource;

/**
 * 服务链路追踪
 *
 * @author: 仙(๑ • ㅂ • ́)و✧酱
 * @date: 2019/2/22
 */
@SpringCloudApplication
@EnableZipkinServer
public class PigxZipkinApplication {
	public static void main(String[] args) {
		SpringApplication.run(PigxZipkinApplication.class, args);
	}

	@Bean
	public MySQLStorage mySQLStorage(DataSource datasource) {
		return MySQLStorage.builder().datasource(datasource).executor(Runnable::run).build();
	}

}
