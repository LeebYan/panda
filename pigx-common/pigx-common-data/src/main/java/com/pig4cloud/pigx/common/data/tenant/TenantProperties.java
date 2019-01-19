package com.pig4cloud.pigx.common.data.tenant;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 多租户配置类对应属性配置映射
 *
 * @author oathsign
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "pigx.tenant")
public class TenantProperties {

	/**
	 * 服务中应用多租户的数据库表名
	 */
	private String[] tables = new String[]{};
}
