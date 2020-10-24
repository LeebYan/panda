package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import org.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken;

import java.io.IOException;
import java.util.Date;

/**
 * DefaultExpiringOAuth2RefreshToken 反序列化
 *
 * @author dream.lu
 */
public class OAuth2RefreshTokenDeserializer extends StdDeserializer<DefaultExpiringOAuth2RefreshToken> {

	protected OAuth2RefreshTokenDeserializer() {
		super(DefaultExpiringOAuth2RefreshToken.class);
	}

	@Override
	public DefaultExpiringOAuth2RefreshToken deserialize(JsonParser jp, DeserializationContext ctxt)
			throws IOException, JsonProcessingException {
		// {"@class":"org.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken","value":"a94d2f04-d9be-49f9-9d9c-2bc7b34c8618","expiration":["java.util.Date",1605237988760]}
		ObjectMapper mapper = (ObjectMapper) jp.getCodec();
		JsonNode jsonNode = mapper.readTree(jp);
		String value = jsonNode.get("value").asText();
		JsonNode expirationNode = jsonNode.get("expiration");
		Date date = mapper.convertValue(expirationNode, Date.class);
		return new DefaultExpiringOAuth2RefreshToken(value, date);
	}

}
