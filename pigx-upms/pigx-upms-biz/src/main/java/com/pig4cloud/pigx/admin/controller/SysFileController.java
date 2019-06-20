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

package com.pig4cloud.pigx.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.admin.api.entity.SysFile;
import com.pig4cloud.pigx.admin.service.SysFileService;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


/**
 * 文件管理
 *
 * @author Luckly
 * @date 2019-06-18 17:18:42
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sys-file")
@Api(value = "sys-file", tags = "文件管理")
public class SysFileController {

	private final SysFileService sysFileService;

	/**
	 * 分页查询
	 *
	 * @param page    分页对象
	 * @param sysFile 文件管理
	 * @return
	 */
	@ApiOperation(value = "分页查询", notes = "分页查询")
	@GetMapping("/page")
	public R getSysFilePage(Page page, SysFile sysFile) {
		return R.ok(sysFileService.page(page, Wrappers.query(sysFile)));
	}


	/**
	 * 通过id查询文件管理
	 *
	 * @param id id
	 * @return R
	 */
	@ApiOperation(value = "通过id查询文件管理", notes = "通过id查询文件管理")
	@GetMapping("/{id}")
	public R getById(@PathVariable("id") String id) {
		return R.ok(sysFileService.getById(id));
	}

	/**
	 * 新增文件管理
	 *
	 * @param sysFile 文件管理
	 * @return R
	 */
	@ApiOperation(value = "新增文件管理", notes = "新增文件管理")
	@SysLog("新增文件管理")
	@PostMapping
	@PreAuthorize("@pms.hasPermission('sys_file_add')")
	public R save(@RequestBody SysFile sysFile) {
		return R.ok(sysFileService.save(sysFile));
	}

	/**
	 * 修改文件管理
	 *
	 * @param sysFile 文件管理
	 * @return R
	 */
	@ApiOperation(value = "修改文件管理", notes = "修改文件管理")
	@SysLog("修改文件管理")
	@PutMapping
	@PreAuthorize("@pms.hasPermission('sys_file_edit')")
	public R updateById(@RequestBody SysFile sysFile) {
		return R.ok(sysFileService.updateById(sysFile));
	}

	/**
	 * 通过id删除文件管理
	 *
	 * @param id id
	 * @return R
	 */
	@ApiOperation(value = "通过id删除文件管理", notes = "通过id删除文件管理")
	@SysLog("删除文件管理")
	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('sys_file_del')")
	public R removeById(@PathVariable String id) {
		return R.ok(sysFileService.removeById(id));
	}

}
