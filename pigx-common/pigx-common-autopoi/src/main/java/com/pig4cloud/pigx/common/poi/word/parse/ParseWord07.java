package com.pig4cloud.pigx.common.poi.word.parse;

import com.pig4cloud.pigx.common.poi.cache.WordCache;
import com.pig4cloud.pigx.common.poi.util.PoiPublicUtil;
import com.pig4cloud.pigx.common.poi.word.entity.MyXWPFDocument;
import com.pig4cloud.pigx.common.poi.word.entity.WordImageEntity;
import com.pig4cloud.pigx.common.poi.word.entity.params.ExcelListEntity;
import com.pig4cloud.pigx.common.poi.word.parse.excel.ExcelEntityParse;
import com.pig4cloud.pigx.common.poi.word.parse.excel.ExcelMapParse;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.xwpf.usermodel.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 解析07版的Word,替换文字,生成表格,生成图片
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Slf4j
@SuppressWarnings({ "unchecked", "rawtypes" })
public class ParseWord07 {

	/**
	 * 添加图片
	 *
	 * @param obj
	 * @param currentRun
	 * @throws Exception
	 */
	private void addAnImage(WordImageEntity obj, XWPFRun currentRun) throws Exception {
		Object[] isAndType = PoiPublicUtil.getIsAndType(obj);
		String picId;
		try {
			picId = currentRun.getParagraph().getDocument().addPictureData((byte[]) isAndType[0], (Integer) isAndType[1]);
			((MyXWPFDocument) currentRun.getParagraph().getDocument()).createPicture(currentRun, picId, currentRun.getParagraph().getDocument().getNextPicNameNumber((Integer) isAndType[1]), obj.getWidth(), obj.getHeight());

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

	}

	/**
	 * 根据条件改变值
	 *
	 * @param paragraph
	 * @param currentRun
	 * @param currentText
	 * @param runIndex
	 * @param map
	 * @throws Exception
	 */
	private void changeValues(XWPFParagraph paragraph, XWPFRun currentRun, String currentText, List<Integer> runIndex, Map<String, Object> map) throws Exception {
		Object obj = PoiPublicUtil.getRealValue(currentText, map);
		if (obj instanceof WordImageEntity) {// 如果是图片就设置为图片
			currentRun.setText("", 0);
			addAnImage((WordImageEntity) obj, currentRun);
		} else {
			currentText = obj.toString();
			currentRun.setText(currentText, 0);
		}
		for (int k = 0; k < runIndex.size(); k++) {
			paragraph.getRuns().get(runIndex.get(k)).setText("", 0);
		}
		runIndex.clear();
	}

	/**
	 * 判断是不是迭代输出
	 *
	 * @param cell
	 * @param map
	 * @return
	 * @throws Exception
	 */
	private Object checkThisTableIsNeedIterator(XWPFTableCell cell, Map<String, Object> map) throws Exception {
		String text = cell.getText().trim();
		// 判断是不是迭代输出
		if (text.startsWith("{{") && text.endsWith("}}") && text.indexOf("in ") != -1) {
			return PoiPublicUtil.getRealValue(text.replace("in ", "").trim(), map);
		}
		return null;
	}

	/**
	 * 解析所有的文本
	 *
	 * @param paragraphs
	 * @param map
	 * @throws Exception
	 */
	private void parseAllParagraphic(List<XWPFParagraph> paragraphs, Map<String, Object> map) throws Exception {
		XWPFParagraph paragraph;
		for (int i = 0; i < paragraphs.size(); i++) {
			paragraph = paragraphs.get(i);
			if (paragraph.getText().indexOf("{{") != -1) {
				parseThisParagraph(paragraph, map);
			}

		}

	}

	/**
	 * 解析这个段落
	 * @param paragraph
	 * @param map
	 * @throws Exception
	 */
	private void parseThisParagraph(XWPFParagraph paragraph, Map<String, Object> map) throws Exception {
		XWPFRun run;
		XWPFRun currentRun = null;// 拿到的第一个run,用来set值,可以保存格式
		String currentText = "";// 存放当前的text
		String text;
		Boolean isfinde = false;// 判断是不是已经遇到{{
		List<Integer> runIndex = new ArrayList<Integer>();// 存储遇到的run,把他们置空
		for (int i = 0; i < paragraph.getRuns().size(); i++) {
			run = paragraph.getRuns().get(i);
			text = run.getText(0);
			if (StringUtils.isEmpty(text)) {
				continue;
			}// 如果为空或者""这种这继续循环跳过
			if (isfinde) {
				currentText += text;
				if (currentText.indexOf("{{") == -1) {
					isfinde = false;
					runIndex.clear();
				} else {
					runIndex.add(i);
				}
				if (currentText.indexOf("}}") != -1) {
					changeValues(paragraph, currentRun, currentText, runIndex, map);
					currentText = "";
					isfinde = false;
				}
			} else if (text.indexOf("{") >= 0) {// 判断是不是开始
				currentText = text;
				isfinde = true;
				currentRun = run;
			} else {
				currentText = "";
			}
			if (currentText.indexOf("}}") != -1) {
				changeValues(paragraph, currentRun, currentText, runIndex, map);
				isfinde = false;
			}
		}

	}

	private void parseThisRow(List<XWPFTableCell> cells, Map<String, Object> map) throws Exception {
		for (XWPFTableCell cell : cells) {
			parseAllParagraphic(cell.getParagraphs(), map);
		}
	}

	/**
	 * 解析这个段落
	 *
	 * @param table
	 * @param map
	 * @throws Exception
	 */
	private void parseThisTable(XWPFTable table, Map<String, Object> map) throws Exception {
		XWPFTableRow row;
		List<XWPFTableCell> cells;
		Object listobj;
		ExcelEntityParse excelEntityParse = new ExcelEntityParse();
		for (int i = 0; i < table.getNumberOfRows(); i++) {
			row = table.getRow(i);
			cells = row.getTableCells();
			if (cells.size() == 1) {
				listobj = checkThisTableIsNeedIterator(cells.get(0), map);
				if (listobj == null) {
					parseThisRow(cells, map);
				} else if (listobj instanceof ExcelListEntity) {
					table.removeRow(i);// 删除这一行
					excelEntityParse.parseNextRowAndAddRow(table, i, (ExcelListEntity) listobj);
				} else {
					table.removeRow(i);// 删除这一行
					ExcelMapParse.parseNextRowAndAddRow(table, i, (List) listobj);
				}
			} else {
				parseThisRow(cells, map);
			}
		}
	}

	/**
	 * 解析07版的Word并且进行赋值
	 * @param url
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public XWPFDocument parseWord(String url, Map<String, Object> map) throws Exception {
		MyXWPFDocument doc = WordCache.getXWPFDocumen(url);
		parseWordSetValue(doc, map);
		return doc;
	}

	/**
	 * 解析07版的Word并且进行赋值
	 *
	 * @param document
	 * @param map
	 * @throws Exception
	 */
	public void parseWord(XWPFDocument document, Map<String, Object> map) throws Exception {
		parseWordSetValue((MyXWPFDocument) document, map);
	}

	private void parseWordSetValue(MyXWPFDocument doc, Map<String, Object> map) throws Exception {
		// 第一步解析文档
		parseAllParagraphic(doc.getParagraphs(), map);
		// 第二步解析页眉,页脚
		parseHeaderAndFoot(doc, map);
		// 第三步解析所有表格
		XWPFTable table;
		Iterator<XWPFTable> itTable = doc.getTablesIterator();
		while (itTable.hasNext()) {
			table = itTable.next();
			if (table.getText().indexOf("{{") != -1) {
				parseThisTable(table, map);
			}
		}

	}

	/**
	 * 解析页眉和页脚
	 * 
	 * @param doc
	 * @param map
	 * @throws Exception
	 */
	private void parseHeaderAndFoot(MyXWPFDocument doc, Map<String, Object> map) throws Exception {
		List<XWPFHeader> headerList = doc.getHeaderList();
		for (XWPFHeader xwpfHeader : headerList) {
			for (int i = 0; i < xwpfHeader.getListParagraph().size(); i++) {
				parseThisParagraph(xwpfHeader.getListParagraph().get(i), map);
			}
		}
		List<XWPFFooter> footerList = doc.getFooterList();
		for (XWPFFooter xwpfFooter : footerList) {
			for (int i = 0; i < xwpfFooter.getListParagraph().size(); i++) {
				parseThisParagraph(xwpfFooter.getListParagraph().get(i), map);
			}
		}

	}
}
