package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import com.pig4cloud.pigx.common.security.service.PigxUser;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.DefaultOAuth2RefreshToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.util.OAuth2Utils;

import java.io.IOException;
import java.util.*;

/**
 * 反序列化
 *
 * @author dream.lu
 */
public final class AccessTokenJackson2Deserializer extends StdDeserializer<OAuth2AccessToken> {

	public AccessTokenJackson2Deserializer() {
		super(OAuth2AccessToken.class);
	}

	@Override
	public Object deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer)
			throws IOException {
		return myDeserializeWithType(p);
	}

	private OAuth2AccessToken myDeserializeWithType(JsonParser jp) throws IOException {
		ObjectMapper mapper = (ObjectMapper) jp.getCodec();
		JsonNode jsonNode = mapper.readTree(jp);
		String tokenValue = jsonNode.get(OAuth2AccessToken.ACCESS_TOKEN).asText();
		String tokenType = jsonNode.get(OAuth2AccessToken.TOKEN_TYPE).asText();
		String refreshToken = jsonNode.get(OAuth2AccessToken.REFRESH_TOKEN).asText();
		long expiresIn = jsonNode.get(OAuth2AccessToken.EXPIRES_IN).asLong();
		DefaultOAuth2AccessToken accessToken = new DefaultOAuth2AccessToken(tokenValue);
		accessToken.setTokenType(tokenType);
		accessToken.setExpiration(new Date(System.currentTimeMillis() + expiresIn * 1000));
		if (refreshToken != null) {
			accessToken.setRefreshToken(new DefaultOAuth2RefreshToken(refreshToken));
		}
		// scope
		JsonNode scopeNode = jsonNode.get(OAuth2AccessToken.SCOPE);
		accessToken.setScope(parseScope(scopeNode));
		// 扩展字段
		accessToken.setAdditionalInformation(parseAdditionalInformation(mapper, jsonNode));
		return accessToken;
	}

	@Override
	public OAuth2AccessToken deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
		return myDeserializeWithType(jp);
	}

	/**
	 * 解析 scope
	 * @param scopeNode scope json
	 * @return String Set
	 */
	private static Set<String> parseScope(JsonNode scopeNode) {
		// 空处理
		if (scopeNode == null || scopeNode.isNull()) {
			return Collections.emptySet();
		}
		// 字符串 x xx xxx 格式
		if (scopeNode.isTextual()) {
			return OAuth2Utils.parseParameterList(scopeNode.asText());
		}
		// 集合模型
		Set<String> scope = new TreeSet<>();
		Iterator<JsonNode> elements = scopeNode.elements();
		while (elements.hasNext()) {
			JsonNode next = elements.next();
			scope.add(next.asText());
		}
		return scope;
	}

	/**
	 * 解析扩展字段
	 * @param mapper jackson 工具
	 * @param jsonNode json String
	 * @return map
	 * @see com.pig4cloud.pigx.common.security.component.PigxTokenEnhancer
	 */
	private Map<String, Object> parseAdditionalInformation(ObjectMapper mapper, JsonNode jsonNode) {
		LinkedHashMap<String, Object> additionalInformation = new LinkedHashMap<>();

		// 处理 user_info
		JsonNode userNode = jsonNode.get(SecurityConstants.DETAILS_USER);
		User user = mapper.convertValue(userNode, User.class);
		int deptId = userNode.get(SecurityConstants.DETAILS_DEPT_ID).asInt();
		int tenantId = userNode.get(SecurityConstants.DETAILS_TENANT_ID).asInt();
		int userId = userNode.get(SecurityConstants.DETAILS_USER_ID).asInt();
		String phone = userNode.get(SecurityConstants.DETAILS_PHONE).asText();
		String avatar = userNode.get(SecurityConstants.DETAILS_AVATAR).asText();
		PigxUser pigxUser = new PigxUser(userId, deptId, phone, avatar, tenantId, user.getUsername(), "N/A",
				user.isEnabled(), user.isAccountNonExpired(), user.isCredentialsNonExpired(), user.isAccountNonLocked(),
				user.getAuthorities());
		additionalInformation.put(SecurityConstants.DETAILS_USER, pigxUser);

		// 处理 license 等扩展字段 【去掉OAuth2AccessToken 字段避免重复】
		additionalInformation.put(SecurityConstants.DETAILS_LICENSE,
				jsonNode.get(SecurityConstants.DETAILS_LICENSE).asText());
		additionalInformation.put(SecurityConstants.ACTIVE, jsonNode.get(SecurityConstants.ACTIVE).asBoolean());
		return additionalInformation;
	}

}
