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

package com.pig4cloud.pigx.admin.controller;

import com.pig4cloud.pigx.admin.config.DynamicRouteInitRunner;
import com.pig4cloud.pigx.admin.service.SysRouteConfService;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.security.annotation.Inner;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lucky
 * @date 2019-04-29
 * <p>
 * 由于环境特殊，针对缓存清理和初始化路由缓存
 */
@Slf4j
@RestController
@AllArgsConstructor
@RequestMapping("/redis")
@Api(value = "redis", tags = "缓存管理模块")
public class RedisController {

    private final RedisTemplate redisTemplate;
    private final SysRouteConfService routeConfService;

    /**
     * 初始化路由缓存
     */
    @Inner(value = false)
    @PostMapping("/initRoute")
	@ApiOperation("初始化路由缓存")
    public R initRoute() {
        return new DynamicRouteInitRunner(redisTemplate, routeConfService).initRoute();
    }

}
