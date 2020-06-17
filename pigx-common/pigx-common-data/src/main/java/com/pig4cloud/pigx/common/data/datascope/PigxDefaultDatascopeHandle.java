/*
 *    Copyright (c) 2018-2025, ihealth All rights reserved.
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
 * Author: ihealth
 */

package com.pig4cloud.pigx.common.data.datascope;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.pig4cloud.pigx.admin.api.entity.SysDeptRelation;
import com.pig4cloud.pigx.admin.api.entity.SysRole;
import com.pig4cloud.pigx.admin.api.feign.RemoteDataScopeService;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import com.pig4cloud.pigx.common.data.enums.DataScopeFieldEnum;
import com.pig4cloud.pigx.common.data.enums.DataScopeTypeEnum;
import com.pig4cloud.pigx.common.security.service.PigxUser;
import com.pig4cloud.pigx.common.security.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ihealth
 * @date 2019-09-07
 * <p>
 * 默认data scope 判断处理器
 *
 * update by yhaili2009@163.com at 2020/6/17
 *  1、支持本人数据权限过滤；
 *  2、支持自动注入、手动注入；
 *  3、支持字段名称及表别名设置；
 */
public class PigxDefaultDatascopeHandle implements DataScopeHandle {

	@Autowired
	private RemoteDataScopeService dataScopeService;

	/**
	 * 计算用户数据权限
	 *
	 * @param dataScope
	 * @return
	 */
	@Override
	public Boolean calcScope(DataScope dataScope) {
		// 默认数据权限sql为空，即不限制
		dataScope.setScopeSql("");

		// 优先获取赋值数据
		if (CollUtil.isNotEmpty(dataScope.getScopeIds())) {
			return false;
		}

		List<Integer> scopeList = dataScope.getScopeIds();
		if (scopeList == null) {
			scopeList = new ArrayList<>();
		}
		// 默认为部门数据权限控制
//		dataScope.setScopeName(DEPT_SCOPE_NAME);

		PigxUser user = SecurityUtils.getUser();
		// 当前用户为空（一般后台处理程序），给所有数据
		if (user == null) {
			return true;
		}
		List<String> roleIdList = user.getAuthorities()
				.stream().map(GrantedAuthority::getAuthority)
				.filter(authority -> authority.startsWith(SecurityConstants.ROLE))
				.map(authority -> authority.split(StrUtil.UNDERLINE)[1])
				.collect(Collectors.toList());

		SysRole role = dataScopeService.getRoleList(roleIdList).getData().stream()
				.min(Comparator.comparingInt(SysRole::getDsType)).get();

		Integer dsType = role.getDsType();
		// 仅支持用户字段的数据权限时，角色指定不是仅本人数据
		if (dataScope.getScopeField() == DataScopeFieldEnum.USER && dsType != DataScopeTypeEnum.OWN.getType()) {
			return true;
		}
		// 仅支持部门字段数据权限时，角色指定只能查看仅本人数据
		if (dataScope.getScopeField() == DataScopeFieldEnum.DEPT && dsType == DataScopeTypeEnum.OWN.getType()) {
			return true;
		}

		// 默认为部门数据权限过滤
		String alias = dataScope.getDeptAlias();

		// 查询全部
		if (DataScopeTypeEnum.ALL.getType() == dsType) {
			return true;
		}
		// 自定义
		else if (DataScopeTypeEnum.CUSTOM.getType() == dsType) {
			String dsScope = role.getDsScope();
			scopeList.addAll(Arrays.stream(dsScope.split(StrUtil.COMMA))
					.map(Integer::parseInt).collect(Collectors.toList()));
		}
		// 查询本级及其下级
		else if (DataScopeTypeEnum.OWN_CHILD_LEVEL.getType() == dsType) {
			List<Integer> deptIdList = dataScopeService.getDescendantList(user.getDeptId())
					.getData().stream().map(SysDeptRelation::getDescendant)
					.collect(Collectors.toList());
			scopeList.addAll(deptIdList);
		}
		// 只查询本级
		else if (DataScopeTypeEnum.OWN_LEVEL.getType() == dsType) {
			scopeList.add(user.getDeptId());
		}
		/**
		 * 只查询本人
		 * add by yhaili2009@163.com at 2020/6/17
		 */
		else if (DataScopeTypeEnum.OWN.getType() == dsType) {
			scopeList.add(user.getId());
			// 设置用户数据权限控制
			dataScope.setScopeName(dataScope.getUserScopeName());
			alias = dataScope.getUserAlias();
		}

		alias = StrUtil.isBlank(alias) ? "" : alias + ".";
		if (scopeList.isEmpty()) {
			// 没有任何权限，不返回任何数据
			dataScope.setScopeSql(" AND 1=0");
		} else if (scopeList.size() == 1) {
			dataScope.setScopeSql(" AND " + alias + dataScope.getScopeName() + " = " + scopeList.get(0));
		} else {
			String join = CollectionUtil.join(scopeList, ",");
			dataScope.setScopeSql(" AND " + alias + dataScope.getScopeName() + " IN (" + join + ")");
		}

		dataScope.setScopeIds(scopeList);
		return false;
	}
}
