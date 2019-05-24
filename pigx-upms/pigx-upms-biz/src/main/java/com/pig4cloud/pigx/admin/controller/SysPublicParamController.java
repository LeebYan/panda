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

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.admin.api.entity.SysPublicParam;
import com.pig4cloud.pigx.admin.service.SysPublicParamService;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import com.pig4cloud.pigx.common.poi.excel.ExcelImportUtil;
import com.pig4cloud.pigx.common.poi.excel.def.NormalExcelConstants;
import com.pig4cloud.pigx.common.poi.excel.entity.ExportParams;
import com.pig4cloud.pigx.common.poi.excel.entity.ImportParams;
import com.pig4cloud.pigx.common.poi.excel.view.PigxEntityExcelView;
import com.pig4cloud.pigx.common.security.annotation.Inner;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;


/**
 * 公共参数
 *
 * @author Lucky
 * @date 2019-04-29
 */
@RestController
@AllArgsConstructor
@RequestMapping("/param")
@Api(value = "param", tags = "公共参数配置")
public class SysPublicParamController {

	private final SysPublicParamService sysPublicParamService;

	/**
	 * 通过key查询公共参数值
	 *
	 * @param publicKey
	 * @return
	 */
	@Inner(value = false)
	@ApiOperation(value = "查询公共参数值", notes = "根据key查询公共参数值")
	@GetMapping("/publicValue/{publicKey}")
	public R publicKey(@PathVariable("publicKey") String publicKey) {
		return R.ok(sysPublicParamService.getSysPublicParamKeyToValue(publicKey));
	}

	/**
	 * 分页查询
	 *
	 * @param page           分页对象
	 * @param sysPublicParam 公共参数
	 * @return
	 */
	@ApiOperation(value = "分页查询", notes = "分页查询")
	@GetMapping("/page")
	public R getSysPublicParamPage(Page page, SysPublicParam sysPublicParam) {
		return R.ok(sysPublicParamService.page(page, Wrappers.query(sysPublicParam)));
	}


	/**
	 * 通过id查询公共参数
	 *
	 * @param publicId id
	 * @return R
	 */
	@ApiOperation(value = "通过id查询公共参数", notes = "通过id查询公共参数")
	@GetMapping("/{publicId}")
	public R getById(@PathVariable("publicId") Long publicId) {
		return R.ok(sysPublicParamService.getById(publicId));
	}

	/**
	 * 新增公共参数
	 *
	 * @param sysPublicParam 公共参数
	 * @return R
	 */
	@ApiOperation(value = "新增公共参数", notes = "新增公共参数")
	@SysLog("新增公共参数")
	@PostMapping
	@PreAuthorize("@pms.hasPermission('admin_syspublicparam_add')")
	public R save(@RequestBody SysPublicParam sysPublicParam) {
		return R.ok(sysPublicParamService.save(sysPublicParam));
	}

	/**
	 * 修改公共参数
	 *
	 * @param sysPublicParam 公共参数
	 * @return R
	 */
	@ApiOperation(value = "修改公共参数", notes = "修改公共参数")
	@SysLog("修改公共参数")
	@PutMapping
	@PreAuthorize("@pms.hasPermission('admin_syspublicparam_edit')")
	public R updateById(@RequestBody SysPublicParam sysPublicParam) {
		return sysPublicParamService.updateParam(sysPublicParam);
	}

	/**
	 * 通过id删除公共参数
	 *
	 * @param publicId id
	 * @return R
	 */
	@ApiOperation(value = "删除公共参数", notes = "删除公共参数")
	@SysLog("删除公共参数")
	@DeleteMapping("/{publicId}")
	@PreAuthorize("@pms.hasPermission('admin_syspublicparam_del')")
	public R removeById(@PathVariable Long publicId) {
		return sysPublicParamService.removeParam(publicId);
	}


	/**
	 * 导出excel
	 *
	 */
	//临时接口调试开启Inner
	@Inner(value = false)
	@SysLog("导出excel数据")
	@ApiOperation(value = "导出excel数据", notes = "导出excel数据")
	@GetMapping(value = "/exportXls")
//	@PostMapping(value = "/exportXls")
	public ModelAndView exportXls() {
		// Step.1 组装查询条件
		// TODO 后续封装完成 通用查询条件 包含权限、排序、普通检索、高级检索 QueryGenerator.initQueryWrapper(...);
		QueryWrapper<SysPublicParam> queryWrapper = null;
		queryWrapper = Wrappers.query();

		// Step.2 AutoPoi 导出Excel
		ModelAndView mv = new ModelAndView(new PigxEntityExcelView());
		List<SysPublicParam> pageList = sysPublicParamService.list(Wrappers.query());

		//Step.3 导出文件名称
		mv.addObject(NormalExcelConstants.FILE_NAME, "参数配置列表");
		mv.addObject(NormalExcelConstants.CLASS, SysPublicParam.class);
		mv.addObject(NormalExcelConstants.PARAMS, new ExportParams("参数配置列表数据", "导出人:pigx", "导出信息"));
		mv.addObject(NormalExcelConstants.DATA_LIST, pageList);
		return mv;
	}

	/**
	 * 通过excel导入数据
	 *
	 * @param file
	 * @return
	 */
	//临时接口调试开启Inner
	@Inner(value = false)
	@SysLog("导入excel数据")
	@ApiOperation(value = "导入excel数据", notes = "导入excel数据")
	@PostMapping(value = "/importExcel")
	public R<?> importExcel(@RequestParam("file") MultipartFile file) {
//		HttpServletRequest request
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		//for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			// 获取上传文件对象
			//MultipartFile file = entity.getValue();
			ImportParams params = new ImportParams();
			params.setTitleRows(2);
			params.setHeadRows(1);
			params.setNeedSave(true);
			try {
				List<SysPublicParam> listSysPublicParams = null;
				if(file.getInputStream() != null){
					listSysPublicParams = ExcelImportUtil.importExcel(file.getInputStream(), SysPublicParam.class, params);
					for (SysPublicParam sysPublicParamExcel : listSysPublicParams) {
						sysPublicParamService.save(sysPublicParamExcel);
					}
				}

				return R.ok("文件导入成功！数据行数：" + listSysPublicParams.size());
			} catch (Exception e) {
				return R.failed("文件导入失败！");
			} finally {
				try {
					file.getInputStream().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		//}
	}
}
