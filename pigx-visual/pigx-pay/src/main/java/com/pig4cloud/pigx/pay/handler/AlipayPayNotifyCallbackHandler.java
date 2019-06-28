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

package com.pig4cloud.pigx.pay.handler;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.jpay.alipay.AliPayApiConfig;
import com.jpay.alipay.AliPayApiConfigKit;
import com.pig4cloud.pigx.pay.entity.PayNotifyRecord;
import com.pig4cloud.pigx.pay.service.PayGoodsOrderService;
import com.pig4cloud.pigx.pay.service.PayNotifyRecordService;
import com.pig4cloud.pigx.pay.service.PayTradeOrderService;
import com.pig4cloud.pigx.pay.utils.PayConstants;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author lengleng
 * @date 2019-06-27
 * <p>
 * 支付宝回调处理
 */
@Slf4j
@AllArgsConstructor
@Service("alipayCallback")
public class AlipayPayNotifyCallbackHandler extends AbstractPayNotifyCallbakHandler {
	private final MessageDuplicateCheckerHandler duplicateCheckerHandler;
	private final PayTradeOrderService tradeOrderService;
	private final PayGoodsOrderService goodsOrderService;
	private final PayNotifyRecordService recordService;

	/**
	 * 去重处理
	 *
	 * @param params 回调报文
	 * @return
	 */
	@Override
	public Boolean duplicateChecker(Map<String, String> params) {
		// 判断10秒内是否已经回调处理
		if (!duplicateCheckerHandler.isDuplicate(params.get(PayConstants.OUT_TRADE_NO))) {
			log.warn("支付宝订单重复回调 {} 不做处理", params);
			this.saveNotifyRecord(params, "重复回调");
			return true;
		}
		return false;
	}

	/**
	 * 验签逻辑
	 *
	 * @param params 回调报文
	 * @return
	 */
	@Override
	public Boolean verifyNotify(Map<String, String> params) {
		String callReq = MapUtil.join(params, StrUtil.DASHED, StrUtil.DASHED);
		log.info("支付宝发起回调 报文: {}", callReq);
		String appId = params.get("app_id");

		if (StrUtil.isBlank(appId)) {
			log.warn("支付宝回调报文 appid 为空 {}", callReq);
			return false;
		}

		AliPayApiConfig apiConfig = AliPayApiConfigKit.getApiConfig(appId);
		if (apiConfig == null) {
			log.warn("支付宝回调报文 appid 不合法 {}", callReq);
			return false;
		}

		try {
			return AlipaySignature.rsaCheckV1(params, apiConfig.getAlipayPublicKey()
					, CharsetUtil.UTF_8, "RSA2");
		} catch (AlipayApiException e) {
			log.error("支付宝验签失败", e);
			return false;
		}
	}

	/**
	 * 解析报文
	 *
	 * @param params 回调报文
	 * @return
	 */
	@Override
	public String parse(Map<String, String> params) {

		goodsOrderService.updateOrder(params);
		tradeOrderService.updateOrder(params);

		return "success";
	}

	/**
	 * 保存回调记录
	 *
	 * @param result 处理结果
	 * @param params 回调报文
	 */
	@Override
	public void saveNotifyRecord(Map<String, String> params, String result) {
		PayNotifyRecord record = new PayNotifyRecord();
		String notifyId = params.get("notify_id");
		record.setNotifyId(notifyId);
		String orderNo = params.get("out_trade_no");
		record.setOrderNo(orderNo);
		record.setRequest(MapUtil.join(params, StrUtil.DASHED, StrUtil.DASHED));
		record.setResponse(result);
		recordService.save(record);
	}
}
