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

package com.pig4cloud.pigx.admin.api.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 文件管理
 *
 * @author Luckly
 * @date 2019-06-18 17:18:42
 */
@Data
@TableName("sys_file")
@EqualsAndHashCode(callSuper = true)
@ApiModel(description = "文件管理")
public class SysFile extends Model<SysFile> {
	private static final long serialVersionUID = 1L;

	/**
	 * 编号
	 */
	@TableId
	private String id;
	/**
	 * 文件名
	 */
	@TableField("`file_name`")
	private String name;
	/**
	 * 保存路径
	 */
	private String path;
	/**
	 * 绝对路径
	 */
	private String absolutePath;
	/**
	 * 上传服务器前缀地址
	 */
	private String prefix;
	/**
	 * 原文件名
	 */
	private String original;
	/**
	 * MD5值
	 */
	private String md5;
	/**
	 * 后缀名
	 */
	private String suffix;
	/**
	 * 文件类型
	 */
	private String type;
	/**
	 * 文件大小
	 */
	@TableField("`file_size`")
	private Long fileSize;
	/**
	 * 显示大小
	 */
	private String displaySize;
	/**
	 * 上传人
	 */
	private String createUser;
	/**
	 * 上传时间
	 */
	private LocalDateTime createTime;
	/**
	 * 更新人
	 */
	private String updateUser;
	/**
	 * 更新时间
	 */
	private LocalDateTime updateTime;
	/**
	 * 删除标识：1-删除，0-正常
	 */
	@TableLogic
	private Integer delFlag;
}
