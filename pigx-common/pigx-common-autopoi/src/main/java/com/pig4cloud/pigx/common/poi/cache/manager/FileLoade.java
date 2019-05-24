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
package com.pig4cloud.pigx.common.poi.cache.manager;

import com.pig4cloud.pigx.common.poi.util.PoiPublicUtil;
import lombok.extern.slf4j.Slf4j;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * 文件加载类,根据路径加载指定文件
 */
@Slf4j
class FileLoade {

	public byte[] getFile(String url) {
		FileInputStream fileis = null;
		ByteArrayOutputStream baos = null;
		try {
			// 先用绝对路径查询,再查询相对路径
			try {
				fileis = new FileInputStream(url);
			} catch (FileNotFoundException e) {
				String path = PoiPublicUtil.getWebRootPath(url);
				fileis = new FileInputStream(path);
			}
			baos = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int len;
			while ((len = fileis.read(buffer)) > -1) {
				baos.write(buffer, 0, len);
			}
			baos.flush();
			return baos.toByteArray();
		} catch (FileNotFoundException e) {
			log.error(e.getMessage(), e);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		} finally {
			try {
				if (fileis != null)
					fileis.close();
				if (fileis != null)
					baos.close();
			} catch (IOException e) {
				log.error(e.getMessage(), e);
			}
		}
		log.error(fileis + "这个路径文件没有找到,请查询");
		return null;
	}

}
