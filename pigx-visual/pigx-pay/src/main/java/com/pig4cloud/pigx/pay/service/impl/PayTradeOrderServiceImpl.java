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

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pigx.pay.entity.PayTradeOrder;
import com.pig4cloud.pigx.pay.mapper.PayTradeOrderMapper;
import com.pig4cloud.pigx.pay.service.PayTradeOrderService;
import com.pig4cloud.pigx.pay.utils.PayConstants;
import com.pig4cloud.pigx.pay.utils.TradeStatusEnum;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * 支付
 *
 * @author lengleng
 * @date 2019-05-28 23:58:18
 */
@Service
public class PayTradeOrderServiceImpl extends ServiceImpl<PayTradeOrderMapper, PayTradeOrder> implements PayTradeOrderService {

	/**
	 * 更新支付订单
	 *
	 * @param params
	 */
	@Async
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateOrder(Map<String, String> params) {
		PayTradeOrder payTradeOrder = this.baseMapper.selectById(params.get(PayConstants.OUT_TRADE_NO));
		payTradeOrder.setStatus(TradeStatusEnum.TRADE_SUCCESS.getStatus());
		payTradeOrder.setChannelOrderNo(params.get("trade_no"));
		this.baseMapper.updateById(payTradeOrder);
	}
}
