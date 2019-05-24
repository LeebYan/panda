package com.pig4cloud.pigx.common.poi.excel.entity.sax;

import com.pig4cloud.pigx.common.poi.excel.entity.enmus.CellValueType;

/**
 * Cell 对象
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public class SaxReadCellEntity {
	/**
	 * 值类型
	 */
	private CellValueType cellType;
	/**
	 * 值
	 */
	private Object value;

	public SaxReadCellEntity(CellValueType cellType, Object value) {
		this.cellType = cellType;
		this.value = value;
	}

	public CellValueType getCellType() {
		return cellType;
	}

	public void setCellType(CellValueType cellType) {
		this.cellType = cellType;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "[type=" + cellType.toString() + ",value=" + value + "]";
	}

}
