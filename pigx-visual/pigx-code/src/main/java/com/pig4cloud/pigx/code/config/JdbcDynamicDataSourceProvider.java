package com.pig4cloud.pigx.code.config;

import com.baomidou.dynamic.datasource.provider.AbstractJdbcDataSourceProvider;
import com.baomidou.dynamic.datasource.provider.DynamicDataSourceProvider;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DataSourceProperty;
import lombok.AllArgsConstructor;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

@Configuration
@AllArgsConstructor
public class JdbcDynamicDataSourceProvider {
	private final StringEncryptor stringEncryptor;
	private final JdbcDynamicDataSourceProperties properties;

	@Bean
	public DynamicDataSourceProvider dynamicDataSourceProvider() {
		return new AbstractJdbcDataSourceProvider(properties.getDriverClassName(), properties.getUrl(), properties.getUsername(), properties.getPassword()) {
			@Override
			protected Map<String, DataSourceProperty> executeStmt(Statement statement) throws SQLException {
				Map<String, DataSourceProperty> map = new HashMap<>();
				ResultSet rs = statement.executeQuery(properties.getSql());
				while (rs.next()) {
					String name = rs.getString("name");
					String username = rs.getString("username");
					String password = rs.getString("password");
					String url = rs.getString("url");
//					String driver = rs.getString("driver");
					DataSourceProperty property = new DataSourceProperty();
					property.setUsername(username);
					property.setPassword(stringEncryptor.decrypt(password));
					property.setUrl(url);
//					property.setDriverClassName(driver);
					map.put(name, property);
				}
				return map;
			}
		};
	}
}
