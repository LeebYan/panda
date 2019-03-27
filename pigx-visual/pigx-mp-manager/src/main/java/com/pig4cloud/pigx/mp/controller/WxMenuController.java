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
package com.pig4cloud.pigx.mp.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import com.pig4cloud.pigx.mp.entity.WxMenu;
import com.pig4cloud.pigx.mp.service.WxMenuService;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


/**
 * 微信菜单管理
 *
 * @author lengleng
 * @date 2019-03-27 20:45:18
 */
@RestController
@AllArgsConstructor
@RequestMapping("/wxmenu")
public class WxMenuController {

	private final WxMenuService wxMenuService;

	/**
	 * 分页查询
	 *
	 * @param page   分页对象
	 * @param wxMenu lengleng
	 * @return
	 */
	@GetMapping("/page")
	public R getWxMenuPage(Page page, WxMenu wxMenu) {
		return new R<>(wxMenuService.page(page, Wrappers.query(wxMenu)));
	}


	/**
	 * 通过id查询lengleng
	 *
	 * @param id id
	 * @return R
	 */
	@GetMapping("/{id}")
	public R getById(@PathVariable("id") Integer id) {
		return new R<>(wxMenuService.getById(id));
	}

	/**
	 * 新增lengleng
	 *
	 * @param wxMenu lengleng
	 * @return R
	 */
	@SysLog("新增lengleng")
	@PostMapping
	@PreAuthorize("@pms.hasPermission('mp_wxmenu_add')")
	public R save(@RequestBody WxMenu wxMenu) {
		return new R<>(wxMenuService.save(wxMenu));
	}

	/**
	 * 修改lengleng
	 *
	 * @param wxMenu lengleng
	 * @return R
	 */
	@SysLog("修改lengleng")
	@PutMapping
	@PreAuthorize("@pms.hasPermission('mp_wxmenu_edit')")
	public R updateById(@RequestBody WxMenu wxMenu) {
		return new R<>(wxMenuService.updateById(wxMenu));
	}

	/**
	 * 通过id删除lengleng
	 *
	 * @param id id
	 * @return R
	 */
	@SysLog("删除lengleng")
	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('mp_wxmenu_del')")
	public R removeById(@PathVariable Integer id) {
		return new R<>(wxMenuService.removeById(id));
	}

}
