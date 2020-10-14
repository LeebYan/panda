package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import com.pig4cloud.pigx.common.security.mobile.MobileAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.jackson2.CoreJackson2Module;
import org.springframework.security.jackson2.SimpleGrantedAuthorityMixin;
import org.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.store.redis.BaseRedisTokenStoreSerializationStrategy;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * jackson 序列化
 *
 * @author dream.lu
 */
public class JacksonRedisTokenStoreSerializationStrategy extends BaseRedisTokenStoreSerializationStrategy {

	private final ObjectMapper mapper;

	public JacksonRedisTokenStoreSerializationStrategy() {
		this.mapper = new ObjectMapper();
		this.mapper.activateDefaultTyping(LaissezFaireSubTypeValidator.instance, ObjectMapper.DefaultTyping.NON_FINAL,
				JsonTypeInfo.As.PROPERTY);
		this.mapper.addMixIn(OAuth2AccessToken.class, AccessTokenMixIn.class);
		this.mapper.addMixIn(OAuth2Authentication.class, OAuth2AuthenticationMixin.class);
		this.mapper.addMixIn(PreAuthenticatedAuthenticationToken.class, PreAuthenticatedAuthenticationTokenMixin.class);
		this.mapper.addMixIn(MobileAuthenticationToken.class, MobileAuthenticationTokenMixin.class);
		this.mapper.addMixIn(SimpleGrantedAuthority.class, SimpleGrantedAuthorityMixin.class);
		this.mapper.registerModule(new CoreJackson2Module());
		this.mapper.addMixIn(DefaultExpiringOAuth2RefreshToken.class, OAuth2RefreshTokenMixin.class);
	}

	@Override
	protected <T> T deserializeInternal(byte[] bytes, Class<T> clazz) {
		try {
			return mapper.readValue(bytes, clazz);
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	protected String deserializeStringInternal(byte[] bytes) {
		return new String(bytes, StandardCharsets.UTF_8);
	}

	@Override
	protected byte[] serializeInternal(Object object) {
		try {
			return mapper.writeValueAsBytes(object);
		}
		catch (JsonProcessingException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	protected byte[] serializeInternal(String data) {
		return data.getBytes(StandardCharsets.UTF_8);
	}

}
