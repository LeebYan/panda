package com.pig4cloud.pigx.common.poi.excel.entity;

import lombok.Data;
import org.apache.poi.hssf.util.HSSFColor;
import com.pig4cloud.pigx.common.poi.excel.entity.enmus.ExcelType;
import com.pig4cloud.pigx.common.poi.excel.export.styler.ExcelExportStylerDefaultImpl;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * Excel 导出参数
 */
@Data
public class ExportParams extends ExcelBaseParams {

	/**
	 * 表格名称
	 */
	private String title;

	/**
	 * 表格名称
	 */
	private short titleHeight = 10;

	/**
	 * 第二行名称
	 */
	private String secondTitle;

	/**
	 * 表格名称
	 */
	private short secondTitleHeight = 8;
	/**
	 * sheetName
	 */
	private String sheetName;
	/**
	 * 过滤的属性
	 */
	private String[] exclusions;
	/**
	 * 是否添加需要需要
	 */
	private boolean addIndex;
	/**
	 * 是否添加需要需要
	 */
	private String indexName = "序号";
	/**
	 * 冰冻列
	 */
	private int freezeCol;
	/**
	 * 表头颜色
	 */
	private short color = HSSFColor.WHITE.index;
	/**
	 * 属性说明行的颜色 例如:HSSFColor.SKY_BLUE.index 默认
	 */
	private short headerColor = HSSFColor.SKY_BLUE.index;
	/**
	 * Excel 导出版本
	 */
	private ExcelType type = ExcelType.HSSF;
	/**
	 * Excel 导出style
	 */
	private Class<?> style = ExcelExportStylerDefaultImpl.class;
	/**
	 * 是否创建表头
	 */
	private boolean isCreateHeadRows = true;

	public ExportParams() {

	}

	public ExportParams(String title, String sheetName) {
		this.title = title;
		this.sheetName = sheetName;
	}

	public ExportParams(String title, String sheetName, ExcelType type) {
		this.title = title;
		this.sheetName = sheetName;
		this.type = type;
	}

	public ExportParams(String title, String secondTitle, String sheetName) {
		this.title = title;
		this.secondTitle = secondTitle;
		this.sheetName = sheetName;
	}

	public short getSecondTitleHeight() {
		return (short) (secondTitleHeight * 50);
	}

	public short getTitleHeight() {
		return (short) (titleHeight * 50);
	}

}
