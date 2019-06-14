package com.pig4cloud.common.excel.util;

import cn.hutool.core.util.StrUtil;
import com.alibaba.excel.EasyExcelFactory;
import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.BaseRowModel;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.pig4cloud.common.excel.exception.ExcelException;
import com.pig4cloud.common.excel.factory.ExcelWriterFactory;
import com.pig4cloud.common.excel.handler.PreWriterHandler;
import com.pig4cloud.common.excel.listener.ExcelListener;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Excel工具类
 *
 * @author lishangbu
 * @date 2019-06-11
 */
@Slf4j
@UtilityClass
public class ExcelUtils {

	private final String DEFAULT_EXCEL_SHEET_NAME="Sheet1";

	/**
	 * 读取 Excel(多个 sheet)
	 * 将多sheet合并成一个list数据集，通过自定义ExcelReader继承AnalysisEventListener
	 * 重写invoke doAfterAllAnalysed方法
	 * getExtendsBeanList 主要是做Bean的属性拷贝 ，可以通过ExcelReader中添加的数据集直接获取
	 *
	 * @param excel    文件
	 * @param rowModel 实体类映射，继承 BaseRowModel 类
	 * @return Excel 数据 list
	 */
	public <T extends BaseRowModel> List<T> readExcel(MultipartFile excel, Class<T> rowModel) {
		ExcelListener excelListener = new ExcelListener();
		ExcelReader reader = getReader(excel, excelListener);
		if (reader == null) {
			return new ArrayList<>();
		}
		for (Sheet sheet : reader.getSheets()) {
			sheet.setClazz(rowModel);
			reader.read(sheet);
		}
		return getExtendsBeanList(excelListener.getDataList(), rowModel);
	}

	/**
	 * 读取某个 sheet 的 Excel
	 *
	 * @param excel    文件
	 * @param rowModel 实体类映射，继承 BaseRowModel 类
	 * @param sheetNo  sheet 的序号 从1开始
	 * @return Excel 数据 list
	 */
	public <T extends BaseRowModel> List<T> readExcel(MultipartFile excel, Class<T> rowModel, int sheetNo) {
		return readExcel(excel, rowModel, sheetNo, 1);
	}

	/**
	 * 读取某个 sheet 的 Excel
	 *
	 * @param excel       文件
	 * @param rowModel    实体类映射，继承 BaseRowModel 类
	 * @param sheetNo     sheet 的序号 从1开始
	 * @param headLineNum 表头行数，默认为1
	 * @return Excel 数据 list
	 */
	public <T extends BaseRowModel> List<T> readExcel(MultipartFile excel, Class<T> rowModel, int sheetNo,
													  int headLineNum) {
		ExcelListener excelListener = new ExcelListener();
		ExcelReader reader = getReader(excel, excelListener);
		if (reader == null) {
			return new ArrayList<>();
		}
		reader.read(new Sheet(sheetNo, headLineNum, rowModel));
		return getExtendsBeanList(excelListener.getDataList(), rowModel);
	}


	/**
	 * 导出 2007 Excel ：一个 sheet，带表头,默认sheet名称
	 *
	 * @param response  HttpServletResponse
	 * @param list      数据 list，每个元素为一个 BaseRowModel
	 * @param fileName  导出的文件名
	 * @param classType 实体类映射，继承 BaseRowModel 类
	 * @param <T>
	 */
	public <T extends BaseRowModel> void writeExcel(HttpServletResponse response, List<T> list,
													String fileName, Class<T> classType){
		writeExcel(response,list,fileName,null,classType);
	}


	/**
	 * 导出 2007 Excel ：一个 sheet，带表头
	 *
	 * @param response  HttpServletResponse
	 * @param list      数据 list，每个元素为一个 BaseRowModel
	 * @param fileName  导出的文件名
	 * @param sheetName 导入文件的 sheet 名
	 * @param classType 实体类映射，继承 BaseRowModel 类
	 * @param <T>
	 */
	public <T extends BaseRowModel> void writeExcel(HttpServletResponse response, List<T> list,
													String fileName, String sheetName,
													Class<T> classType){
		writeExcel(response,list,fileName,sheetName,ExcelTypeEnum.XLSX,classType);
	}

