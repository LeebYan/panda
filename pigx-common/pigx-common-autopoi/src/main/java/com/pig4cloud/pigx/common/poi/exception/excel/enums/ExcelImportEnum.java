package com.pig4cloud.pigx.common.poi.exception.excel.enums;

/**
 * 导出异常类型枚举
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public enum ExcelImportEnum {

	GET_VALUE_ERROR("Excel值获取失败"),
	VERIFY_ERROR("值校验失败");

	private String msg;

	ExcelImportEnum(String msg) {
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
