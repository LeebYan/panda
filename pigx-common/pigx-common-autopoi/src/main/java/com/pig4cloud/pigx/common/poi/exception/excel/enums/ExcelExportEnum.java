package com.pig4cloud.pigx.common.poi.exception.excel.enums;

/**
 * 导出异常类型枚举
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public enum ExcelExportEnum {

	PARAMETER_ERROR("Excel导出参数错误"),
	EXPORT_ERROR("Excel导出错误");

	private String msg;

	ExcelExportEnum(String msg) {
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
