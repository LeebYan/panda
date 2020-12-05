package com.pig4cloud.pigx.ureport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author lengleng
 * @date 2020/12/5
 * <p>
 * 页面跳转
 */
@Controller
public class PageController {
	/**
	 * 表单设计URL
	 */
	private static final String REDIRECT_UREPORT_DESIGNER = "redirect:/ureport/designer";

	/**
	 * 跳转至表单设计
	 *
	 * @return
	 */
	@GetMapping
	public String designer() {
		return REDIRECT_UREPORT_DESIGNER;
	}
}
