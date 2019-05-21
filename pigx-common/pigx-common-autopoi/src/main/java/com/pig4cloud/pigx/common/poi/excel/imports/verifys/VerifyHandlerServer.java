package com.pig4cloud.pigx.common.poi.excel.imports.verifys;

import org.apache.commons.lang3.StringUtils;
import com.pig4cloud.pigx.common.poi.excel.entity.params.ExcelVerifyEntity;
import com.pig4cloud.pigx.common.poi.excel.entity.result.ExcelVerifyHanlderResult;
import com.pig4cloud.pigx.common.poi.handler.inter.IExcelVerifyHandler;

/**
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * 校验服务
 */
public class VerifyHandlerServer {

	private final static ExcelVerifyHanlderResult DEFAULT_RESULT = new ExcelVerifyHanlderResult(true);

	private void addVerifyResult(ExcelVerifyHanlderResult hanlderResult, ExcelVerifyHanlderResult result) {
		if (!hanlderResult.isSuccess()) {
			result.setSuccess(false);
			result.setMsg((StringUtils.isEmpty(result.getMsg()) ? "" : result.getMsg() + " , ") + hanlderResult.getMsg());
		}
	}

	/**
	 * 校验数据
	 *
	 * @param object
	 * @param value
	 * @param name
	 * @param verify
	 * @param excelVerifyHandler
	 * @return
	 */
	public ExcelVerifyHanlderResult verifyData(Object object, Object value, String name, ExcelVerifyEntity verify, IExcelVerifyHandler excelVerifyHandler) {
		if (verify == null) {
			return DEFAULT_RESULT;
		}
		ExcelVerifyHanlderResult result = new ExcelVerifyHanlderResult(true, "");
		if (verify.isNotNull()) {
			addVerifyResult(BaseVerifyHandler.notNull(name, value), result);
		}
		if (verify.isEmail()) {
			addVerifyResult(BaseVerifyHandler.isEmail(name, value), result);
		}
		if (verify.isMobile()) {
			addVerifyResult(BaseVerifyHandler.isMobile(name, value), result);
		}
		if (verify.isTel()) {
			addVerifyResult(BaseVerifyHandler.isTel(name, value), result);
		}
		if (verify.getMaxLength() != -1) {
			addVerifyResult(BaseVerifyHandler.maxLength(name, value, verify.getMaxLength()), result);
		}
		if (verify.getMinLength() != -1) {
			addVerifyResult(BaseVerifyHandler.minLength(name, value, verify.getMinLength()), result);
		}
		if (StringUtils.isNotEmpty(verify.getRegex())) {
			addVerifyResult(BaseVerifyHandler.regex(name, value, verify.getRegex(), verify.getRegexTip()), result);
		}
		if (verify.isInterHandler()) {
			addVerifyResult(excelVerifyHandler.verifyHandler(object, name, value), result);
		}
		return result;

	}
}
