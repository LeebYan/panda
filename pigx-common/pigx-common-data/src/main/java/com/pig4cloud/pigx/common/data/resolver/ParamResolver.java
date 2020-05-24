package com.pig4cloud.pigx.common.data.resolver;

import cn.hutool.core.util.StrUtil;
import com.pig4cloud.pigx.admin.api.feign.RemoteParamService;
import com.pig4cloud.pigx.common.core.constant.SecurityConstants;
import com.pig4cloud.pigx.common.core.util.SpringContextHolder;
import lombok.experimental.UtilityClass;

/**
 * @author lengleng
 * @date 2020/5/12
 * <p>
 * 系统参数配置解析器
 */
@UtilityClass
public class ParamResolver {

	/**
	 * 根据key 查询value 配置
	 *
	 * @param key        key
	 * @param defaultVal 默认值
	 * @return value
	 */
	public Integer getInt(String key, Integer... defaultVal) {
		return checkAndGet(key, defaultVal);
	}


	/**
	 * 根据key 查询value 配置
	 *
	 * @param key        key
	 * @param defaultVal 默认值
	 * @return value
	 */
	public String getStr(String key, String... defaultVal) {
		return checkAndGet(key, defaultVal);
	}


	private <T> T checkAndGet(String key, Object... defaultVal) {
		// 校验入参是否合法
		if (StrUtil.isBlank(key) || defaultVal.length > 1) {
			throw new IllegalArgumentException("参数不合法");
		}

		RemoteParamService remoteParamService = SpringContextHolder.getBean(RemoteParamService.class);

		String result = remoteParamService.getByKey(key, SecurityConstants.FROM_IN).getData();

		if (StrUtil.isNotBlank(result)) {
			return (T) result;
		}

		if (defaultVal != null) {
			return (T) defaultVal.clone()[0];
		}
		return null;
	}
}