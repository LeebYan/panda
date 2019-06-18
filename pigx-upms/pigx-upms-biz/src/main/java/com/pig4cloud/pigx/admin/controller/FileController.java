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

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.pig4cloud.common.minio.service.MinioTemplate;
import com.pig4cloud.pigx.admin.api.entity.SysFile;
import com.pig4cloud.pigx.admin.service.SysFileService;
import com.pig4cloud.pigx.admin.util.FileKit;
import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import com.pig4cloud.pigx.common.core.util.R;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

;

/**
 * @author lengleng
 * @date 2018-12-30
 * <p>
 * 文件管理
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/file")
@Api(value = "file", tags = "文件管理模块")
public class FileController {
	private final MinioTemplate minioTemplate;
	private final SysFileService sysFileService;
	/**
	 * 上传文件
	 * 文件名采用uuid,避免原始文件名中带"-"符号导致下载的时候解析出现异常
	 *
	 * @param file 资源
	 * @return R(bucketName, filename)
	 */
	@PostMapping("/upload")
	public R upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		String fileName = IdUtil.simpleUUID() + StrUtil.DOT + FileUtil.extName(file.getOriginalFilename());
		Map<String, String> resultMap = new HashMap<>(4);
		resultMap.put("bucketName", CommonConstants.BUCKET_NAME);
		resultMap.put("fileName", fileName);

		try {
			minioTemplate.putObject(CommonConstants.BUCKET_NAME, fileName, file.getInputStream());
			String tenantId = request.getHeader(CommonConstants.TENANT_ID);
			log.debug("获取header中的租户ID为:{}", tenantId);
			//文件管理数据记录,收集管理追踪文件
			fileLog(file, fileName,tenantId);
		} catch (Exception e) {
			log.error("上传失败", e);
			return R.failed(e.getLocalizedMessage());
		}
		return R.ok(resultMap);
	}

	/**
	 * 文件管理数据记录,收集管理追踪文件
	 *
	 * @param file     上传文件格式
	 * @param fileName 文件名
	 */
	private void fileLog(MultipartFile file, String fileName, String tenantId) throws IOException {
		SysFile sysFile = new SysFile();
		//存储文件名
		String name = CommonConstants.BUCKET_NAME + StrUtil.DASHED + fileName;
		//原文件名
		String original = file.getOriginalFilename();
		//文件大小
		Long size = file.getSize();
		//后缀名
		String suffix = FileKit.getSuffix(name);
		//文件类型
		String type = FileKit.getType(name);
		//显示大小
		String displaySize = FileKit.getDisplaySize(file.getSize());

		sysFile.setName(name);
		sysFile.setOriginal(original);
		sysFile.setFileSize(size);
		sysFile.setSuffix(suffix);
		sysFile.setType(type);
		sysFile.setDisplaySize(displaySize);
		sysFile.setMd5(DigestUtils.md5Hex(file.getBytes()));

//		if (StrUtil.isNotBlank(tenantId)) {
//			sysFile.setTenantId(Integer.parseInt(tenantId));
//		} else {
//			sysFile.setTenantId(CommonConstants.TENANT_ID_1);
//		}

		sysFileService.save(sysFile);
	}


	/**
	 * 获取文件
	 *
	 * @param fileName 文件空间/名称
	 * @param response
	 * @return
	 */
	@GetMapping("/{fileName}")
	public void file(@PathVariable String fileName, HttpServletResponse response) {
		Integer separator = fileName.lastIndexOf(StrUtil.DASHED);
		try (InputStream inputStream = minioTemplate.getObject(fileName.substring(0, separator), fileName.substring(separator + 1, fileName.length()))) {
			response.setContentType("application/octet-stream; charset=UTF-8");
			IoUtil.copy(inputStream, response.getOutputStream());
		} catch (Exception e) {
			log.error("文件读取异常", e);
		}
	}
}
