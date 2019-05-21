package com.pig4cloud.pigx.common.poi.excel.entity;

import com.pig4cloud.pigx.common.poi.excel.export.styler.ExcelExportStylerDefaultImpl;
import lombok.Data;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * 模板导出参数设置
 */
@Data
public class TemplateExportParams extends ExcelBaseParams {

	/**
	 * 输出全部的sheet
	 */
	private boolean scanAllsheet = false;
	/**
	 * 模板的路径
	 */
	private String templateUrl;

	/**
	 * 需要导出的第几个 sheetNum,默认是第0个
	 */
	private Integer[] sheetNum = new Integer[]{0};

	/**
	 * 这只sheetName 不填就使用原来的
	 */
	private String[] sheetName;

	/**
	 * 表格列标题行数,默认1
	 */
	private int headingRows = 1;

	/**
	 * 表格列标题开始行,默认1
	 */
	private int headingStartRow = 1;
	/**
	 * 设置数据源的NUM
	 */
	private int dataSheetNum = 0;
	/**
	 * Excel 导出style
	 */
	private Class<?> style = ExcelExportStylerDefaultImpl.class;
	/**
	 * FOR EACH 用到的局部变量
	 */
	private String tempParams = "t";

	/**
	 * 默认构造器
	 */
	public TemplateExportParams() {

	}

	/**
	 * 构造器
	 *
	 * @param templateUrl  模板路径
	 * @param scanAllsheet 是否输出全部的sheet
	 * @param sheetName    sheet的名称,可不填
	 */
	public TemplateExportParams(String templateUrl, boolean scanAllsheet, String... sheetName) {
		this.templateUrl = templateUrl;
		this.scanAllsheet = scanAllsheet;
		if (sheetName != null && sheetName.length > 0) {
			this.sheetName = sheetName;

		}
	}

	/**
	 * 构造器
	 *
	 * @param templateUrl 模板路径
	 * @param sheetNum    sheet 的位置,可不填
	 */
	public TemplateExportParams(String templateUrl, Integer... sheetNum) {
		this.templateUrl = templateUrl;
		if (sheetNum != null && sheetNum.length > 0) {
			this.sheetNum = sheetNum;
		}
	}

	/**
	 * 单个sheet输出构造器
	 *
	 * @param templateUrl 模板路径
	 * @param sheetName   sheet的名称
	 * @param sheetNum    sheet的位置,可不填
	 */
	public TemplateExportParams(String templateUrl, String sheetName, Integer... sheetNum) {
		this.templateUrl = templateUrl;
		this.sheetName = new String[]{sheetName};
		if (sheetNum != null && sheetNum.length > 0) {
			this.sheetNum = sheetNum;
		}
	}

}
