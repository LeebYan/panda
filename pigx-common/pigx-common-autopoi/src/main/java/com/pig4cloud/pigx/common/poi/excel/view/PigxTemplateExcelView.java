package com.pig4cloud.pigx.common.poi.excel.view;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import com.pig4cloud.pigx.common.poi.excel.ExcelExportUtil;
import com.pig4cloud.pigx.common.poi.excel.def.NormalExcelConstants;
import com.pig4cloud.pigx.common.poi.excel.def.TemplateExcelConstants;
import com.pig4cloud.pigx.common.poi.excel.entity.TemplateExportParams;
import org.springframework.stereotype.Controller;

/**
 * Excel 模板导出
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@SuppressWarnings("unchecked")
@Controller(TemplateExcelConstants.PIGX_TEMPLATE_EXCEL_VIEW)
public class PigxTemplateExcelView extends MiniAbstractExcelView {

	public PigxTemplateExcelView() {
		super();
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String codedFileName = "临时文件";
		Workbook workbook = ExcelExportUtil.exportExcel((TemplateExportParams) model.get(TemplateExcelConstants.PARAMS), (Class<?>) model.get(TemplateExcelConstants.CLASS), (List<?>) model.get(TemplateExcelConstants.LIST_DATA), (Map<String, Object>) model.get(TemplateExcelConstants.MAP_DATA));
		if (model.containsKey(NormalExcelConstants.FILE_NAME)) {
			codedFileName = (String) model.get(NormalExcelConstants.FILE_NAME);
		}
		if (workbook instanceof HSSFWorkbook) {
			codedFileName += HSSF;
		} else {
			codedFileName += XSSF;
		}
		if (isIE(request)) {
			codedFileName = java.net.URLEncoder.encode(codedFileName, "UTF8");
		} else {
			codedFileName = new String(codedFileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName);
		ServletOutputStream out = response.getOutputStream();
		workbook.write(out);
		out.flush();
	}
}
