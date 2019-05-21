package com.pig4cloud.pigx.common.poi.excel.entity;

import com.pig4cloud.pigx.common.poi.handler.inter.IExcelDataHandler;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * 基础参数
 */
public class ExcelBaseParams {

	/**
	 * 数据处理接口,以此为主,replace,format都在这后面
	 */
	private IExcelDataHandler dataHanlder;

	public IExcelDataHandler getDataHanlder() {
		return dataHanlder;
	}

	public void setDataHanlder(IExcelDataHandler dataHanlder) {
		this.dataHanlder = dataHanlder;
	}

}