	/**
	 * 导出 Excel ：一个 sheet，带表头
	 * 自定义WriterHandler 可以定制行列数据进行灵活化操作
	 *
	 * @param response  HttpServletResponse
	 * @param list      数据 list，每个元素为一个 BaseRowModel
	 * @param fileName  导出的文件名
	 * @param sheetName 导入文件的 sheet 名
	 * @param excelTypeEnum 导出Excel类型
	 * @param classType 实体类映射，继承 BaseRowModel 类
	 *
	 */
	public <T extends BaseRowModel> void writeExcel(HttpServletResponse response, List<T> list,
													String fileName, String sheetName, ExcelTypeEnum excelTypeEnum,
													Class<T> classType) {
		if (StrUtil.isBlank(sheetName)) {
			sheetName = DEFAULT_EXCEL_SHEET_NAME;
		}
		OutputStream outputStream =null;
		try {
			response.reset();
			outputStream = getOutputStream(fileName, response, excelTypeEnum);
			if (excelTypeEnum == ExcelTypeEnum.XLSX) {
				ExcelWriter writer = EasyExcelFactory.getWriterWithTempAndHandler(null, outputStream
						, excelTypeEnum, true, new PreWriterHandler<>(classType));
				Sheet sheet = new Sheet(1, 0, classType);
				sheet.setSheetName(sheetName);
				try {
					writer.write(list, sheet);
				} finally {
					writer.finish();
				}
			} else if (excelTypeEnum == ExcelTypeEnum.XLS) {
				// 其实也可以专门调03版的样式，或者直接套用
				ExcelWriterFactory writer = new ExcelWriterFactory(outputStream, excelTypeEnum);
				Sheet sheet = new Sheet(1, 0, classType);
				sheet.setSheetName(sheetName);
				try {
					writer.write(list, sheet);
				} finally {
					writer.finish();
					writer.close();
				}
			}
			outputStream.flush();
		}catch (IOException e){
			log.error("导出excel异常:{}",e);
		}finally {
			if(outputStream!=null){
				try {
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * 导出 Excel ：多个 sheet，带表头
	 *
	 * @param response  HttpServletResponse
	 * @param list      数据 list，每个元素为一个 BaseRowModel
	 * @param fileName  导出的文件名
	 * @param sheetName 导入文件的 sheet 名
	 * @param object    映射实体类，Excel 模型
	 */
	public ExcelWriterFactory writeExcelWithSheets(HttpServletResponse response, List<? extends BaseRowModel> list,
												   String fileName, String sheetName, BaseRowModel object, ExcelTypeEnum excelTypeEnum) {
		ExcelWriterFactory writer = new ExcelWriterFactory(getOutputStream(fileName, response, excelTypeEnum), excelTypeEnum);
		Sheet sheet = new Sheet(1, 0, object.getClass());
		sheet.setSheetName(sheetName);
		writer.write(list, sheet);
		return writer;
	}

	/**
	 * 导出文件时为Writer生成OutputStream
	 */
	private OutputStream getOutputStream(String fileName, HttpServletResponse response, ExcelTypeEnum excelTypeEnum) {
		try {
			String encodeFilename = URLEncoder.encode(fileName, StandardCharsets.UTF_8.toString());
			response.setContentType(MediaType.MULTIPART_FORM_DATA_VALUE);
			response.setCharacterEncoding(StandardCharsets.UTF_8.name());
			response.setHeader("Content-disposition", "attachment;filename="+ encodeFilename+excelTypeEnum.getValue());
			return response.getOutputStream();
		} catch (IOException e) {
			throw new ExcelException("创建文件失败！");
		}
	}

	/**
	 * 返回 ExcelReader
	 *
	 * @param excel         需要解析的 Excel 文件
	 * @param excelListener new ExcelListener()
	 */
	private ExcelReader getReader(MultipartFile excel,
								  ExcelListener excelListener) {
		String fileName = excel.getOriginalFilename();
		if (fileName == null) {
			throw new ExcelException("文件格式错误！");
		}
		if (!fileName.toLowerCase().endsWith(ExcelTypeEnum.XLS.getValue()) && !fileName.toLowerCase().endsWith(ExcelTypeEnum.XLSX.getValue())) {
			throw new ExcelException("文件格式错误！");
		}
		InputStream inputStream;
		try {
			inputStream = excel.getInputStream();
			return new ExcelReader(inputStream, null, excelListener, false);
		} catch (IOException e) {
			//do something
		}
		return null;
	}

	/**
	 * 利用BeanCopy转换list
	 */
	private <T extends BaseRowModel> List<T> getExtendsBeanList(List<?> list, Class<T> typeClazz) {
		return BeanCopyUtils.convert(list, typeClazz);
	}
}

