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

package com.pig4cloud.pigx.pay.controller;

import cn.hutool.core.util.StrUtil;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import com.pig4cloud.pigx.common.security.annotation.Inner;
import com.pig4cloud.pigx.pay.service.PayGoodsOrderService;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


/**
 * 商品
 *
 * @author lengleng
 * @date 2019-05-28 23:58:27
 */
@RestController
@AllArgsConstructor
@RequestMapping("/goods")
@Api(value = "goods", tags = "商品订单管理")
public class PayGoodsOrderController {

	private final PayGoodsOrderService payGoodsOrderService;


	/**
	 * 商品订单
	 *
	 * @param amount 金额
	 * @return R
	 */
	@Inner(false)
	@GetMapping("/buy")
	@SysLog("新增商品订单")
	public R save(Long amount, HttpServletRequest request) {
		String ua = request.getHeader(HttpHeaders.USER_AGENT);
		if (StrUtil.isBlank(ua)) {
			return R.failed("终端不合法");
		}
		return payGoodsOrderService.buy(amount);
	}
}
