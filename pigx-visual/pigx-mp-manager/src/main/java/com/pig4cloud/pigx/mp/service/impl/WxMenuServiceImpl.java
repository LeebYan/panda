/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */
package com.pig4cloud.pigx.mp.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.mp.config.WxMpConfiguration;
import com.pig4cloud.pigx.mp.entity.WxAccount;
import com.pig4cloud.pigx.mp.entity.WxMpMenu;
import com.pig4cloud.pigx.mp.mapper.WxAccountMapper;
import com.pig4cloud.pigx.mp.mapper.WxMenuMapper;
import com.pig4cloud.pigx.mp.service.WxMenuService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpMenuService;
import me.chanjar.weixin.mp.api.WxMpService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 微信菜单业务
 *
 * @author lengleng
 * @date 2019-03-27 20:45:18
 */
@Slf4j
@Service
@AllArgsConstructor
public class WxMenuServiceImpl extends ServiceImpl<WxMenuMapper, WxMpMenu> implements WxMenuService {
	private static final String MENU = "menu";
	private final WxAccountMapper wxAccountMapper;

	/**
	 * 新增微信公众号按钮
	 *
	 * @param wxMenus json
	 * @param appId   公众号
	 * @return
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean save(JSONObject wxMenus, String appId) {
		baseMapper.delete(Wrappers.<WxMpMenu>lambdaQuery()
				.eq(WxMpMenu::getWxAccountAppid, appId));

		WxAccount wxAccount = wxAccountMapper
				.selectOne(Wrappers.<WxAccount>lambdaQuery()
						.eq(WxAccount::getAppid, appId));
		WxMpMenu wxMpMenu = new WxMpMenu();
		wxMpMenu.setMenu(wxMenus.toStringPretty());
		wxMpMenu.setWxAccountId(wxAccount.getId());
		wxMpMenu.setWxAccountAppid(wxAccount.getAppid());
		wxMpMenu.setWxAccountName(wxAccount.getName());
		baseMapper.insert(wxMpMenu);
		return Boolean.TRUE;
	}

	/**
	 * 发布到微信
	 *
	 * @param appId 公众号信息
	 * @return
	 */
	@Override
	public R push(String appId) {
		List<WxMpMenu> wxMpMenuList = baseMapper.selectList(Wrappers.<WxMpMenu>lambdaQuery()
				.eq(WxMpMenu::getWxAccountAppid, appId));

		if (CollUtil.isEmpty(wxMpMenuList)) {
			return R.builder()
					.code(CommonConstants.FAIL)
					.msg("微信菜单配置为空，不能发布").build();
		}

		WxMpService wxMpService = WxMpConfiguration.getMpServices().get(appId);
		WxMpMenuService menuService = wxMpService.getMenuService();

		// 给数据库保存的加一层
		JSONObject jsonObject = new JSONObject(wxMpMenuList.get(0).getMenu());
		jsonObject.put(MENU, jsonObject);
		try {
			menuService.menuCreate(jsonObject.toStringPretty());
		} catch (WxErrorException e) {
			return R.builder()
					.code(CommonConstants.FAIL)
					.msg(e.getError().getErrorMsg()).build();
		}
		return R.builder().build();
	}

	/**
	 * 通过appid 查询菜单信息
	 *
	 * @param appId
	 * @return
	 */
	@Override
	public R getByAppId(String appId) {
		List<WxMpMenu> wxMpMenuList = baseMapper.selectList(Wrappers.<WxMpMenu>lambdaQuery()
				.eq(WxMpMenu::getWxAccountAppid, appId));

		if (CollUtil.isEmpty(wxMpMenuList)) {
			return R.builder().build();
		}
		return R.builder().data(wxMpMenuList.get(0).getMenu()).build();
	}
}
