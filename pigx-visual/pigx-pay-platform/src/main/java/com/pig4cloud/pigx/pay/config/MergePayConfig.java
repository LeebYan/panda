package com.pig4cloud.pigx.pay.config;

import lombok.Data;

/**
 * @author lengleng
 * @date 2021/1/4
 * <p>
 * 聚合支付
 */
@Data
public class MergePayConfig {
	/**
	 * 前端回调地址
	 */
	private String returnUrl;

	/**
	 * 服务端回调地址
	 */
	private String notifyUrl;
}
