package com.pig4cloud.pigx.auth.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.common.core.constant.CacheConstants;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import com.pig4cloud.pigx.common.core.util.KeyStrResolver;
import com.pig4cloud.pigx.common.core.util.R;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.ConvertingCursor;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author lengleng
 * @date 2020/9/3
 * <p>
 * token 端点相关的业务处理
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PigxTokenDealServiceImpl {

	private final RedisTemplate redisTemplate;

	private final CacheManager cacheManager;

	private final TokenStore tokenStore;

	private final KeyStrResolver keyStrResolver;

	/**
	 * 删除 请求令牌 和 刷新令牌
	 * @param token 请求令牌
	 * @return R
	 */
	public R<Boolean> removeToken(String token) {

		OAuth2AccessToken accessToken = tokenStore.readAccessToken(token);
		if (accessToken == null || StrUtil.isBlank(accessToken.getValue())) {
			return R.ok(Boolean.TRUE, "退出失败，token 无效");
		}

		OAuth2Authentication auth2Authentication = tokenStore.readAuthentication(accessToken);
		// 清空用户信息
		cacheManager.getCache(CacheConstants.USER_DETAILS).evict(auth2Authentication.getName());

		// 清空access token
		tokenStore.removeAccessToken(accessToken);

		// 清空 refresh token
		OAuth2RefreshToken refreshToken = accessToken.getRefreshToken();
		tokenStore.removeRefreshToken(refreshToken);
		return R.ok();
	}

	/**
	 * 根据用户名查询 令牌相关信息
	 * @param page 分页信息
	 * @param username 用户名
	 * @return R
	 */
	public R queryTokenByUsername(Page page, String username) {
		String key = keyStrResolver.extract(
				SecurityConstants.PIGX_PREFIX + SecurityConstants.OAUTH_PREFIX + "uname_to_access:", StrUtil.COLON);

		Object collect = redisTemplate.keys("*:" + username).stream().filter(k -> ((String) k).contains(key))
				.flatMap(k -> {
					redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
					return redisTemplate.opsForSet().members(k).stream();
				}).collect(Collectors.toList());

		if (collect instanceof List) {
			List objSet = (List<?>) collect;
			page.setRecords(objSet);
			page.setTotal(objSet.size());
		}
		return R.ok(page);
	}

	/**
	 * 分页查询token 列表
	 * @param page page
	 * @return
	 */
	public R<Page> queryToken(Page page) {
		// 根据分页参数获取对应数据
		String key = keyStrResolver.extract(SecurityConstants.PIGX_PREFIX + SecurityConstants.OAUTH_PREFIX + "access:*",
				StrUtil.COLON);
		List<String> pages = findKeysForPage(key, page.getCurrent(), page.getSize());
		redisTemplate.setValueSerializer(new JdkSerializationRedisSerializer());
		page.setRecords(redisTemplate.opsForValue().multiGet(pages));
		page.setTotal(redisTemplate.keys(key).size());
		return R.ok(page);
	}

	/**
	 * 使用游标 分页查询key
	 * @param patternKey key 通配符
	 * @param pageNum 当前页
	 * @param pageSize 每页大小
	 * @return 符合的 value列表
	 */
	private List<String> findKeysForPage(String patternKey, long pageNum, long pageSize) {
		ScanOptions options = ScanOptions.scanOptions().count(1000L).match(patternKey).build();
		RedisSerializer<String> redisSerializer = (RedisSerializer<String>) redisTemplate.getKeySerializer();
		Cursor cursor = (Cursor) redisTemplate.executeWithStickyConnection(
				redisConnection -> new ConvertingCursor<>(redisConnection.scan(options), redisSerializer::deserialize));
		List<String> result = new ArrayList<>();
		int tmpIndex = 0;
		long startIndex = (pageNum - 1) * pageSize;
		long end = pageNum * pageSize;

		assert cursor != null;
		while (cursor.hasNext()) {
			if (tmpIndex >= startIndex && tmpIndex < end) {
				result.add(cursor.next().toString());
				tmpIndex++;
				continue;
			}
			if (tmpIndex >= end) {
				break;
			}
			tmpIndex++;
			cursor.next();
		}

		try {
			cursor.close();
		}
		catch (IOException e) {
			log.error("关闭cursor 失败");
		}
		return result;
	}

}
