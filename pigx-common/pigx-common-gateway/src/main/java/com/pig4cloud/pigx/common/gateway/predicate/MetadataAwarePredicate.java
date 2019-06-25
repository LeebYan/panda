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

package com.pig4cloud.pigx.common.gateway.predicate;

import cn.hutool.core.util.StrUtil;
import com.pig4cloud.pigx.common.core.util.SpringContextHolder;
import com.pig4cloud.pigx.common.gateway.support.MicaRibbonRuleProperties;
import org.springframework.cloud.alibaba.nacos.ribbon.NacosServer;

import java.util.Map;

/**
 * 基于 Metadata 的服务筛选
 *
 * @author L.cm
 */
public class MetadataAwarePredicate extends DiscoveryEnabledPredicate {

	@Override
	protected boolean apply(NacosServer server) {
		final Map<String, String> metadata = server.getMetadata();

		// 获取配置
		MicaRibbonRuleProperties properties = SpringContextHolder.getBean(MicaRibbonRuleProperties.class);
		// 服务里的配置
		String localTag = properties.getTag();

		if (StrUtil.isBlank(localTag)) {
			return true;
		}

		// 本地有 tag，服务没有，返回 false
		String metaDataTag = metadata.get("tag");
		if (StrUtil.isBlank(metaDataTag)) {
			return false;
		}

		return metaDataTag.equals(localTag);
	}

}
