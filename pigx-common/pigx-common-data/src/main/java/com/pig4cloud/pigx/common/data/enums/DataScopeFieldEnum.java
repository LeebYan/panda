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

package com.pig4cloud.pigx.common.data.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 数据权限支持的模式
 * @author yhaili2009@163.com
 * @date 2020/6/17
 *
 */
@Getter
@AllArgsConstructor
public enum DataScopeFieldEnum {
	/**
	 * 仅支持部门
	 */
	DEPT(0, "仅部门"),

	/**
	 * 仅支持用户
	 */
	USER(1, "仅用户"),

	/**
	 * 支持部门和用户
	 */
	DEPT_AND_USER(2, "部门和用户");

	/**
	 * 类型
	 */
	private final int type;
	/**
	 * 描述
	 */
	private final String description;
}
