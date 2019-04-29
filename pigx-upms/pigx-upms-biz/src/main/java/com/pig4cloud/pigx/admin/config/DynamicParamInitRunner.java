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

package com.pig4cloud.pigx.admin.config;

import com.pig4cloud.pigx.admin.api.vo.ParamVo;
import com.pig4cloud.pigx.admin.service.SysPublicParamService;
import com.pig4cloud.pigx.admin.support.DynamicParamInitEvent;
import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import com.pig4cloud.pigx.common.core.util.R;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.scheduling.annotation.Async;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lucky
 * @date 2019/4/28
 * <p>
 * 启动后保存配置文件里面的公共参数信息到Redis
 */
@Slf4j
@Configuration
@AllArgsConstructor
public class DynamicParamInitRunner {
    private final RedisTemplate redisTemplate;
    private final SysPublicParamService sysPublicParamService;
    public static final String PIG_PUBLIC_PARAM_KEY = CommonConstants.PIG_PUBLIC_PARAM_KEY;
    @Async
    @Order
    @EventListener({WebServerInitializedEvent.class, DynamicParamInitEvent.class})
    public R initPrope() {
        log.info("初始化公共参数配置 {} ", PIG_PUBLIC_PARAM_KEY);
        //列信息
        List<ParamVo> paramVoList = new ArrayList<>();
		sysPublicParamService.querySysPublicParam().forEach(param -> {
			ParamVo paramVo = new ParamVo();
            String publicKey = param.getPublicKey();
			paramVo.setPublicKey(publicKey);
			paramVo.setPublicValue(param.getPublicValue());
			paramVo.setPublicName(param.getPublicName());
            log.info("加载公共参数ID：{},{}", publicKey, paramVo);
            redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(ParamVo.class));
            redisTemplate.opsForHash().put(PIG_PUBLIC_PARAM_KEY, publicKey, paramVo);
			paramVoList.add(paramVo);
        });
        log.debug("初始化公共参数配置结束 ");
        return new R<>(paramVoList);
    }
}
