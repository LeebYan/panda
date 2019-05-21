package com.pig4cloud.pigx.common.poi.exception.word.enmus;

/**
 * 导出异常枚举
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public enum WordExportEnum {

	EXCEL_PARAMS_ERROR("Excel导出参数错误"),
	EXCEL_HEAD_HAVA_NULL("Excel表头有的字段为空"),
	EXCEL_NO_HEAD("Excel没有表头");

	private String msg;

	WordExportEnum(String msg) {
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
