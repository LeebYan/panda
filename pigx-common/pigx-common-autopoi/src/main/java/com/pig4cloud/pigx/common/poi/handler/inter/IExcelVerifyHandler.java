package com.pig4cloud.pigx.common.poi.handler.inter;

import com.pig4cloud.pigx.common.poi.excel.entity.result.ExcelVerifyHanlderResult;

/**
 * 导入校验接口
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public interface IExcelVerifyHandler {

	/**
	 * 获取需要处理的字段,导入和导出统一处理了, 减少书写的字段
	 *
	 * @return
	 */
	String[] getNeedVerifyFields();

	/**
	 * 获取需要处理的字段,导入和导出统一处理了, 减少书写的字段
	 *
	 * @return
	 */
	void setNeedVerifyFields(String[] arr);

	/**
	 * 导出处理方法
	 *
	 * @param obj   当前对象
	 * @param name  当前字段名称
	 * @param value 当前值
	 * @return
	 */
	ExcelVerifyHanlderResult verifyHandler(Object obj, String name, Object value);

}
