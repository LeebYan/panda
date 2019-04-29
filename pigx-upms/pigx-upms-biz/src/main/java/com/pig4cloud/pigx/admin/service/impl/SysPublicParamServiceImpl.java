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

package com.pig4cloud.pigx.admin.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pigx.admin.api.entity.SysPublicParam;
import com.pig4cloud.pigx.admin.api.vo.ParamVo;
import com.pig4cloud.pigx.admin.mapper.SysPublicParamMapper;
import com.pig4cloud.pigx.admin.service.SysPublicParamService;
import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 公共参数配置
 *
 * @author Lucky
 * @date 2019-04-29
 */
@Service
@AllArgsConstructor
public class SysPublicParamServiceImpl extends ServiceImpl<SysPublicParamMapper, SysPublicParam> implements SysPublicParamService {

	private final RedisTemplate redisTemplate;

	@Override
	public List<SysPublicParam> querySysPublicParam() {
		List paramList =  baseMapper.selectList(Wrappers.emptyWrapper());
		return paramList;
	}

	@Override
	public String getSysPublicParamKeyToValue(String publicKey) {
		String groupName = CommonConstants.PIG_PUBLIC_PARAM_KEY;
		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(ParamVo.class));
		//List<ParamVo> values = redisTemplate.opsForHash().values(groupName);
		ParamVo mapValue = (ParamVo) redisTemplate.opsForHash().get(groupName, publicKey);

		if(ObjectUtil.isNull(mapValue)){
			return "";
		}
		return mapValue.getPublicValue();
	}
}
