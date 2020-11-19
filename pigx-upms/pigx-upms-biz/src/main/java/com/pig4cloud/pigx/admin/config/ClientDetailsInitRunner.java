package com.pig4cloud.pigx.admin.config;

import cn.hutool.core.util.StrUtil;
import com.pig4cloud.pigx.admin.api.entity.SysOauthClientDetails;
import com.pig4cloud.pigx.admin.service.SysOauthClientDetailsService;
import com.pig4cloud.pigx.admin.service.SysTenantService;
import com.pig4cloud.pigx.common.core.constant.CacheConstants;
import com.pig4cloud.pigx.common.data.tenant.TenantBroker;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lengleng
 * @date 2020/11/18
 * <p>
 * oauth 客户端认证参数初始化
 */
@Slf4j
@Service
@RequiredArgsConstructor
@SuppressWarnings("all")
public class ClientDetailsInitRunner {

	private final SysOauthClientDetailsService clientDetailsService;

	private final SysTenantService tenantService;

	private final RedisTemplate redisTemplate;

	@Async
	@Order
	@EventListener({ WebServerInitializedEvent.class, ClientDetailsInitEvent.class })
	public void initClientDetails() {
		log.debug("初始化客户端信息开始 ");
		List<SysOauthClientDetails> clientDetailsList = new ArrayList<>();

		// 查询全部租户的客户端定义信息
		tenantService.list().forEach(tenant -> clientDetailsList
				.addAll(TenantBroker.applyAs(tenant.getId(), tenantId -> clientDetailsService.list())));

		for (SysOauthClientDetails client : clientDetailsList) {
			if (StrUtil.isBlank(client.getAdditionalInformation())) {
				continue;
			}
			// 拼接key 1:client_config_flag:clinetId
			String key = String.format("%s:%s:%s", client.getTenantId(), CacheConstants.CLIENT_FLAG,
					client.getClientId());
			// hashkey clientId
			redisTemplate.opsForValue().set(key, client.getAdditionalInformation());
		}

		log.debug("初始化客户端信息结束 ");
	}

	/**
	 * 客户端刷新事件
	 */
	public static class ClientDetailsInitEvent extends ApplicationEvent {

		public ClientDetailsInitEvent(Object source) {
			super(source);
		}

	}

}
