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
package com.pig4cloud.pigx.mp.controller;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.mp.config.WxMpConfiguration;
import com.pig4cloud.pigx.mp.constant.MsgTypeEnum;
import com.pig4cloud.pigx.mp.entity.WxAccountFans;
import com.pig4cloud.pigx.mp.entity.WxMsg;
import com.pig4cloud.pigx.mp.service.WxAccountFansService;
import com.pig4cloud.pigx.mp.service.WxMsgService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpKefuService;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.kefu.WxMpKefuMessage;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


/**
 * 微信粉丝消息管理
 *
 * @author lengleng
 * @date 2019-03-27 20:45:27
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/wxfansmsg")
public class WxFansMsgController {

	private final WxAccountFansService wxAccountFansService;
	private final WxMsgService wxMsgService;

	/**
	 * 分页查询
	 *
	 * @param page 分页对象
	 * @param msg  查询条件
	 */
	@GetMapping("/page")
	public R getWxMsgPage(Page page, WxMsg msg) {
		return R.ok(wxMsgService.page(page, Wrappers.query(msg)));
	}

	/**
	 * 通过id查询微信消息
	 *
	 * @param id id
	 * @return R
	 */
	@GetMapping("/{id}")
	public R getById(@PathVariable("id") Integer id) {
		return R.ok(wxMsgService.getById(id));
	}

	/**
	 * 新增微信消息
	 *
	 * @param wxMsg 微信消息
	 * @return R
	 */
	@PostMapping
	public R save(@RequestBody WxMsg wxMsg) {
		try {
			WxAccountFans wxUser = wxAccountFansService.getById(wxMsg.getWxUserId());
			//入库
			wxMsg.setNickName(wxUser.getNickname());
			wxMsg.setHeadimgUrl(wxUser.getHeadimgUrl());
			wxMsg.setCreateTime(LocalDateTime.now());
			wxMsg.setType(MsgTypeEnum.MP2USER.getType());
			WxMpKefuMessage wxMpKefuMessage = null;
			if (WxConsts.KefuMsgType.TEXT.equals(wxMsg.getRepType())) {
				wxMsg.setRepContent(wxMsg.getRepContent());
				wxMpKefuMessage = WxMpKefuMessage.TEXT().build();
				wxMpKefuMessage.setContent(wxMsg.getRepContent());
			}
			if (WxConsts.KefuMsgType.IMAGE.equals(wxMsg.getRepType())) {//图片
				wxMsg.setRepName(wxMsg.getRepName());
				wxMsg.setRepUrl(wxMsg.getRepUrl());
				wxMsg.setRepMediaId(wxMsg.getRepMediaId());
				wxMpKefuMessage = WxMpKefuMessage.IMAGE().build();
				wxMpKefuMessage.setMediaId(wxMsg.getRepMediaId());
			}
			if (WxConsts.KefuMsgType.VOICE.equals(wxMsg.getRepType())) {
				wxMsg.setRepName(wxMsg.getRepName());
				wxMsg.setRepUrl(wxMsg.getRepUrl());
				wxMsg.setRepMediaId(wxMsg.getRepMediaId());
				wxMpKefuMessage = WxMpKefuMessage.VOICE().build();
				wxMpKefuMessage.setMediaId(wxMsg.getRepMediaId());
			}
			if (WxConsts.KefuMsgType.VIDEO.equals(wxMsg.getRepType())) {
				wxMsg.setRepName(wxMsg.getRepName());
				wxMsg.setRepDesc(wxMsg.getRepDesc());
				wxMsg.setRepUrl(wxMsg.getRepUrl());
				wxMsg.setRepMediaId(wxMsg.getRepMediaId());
				wxMpKefuMessage = WxMpKefuMessage.VIDEO().build();
				wxMpKefuMessage.setMediaId(wxMsg.getRepMediaId());
				wxMpKefuMessage.setTitle(wxMsg.getRepName());
				wxMpKefuMessage.setDescription(wxMsg.getRepDesc());
			}
			if (WxConsts.KefuMsgType.MUSIC.equals(wxMsg.getRepType())) {
				wxMsg.setRepName(wxMsg.getRepName());
				wxMsg.setRepDesc(wxMsg.getRepDesc());
				wxMsg.setRepUrl(wxMsg.getRepUrl());
				wxMsg.setRepHqUrl(wxMsg.getRepHqUrl());
				wxMpKefuMessage = WxMpKefuMessage.MUSIC().build();
				wxMpKefuMessage.setTitle(wxMsg.getRepName());
				wxMpKefuMessage.setDescription(wxMsg.getRepDesc());
				wxMpKefuMessage.setMusicUrl(wxMsg.getRepUrl());
				wxMpKefuMessage.setHqMusicUrl(wxMsg.getRepHqUrl());
				wxMpKefuMessage.setThumbMediaId(wxMsg.getRepThumbMediaId());
			}
			if (WxConsts.KefuMsgType.NEWS.equals(wxMsg.getRepType())) {
				List<WxMpKefuMessage.WxArticle> list = new ArrayList<>();
				JSONArray articles = JSONUtil.parseObj(wxMsg.getContent()).getJSONArray("articles");
				WxMpKefuMessage.WxArticle t;
				for (Object object : articles) {
					JSONObject obj = JSONUtil.parseObj(JSONUtil.toJsonStr(object));
					t = new WxMpKefuMessage.WxArticle();
					t.setTitle(obj.getStr("title"));
					t.setDescription(obj.getStr("digest"));
					t.setPicUrl(obj.getStr("thumbUrl"));
					t.setUrl(obj.getStr("url"));
					list.add(t);
				}
				wxMsg.setRepName(wxMsg.getRepName());
				wxMsg.setRepDesc(wxMsg.getRepDesc());
				wxMsg.setRepUrl(wxMsg.getRepUrl());
				wxMsg.setRepMediaId(wxMsg.getRepMediaId());
				wxMsg.setContent(wxMsg.getContent());
				wxMpKefuMessage = WxMpKefuMessage.NEWS().build();
				wxMpKefuMessage.setArticles(list);
			}
			if (wxMpKefuMessage != null) {
				WxMpService wxMpService = WxMpConfiguration.getMpServices().get(wxMsg.getAppId());
				WxMpKefuService wxMpKefuService = wxMpService.getKefuService();
				wxMpKefuMessage.setToUser(wxUser.getOpenid());
				wxMpKefuService.sendKefuMessage(wxMpKefuMessage);
				wxMsgService.save(wxMsg);
				return R.ok(wxMsg);
			} else {
				return R.failed("非法消息类型");
			}
		} catch (WxErrorException e) {
			e.printStackTrace();
			log.error("新增微信消息失败" + e.getMessage());
			return R.failed(e.getMessage());
		}
	}

	/**
	 * 修改微信消息
	 *
	 * @param wxMsg 微信消息
	 * @return R
	 */
	@PutMapping
	@PreAuthorize("@ss.hasPermi('wxmp:wxmsg:edit')")
	public R updateById(@RequestBody WxMsg wxMsg) {
		return R.ok(wxMsgService.updateById(wxMsg));
	}

	/**
	 * 通过id删除微信消息
	 *
	 * @param id id
	 * @return R
	 */
	@DeleteMapping("/{id}")
	@PreAuthorize("@ss.hasPermi('wxmp:wxmsg:del')")
	public R removeById(@PathVariable String id) {
		return R.ok(wxMsgService.removeById(id));
	}

}
