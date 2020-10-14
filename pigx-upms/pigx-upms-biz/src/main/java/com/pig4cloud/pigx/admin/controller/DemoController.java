package com.pig4cloud.pigx.admin.controller;

import com.pig4cloud.pigx.common.security.annotation.Inner;
import org.springframework.web.bind.annotation.*;

/**
 * @author lengleng
 * @date 2020/10/13
 */
@Inner
@RequestMapping(value = "/demo", method = RequestMethod.POST)
@RestController
public class DemoController {

	@Inner(false)
	@GetMapping("/test")
	public String demo() {
		return "ssucess";
	}

	@Inner(false)
	@GetMapping("/test/{id}")
	public String demo2(@PathVariable String id) {
		return "ssucess";
	}

}
