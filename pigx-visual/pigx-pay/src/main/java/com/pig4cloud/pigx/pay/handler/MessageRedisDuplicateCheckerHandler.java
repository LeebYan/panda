package com.pig4cloud.pigx.pay.handler;

import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;

/**
 * @author lengleng
 * @date 2019-06-14
 * <p>
 * 消息去重
 */
@Service
@AllArgsConstructor
public class MessageRedisDuplicateCheckerHandler implements MessageDuplicateCheckerHandler {
	private final RedisTemplate redisTemplate;

	/**
	 * 判断回调消息是否重复.
	 *
	 * @param messageId messageId需要根据上面讲的方式构造
	 * @return 如果是重复消息，返回false，否则返回true
	 */
	@Override
	public boolean isDuplicate(String messageId) {
		return redisTemplate.opsForValue()
				.setIfAbsent(messageId, messageId, Duration.ofSeconds(10L));
	}
}
