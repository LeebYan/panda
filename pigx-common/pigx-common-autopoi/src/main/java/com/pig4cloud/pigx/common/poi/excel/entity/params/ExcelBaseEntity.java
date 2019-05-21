package com.pig4cloud.pigx.common.poi.excel.entity.params;

import lombok.Data;

import java.lang.reflect.Method;
import java.util.List;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * Excel 导入导出基础对象类
 */
@Data
public class ExcelBaseEntity {
	/**
	 * 对应name
	 */
	protected String name;
	/**
	 * 对应type
	 */
	private int type = 1;
	/**
	 * 数据库格式
	 */
	private String databaseFormat;
	/**
	 * 导出日期格式
	 */
	private String format;
	/**
	 * 替换值表达式 ："男_1","女_0"
	 */
	private String[] replace;
	/**
	 * 替换是否是替换多个值
	 */
	private boolean multiReplace;
	/**
	 * set/get方法
	 */
	private Method method;
	/**
	 * set/get方法
	 */
	private List<Method> methods;

}
