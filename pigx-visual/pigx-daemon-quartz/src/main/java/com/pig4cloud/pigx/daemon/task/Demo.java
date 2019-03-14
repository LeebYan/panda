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

package com.pig4cloud.pigx.daemon.task;

import cn.hutool.core.date.DateUtil;
import com.pig4cloud.pigx.daemon.constant.enums.PigxQuartzEnum;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author 郑健楠
 */
@Slf4j
@Component("demo")
public class Demo {
	/**
	 *
	 */
	@SneakyThrows
	public String demoMethod(String para) {
		log.info("郑健楠测试于:{}，输入参数L{}", DateUtil.now(), para);
		return PigxQuartzEnum.JOBLOGSTATUSSUCCESS.getType();
	}
}
