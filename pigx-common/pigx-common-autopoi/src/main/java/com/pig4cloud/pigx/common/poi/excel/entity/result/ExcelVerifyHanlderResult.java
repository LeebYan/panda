package com.pig4cloud.pigx.common.poi.excel.entity.result;

/**
 * Excel导入处理返回结果
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public class ExcelVerifyHanlderResult {
	/**
	 * 是否正确
	 */
	private boolean success;
	/**
	 * 错误信息
	 */
	private String msg;

	public ExcelVerifyHanlderResult() {

	}

	public ExcelVerifyHanlderResult(boolean success) {
		this.success = success;
	}

	public ExcelVerifyHanlderResult(boolean success, String msg) {
		this.success = success;
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
