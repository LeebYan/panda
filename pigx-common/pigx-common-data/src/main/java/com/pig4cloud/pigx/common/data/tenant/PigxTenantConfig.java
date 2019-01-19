package com.pig4cloud.pigx.common.data.tenant;

import lombok.Data;

/**
 * 多租户配置
 *
 * @author oathsign
 */
@Data
public class PigxTenantConfig {

	/**
	 * 应用了多租户的数据表集合
	 */
	private String[] tenantTables = new String[]{};
}
