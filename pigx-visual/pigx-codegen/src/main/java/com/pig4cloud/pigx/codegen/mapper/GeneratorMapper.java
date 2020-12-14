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

package com.pig4cloud.pigx.codegen.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.codegen.entity.ColumnEntity;
import com.pig4cloud.pigx.common.data.datascope.PigxBaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 *
 * @author lengleng
 * @date 2018-07-30
 */
public interface GeneratorMapper extends PigxBaseMapper<ColumnEntity> {

	/**
	 * 分页查询表格
	 * @param page 分页信息
	 * @param tableName 表名称
	 * @return
	 */
	IPage<List<Map<String, Object>>> queryTable(Page page, @Param("tableName") String tableName);

	/**
	 * 查询表信息
	 * @param tableName 表名称
	 * @param dsName 数据源名称
	 * @return
	 */
	@DS("#last")
	Map<String, String> queryTable(@Param("tableName") String tableName, String dsName);

	/**
	 * 分页查询表分页信息
	 * @param page
	 * @param tableName
	 * @param dsName
	 * @return
	 */
	@DS("#last")
	IPage<ColumnEntity> selectTableColumn(Page page, @Param("tableName") String tableName,
			@Param("dsName") String dsName);

	/**
	 * 查询表全部列信息
	 * @param tableName
	 * @param dsName
	 * @return
	 */
	@DS("#last")
	List<ColumnEntity> selectTableColumn(@Param("tableName") String tableName, @Param("dsName") String dsName);

	/**
	 * 查询表全部列信息
	 * @param tableName 表名称
	 * @param dsName 数据源名称
	 * @return
	 */
	@DS("#last")
	List<Map<String, String>> selectMapTableColumn(@Param("tableName") String tableName, String dsName);

}
