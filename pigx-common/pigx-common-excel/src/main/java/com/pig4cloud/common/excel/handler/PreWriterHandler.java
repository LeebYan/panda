package com.pig4cloud.common.excel.handler;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.event.WriteHandler;
import com.alibaba.excel.metadata.BaseRowModel;
import com.pig4cloud.common.excel.annotation.CellStyleFormat;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFFont;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * excel写入预处理器，支持生成Excel2007版本样式
 * 参考 https://github.com/alibaba/easyexcel/issues/205
 *
 * @author lishangbu
 * @date 2019-06-12
 */
public class PreWriterHandler<T extends Class<? extends BaseRowModel>> implements WriteHandler {

	private T rowModel;

	private Map<Integer, CellStyleFormat> colStyleFormat = new HashMap<>();

	private Map<Integer, CellStyle> colStyle = new HashMap<>();

	private Map<String, String> infos = new HashMap<>();

	public static final String TITLE_NUM = "title_num";

	public PreWriterHandler(T rowModel) {
		this.rowModel = rowModel;
		init(rowModel);
	}

	private void init(T rowModel) {
		Field[] declaredFields = rowModel.getDeclaredFields();
		//查找有CellStyle注解和ExcelProperty注解的Field加入cellStyle
		int titleNum = 0;
		for (Field field : declaredFields) {
			CellStyleFormat cellStyle = field.getAnnotation(CellStyleFormat.class);
			ExcelProperty excelProperty = field.getAnnotation(ExcelProperty.class);
			if (excelProperty != null) {
				titleNum =Math.max(excelProperty.value().length, titleNum);
			}
			if (cellStyle == null || excelProperty == null) {
				continue;
			}
			colStyleFormat.put(excelProperty.index(), cellStyle);

		}
		infos.put(TITLE_NUM, String.valueOf(titleNum));
	}

	@Override
	public void sheet(int sheetNo, Sheet sheet) {
		// 只初始化一次
		if (sheetNo == 1) {
			colStyle = colStyleFormat.entrySet().stream()
					.collect(Collectors.toMap(Map.Entry::getKey, x -> {
								CellStyle cellStyle = sheet.getWorkbook().createCellStyle();
								CellStyleFormat value = x.getValue();
								//居中方式
								cellStyle.setVerticalAlignment(value.verticalAlignment());
								cellStyle.setAlignment(value.horizontalalignment());
								// 设置边框
								cellStyle.setBorderBottom(value.borderStyle());
								cellStyle.setBorderLeft(value.borderStyle());
								cellStyle.setBorderRight(value.borderStyle());
								cellStyle.setBorderTop(value.borderStyle());
								cellStyle.setBottomBorderColor(value.borderColor().getIndex());
								cellStyle.setLeftBorderColor(value.borderColor().getIndex());
								cellStyle.setRightBorderColor(value.borderColor().getIndex());
								cellStyle.setTopBorderColor(value.borderColor().getIndex());
								// 设置字体
								XSSFFont font = (XSSFFont) sheet.getWorkbook().createFont();
								font.setFontName(value.cellFont().fontName());
								font.setColor(value.cellFont().fontColor().getIndex());
								font.setFontHeightInPoints(value.cellFont().fontHeightInPoints());
								cellStyle.setFont(font);
								// 设置单元格是否换行
								cellStyle.setWrapText(value.warpText());
								// 背景颜色
								cellStyle.setFillBackgroundColor(value.fillBackgroundColor().getIndex());
								return cellStyle;
							},
							(u, v) -> v));
		}
	}

	@Override
	public void row(int rowNum, Row row) {

	}

	@Override
	public void cell(int cellNum, Cell cell) {
		CellStyle cellStyle = colStyle.get(cellNum);
		// 表头不操作 行序号是从0开始的
		if (cell.getRowIndex() <= Integer.valueOf(infos.get(TITLE_NUM))-1)  {
			return;
		}
		// 没有不操作
		if (cellStyle == null) {
			return;
		}
		//设置样式
		cell.setCellStyle(cellStyle);
	}
}