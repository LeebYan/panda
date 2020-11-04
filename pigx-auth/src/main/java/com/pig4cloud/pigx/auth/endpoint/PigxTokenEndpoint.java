/*
 *
 *      Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the pig4cloud.com developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: lengleng (wangiegie@gmail.com)
 *
 */

package com.pig4cloud.pigx.auth.endpoint;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.admin.api.entity.SysTenant;
import com.pig4cloud.pigx.admin.api.feign.RemoteTenantService;
import com.pig4cloud.pigx.auth.service.PigxTokenDealServiceImpl;
import com.pig4cloud.pigx.common.core.constant.PaginationConstants;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.security.annotation.Inner;
import com.pig4cloud.pigx.common.security.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.AuthorizationRequest;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author lengleng
 * @date 2018/6/24 删除token端点
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/token")
public class PigxTokenEndpoint {

	private final ClientDetailsService clientDetailsService;

	private final PigxTokenDealServiceImpl dealService;

	private final RemoteTenantService tenantService;

	/**
	 * 认证页面
	 * @param modelAndView
	 * @param error 表单登录失败处理回调的错误信息
	 * @return ModelAndView
	 */
	@GetMapping("/login")
	public ModelAndView require(ModelAndView modelAndView, @RequestParam(required = false) String error) {
		R<List<SysTenant>> tenantList = tenantService.list(SecurityConstants.FROM_IN);
		modelAndView.setViewName("ftl/login");
		modelAndView.addObject("error", error);
		modelAndView.addObject("tenantList", tenantList.getData());
		return modelAndView;
	}

	/**
	 * 确认授权页面
	 * @param request
	 * @param session
	 * @param modelAndView
	 * @return
	 */
	@GetMapping("/confirm_access")
	public ModelAndView confirm(HttpServletRequest request, HttpSession session, ModelAndView modelAndView) {
		Map<String, Object> scopeList = (Map<String, Object>) request.getAttribute("scopes");
		modelAndView.addObject("scopeList", scopeList.keySet());

		Object auth = session.getAttribute("authorizationRequest");
		if (auth != null) {
			AuthorizationRequest authorizationRequest = (AuthorizationRequest) auth;
			ClientDetails clientDetails = clientDetailsService.loadClientByClientId(authorizationRequest.getClientId());
			modelAndView.addObject("app", clientDetails.getAdditionalInformation());
			modelAndView.addObject("user", SecurityUtils.getUser());
		}

		modelAndView.setViewName("ftl/confirm");
		return modelAndView;
	}

	/**
	 * 退出token
	 * @param authHeader Authorization
	 */
	@DeleteMapping("/logout")
	public R logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String authHeader) {
		if (StrUtil.isBlank(authHeader)) {
			return R.ok(Boolean.FALSE, "退出失败，token 为空");
		}

		String tokenValue = authHeader.replace(OAuth2AccessToken.BEARER_TYPE, StrUtil.EMPTY).trim();
		return delToken(tokenValue);
	}

	/**
	 * 令牌管理调用
	 * @param token token
	 * @return
	 */
	@Inner
	@DeleteMapping("/{token}")
	public R<Boolean> delToken(@PathVariable("token") String token) {
		return dealService.removeToken(token);
	}

	/**
	 * 查询token
	 * @param params 分页参数
	 * @return
	 */
	@Inner
	@PostMapping("/page")
	public R<Page> tokenList(@RequestBody Map<String, Object> params) {
		Page result = new Page(MapUtil.getInt(params, PaginationConstants.CURRENT),
				MapUtil.getInt(params, PaginationConstants.SIZE));

		// 根据username 查询 token 列表
		Object username = params.get("username");
		if (username != null) {
			return dealService.queryTokenByUsername(result, (String) username);
		}

		return dealService.queryToken(result);
	}

}
