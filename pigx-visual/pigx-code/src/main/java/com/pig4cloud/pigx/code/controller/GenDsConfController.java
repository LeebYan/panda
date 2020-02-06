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
package com.pig4cloud.pigx.code.controller;

import com.baomidou.dynamic.datasource.DynamicDataSourceCreator;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.spring.boot.autoconfigure.DataSourceProperty;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.code.entity.GenDatasourceConf;
import com.pig4cloud.pigx.code.service.GenDatasourceConfService;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import lombok.AllArgsConstructor;
import org.jasypt.encryption.StringEncryptor;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;


/**
 * 数据源管理
 *
 * @author lengleng
 * @date 2019-03-31 16:00:20
 */
@RestController
@AllArgsConstructor
@RequestMapping("/dsconf")
public class GenDsConfController {
	private final GenDatasourceConfService datasourceConfService;
	private final StringEncryptor stringEncryptor;
	private DataSource dataSource;
	private DynamicDataSourceCreator dataSourceCreator;

	/**
	 * 分页查询
	 *
	 * @param page           分页对象
	 * @param datasourceConf 数据源表
	 * @return
	 */
	@GetMapping("/page")
	public R getSysDatasourceConfPage(Page page, GenDatasourceConf datasourceConf) {
		return R.ok(datasourceConfService.page(page, Wrappers.query(datasourceConf)));
	}

	/**
	 * 查询全部数据源
	 *
	 * @return
	 */
	@GetMapping("/list")
	public R list() {
		return R.ok(datasourceConfService.list());
	}


	/**
	 * 通过id查询数据源表
	 *
	 * @param id id
	 * @return R
	 */
	@GetMapping("/{id}")
	public R getById(@PathVariable("id") Integer id) {
		return R.ok(datasourceConfService.getById(id));
	}

	/**
	 * 新增数据源表
	 *
	 * @param datasourceConf 数据源表
	 * @return R
	 */
	@SysLog("新增数据源表")
	@PostMapping
	public R save(@RequestBody GenDatasourceConf datasourceConf) {
		DynamicRoutingDataSource ds = (DynamicRoutingDataSource) dataSource;
		DataSourceProperty dataSourceProperty = new DataSourceProperty();
		dataSourceProperty.setPollName(datasourceConf.getName());
		dataSourceProperty.setUrl(datasourceConf.getUrl());
		dataSourceProperty.setUsername(datasourceConf.getUsername());
		dataSourceProperty.setPassword(datasourceConf.getPassword());
		DataSource dataSource = dataSourceCreator.createDataSource(dataSourceProperty);
		ds.addDataSource(dataSourceProperty.getPollName(), dataSource);
		return R.ok(datasourceConfService.saveDsByEnc(datasourceConf));
	}

	/**
	 * 修改数据源表
	 *
	 * @param sysDatasourceConf 数据源表
	 * @return R
	 */
	@SysLog("修改数据源表")
	@PutMapping
	public R updateById(@RequestBody GenDatasourceConf sysDatasourceConf) {
		DynamicRoutingDataSource ds = (DynamicRoutingDataSource) dataSource;
		//先移除
		ds.removeDataSource(datasourceConfService.getById(sysDatasourceConf.getId()).getName());
		//再添加
		DataSourceProperty dataSourceProperty = new DataSourceProperty();
		dataSourceProperty.setPollName(sysDatasourceConf.getName());
		dataSourceProperty.setUrl(sysDatasourceConf.getUrl());
		dataSourceProperty.setUsername(sysDatasourceConf.getUsername());
		dataSourceProperty.setPassword(sysDatasourceConf.getPassword());
		DataSource dataSource = dataSourceCreator.createDataSource(dataSourceProperty);
		ds.addDataSource(dataSourceProperty.getPollName(), dataSource);
		return R.ok(datasourceConfService.updateDsByEnc(sysDatasourceConf));
	}

	/**
	 * 通过id删除数据源表
	 *
	 * @param id id
	 * @return R
	 */
	@SysLog("删除数据源表")
	@DeleteMapping("/{id}")
	public R removeById(@PathVariable Integer id) {
		DynamicRoutingDataSource ds = (DynamicRoutingDataSource) dataSource;
		ds.removeDataSource(datasourceConfService.getById(id).getName());
		return R.ok(datasourceConfService.removeById(id));
	}

}
