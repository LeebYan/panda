/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */

package com.pig4cloud.pigx.common.aws;

import com.pig4cloud.pigx.common.aws.http.AwsEndpoint;
import com.pig4cloud.pigx.common.aws.service.AwsTemplate;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

/**
 * aws 自动配置类
 *
 * @author lengleng
 * @author 858695266
 */
@AllArgsConstructor
@EnableConfigurationProperties({AwsProperties.class})
public class AwsAutoConfiguration {
	private final AwsProperties properties;

	@Bean
	@ConditionalOnMissingBean(AwsTemplate.class)
	@ConditionalOnProperty(name = "oss.endpoint")
	AwsTemplate awsTemplate() {
		return new AwsTemplate(properties);
	}

	@Bean
	@ConditionalOnProperty(name = "oss.enable", havingValue = "true")
	public AwsEndpoint awsEndpoint(AwsTemplate template) {
		return new AwsEndpoint(template);
	}

}
