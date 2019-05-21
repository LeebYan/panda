package com.pig4cloud.pigx.common.poi.excel.view;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import com.pig4cloud.pigx.common.poi.excel.ExcelExportUtil;
import com.pig4cloud.pigx.common.poi.excel.def.MapExcelConstants;
import com.pig4cloud.pigx.common.poi.excel.entity.ExportParams;
import com.pig4cloud.pigx.common.poi.excel.entity.params.ExcelExportEntity;
import org.springframework.stereotype.Controller;

/**
 * Map 数据对象接口导出
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@SuppressWarnings("unchecked")
@Controller(MapExcelConstants.PIGX_MAP_EXCEL_VIEW)
public class PigxMapExcelView extends MiniAbstractExcelView {

	public PigxMapExcelView() {
		super();
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String codedFileName = "临时文件";
		Workbook workbook = ExcelExportUtil.exportExcel((ExportParams) model.get(MapExcelConstants.PARAMS), (List<ExcelExportEntity>) model.get(MapExcelConstants.ENTITY_LIST), (Collection<? extends Map<?, ?>>) model.get(MapExcelConstants.MAP_LIST));
		if (model.containsKey(MapExcelConstants.FILE_NAME)) {
			codedFileName = (String) model.get(MapExcelConstants.FILE_NAME);
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
