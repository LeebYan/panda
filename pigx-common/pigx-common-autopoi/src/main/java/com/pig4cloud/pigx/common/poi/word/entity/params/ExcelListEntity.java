package com.pig4cloud.pigx.common.poi.word.entity.params;

import com.pig4cloud.pigx.common.poi.excel.entity.ExcelBaseParams;
import com.pig4cloud.pigx.common.poi.handler.inter.IExcelDataHandler;

import java.util.List;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * Excel 导出对象
 */
public class ExcelListEntity extends ExcelBaseParams {

	/**
	 * 数据源
	 */
	private List<?> list;

	/**
	 * 实体类对象
	 */
	private Class<?> clazz;

	/**
	 * 表头行数
	 */
	private int headRows = 1;

	public ExcelListEntity() {

	}

	public ExcelListEntity(List<?> list, Class<?> clazz) {
		this.list = list;
		this.clazz = clazz;
	}

	public ExcelListEntity(List<?> list, Class<?> clazz, IExcelDataHandler dataHanlder) {
		this.list = list;
		this.clazz = clazz;
		setDataHanlder(dataHanlder);
	}

	public ExcelListEntity(List<?> list, Class<?> clazz, IExcelDataHandler dataHanlder, int headRows) {
		this.list = list;
		this.clazz = clazz;
		this.headRows = headRows;
		setDataHanlder(dataHanlder);
	}

	public ExcelListEntity(List<?> list, Class<?> clazz, int headRows) {
		this.list = list;
		this.clazz = clazz;
		this.headRows = headRows;
	}

	public Class<?> getClazz() {
		return clazz;
	}

	public int getHeadRows() {
		return headRows;
	}

	public List<?> getList() {
		return list;
	}

	public void setClazz(Class<?> clazz) {
		this.clazz = clazz;
	}

	public void setHeadRows(int headRows) {
		this.headRows = headRows;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

}
