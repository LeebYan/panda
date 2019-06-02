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

package com.pig4cloud.pigx.pay.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 差错
 *
 * @author lengleng
 * @date 2019-05-28 23:57:50
 */
@Data
@TableName("pay_check_mistake")
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "差错")
public class PayCheckMistake extends Model<PayCheckMistake> {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 * 商品名称
	 */
	private String productName;
	/**
	 * 订单号
	 */
	private String orderNo;
	/**
	 * 支付流水号
	 */
	private String trxNo;
	/**
	 * 银行订单号
	 */
	private String bankOrderNo;
	/**
	 * 银行流水号
	 */
	private String bankTrxNo;
	/**
	 * 订单金额
	 */
	private BigDecimal orderAmount;
	/**
	 * 平台收入
	 */
	private BigDecimal platIncome;
	/**
	 * 费率
	 */
	private BigDecimal feeRate;
	/**
	 * 平台成本
	 */
	private BigDecimal platCost;
	/**
	 * 平台利润
	 */
	private BigDecimal platProfit;
	/**
	 * 状态(参考枚举:paymentrecordstatusenum)
	 */
	private String status;
	/**
	 * 支付通道编号
	 */
	private String payWayCode;
	/**
	 * 支付通道名称
	 */
	private String payWayName;
	/**
	 * 支付成功时间
	 */
	private LocalDateTime paySuccessTime;
	/**
	 * 完成时间
	 */
	private LocalDateTime completeTime;
	/**
	 * 是否退款(100:是,101:否,默认值为:101)
	 */
	private String isRefund;
	/**
	 * 退款次数(默认值为:0)
	 */
	private Integer refundTimes;
	/**
	 * 成功退款总金额
	 */
	private BigDecimal successRefundAmount;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 *
	 */
	private String batchNo;
	/**
	 *
	 */
	private LocalDateTime billDate;
	/**
	 *
	 */
	private LocalDateTime createTime;
	/**
	 *
	 */
	private LocalDateTime updateTime;
	/**
	 *
	 */
	@TableLogic
	private String delFlag;
	/**
	 * 租户ID
	 */
	private Integer tenantId;

}
