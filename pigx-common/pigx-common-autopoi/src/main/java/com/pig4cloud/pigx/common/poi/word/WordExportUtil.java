package com.pig4cloud.pigx.common.poi.word;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import com.pig4cloud.pigx.common.poi.word.parse.ParseWord07;

import java.util.Map;

/**
 * Word使用模板导出工具类
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public final class WordExportUtil {

	private WordExportUtil() {

	}

	/**
	 * 解析Word2007版本
	 *
	 * @param url 模板地址
	 * @param map 解析数据源
	 * @return
	 */
	public static XWPFDocument exportWord07(String url, Map<String, Object> map) throws Exception {
		return new ParseWord07().parseWord(url, map);
	}

	/**
	 * 解析Word2007版本
	 *
	 * @param document 模板
	 * @param map 解析数据源
	 * @return
	 */
	public static void exportWord07(XWPFDocument document, Map<String, Object> map) throws Exception {
		new ParseWord07().parseWord(document, map);
	}

}
