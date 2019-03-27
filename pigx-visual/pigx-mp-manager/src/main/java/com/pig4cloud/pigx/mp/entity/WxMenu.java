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
package com.pig4cloud.pigx.mp.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 微信菜单表
 *
 * @author lengleng
 * @date 2019-03-27 20:45:18
 */
@Data
@TableName("t_wx_menu")
@EqualsAndHashCode(callSuper = true)
public class WxMenu extends Model<WxMenu> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Integer id;
	/**
	 * 父ID
	 */
	private String parentId;
	/**
	 * 菜单名称
	 */
	private String menuName;
	/**
	 * 菜单类型 1文本消息；2图文消息；3网址链接；4小程序
	 */
	private String menuType;
	/**
	 * 菜单等级
	 */
	private String menuLevel;
	/**
	 * 模板ID
	 */
	private String tplId;
	/**
	 * 菜单URL
	 */
	private String menuUrl;
	/**
	 * 排序
	 */
	private String menuSort;
	/**
	 * 微信账号ID
	 */
	private String wxAccountId;
	/**
	 * 小程序appid
	 */
	private String miniprogramAppid;
	/**
	 * 小程序页面路径
	 */
	private String miniprogramPagepath;
	/**
	 * 创建时间
	 */
	private LocalDateTime createTime;
	/**
	 * 更新时间
	 */
	private LocalDateTime updateTime;

}
