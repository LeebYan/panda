/*
 *
 *  *  Copyright (c) 2019-2020, 冷冷 (wangiegie@gmail.com).
 *  *  <p>
 *  *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  *  you may not use this file except in compliance with the License.
 *  *  You may obtain a copy of the License at
 *  *  <p>
 *  * https://www.gnu.org/licenses/lgpl.html
 *  *  <p>
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 *
 */

package com.pig4cloud.pigx.common.security.component;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.provider.authentication.BearerTokenExtractor;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import javax.servlet.http.HttpServletRequest;

/**
 * 改造 {@link BearerTokenExtractor} 对公开权限的请求不进行校验
 *
 * @author caiqy
 * @date 2020.05.15
 */
@Component
@RequiredArgsConstructor
public class PigxBearerTokenExtractor extends BearerTokenExtractor {

	private final PathMatcher pathMatcher = new AntPathMatcher();

	private final PermitAllUrlResolver permitAllUrlResolver;

	@Override
	public Authentication extract(HttpServletRequest request) {

		// 2. 判断请求方法是否匹配
		boolean result = permitAllUrlResolver.getIgnoreUrls().stream().anyMatch(url -> {
			String[] strings = StrUtil.split(url, "|");
			// 1. 判断路径是否匹配
			boolean match = pathMatcher.match(strings[0], request.getRequestURI());
			// 2. 判断方法是否匹配
			if (strings.length == 2) {
				String[] methods = StrUtil.split(strings[1], StrUtil.COMMA);
				return ArrayUtil.contains(methods, request.getMethod()) && match;
			}
			return match;
		});
		return result ? null : super.extract(request);
	}

}
