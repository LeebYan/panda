package com.pig4cloud.pigx.pay.handler;

import cn.hutool.extra.servlet.ServletUtil;
import com.alipay.api.AlipayApiException;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.jpay.alipay.AliPayApi;
import com.pig4cloud.pigx.common.data.tenant.TenantContextHolder;
import com.pig4cloud.pigx.pay.entity.PayGoodsOrder;
import com.pig4cloud.pigx.pay.entity.PayTradeOrder;
import com.pig4cloud.pigx.pay.service.PayGoodsOrderService;
import com.pig4cloud.pigx.pay.service.PayTradeOrderService;
import com.pig4cloud.pigx.pay.utils.OrderStatusEnum;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author lengleng
 * @date 2019-05-31
 * <p>
 * 支付宝手机支付
 */
@Slf4j
@Service("ALIPAY_WAP")
@AllArgsConstructor
public class AlipayWapPayOrderHandler extends AbstractPayOrderHandler {
	private final PayTradeOrderService tradeOrderService;
	private final PayGoodsOrderService goodsOrderService;
	private final HttpServletRequest request;
	private final HttpServletResponse response;

	/**
	 * 创建交易订单
	 *
	 * @param goodsOrder
	 * @return
	 */
	@Override
	public PayTradeOrder createTradeOrder(PayGoodsOrder goodsOrder) {
		PayTradeOrder tradeOrder = new PayTradeOrder();
		tradeOrder.setOrderId(goodsOrder.getPayOrderId());
		tradeOrder.setAmount(goodsOrder.getAmount());
		tradeOrder.setChannelId("ALIPAY_WAP");
		tradeOrder.setChannelMchId("1517584931");
		tradeOrder.setClientIp(ServletUtil.getClientIP(request));
		tradeOrder.setCurrency("cny");
		tradeOrder.setExpireTime(30L);
		tradeOrder.setStatus(OrderStatusEnum.INIT.getStatus());
		tradeOrder.setBody("测试商品");
		tradeOrderService.save(tradeOrder);
		return tradeOrder;
	}

	/**
	 * 调起渠道支付
	 *
	 * @param goodsOrder 商品订单
	 * @param tradeOrder 交易订单
	 */
	@Override
	public PayTradeOrder pay(PayGoodsOrder goodsOrder, PayTradeOrder tradeOrder) {
		AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
		model.setBody(tradeOrder.getBody());
		model.setSubject(tradeOrder.getBody());
		model.setOutTradeNo(tradeOrder.getOrderId());
		model.setTimeoutExpress(tradeOrder.getExpireTime() + "m");
		model.setTotalAmount(String.valueOf(tradeOrder.getAmount()));
		model.setPassbackParams(String.valueOf(TenantContextHolder.getTenantId()));
		model.setProductCode(goodsOrder.getGoodsId());
		try {
			AliPayApi.wapPay(response, model, "http://www.baidu.com", "/alipay/notify_url");
		} catch (AlipayApiException e) {
			log.warn("支付宝支付失败 {} {}", e.getErrCode(), e.getErrMsg());
			tradeOrder.setErrMsg(e.getErrMsg());
			tradeOrder.setErrCode(e.getErrCode());
			tradeOrder.setStatus(OrderStatusEnum.FAIL.getStatus());
			goodsOrder.setStatus(OrderStatusEnum.FAIL.getStatus());
		} catch (IOException e) {
			log.error("支付宝手机支付失败", e);
			tradeOrder.setErrMsg(e.getMessage());
			tradeOrder.setStatus(OrderStatusEnum.FAIL.getStatus());
			goodsOrder.setStatus(OrderStatusEnum.FAIL.getStatus());
		}
		return tradeOrder;
	}

	/**
	 * 更新订单信息
	 *
	 * @param goodsOrder 商品订单
	 * @param tradeOrder 交易订单
	 */
	@Override
	public void updateOrder(PayGoodsOrder goodsOrder, PayTradeOrder tradeOrder) {
		tradeOrderService.updateById(tradeOrder);
		goodsOrderService.updateById(goodsOrder);
	}
}
