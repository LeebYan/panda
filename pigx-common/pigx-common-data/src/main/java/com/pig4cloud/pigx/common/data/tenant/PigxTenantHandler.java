/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */

package com.pig4cloud.pigx.common.data.tenant;

import cn.hutool.core.util.ArrayUtil;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;

/**
 * @author lengleng
 * @date 2018-12-26
 * <p>
 * 租户维护处理器
 */
@Slf4j
@Data
public class PigxTenantHandler implements TenantHandler {
	private String[] tenantTables = new String[]{};

	/**
	 * 获取租户值
	 *
	 * @return 租户值
	 */
	@Override
	public Expression getTenantId() {
		Integer tenantId = TenantContextHolder.getTenantId();
		log.debug("当前租户为 >> {}", tenantId);
		return new LongValue(tenantId);
	}

	/**
	 * 获取租户字段名
	 *
	 * @return 租户字段名
	 */
	@Override
	public String getTenantIdColumn() {
		return "tenant_id";
	}

	/**
	 * 根据表名判断是否进行过滤
	 *
	 * @param tableName 表名
	 * @return 是否进行过滤
	 */
	@Override
	public boolean doTableFilter(String tableName) {
		return !ArrayUtil.contains(tenantTables, tableName);
	}
}
