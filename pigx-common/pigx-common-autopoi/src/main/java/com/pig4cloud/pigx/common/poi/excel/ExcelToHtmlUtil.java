package com.pig4cloud.pigx.common.poi.excel;

import com.pig4cloud.pigx.common.poi.excel.html.ExcelToHtmlServer;
import org.apache.poi.ss.usermodel.Workbook;

/**
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * Excel 变成界面
 */
public final class ExcelToHtmlUtil {

	private ExcelToHtmlUtil() {
	}

	/**
	 * 转换成为Table
	 *
	 * @param wb Excel
	 * @return
	 */
	public static String toTableHtml(Workbook wb) {
		return new ExcelToHtmlServer(wb, false, 0).printPage();
	}

	/**
	 * 转换成为Table
	 *
	 * @param wb       Excel
	 * @param sheetNum sheetNum
	 * @return
	 */
	public static String toTableHtml(Workbook wb, int sheetNum) {
		return new ExcelToHtmlServer(wb, false, sheetNum).printPage();
	}

	/**
	 * 转换成为完整界面
	 *
	 * @param wb Excel
	 * @return
	 */
	public static String toAllHtml(Workbook wb) {
		return new ExcelToHtmlServer(wb, true, 0).printPage();
	}

	/**
	 * 转换成为完整界面
	 *
	 * @param wb       Excel
	 * @param sheetNum sheetNum
	 * @return
	 */
	public static String toAllHtml(Workbook wb, int sheetNum) {
		return new ExcelToHtmlServer(wb, true, sheetNum).printPage();
	}

}
