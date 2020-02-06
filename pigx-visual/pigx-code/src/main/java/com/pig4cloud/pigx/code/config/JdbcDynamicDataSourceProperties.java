package com.pig4cloud.pigx.code.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties("spring.datasource.dynamic")
public class JdbcDynamicDataSourceProperties {
	private final StringEncryptor stringEncryptor;
	private String username;
	private String password;
	private String url;
	private String driverClassName;
	private String sql;

}
