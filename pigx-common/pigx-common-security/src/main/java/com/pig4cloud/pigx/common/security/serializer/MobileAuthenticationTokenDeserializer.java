package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import com.pig4cloud.pigx.common.security.mobile.MobileAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * @author lengleng
 * @date 2020/10/21
 * <p>
 * MobileAuthenticationToken 反序列化处理
 */
public class MobileAuthenticationTokenDeserializer extends StdDeserializer<MobileAuthenticationToken> {

	protected MobileAuthenticationTokenDeserializer() {
		super(MobileAuthenticationToken.class);
	}

	@Override
	public MobileAuthenticationToken deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {

		ObjectMapper mapper = (ObjectMapper) jp.getCodec();
		JsonNode jsonNode = mapper.readTree(jp);

		Set<GrantedAuthority> authorities = getAuthorities(mapper, jsonNode);

		User principal = mapper.convertValue(jsonNode.get("principal"), User.class);

		return new MobileAuthenticationToken(principal, authorities);
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
