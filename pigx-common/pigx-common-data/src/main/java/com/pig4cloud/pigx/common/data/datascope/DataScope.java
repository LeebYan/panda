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

package com.pig4cloud.pigx.common.data.datascope;

import com.pig4cloud.pigx.common.data.enums.DataScopeFieldEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * @author lengleng
 * @date 2018/8/30
 * 数据权限查询参数
 *
 * update by yhaili2009@163.com at 2020/6/17
 * 1、支持本人数据权限过滤；
 * 2、支持自动注入、手动注入；
 * 3、支持字段名称及表别名设置；
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class DataScope extends HashMap {
	/**
	 * sql中的占位符，需要xml中和此处一致，会被替换为真正的数据权限语句
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private String sqlPlaceholder = "[scope.scopeSql]";
	/**
	 * 用户ID的引用别名（autoInj为false时会用到）
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private String userAlias;
	/**
	 * 部门ID的引用别名（autoInj为false时会用到）
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private String deptAlias;
	/**
	 * 数据权限 sql语句，用于在自定义sql中引入
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private String scopeSql = "";
	/**
	 * 是否自动注入数据权限的sql， 为false时，需要自己在sql中通过 scopeSql 引入
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private boolean autoInj = true;
	/**
	 * 限制范围的字段名称（用户）
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private String userScopeName = "user_id";
	/**
	 * 限制范围的字段名称（部门）
	 */
	private String scopeName = "dept_id";

	/**
	 * 具体的数据范围(部门)
	 */
	private List<Integer> scopeIds = new ArrayList<>();

	/**
	 * 是否只查询本部门
	 */
	private Boolean isOnly = false;

	/**
	 * 数据权限字段
	 * add by yhaili2009@163.com at 2020/6/17
	 */
	private DataScopeFieldEnum scopeField;

	public DataScope() {
		this(DataScopeFieldEnum.DEPT);
	}

	public DataScope(DataScopeFieldEnum scopeField) {
		this.scopeField = scopeField;
	}

	/**
	 * 仅控制用户数据权限
	 * @return
	 */
	public static DataScope onlyUser() {
		return new DataScope(DataScopeFieldEnum.USER);
	}

	/**
	 * 仅控制部门数据权限
	 * @return
	 */
	public static DataScope onlyDept() {
		return new DataScope(DataScopeFieldEnum.DEPT);
	}

	/**
	 * 可控制部门和用户数据权限
	 * @return
	 */
	public static DataScope deptAndUser() {
		return new DataScope(DataScopeFieldEnum.DEPT_AND_USER);
	}

	/**
	 * 是否开启自动注入权限sql
	 * @param autoInj
	 * @return
	 */
	public DataScope autoInj(boolean autoInj) {
		this.autoInj = autoInj;
		return this;
	}

	/**
	 * 设置部门ID引用的别名
	 * @param deptAlias
	 * @return
	 */
	public DataScope deptAlias(String deptAlias) {
		this.deptAlias = deptAlias;
		return this;
	}

	/**
	 * 设置用户ID引用的别名
	 * @param userAlias
	 * @return
	 */
	public DataScope userAlias(String userAlias) {
		this.userAlias = userAlias;
		return this;
	}

	/**
	 * 设置部门字段名
	 * @param deptScopeName
	 * @return
	 */
	public DataScope deptScopeName(String deptScopeName) {
		this.scopeName = deptScopeName;
		return this;
	}

	/**
	 * 设置用户字段名
	 * @param userScopeName
	 * @return
	 */
	public DataScope userScopeName(String userScopeName) {
		this.userScopeName = userScopeName;
		return this;
	}

	/**
	 * 设置数据权限 sql占位符
	 * @param sqlPlaceholder
	 * @return
	 */
	public DataScope sqlPlaceholder(String sqlPlaceholder) {
		this.sqlPlaceholder = sqlPlaceholder;
		return this;
	}

	/**
	 * 自定义可以查看的部门ID
	 * @param deptId
	 * @return
	 */
	public DataScope scopeIds(Integer ...deptId) {
		this.scopeIds.addAll(Arrays.asList(deptId));
		return this;
	}

	/**
	 * 权限sql不能在其他地方修改
	 * @param scopeSql
	 */
	protected void setScopeSql(String scopeSql) {
		this.scopeSql = scopeSql;
	}
}
