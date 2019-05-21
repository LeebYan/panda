package com.pig4cloud.pigx.common.poi.exception.word;

import com.pig4cloud.pigx.common.poi.exception.word.enmus.WordExportEnum;

/**
 * word导出异常
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public class WordExportException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public WordExportException() {
		super();
	}

	public WordExportException(String msg) {
		super(msg);
	}

	public WordExportException(WordExportEnum exception) {
		super(exception.getMsg());
	}

}
