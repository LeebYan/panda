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
package com.pig4cloud.pigx.common.poi.excel.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * Excel 导入校验
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface ExcelVerify {
	/**
	 * 接口校验
	 * 
	 * @return
	 */
	boolean interHandler() default false;

	/**
	 * 是电子邮件
	 * 
	 * @return
	 */
	boolean isEmail() default false;

	/**
	 * 是13位移动电话
	 * 
	 * @return
	 */
	boolean isMobile() default false;

	/**
	 * 是座机号码
	 * 
	 * @return
	 */
	boolean isTel() default false;

	/**
	 * 最大长度
	 * 
	 * @return
	 */
	int maxLength() default -1;

	/**
	 * 最小长度
	 * 
	 * @return
	 */
	int minLength() default -1;

	/**
	 * 不允许空
	 * 
	 * @return
	 */
	boolean notNull() default false;

	/**
	 * 正在表达式
	 * 
	 * @return
	 */
	String regex() default "";

	/**
	 * 正在表达式,错误提示信息
	 * 
	 * @return
	 */
	String regexTip() default "数据不符合规范";

}
