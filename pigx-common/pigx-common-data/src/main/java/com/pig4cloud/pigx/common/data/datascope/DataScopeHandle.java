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

/**
 * @author lengleng
 * @date 2019-09-07
 * <p>
 * data scope 判断处理器,抽象服务扩展
 */
public interface DataScopeHandle {

	/**
	 * 计算用户数据权限
	 *
	 * @param dataScope
	 * @return
	 *
	 * update by yhaili2009@163.com at 2020/6/17
	 * 修改参数 List<Integer> 为 DataScope
	 */
	Boolean calcScope(DataScope dataScope);
}
