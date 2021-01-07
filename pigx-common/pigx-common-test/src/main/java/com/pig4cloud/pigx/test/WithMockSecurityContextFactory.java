package com.pig4cloud.pigx.test;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import com.pig4cloud.pigx.common.core.util.SpringContextHolder;
import com.pig4cloud.pigx.common.security.service.PigxUser;
import com.pig4cloud.pigx.test.annotation.WithMockOAuth2User;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.provider.token.AccessTokenConverter;
import org.springframework.security.test.context.support.WithSecurityContextFactory;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author lengleng
 * @date 2020/9/22
 * <p>
 * oauth2 上下文生成处理器
 */
public class WithMockSecurityContextFactory implements WithSecurityContextFactory<WithMockOAuth2User> {

	@Override
	public SecurityContext createSecurityContext(WithMockOAuth2User oAuth2User) {
		// 1. 请求认证中心
		JSONObject authResult = request(oAuth2User);

		// 2. 解析认证中心返回报文
		PigxUser principal = parse(authResult);

		// 3. 构建 oauth2 上下文
		SecurityContext context = SecurityContextHolder.createEmptyContext();
		Authentication auth = new UsernamePasswordAuthenticationToken(principal, "N/A", principal.getAuthorities());
		context.setAuthentication(auth);

		// 4. 上下文保存 token
		String token = authResult.getStr("access_token");
		DefaultOAuth2AccessToken accessToken = new DefaultOAuth2AccessToken(token);
		OAuth2ClientContext clientContext = SpringContextHolder.getBean(OAuth2ClientContext.class);
		clientContext.setAccessToken(accessToken);
		return context;
	}

	/**
	 * 请求认证中心
	 * @param oAuth2User 账号、密码
	 * @return JSONObject
	 */
	private JSONObject request(WithMockOAuth2User oAuth2User) {
		OAuth2ProtectedResourceDetails clientProperties = SpringContextHolder
				.getBean(OAuth2ProtectedResourceDetails.class);

		String result = HttpRequest.post(clientProperties.getAccessTokenUri())
				.basicAuth(clientProperties.getClientId(), clientProperties.getClientSecret())
				.form("username", oAuth2User.username()).form("password", oAuth2User.password())
				.form("grant_type", "password").form("scope", clientProperties.getScope()).execute().body();

		return JSONUtil.parseObj(result);
	}

	/**
	 * 请求认证中心
	 * @param tokenObj 认证中心返回结果
	 * @return 用户信息
	 */
	private PigxUser parse(JSONObject tokenObj) {
		JSONObject userInfo = tokenObj.getJSONObject("user_info");

		Integer id = userInfo.getInt(SecurityConstants.DETAILS_USER_ID);
		Integer deptId = userInfo.getInt(SecurityConstants.DETAILS_DEPT_ID);
		String phone = userInfo.getStr(SecurityConstants.DETAILS_PHONE);
		String avatar = userInfo.getStr(SecurityConstants.DETAILS_AVATAR);
		String username = userInfo.getStr(SecurityConstants.DETAILS_USERNAME);
		Integer tenantId = userInfo.getInt(SecurityConstants.DETAILS_TENANT_ID);

		return new PigxUser(id, deptId, phone, avatar, tenantId, username, "N/A", true, true, true, true,
				getAuthorities(userInfo));
	}

	/**
	 * 转换用户权限角色信息 注入到 上线文对象
	 * @param userInfo
	 * @return
	 */
	private Collection<? extends GrantedAuthority> getAuthorities(JSONObject userInfo) {
		List<String> authorityList = userInfo.getJSONArray(AccessTokenConverter.AUTHORITIES).stream().map(obj -> {
			JSONObject jsonObject = (JSONObject) obj;
			return jsonObject.getStr("authority");
		}).collect(Collectors.toList());
		return AuthorityUtils.commaSeparatedStringToAuthorityList(CollUtil.join(authorityList, StrUtil.COMMA));
	}

}
