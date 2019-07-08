package com.pig4cloud.pigx.gateway.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.cloud.gateway.config.GlobalCorsProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;


/**
 * Spring Cloud Gateway 跨域配置
 *
 * @author jclazz
 * @date 7/5/2019
 * @since 3.1.0
 */
@Configuration
public class GlobalCorsConfig {
	@ConditionalOnBean(GlobalCorsProperties.class)
	@Bean
	CorsWebFilter corsWebFilter(GlobalCorsProperties globalCorsProperties) {
		UrlBasedCorsConfigurationSource source =
				new UrlBasedCorsConfigurationSource();
		source.setCorsConfigurations(globalCorsProperties.getCorsConfigurations());
		return new CorsWebFilter(source);
	}
}
