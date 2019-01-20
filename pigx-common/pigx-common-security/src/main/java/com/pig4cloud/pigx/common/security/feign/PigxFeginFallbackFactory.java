/*
 * *************************************************************************
 *   Copyright (c) 2018-2025, dreamlu.net All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the dreamlu.net developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: chunmeng.lu (qq596392912@gmail.com)
 * *************************************************************************
 */

package com.pig4cloud.pigx.common.security.feign;

import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import com.pig4cloud.pigx.common.core.util.R;
import feign.hystrix.FallbackFactory;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * 默认 Fallback，避免写过多fallback类
 *
 * @param <T> 泛型标记
 * @author L.cm
 */
@Slf4j
@NoArgsConstructor
public final class PigxFeginFallbackFactory<T> implements FallbackFactory<T> {
	public static final PigxFeginFallbackFactory INSTANCE = new PigxFeginFallbackFactory();
	private static final ConcurrentMap<Class<?>, Object> FALLBACK_MAP = new ConcurrentHashMap<>();

	@SuppressWarnings("unchecked")
	public T create(final Class<?> type, final Throwable cause) {
		// 重写 fegin ErrorDecoder，message 知己为 body 数据，反序列化为 Result
		final R result = cause instanceof PigxFeginException ?
				((PigxFeginException) cause).getResult() : R.builder()
				.code(CommonConstants.FAIL)
				.msg(cause.getMessage()).build();
		return (T) FALLBACK_MAP.computeIfAbsent(type, key -> {
			Enhancer enhancer = new Enhancer();
			enhancer.setSuperclass(key);
			enhancer.setCallback((MethodInterceptor) (obj, method, args, proxy) -> {
				log.error("Fallback class:[{}] method:[{}] message:[{}]",
						type.getName(), method.getName(), cause.getMessage());
				return result;
			});
			return enhancer.create();
		});
	}

	@Override
	public T create(Throwable cause) {
		return null;
	}
}
