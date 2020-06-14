package com.pig4cloud.pigx.gateway.config;

import com.anji.captcha.service.CaptchaCacheService;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @author lengleng
 * @date 2020/5/19
 * <p>
 * 验证码 缓存提供支持集群
 */
@Primary
@Component
@AllArgsConstructor
public class CaptchaCacheServiceProvider implements CaptchaCacheService {

	private final StringRedisTemplate stringRedisTemplate;

	@Override
	public void set(String key, String value, long expiresInSeconds) {
		stringRedisTemplate.opsForValue().set(key, value, expiresInSeconds, TimeUnit.SECONDS);
	}

	@Override
	public boolean exists(String key) {
		return stringRedisTemplate.hasKey(key);
	}

	@Override
	public void delete(String key) {
		stringRedisTemplate.delete(key);
	}

	@Override
	public String get(String key) {
		return stringRedisTemplate.opsForValue().get(key);
	}

}
