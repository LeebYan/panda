package com.pig4cloud.pigx.common.datasource.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pig4cloud.pigx.common.datasource.support.DynamicDataSourceContextHolder;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * @author lengleng
 * @date 2019-05-18
 * <p>
 * 动态数据源拦截器
 */
@Slf4j
@Component
@AllArgsConstructor
public class DynamicDatasourceInterceptor implements HandlerInterceptor {
	private final RedisTemplate redisTemplate;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		redisTemplate.setHashValueSerializer(new Jackson2JsonRedisSerializer<>(String.class));
		HashOperations<String, String, String> vo = redisTemplate.opsForHash();
//		String dbName = vo.get("db_route_key", 1);
		DynamicDataSourceContextHolder.setDataSourceType(1);
		log.info("数据源切换:{}", 1);
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
								@Nullable Exception ex) {
		DynamicDataSourceContextHolder.clearDataSourceType();
	}

}
