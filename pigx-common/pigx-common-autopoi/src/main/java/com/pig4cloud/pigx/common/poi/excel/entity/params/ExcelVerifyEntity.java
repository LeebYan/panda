package com.pig4cloud.pigx.common.poi.excel.entity.params;

import lombok.Data;

/**
 * Excel 校验对象
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Data
public class ExcelVerifyEntity {

	/**
	 * 接口校验
	 * 
	 * @return
	 */
	private boolean interHandler;

	/**
	 * 不允许空
	 * 
	 * @return
	 */
	private boolean notNull;

	/**
	 * 是13位移动电话
	 * 
	 * @return
	 */
	private boolean isMobile;
	/**
	 * 是座机号码
	 * 
	 * @return
	 */
	private boolean isTel;

	/**
	 * 是电子邮件
	 * 
	 * @return
	 */
	private boolean isEmail;

	/**
	 * 最小长度
	 * 
	 * @return
	 */
	private int minLength;

	/**
	 * 最大长度
	 * 
	 * @return
	 */
	private int maxLength;

	/**
	 * 正在表达式
	 * 
	 * @return
	 */
	private String regex;
	/**
	 * 正在表达式,错误提示信息
	 * 
	 * @return
	 */
	private String regexTip;

}
