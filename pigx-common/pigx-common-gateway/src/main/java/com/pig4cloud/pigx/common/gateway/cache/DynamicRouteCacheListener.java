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

package com.pig4cloud.pigx.common.gateway.cache;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * @author lengleng
 * @date 2019-08-16
 * <p>
 * redis 消息订阅
 */
@Slf4j
@Component
@AllArgsConstructor
public class DynamicRouteCacheListener implements MessageListener {
	private final RedisTemplate<String, String> redisTemplate;

	@Override
	public void onMessage(Message message, byte[] bytes) {
		byte[] body = message.getBody();
		byte[] channel = message.getChannel();
		String msg = redisTemplate.getStringSerializer().deserialize(body);
		String topic = redisTemplate.getStringSerializer().deserialize(channel);

		log.info("监听到 {} , 消息内容为 {}", msg, topic);
		RouteCacheUtil.removeRouteList();
	}

}
