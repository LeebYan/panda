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
package com.pig4cloud.pigx.pay.service.impl;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jpay.alipay.AliPayApiConfig;
import com.jpay.alipay.AliPayApiConfigKit;
import com.jpay.ext.kit.PaymentKit;
import com.jpay.weixin.api.WxPayApiConfigKit;
import com.pig4cloud.pigx.pay.entity.PayNotifyRecord;
import com.pig4cloud.pigx.pay.mapper.PayNotifyRecordMapper;
import com.pig4cloud.pigx.pay.service.PayGoodsOrderService;
import com.pig4cloud.pigx.pay.service.PayNotifyRecordService;
import com.pig4cloud.pigx.pay.service.PayTradeOrderService;
import com.pig4cloud.pigx.pay.utils.TradeStatusEnum;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 异步通知记录
 *
 * @author lengleng
 * @date 2019-05-28 23:57:23
 */
@Slf4j
@Service
@AllArgsConstructor
public class PayNotifyRecordServiceImpl extends ServiceImpl<PayNotifyRecordMapper, PayNotifyRecord> implements PayNotifyRecordService {
	private final PayTradeOrderService tradeOrderService;
	private final PayGoodsOrderService goodsOrderService;


	/**
	 * 处理微信渠道回调
	 *
	 * @param params
	 * @return
	 */
	@Override
	public String wxCallbak(Map<String, String> params) {
		if (!PaymentKit.verifyNotify(params, WxPayApiConfigKit.getWxPayApiConfig().getPaternerKey())) {
			log.warn("微信支付回调验签失败", params);
			return null;
		}

		params.put("trade_status", TradeStatusEnum.TRADE_SUCCESS.getDescription());

		goodsOrderService.updateOrder(params);
		tradeOrderService.updateOrder(params);

		Map<String, String> xml = new HashMap<>(4);
		xml.put("return_code", "SUCCESS");
		xml.put("return_msg", "OK");
		return PaymentKit.toXml(xml);
	}

	/**
	 * 处理渠道回调
	 *
	 * @param params
	 * @return
	 */
	@Override
	public String aliCallbak(Map<String, String> params) {
		String callReq = MapUtil.join(params, StrUtil.DASHED, StrUtil.DASHED);
		log.info("支付宝发起回调 报文: {}", callReq);
		String appId = params.get("app_id");

		if (StrUtil.isBlank(appId)) {
			log.warn("支付宝回调报文 appid 为空 {}", callReq);
			return "failure";
		}

		AliPayApiConfig apiConfig = AliPayApiConfigKit.getApiConfig(appId);
		if (apiConfig == null) {
			log.warn("支付宝回调报文 appid 不合法 {}", callReq);
			return "failure";
		}

		boolean verifyResult;
		try {
			verifyResult = AlipaySignature.rsaCheckV1(params, apiConfig.getAlipayPublicKey(), CharsetUtil.UTF_8,
					"RSA2");
		} catch (AlipayApiException e) {
			log.warn("验签异常 {} {}", e.getErrCode(), e.getErrMsg());
			return "failure";
		}

		if (!verifyResult) {
			log.warn("支付宝回调验签:{}", MapUtil.join(params, StrUtil.DASHED, StrUtil.DASHED));
			return "failure";
		}

		goodsOrderService.updateOrder(params);
		tradeOrderService.updateOrder(params);
		return "success";
	}

	/**
	 * 保存支付宝回调结果
	 *
	 * @param params
	 * @param result
	 */
	@Async
	@Override
	public void saveAliRecord(Map<String, String> params, String result) {
		PayNotifyRecord record = new PayNotifyRecord();
		String notifyId = params.get("notify_id");
		record.setNotifyId(notifyId);
		String orderNo = params.get("out_trade_no");
		record.setOrderNo(orderNo);
		record.setRequest(MapUtil.join(params, StrUtil.DASHED, StrUtil.DASHED));
		record.setResponse(result);
		this.baseMapper.insert(record);
	}
}
