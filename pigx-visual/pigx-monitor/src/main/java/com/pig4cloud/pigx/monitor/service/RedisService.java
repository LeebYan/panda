package com.pig4cloud.pigx.monitor.service;

import com.pig4cloud.pigx.common.core.util.R;

import java.util.Map;

/**
 * @author lengleng
 * @date 2019-05-08
 * <p>
 * redis 监控
 */
public interface RedisService {
	/**
	 * 获取内存信息
	 *
	 * @return
	 */
	Map<String, Object> getInfo();

	/**
	 * 执行运行命令
	 *
	 * @param command
	 * @return
	 */
	R exec(String command);
}
