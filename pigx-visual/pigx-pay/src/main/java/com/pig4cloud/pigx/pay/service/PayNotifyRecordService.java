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

package com.pig4cloud.pigx.pay.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pig4cloud.pigx.pay.entity.PayNotifyRecord;

import java.util.Map;

/**
 * 异步通知记录
 *
 * @author lengleng
 * @date 2019-05-28 23:57:23
 */
public interface PayNotifyRecordService extends IService<PayNotifyRecord> {

	/**
	 * 处理支付宝渠道回调
	 *
	 * @param params
	 * @return
	 */
	String aliCallbak(Map<String, String> params);

	/**
	 * 保存支付宝回调结果
	 *
	 * @param params
	 * @param result
	 */
	void saveAliRecord(Map<String, String> params, String result);

	/**
	 * 处理微信渠道回调
	 *
	 * @param params
	 * @return
	 */
	String wxCallbak(Map<String, String> params);
}
