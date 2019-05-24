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
package com.pig4cloud.pigx.common.poi.cache;

import com.pig4cloud.pigx.common.poi.cache.manager.POICacheManager;
import com.pig4cloud.pigx.common.poi.word.entity.MyXWPFDocument;
import lombok.extern.slf4j.Slf4j;

import java.io.InputStream;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * word 缓存中心
 */
@Slf4j
public class WordCache {

	public static MyXWPFDocument getXWPFDocumen(String url) {
		InputStream is = null;
		try {
			is = POICacheManager.getFile(url);
			MyXWPFDocument doc = new MyXWPFDocument(is);
			return doc;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		} finally {
			try {
				is.close();
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}
		return null;
	}

}
