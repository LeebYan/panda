package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.fasterxml.jackson.databind.type.MapType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;

import java.io.IOException;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * OAuth2Authentication 反序列化
 *
 * @author dream.lu
 */
public class OAuth2AuthenticationDeserializer extends StdDeserializer<OAuth2Authentication> {

	protected OAuth2AuthenticationDeserializer() {
		super(OAuth2Authentication.class);
	}

	@Override
	public OAuth2Authentication deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
		ObjectMapper mapper = (ObjectMapper) jp.getCodec();
		JsonNode jsonNode = mapper.readTree(jp);
		Set<GrantedAuthority> authorities = getAuthorities(mapper, jsonNode);
		JsonNode requestNode = jsonNode.get("storedRequest");
		Map<String, String> requestParameters = getMap(mapper, requestNode.get("requestParameters"));
		String clientId = requestNode.get("clientId").asText();
		boolean approved = requestNode.get("approved").asBoolean();
		Set<String> scope = getSet(mapper, requestNode.get("scope"));
		Set<String> resourceIds = getSet(mapper, requestNode.get("resourceIds"));
		String redirectUri = requestNode.get("redirectUri").asText(null);
		Set<String> responseTypes = getSet(mapper, requestNode.get("responseTypes"));
		Map<String, Serializable> extensionProperties = getMap(mapper, jsonNode.get("extensions"), Serializable.class);
		// 构造 OAuth2Request
		OAuth2Request request = new OAuth2Request(requestParameters, clientId, authorities, approved, scope,
				resourceIds, redirectUri, responseTypes, extensionProperties);
		JsonNode userAuthenticationNode = jsonNode.get("userAuthentication");
		// UsernamePasswordAuthenticationToken 反序列化
		Authentication authentication = null;
		if (userAuthenticationNode != null && !userAuthenticationNode.isMissingNode()) {
			authentication = (Authentication) mapper.convertValue(userAuthenticationNode, Object.class);
		}

		OAuth2Authentication oAuth2Authentication = new OAuth2Authentication(request, authentication);
		oAuth2Authentication.setAuthenticated(true);
		return oAuth2Authentication;

	}

	private static Set<String> getSet(ObjectMapper mapper, JsonNode jsonNode) {
		return getSet(mapper, jsonNode, String.class);
	}

	private static <T> Set<T> getSet(ObjectMapper mapper, JsonNode jsonNode, Class<T> valueClass) {
		CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(Set.class, valueClass);
		return mapper.convertValue(jsonNode, collectionType);
	}

	private static Map<String, String> getMap(ObjectMapper mapper, JsonNode jsonNode) {
		return getMap(mapper, jsonNode, String.class);
	}

	private static <T> Map<String, T> getMap(ObjectMapper mapper, JsonNode jsonNode, Class<T> valueClass) {
		MapType mapType = mapper.getTypeFactory().constructMapType(Map.class, String.class, valueClass);
		return mapper.convertValue(jsonNode, mapType);
	}

	private Set<GrantedAuthority> getAuthorities(ObjectMapper mapper, JsonNode parentNode) {
		JsonNode authoritiesNode = parentNode.get("authorities");
		Set<GrantedAuthority> authorities = new HashSet<>(authoritiesNode.size());
		for (Iterator<JsonNode> authoritiesIt = authoritiesNode.get(1).elements(); authoritiesIt.hasNext();) {
			JsonNode authorityNode = authoritiesIt.next();
			SimpleGrantedAuthority authority = mapper.convertValue(authorityNode, SimpleGrantedAuthority.class);
			authorities.add(authority);
		}
		return authorities;
	}

}
