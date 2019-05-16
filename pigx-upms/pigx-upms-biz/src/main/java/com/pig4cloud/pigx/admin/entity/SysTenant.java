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

package com.pig4cloud.pigx.admin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 租户
 *
 * @author lengleng
 * @date 2019-05-15 15:55:41
 */
@Data
@TableName("sys_tenant")
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "租户")
public class SysTenant extends Model<SysTenant> {
	private static final long serialVersionUID = 1L;

	/**
	 * 租户id
	 */
	@TableId
	private Integer id;
	/**
	 * 租户名称
	 */
	private String name;
	/**
	 * 租户编号
	 */
	private String code;
	/**
	 * 开始时间
	 */
	private LocalDate startTime;
	/**
	 * 结束时间
	 */
	private LocalDate endTime;
	/**
	 * 0正常 9-冻结
	 */
	private String status;
	/**
	 * 删除标记
	 */
	@TableLogic
	private String delFlag;
	/**
	 * 创建
	 */
	private LocalDateTime createTime;
	/**
	 * 更新时间
	 */
	private LocalDateTime updateTime;

}
