/*
 *
 *      Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the pig4cloud.com developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: lengleng (wangiegie@gmail.com)
 *
 */

package com.pig4cloud.pigx.dynamic.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import com.pig4cloud.pigx.dynamic.mapper.TestMapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author liuyes
 * @date 2019/11/19
 */
@RestController
@AllArgsConstructor
@RequestMapping("/test")
@Api(value = "test", tags = "动态多数据源示例模块")
public class TestController {

	private TestMapper testMapper;

	/**
	 * 获取test1数据库用户信息
	 *
	 * @return 用户信息
	 */
	@ApiOperation(value = "查询test1数据库用户信息", notes = "查询test1数据库用户信息")
	@SysLog("查询test1数据库用户信息" )
	@PostMapping("/getTest1")
	public R getTest1() {
		List<Map<String, Object>> list = testMapper.getTest1();
		if (list == null) {
			return R.failed(null, "查询失败！");
		}
		return R.ok(list,"操作成功！");
	}

	/**
	 * 获取test2数据库用户信息
	 *
	 * @return 用户信息
	 */
	@ApiOperation(value = "查询test2数据库用户信息", notes = "查询test2数据库用户信息")
	@SysLog("查询test2数据库用户信息" )
	@PostMapping("/getTest2")
	public R getTest2(Page page) {
		IPage<List<Map<String, Object>>> list = testMapper.getTest2(page);
		if (list == null) {
			return R.failed(null, "查询失败！");
		}
		return R.ok(list,"操作成功！");
	}
	/**
	 * 获取test3数据库用户信息
	 *
	 * @return 用户信息
	 */
	@ApiOperation(value = "查询test3数据库用户信息", notes = "查询test3数据库用户信息")
	@SysLog("查询test3数据库用户信息" )
	@PostMapping("/getTest3")
	public R getTest3(Page page) {
		IPage<List<Map<String, Object>>> list = testMapper.getTest3(page);
		if (list == null) {
			return R.failed(null, "查询失败！");
		}
		return R.ok(list,"操作成功！");
	}

}
