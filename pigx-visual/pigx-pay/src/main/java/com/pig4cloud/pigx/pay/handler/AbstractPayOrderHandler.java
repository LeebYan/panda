package com.pig4cloud.pigx.pay.handler;

import com.pig4cloud.common.sequence.sequence.Sequence;
import com.pig4cloud.pigx.pay.entity.PayGoodsOrder;
import com.pig4cloud.pigx.pay.entity.PayTradeOrder;
import com.pig4cloud.pigx.pay.service.PayGoodsOrderService;
import com.pig4cloud.pigx.pay.utils.OrderStatusEnum;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author lengleng
 * @date 2019-05-31
 */
public abstract class AbstractPayOrderHandler implements PayOrderHandler {
	@Autowired
	private PayGoodsOrderService goodsOrderService;
	@Autowired
	private Sequence paySequence;


	/**
	 * 创建商品订单
	 *
	 * @param goodsOrder 商品订单
	 * @return
	 */
	@Override
	public void createGoodsOrder(PayGoodsOrder goodsOrder) {
		goodsOrder.setPayOrderId(paySequence.nextNo());
		goodsOrder.setStatus(OrderStatusEnum.INIT.getStatus());
		goodsOrderService.save(goodsOrder);
	}

	/**
	 * 调用入口
	 */
	@Override
	public void handle(PayGoodsOrder payGoodsOrder) {
		createGoodsOrder(payGoodsOrder);
		PayTradeOrder tradeOrder = createTradeOrder(payGoodsOrder);
		pay(payGoodsOrder, tradeOrder);
		updateOrder(payGoodsOrder, tradeOrder);
	}
}
