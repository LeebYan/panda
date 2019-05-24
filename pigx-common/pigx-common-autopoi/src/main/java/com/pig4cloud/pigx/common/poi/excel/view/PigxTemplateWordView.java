package com.pig4cloud.pigx.common.poi.excel.view;

import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import com.pig4cloud.pigx.common.poi.excel.def.TemplateWordConstants;
import com.pig4cloud.pigx.common.poi.word.WordExportUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.view.AbstractView;

/**
 * Word模板导出
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@SuppressWarnings("unchecked")
@Controller(TemplateWordConstants.PIGX_TEMPLATE_WORD_VIEW)
public class PigxTemplateWordView extends AbstractView {

	private static final String CONTENT_TYPE = "application/msword";

	public PigxTemplateWordView() {
		setContentType(CONTENT_TYPE);
	}

	public boolean isIE(HttpServletRequest request) {
		return (request.getHeader("USER-AGENT").toLowerCase().indexOf("msie") > 0 || request.getHeader("USER-AGENT").toLowerCase().indexOf("rv:11.0") > 0) ? true : false;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String codedFileName = "临时文件.docx";
		if (model.containsKey(TemplateWordConstants.FILE_NAME)) {
			codedFileName = (String) model.get(TemplateWordConstants.FILE_NAME) + ".docx";
		}
		if (isIE(request)) {
			codedFileName = java.net.URLEncoder.encode(codedFileName, "UTF8");
		} else {
			codedFileName = new String(codedFileName.getBytes("UTF-8"), "ISO-8859-1");
		}
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName);
		XWPFDocument document = WordExportUtil.exportWord07((String) model.get(TemplateWordConstants.URL), (Map<String, Object>) model.get(TemplateWordConstants.MAP_DATA));
		ServletOutputStream out = response.getOutputStream();
		document.write(out);
		out.flush();
	}
}
