package com.pig4cloud.pigx.pay.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author lengleng
 * @date 2019-05-30
 * <p>
 * 支付渠道名称
 */
@Getter
@AllArgsConstructor
public enum PayChannelNameEnum {
	/**
	 * 支付宝
	 */
	ALIPAY("alipay", "支付宝"),

	/**
	 * 微信支付
	 */
	WXPAY("wxpay", "微信支付"),

	/**
	 * 微信服务商支付
	 */
	WESUBPAY("wxsubpay", "微信服务商支付");

	/**
	 * 名称
	 */
	private String name;
	/**
	 * 描述
	 */
	private String description;
}
