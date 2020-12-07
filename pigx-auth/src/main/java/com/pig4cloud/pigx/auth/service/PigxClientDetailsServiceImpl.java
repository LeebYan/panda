package com.pig4cloud.pigx.auth.service;

import com.pig4cloud.pigx.admin.api.entity.SysOauthClientDetails;
import com.pig4cloud.pigx.admin.api.feign.RemoteClientDetailsService;
import com.pig4cloud.pigx.common.core.constant.CacheConstants;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.oauth2.common.exceptions.InvalidClientException;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.client.BaseClientDetails;
import org.springframework.stereotype.Service;

/**
 * @author lengleng
 * @date 2020/03/25
 * <p>
 * 扩展 JdbcClientDetailsService 支持多租户
 */
@Service
@RequiredArgsConstructor
public class PigxClientDetailsServiceImpl implements ClientDetailsService {

	private final RemoteClientDetailsService clientDetailsService;

	/**
	 * 重写原生方法支持redis缓存
	 * @param clientId
	 * @return ClientDetails
	 * @throws InvalidClientException
	 */
	@Override
	@Cacheable(value = CacheConstants.CLIENT_DETAILS_KEY, key = "#clientId", unless = "#result == null")
	public ClientDetails loadClientByClientId(String clientId) {
		SysOauthClientDetails clientDetails = clientDetailsService
				.getClientDetailsById(clientId, SecurityConstants.FROM_IN).getData();

		if (clientDetails == null) {
			return null;
		}

		// copy原值
		BaseClientDetails client = new BaseClientDetails();
		BeanUtils.copyProperties(clientDetails, client);
		client.setClientSecret(String.format("{noop}%s", clientDetails.getClientSecret()));
		return client;
	}

}
