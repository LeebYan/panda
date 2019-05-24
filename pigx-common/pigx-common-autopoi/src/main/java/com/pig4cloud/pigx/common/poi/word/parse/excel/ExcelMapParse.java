package com.pig4cloud.pigx.common.poi.word.parse.excel;

import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import com.pig4cloud.pigx.common.poi.util.PoiPublicUtil;

import java.util.List;

/**
 * 处理和生成Map 类型的数据变成表格
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public final class ExcelMapParse {

	/**
	 * 解析参数行,获取参数列表
	 *
	 * @param currentRow
	 * @return
	 */
	private static String[] parseCurrentRowGetParams(XWPFTableRow currentRow) {
		List<XWPFTableCell> cells = currentRow.getTableCells();
		String[] params = new String[cells.size()];
		String text;
		for (int i = 0; i < cells.size(); i++) {
			text = cells.get(i).getText();
			params[i] = text == null ? "" : text.trim().replace("{{", "").replace("}}", "");
		}
		return params;
	}

	/**
	 * 解析下一行,并且生成更多的行
	 *
	 * @param table
	 * @param index
	 * @param list
	 * @throws Exception
	 */
	public static void parseNextRowAndAddRow(XWPFTable table, int index, List<Object> list) throws Exception {
		XWPFTableRow currentRow = table.getRow(index);
		String[] params = parseCurrentRowGetParams(currentRow);
		table.removeRow(index);// 移除这一行
		int cellIndex = 0;// 创建完成对象一行好像多了一个cell
		for (Object obj : list) {
			currentRow = table.createRow();
			for (cellIndex = 0; cellIndex < currentRow.getTableCells().size(); cellIndex++) {
				currentRow.getTableCells().get(cellIndex).setText(PoiPublicUtil.getValueDoWhile(obj, params[cellIndex].split("\\."), 0).toString());
			}
			for (; cellIndex < params.length; cellIndex++) {
				currentRow.createCell().setText(PoiPublicUtil.getValueDoWhile(obj, params[cellIndex].split("\\."), 0).toString());
			}
		}

	}

}
