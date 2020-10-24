package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 * 序列化
 *
 * @author dream.lu
 */
public final class AccessTokenJackson2Serializer extends StdSerializer<OAuth2AccessToken> {

	public AccessTokenJackson2Serializer() {
		super(OAuth2AccessToken.class);
	}

	@Override
	public void serializeWithType(OAuth2AccessToken value, JsonGenerator gen, SerializerProvider serializers,
			TypeSerializer typeSer) throws IOException {
		mySerializeWithType(value, gen, serializers, typeSer);
	}

	private void mySerializeWithType(OAuth2AccessToken token, JsonGenerator gen, SerializerProvider serializers,
			TypeSerializer typeSer) throws IOException {
		gen.writeStartObject();
		if (typeSer != null) {
			gen.writeStringField(typeSer.getPropertyName(), token.getClass().getName());
		}
		Map<String, Object> tokenMap = new LinkedHashMap<>();
		tokenMap.put(OAuth2AccessToken.ACCESS_TOKEN, token.getValue());
		tokenMap.put(OAuth2AccessToken.TOKEN_TYPE, token.getTokenType());
		OAuth2RefreshToken refreshToken = token.getRefreshToken();
		if (refreshToken != null) {
			tokenMap.put(OAuth2AccessToken.REFRESH_TOKEN, refreshToken.getValue());
		}
		Date expiration = token.getExpiration();
		if (expiration != null) {
			long now = System.currentTimeMillis();
			tokenMap.put(OAuth2AccessToken.EXPIRES_IN, (expiration.getTime() - now) / 1000);
		}
		Set<String> scope = token.getScope();
		if (scope != null && !scope.isEmpty()) {
			StringBuilder scopes = new StringBuilder();
			for (String s : scope) {
				Assert.hasLength(s, "Scopes cannot be null or empty. Got " + scope);
				scopes.append(s);
				scopes.append(" ");
			}
			tokenMap.put(OAuth2AccessToken.SCOPE, scopes.substring(0, scopes.length() - 1));
		}
		Map<String, Object> additionalInformation = token.getAdditionalInformation();
		tokenMap.putAll(additionalInformation);
		for (String key : tokenMap.keySet()) {
			gen.writeObjectField(key, tokenMap.get(key));
		}
		gen.writeEndObject();
	}

	@Override
	public void serialize(OAuth2AccessToken token, JsonGenerator gen, SerializerProvider provider) throws IOException {
		mySerializeWithType(token, gen, provider, null);
	}

}
