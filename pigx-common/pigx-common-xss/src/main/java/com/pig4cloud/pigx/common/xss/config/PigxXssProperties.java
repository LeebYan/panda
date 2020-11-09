/*
 * Copyright (c) 2019-2029, Dreamlu 卢春梦 (596392912@qq.com & www.dreamlu.net).
 * <p>
 * Licensed under the GNU LESSER GENERAL PUBLIC LICENSE 3.0;
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.gnu.org/licenses/lgpl.html
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.pig4cloud.pigx.common.xss.config;

import cn.hutool.core.collection.CollUtil;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**
 * Xss配置类
 *
 * @author L.cm
 */
@Getter
@Setter
@ConfigurationProperties("security.xss")
public class PigxXssProperties implements InitializingBean {

	/**
	 * 开启xss
	 */
	private boolean enabled = true;

	/**
	 * 拦截的路由，默认拦截 /**
	 */
	private List<String> pathPatterns = new ArrayList<>();

	/**
	 * 放行的规则，默认为空
	 */
	private List<String> excludePatterns = new ArrayList<>();

	@Override
	public void afterPropertiesSet() {
		if (CollUtil.isEmpty(pathPatterns)) {
			pathPatterns.add("/**");
		}
	}

}
