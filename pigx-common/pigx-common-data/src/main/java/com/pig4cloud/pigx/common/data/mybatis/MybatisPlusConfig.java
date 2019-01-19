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

package com.pig4cloud.pigx.common.data.mybatis;

import com.baomidou.mybatisplus.core.injector.ISqlInjector;
import com.baomidou.mybatisplus.core.parser.ISqlParser;
import com.baomidou.mybatisplus.extension.injector.LogicSqlInjector;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;
import com.pig4cloud.pigx.common.data.datascope.DataScopeInterceptor;
import com.pig4cloud.pigx.common.data.tenant.PigxTenantConfig;
import com.pig4cloud.pigx.common.data.tenant.PigxTenantHandler;
import lombok.AllArgsConstructor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author lengleng
 * @date 2017/10/29
 */
@Configuration
@MapperScan("com.pig4cloud.pigx.*.mapper")
@AllArgsConstructor
public class MybatisPlusConfig {

	private final PigxTenantConfig pigxTenantConfig;

	/**
	 * 创建租户维护处理器对象
	 *
	 * @return 处理后的租户维护处理器
	 */
	@Bean
	@ConditionalOnMissingBean
	public PigxTenantHandler pigxTenantHandler() {
		PigxTenantHandler pigxTenantHandler = new PigxTenantHandler();
		pigxTenantHandler.setTenantTables(pigxTenantConfig.getTenantTables());
		return pigxTenantHandler;
	}

	/**
	 * 分页插件
	 *
	 * @return PaginationInterceptor
	 */
	@Bean
	@ConditionalOnMissingBean
	public PaginationInterceptor paginationInterceptor() {
		PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
		List<ISqlParser> sqlParserList = new ArrayList<>();
		TenantSqlParser tenantSqlParser = new TenantSqlParser();
		tenantSqlParser.setTenantHandler(pigxTenantHandler());
		sqlParserList.add(tenantSqlParser);
		paginationInterceptor.setSqlParserList(sqlParserList);
		return paginationInterceptor;
	}

	/**
	 * 数据权限插件
	 *
	 * @param dataSource 数据源
	 * @return DataScopeInterceptor
	 */
	@Bean
	@ConditionalOnMissingBean
	public DataScopeInterceptor dataScopeInterceptor(DataSource dataSource) {
		return new DataScopeInterceptor(dataSource);
	}

	/**
	 * 逻辑删除插件
	 *
	 * @return LogicSqlInjector
	 */
	@Bean
	@ConditionalOnMissingBean
	public ISqlInjector sqlInjector() {
		return new LogicSqlInjector();
	}
}
