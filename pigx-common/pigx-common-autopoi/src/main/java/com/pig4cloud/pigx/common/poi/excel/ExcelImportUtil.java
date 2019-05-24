package com.pig4cloud.pigx.common.poi.excel;

import com.pig4cloud.pigx.common.poi.excel.entity.ImportParams;
import com.pig4cloud.pigx.common.poi.excel.entity.result.ExcelImportResult;
import com.pig4cloud.pigx.common.poi.excel.imports.ExcelImportServer;
import com.pig4cloud.pigx.common.poi.excel.imports.sax.SaxReadExcel;
import com.pig4cloud.pigx.common.poi.excel.imports.sax.parse.ISaxRowRead;
import com.pig4cloud.pigx.common.poi.handler.inter.IExcelReadRowHanlder;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Excel 导入工具
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Slf4j
@SuppressWarnings({"unchecked"})
public final class ExcelImportUtil {

	private ExcelImportUtil() {
	}

	/**
	 * Excel 导入 数据源本地文件,不返回校验结果 导入 字 段类型 Integer,Long,Double,Date,String,Boolean
	 *
	 * @param file
	 * @param pojoClass
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> importExcel(File file, Class<?> pojoClass, ImportParams params) {
		FileInputStream in = null;
		List<T> result = null;
		try {
			in = new FileInputStream(file);
			result = new ExcelImportServer().importExcelByIs(in, pojoClass, params).getList();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				log.error(e.getMessage(), e);
			}
		}
		return result;
	}

	/**
	 * Excel 导入 数据源IO流,不返回校验结果 导入 字段类型 Integer,Long,Double,Date,String,Boolean
	 *
	 * @param inputstream
	 * @param pojoClass
	 * @param params
	 * @param <T>
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> importExcel(InputStream inputstream, Class<?> pojoClass, ImportParams params) throws Exception {
		return new ExcelImportServer().importExcelByIs(inputstream, pojoClass, params).getList();
	}

	/**
	 * Excel 导入 数据源IO流,返回校验结果 字段类型 Integer,Long,Double,Date,String,Boolean
	 *
	 * @param inputstream
	 * @param pojoClass
	 * @param params
	 * @param <T>
	 * @return
	 * @throws Exception
	 */
	public static <T> ExcelImportResult<T> importExcelVerify(InputStream inputstream, Class<?> pojoClass, ImportParams params) throws Exception {
		return new ExcelImportServer().importExcelByIs(inputstream, pojoClass, params);
	}

	/**
	 * Excel 导入 数据源本地文件,返回校验结果 字段类型 Integer,Long,Double,Date,String,Boolean
	 *
	 * @param file
	 * @param pojoClass
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static <T> ExcelImportResult<T> importExcelVerify(File file, Class<?> pojoClass, ImportParams params) {
		FileInputStream in = null;
		try {
			in = new FileInputStream(file);
			return new ExcelImportServer().importExcelByIs(in, pojoClass, params);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				log.error(e.getMessage(), e);
			}
		}
		return null;
	}

	/**
	 * Excel 通过SAX解析方法,适合大数据导入,不支持图片 导入 数据源IO流,不返回校验结果 导入 字段类型
	 * Integer,Long,Double,Date,String,Boolean
	 *
	 * @param inputstream
	 * @param pojoClass
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> importExcelBySax(InputStream inputstream, Class<?> pojoClass, ImportParams params) {
		return new SaxReadExcel().readExcel(inputstream, pojoClass, params, null, null);
	}

	/**
	 * Excel 通过SAX解析方法,适合大数据导入,不支持图片 导入 数据源本地文件,不返回校验结果 导入 字 段类型
	 * Integer,Long,Double,Date,String,Boolean
	 *
	 * @param inputstream
	 * @param pojoClass
	 * @param params
	 * @param hanlder
	 */
	@SuppressWarnings("rawtypes")
	public static void importExcelBySax(InputStream inputstream, Class<?> pojoClass, ImportParams params, IExcelReadRowHanlder hanlder) {
		new SaxReadExcel().readExcel(inputstream, pojoClass, params, null, hanlder);
	}

	/**
	 * Excel 通过SAX解析方法,适合大数据导入,不支持图片 导入 数据源IO流,不返回校验结果 导入 字段类型
	 * Integer,Long,Double,Date,String,Boolean
	 *
	 * @param inputstream
	 * @param rowRead
	 * @param <T>
	 * @return
	 */
	public static <T> List<T> importExcelBySax(InputStream inputstream, ISaxRowRead rowRead) {
		return new SaxReadExcel().readExcel(inputstream, null, null, rowRead, null);
	}

}
