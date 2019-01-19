package com.pig4cloud.pigx.common.data.tenant;

import lombok.AllArgsConstructor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * 多租户自动配置类
 *
 * @author oathsign
 */
@AllArgsConstructor
@EnableConfigurationProperties(TenantProperties.class)
public class PigxTenantAutoConfiguration {

	private final TenantProperties properties;

	@Bean
	PigxTenantConfig pigxTenantTable() {
		PigxTenantConfig pigxTenantConfig = new PigxTenantConfig();
		pigxTenantConfig.setTenantTables(properties.getTables());
		return pigxTenantConfig;
	}
}
