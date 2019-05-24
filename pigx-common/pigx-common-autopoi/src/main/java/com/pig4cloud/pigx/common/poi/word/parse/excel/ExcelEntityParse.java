package com.pig4cloud.pigx.common.poi.word.parse.excel;

import com.pig4cloud.pigx.common.poi.excel.annotation.ExcelTarget;
import com.pig4cloud.pigx.common.poi.excel.entity.params.ExcelExportEntity;
import com.pig4cloud.pigx.common.poi.excel.export.base.ExportBase;
import com.pig4cloud.pigx.common.poi.exception.word.WordExportException;
import com.pig4cloud.pigx.common.poi.exception.word.enmus.WordExportEnum;
import com.pig4cloud.pigx.common.poi.util.PoiPublicUtil;
import com.pig4cloud.pigx.common.poi.word.entity.params.ExcelListEntity;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import java.lang.reflect.Field;
import java.util.*;

/**
 * 解析实体类对象 复用注解
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Slf4j
public class ExcelEntityParse extends ExportBase {

	private static void checkExcelParams(ExcelListEntity entity) {
		if (entity.getList() == null || entity.getClazz() == null) {
			throw new WordExportException(WordExportEnum.EXCEL_PARAMS_ERROR);
		}

	}

	/**
	 * createCells
	 *
	 * @param index
	 * @param t
	 * @param excelParams
	 * @param table
	 * @param rowHeight
	 * @return
	 * @throws Exception
	 */
	private int createCells(int index, Object t, List<ExcelExportEntity> excelParams, XWPFTable table, short rowHeight) throws Exception {
		ExcelExportEntity entity;
		XWPFTableRow row = table.createRow();
		row.setHeight(rowHeight);
		int maxHeight = 1, cellNum = 0;
		for (int k = 0, paramSize = excelParams.size(); k < paramSize; k++) {
			entity = excelParams.get(k);
			if (entity.getList() != null) {
				Collection<?> list = (Collection<?>) entity.getMethod().invoke(t, new Object[] {});
				int listC = 0;
				for (Object obj : list) {
					createListCells(index + listC, cellNum, obj, entity.getList(), table);
					listC++;
				}
				cellNum += entity.getList().size();
				if (list != null && list.size() > maxHeight) {
					maxHeight = list.size();
				}
			} else {
				Object value = getCellValue(entity, t);
				if (entity.getType() == 1) {
					setCellValue(row, value, cellNum++);
				}
			}
		}
		// 合并需要合并的单元格
		cellNum = 0;
		for (int k = 0, paramSize = excelParams.size(); k < paramSize; k++) {
			entity = excelParams.get(k);
			if (entity.getList() != null) {
				cellNum += entity.getList().size();
			} else if (entity.isNeedMerge()) {
				table.setCellMargins(index, index + maxHeight - 1, cellNum, cellNum);
				cellNum++;
			}
		}
		return maxHeight;
	}

	/**
	 * 创建List之后的各个Cells
	 *
	 * @param index
	 * @param cellNum
	 * @param obj
	 * @param excelParams
	 * @param table
	 * @throws Exception
	 */
	public void createListCells(int index, int cellNum, Object obj, List<ExcelExportEntity> excelParams, XWPFTable table) throws Exception {
		ExcelExportEntity entity;
		XWPFTableRow row;
		if (table.getRow(index) == null) {
			row = table.createRow();
			row.setHeight(getRowHeight(excelParams));
		} else {
			row = table.getRow(index);
		}
		for (int k = 0, paramSize = excelParams.size(); k < paramSize; k++) {
			entity = excelParams.get(k);
			Object value = getCellValue(entity, obj);
			if (entity.getType() == 1) {
				setCellValue(row, value, cellNum++);
			}
		}
	}

	/**
	 * 获取表头数据
	 * 
	 * @param table
	 * @param index
	 * @return
	 */
	private Map<String, Integer> getTitleMap(XWPFTable table, int index, int headRows) {
		if (index < headRows) {
			throw new WordExportException(WordExportEnum.EXCEL_NO_HEAD);
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		String text;
		for (int j = 0; j < headRows; j++) {
			List<XWPFTableCell> cells = table.getRow(index - j - 1).getTableCells();
			for (int i = 0; i < cells.size(); i++) {
				text = cells.get(i).getText();
				if (StringUtils.isEmpty(text)) {
					throw new WordExportException(WordExportEnum.EXCEL_HEAD_HAVA_NULL);
				}
				map.put(text, i);
			}
		}
		return map;
	}

	/**
	 * 解析上一行并生成更多行
	 *
	 * @param table
	 * @param index
	 * @param entity
	 */
	public void parseNextRowAndAddRow(XWPFTable table, int index, ExcelListEntity entity) {
		checkExcelParams(entity);
		// 获取表头数据
		Map<String, Integer> titlemap = getTitleMap(table, index, entity.getHeadRows());
		try {
			// 得到所有字段
			Field fileds[] = PoiPublicUtil.getClassFields(entity.getClazz());
			ExcelTarget etarget = entity.getClazz().getAnnotation(ExcelTarget.class);
			String targetId = null;
			if (etarget != null) {
				targetId = etarget.value();
			}
			// 获取实体对象的导出数据
			List<ExcelExportEntity> excelParams = new ArrayList<ExcelExportEntity>();
			getAllExcelField(null, targetId, fileds, excelParams, entity.getClazz(), null);
			// 根据表头进行筛选排序
			sortAndFilterExportField(excelParams, titlemap);
			short rowHeight = getRowHeight(excelParams);
			Iterator<?> its = entity.getList().iterator();
			while (its.hasNext()) {
				Object t = its.next();
				index += createCells(index, t, excelParams, table, rowHeight);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	/**
	 * setCellValue
	 *
	 * @param row
	 * @param value
	 * @param cellNum
	 */
	private void setCellValue(XWPFTableRow row, Object value, int cellNum) {
		if (row.getCell(cellNum++) != null) {
			row.getCell(cellNum - 1).setText(value == null ? "" : value.toString());
		} else {
			row.createCell().setText(value == null ? "" : value.toString());
		}
	}

	/**
	 * 对导出序列进行排序和塞选
	 * 
	 * @param excelParams
	 * @param titlemap
	 * @return
	 */
	private void sortAndFilterExportField(List<ExcelExportEntity> excelParams, Map<String, Integer> titlemap) {
		for (int i = excelParams.size() - 1; i >= 0; i--) {
			if (excelParams.get(i).getList() != null && excelParams.get(i).getList().size() > 0) {
				sortAndFilterExportField(excelParams.get(i).getList(), titlemap);
				if (excelParams.get(i).getList().size() == 0) {
					excelParams.remove(i);
				} else {
					excelParams.get(i).setOrderNum(i);
				}
			} else {
				if (titlemap.containsKey(excelParams.get(i).getName())) {
					excelParams.get(i).setOrderNum(i);
				} else {
					excelParams.remove(i);
				}
			}
		}
		sortAllParams(excelParams);
	}

}
