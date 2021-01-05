package com.pig4cloud.pigx.pay.handler.impl;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.ijpay.wxpay.WxPayApiConfigKit;
import com.pig4cloud.pigx.pay.config.PayCommonProperties;
import com.pig4cloud.pigx.pay.entity.PayGoodsOrder;
import com.pig4cloud.pigx.pay.entity.PayTradeOrder;
import com.pig4cloud.pigx.pay.mapper.PayGoodsOrderMapper;
import com.pig4cloud.pigx.pay.mapper.PayTradeOrderMapper;
import com.pig4cloud.pigx.pay.utils.OrderStatusEnum;
import com.pig4cloud.pigx.pay.utils.PayChannelNameEnum;
import com.yungouos.pay.merge.MergePay;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author lengleng
 * @date 2021/1/4
 * <p>
 * https://open.pay.yungouos.com/#/api/api/pay/merge/nativePay
 * 服务商聚合支付模式
 */
@Slf4j
@Service("MERGE_PAY")
@RequiredArgsConstructor
public class YungouosMergePayOrderHandler extends AbstractPayOrderHandler {

	private final PayCommonProperties commonProperties;

	private final PayTradeOrderMapper tradeOrderMapper;

	private final PayGoodsOrderMapper goodsOrderMapper;

	private final HttpServletRequest request;

	/**
	 * 创建交易订单
	 *
	 * @param goodsOrder 商品订单
	 * @return
	 */
	@Override
	public PayTradeOrder createTradeOrder(PayGoodsOrder goodsOrder) {
		PayTradeOrder tradeOrder = new PayTradeOrder();
		tradeOrder.setOrderId(goodsOrder.getPayOrderId());
		tradeOrder.setAmount(goodsOrder.getAmount());
		tradeOrder.setChannelId(PayChannelNameEnum.MERGE_PAY.getName());
		tradeOrder.setChannelMchId(WxPayApiConfigKit.getWxPayApiConfig().getMchId());
		tradeOrder.setClientIp(ServletUtil.getClientIP(request));
		tradeOrder.setCurrency("CNY");
		tradeOrder.setStatus(OrderStatusEnum.INIT.getStatus());
		tradeOrder.setBody(goodsOrder.getGoodsName());
		tradeOrderMapper.insert(tradeOrder);
		return tradeOrder;
	}

	/**
	 * 调起渠道支付
	 *
	 * @param goodsOrder 商品订单
	 * @param tradeOrder 交易订单
	 * @return obj
	 */
	@Override
	public Object pay(PayGoodsOrder goodsOrder, PayTradeOrder tradeOrder) {
		String money = NumberUtil.div(tradeOrder.getAmount(), "100", 2).toString();
		return MergePay.nativePay(tradeOrder.getOrderId(), money, "100106279016"
				, tradeOrder.getBody()
				, "1"
				, tradeOrder.getBody()
				, commonProperties.getMergePayConfig().getNotifyUrl()
				, commonProperties.getMergePayConfig().getReturnUrl()
				, ""
				, ""
				, ""
				, "759492493EBC43B498955E261E1A494F");
	}

	/**
	 * 更新订单信息
	 *
	 * @param goodsOrder 商品订单
	 * @param tradeOrder 交易订单
	 */
	@Override
	public void updateOrder(PayGoodsOrder goodsOrder, PayTradeOrder tradeOrder) {
		tradeOrderMapper.updateById(tradeOrder);
		goodsOrderMapper.updateById(goodsOrder);
	}
}
