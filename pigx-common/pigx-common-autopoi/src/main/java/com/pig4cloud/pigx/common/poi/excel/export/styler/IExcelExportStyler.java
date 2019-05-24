package com.pig4cloud.pigx.common.poi.excel.export.styler;

import org.apache.poi.ss.usermodel.CellStyle;
import com.pig4cloud.pigx.common.poi.excel.entity.params.ExcelExportEntity;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * Excel导出样式接口
 */
public interface IExcelExportStyler {

	/**
	 * 列表头样式
	 * 
	 * @param headerColor
	 * @return
	 */
	public CellStyle getHeaderStyle(short headerColor);

	/**
	 * 标题样式
	 * 
	 * @param color
	 * @return
	 */
	public CellStyle getTitleStyle(short color);

	/**
	 * 获取样式方法
	 * 
	 * @param noneStyler
	 * @param entity
	 * @return
	 */
	public CellStyle getStyles(boolean noneStyler, ExcelExportEntity entity);

}
