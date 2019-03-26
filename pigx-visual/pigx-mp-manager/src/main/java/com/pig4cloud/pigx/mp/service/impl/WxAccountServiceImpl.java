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

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.mp.config.WxMpConfiguration;
import com.pig4cloud.pigx.mp.entity.WxAccount;
import com.pig4cloud.pigx.mp.mapper.WxAccountMapper;
import com.pig4cloud.pigx.mp.service.WxAccountService;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.stereotype.Service;

/**
 * 公众号账户
 *
 * @author lengleng
 * @date 2019-03-26 22:07:53
 */
@Slf4j
@Service
public class WxAccountServiceImpl extends ServiceImpl<WxAccountMapper, WxAccount> implements WxAccountService {

	/**
	 * 生成公众号二维码
	 *
	 * @param appId
	 * @return
	 */

	@Override
	public R generateQr(String appId) {
		WxMpService wxMpService = WxMpConfiguration.getMpServices().get(appId);
		try {
			WxMpQrCodeTicket ticket = wxMpService.getQrcodeService().qrCodeCreateLastTicket(1);
			String url = wxMpService.getQrcodeService().qrCodePictureUrl(ticket.getTicket());

			WxAccount wxAccount = baseMapper
					.selectOne(Wrappers.<WxAccount>query().lambda()
							.eq(WxAccount::getAppid, appId));
			wxAccount.setQrUrl(url);
			baseMapper.updateById(wxAccount);
		} catch (WxErrorException e) {
			log.error(" 获取公众号二维码失败", e);
			return R.builder().code(CommonConstants.FAIL).msg("更新公众号二维码失败").build();
		}

		return R.builder().build();
	}
}
