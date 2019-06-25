package com.pig4cloud.pigx.pay.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author lengleng
 * @date 2019-06-14
 */
@Getter
@AllArgsConstructor
public enum TradeStatusEnum {
	/**
	 * 交易完成
	 */
	WAIT_BUYER_PAY("TRADE_FINISHED", OrderStatusEnum.INIT.getStatus()),

	/**
	 * TRADE_CLOSED
	 */
	TRADE_CLOSED("TRADE_CLOSED", OrderStatusEnum.FAIL.getStatus()),

	/**
	 * TRADE_SUCCESS
	 */
	TRADE_SUCCESS("TRADE_SUCCESS", OrderStatusEnum.SUCCESS.getStatus()),

	/**
	 * 交易关闭
	 */
	TRADE_FINISHED("TRADE_FINISHED", OrderStatusEnum.COMPLETE.getStatus());


	/**
	 * 描述
	 */
	private String description;
	/**
	 * 描述
	 */
	private Integer status;
}