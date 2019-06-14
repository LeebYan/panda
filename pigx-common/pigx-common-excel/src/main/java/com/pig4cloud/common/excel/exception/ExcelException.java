package com.pig4cloud.common.excel.exception;

/**
 * Excel异常类
 *
 * @author lishangbu
 * @date 2019-06-11
 */
public class ExcelException extends RuntimeException {
	/**
	 * Constructs a new exception with the specified detail message.  The
	 * cause is not initialized, and may subsequently be initialized by
	 * a call to {@link #initCause}.
	 *
	 * @param message the detail message. The detail message is saved for
	 *                later retrieval by the {@link #getMessage()} method.
	 */
	public ExcelException(String message) {
		super(message);
	}
}