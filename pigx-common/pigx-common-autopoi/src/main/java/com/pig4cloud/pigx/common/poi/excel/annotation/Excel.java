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
 * Excel 导出基本注释
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface Excel {

	/**
	 * 导出时间设置,如果字段是Date类型则不需要设置 数据库如果是string 类型,这个需要设置这个数据库格式
	 *
	 * @return 返回类型： String
	 */
	String databaseFormat() default "yyyyMMddHHmmss";

	/**
	 * 导出的时间格式,以这个是否为空来判断是否需要格式化日期
	 *
	 * @return 返回类型： String
	 */
	String exportFormat() default "";

	/**
	 * 时间格式,相当于同时设置了exportFormat 和 importFormat
	 *
	 * @return 返回类型： String
	 */
	String format() default "";

	/**
	 * 导出时在excel中每个列的高度 单位为字符，一个汉字=2个字符
	 *
	 * @return 返回类型： double
	 */
	double height() default 10;

	/**
	 * 导出类型 1 从file读取 2 是从数据库中读取 默认是文件 同样导入也是一样的
	 *
	 * @return 返回类型： int
	 */
	int imageType() default 1;

	/**
	 * 导入的时间格式,以这个是否为空来判断是否需要格式化日期
	 *
	 * @return 返回类型： String
	 */
	String importFormat() default "";

	/**
	 * 文字后缀,如% 90 变成90%
	 *
	 * @return 返回类型： String
	 */
	String suffix() default "";

	/**
	 * 是否换行 即支持\n
	 *
	 * @return 返回类型： boolean
	 */
	boolean isWrap() default true;

	/**
	 * 合并单元格依赖关系,比如第二列合并是基于第一列 则{1}就可以了
	 *
	 * @return 返回类型： int[]
	 */
	int[] mergeRely() default {};

	/**
	 * 纵向合并内容相同的单元格
	 *
	 * @return 返回类型： boolean
	 */
	boolean mergeVertical() default false;

	/**
	 * 导出时，对应数据库的字段 主要是用户区分每个字段， 不能有annocation重名的 导出时的列名
	 * 导出排序跟定义了annotation的字段的顺序有关 可以使用a_id,b_id来确实是否使用
	 *
	 * @return 返回类型： String
	 */
	String name();

	/**
	 * 是否需要纵向合并单元格(用于含有list中,单个的单元格,合并list创建的多个row)
	 *
	 * @return 返回类型： boolean
	 */
	boolean needMerge() default false;

	/**
	 * 展示到第几个可以使用a_id,b_id来确定不同排序
	 *
	 * @return 返回类型： String
	 */
	String orderNum() default "0";

	/**
	 * 值得替换 导出是{"男_1","女_0"} 导入反过来,所以只用写一个
	 *
	 * @return 返回类型： String[]
	 */
	String[] replace() default {};

	/**
	 * 导入路径,如果是图片可以填写,默认是upload/className/ IconEntity这个类对应的就是upload/Icon/
	 *
	 * @return 返回类型： String
	 */
	String savePath() default "upload";

	/**
	 * 导出类型 1 是文本 2 是图片,3是函数,4是数字 默认是文本
	 *
	 * @return 返回类型： int
	 */
	int type() default 1;

	/**
	 * 导出时在excel中每个列的宽 单位为字符，一个汉字=2个字符 如 以列名列内容中较合适的长度 例如姓名列6 【姓名一般三个字】
	 * 性别列4【男女占1，但是列标题两个汉字】 限制1-255
	 *
	 * @return 返回类型： double
	 */
	double width() default 10;

	/**
	 * 是否自动统计数据,如果是统计,true的话在最后追加一行统计,把所有数据都和 这个处理会吞没异常,请注意这一点
	 *
	 * @return 返回类型： boolean
	 */
	boolean isStatistics() default false;

	/**
	 * 数据字典表
	 *
	 * @return 返回类型： String
	 */
	String dictTable() default "";

	/**
	 * 数据code
	 *
	 * @return 返回类型： String
	 */
	String dicCode() default "";

	/**
	 * 数据Text
	 *
	 * @return 返回类型： String
	 */
	String dicText() default "";

	/**
	 * 导入数据是否需要转化
	 * 若是为true,则需要在pojo中加入 方法：convertset字段名(String text)
	 *
	 * @return 返回类型： boolean
	 */
	boolean importConvert() default false;

	/**
	 * 导出数据是否需要转化
	 * 若是为true,则需要在pojo中加入方法:convertget字段名()
	 *
	 * @return 返回类型： boolean
	 */
	boolean exportConvert() default false;

	/**
	 * 值的替换是否支持替换多个(默认true,若数据库值本来就包含逗号则需要配置该值为false)
	 *
	 * @return 返回类型： boolean
	 */
	boolean multiReplace() default true;
}
