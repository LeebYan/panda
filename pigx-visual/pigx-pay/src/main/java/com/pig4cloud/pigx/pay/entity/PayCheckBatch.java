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
 * 批量对账
 *
 * @author lengleng
 * @date 2019-05-28 23:57:38
 */
@Data
@TableName("pay_check_batch")
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "批量对账")
public class PayCheckBatch extends Model<PayCheckBatch> {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 *
	 */
	private String status;
	/**
	 *
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
	private String billType;
	/**
	 *
	 */
	private String handleStatus;
	/**
	 *
	 */
	private String bankType;
	/**
	 *
	 */
	private Integer mistakeCount;
	/**
	 *
	 */
	private Integer unhandleMistakeCount;
	/**
	 *
	 */
	private Integer tradeCount;
	/**
	 *
	 */
	private Integer bankTradeCount;
	/**
	 *
	 */
	private BigDecimal tradeAmount;
	/**
	 *
	 */
	private BigDecimal bankTradeAmount;
	/**
	 *
	 */
	private BigDecimal refundAmount;
	/**
	 *
	 */
	private BigDecimal bankRefundAmount;
	/**
	 *
	 */
	private BigDecimal bankFee;
	/**
	 *
	 */
	private String orgCheckFilePath;
	/**
	 *
	 */
	private String releaseCheckFilePath;
	/**
	 *
	 */
	private String releaseStatus;
	/**
	 *
	 */
	private String checkFailMsg;
	/**
	 *
	 */
	private String bankErrMsg;
	/**
	 *
	 */
	@TableLogic
	private String delFlag;
	/**
	 *
	 */
	private LocalDateTime createTime;
	/**
	 *
	 */
	private LocalDateTime updateTime;
	/**
	 * 租户ID
	 */
	private Integer tenantId;

}
