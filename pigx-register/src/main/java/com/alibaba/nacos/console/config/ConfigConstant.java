package com.alibaba.nacos.console.config;

/**
 * @author lengleng
 * @date 2019-04-19
 * <p>
 * 覆盖nacos 默认配置
 */
public interface ConfigConstant {
	/**
	 * The System property name of  Standalone mode
	 */
	String STANDALONE_MODE = "nacos.standalone";

	/**
	 * 环境变量
	 */
	String USER_HOME = "user.home";

	/**
	 * nacos 日志路径配置
	 */
	String NACOS_LOGS_PATH = "nacos.logs.path";

	/**
	 * nacos 家目录
	 */
	String NACOS_HOME = "nacos.home";


	/**
	 * tomcat 目录
	 */
	String TOMCAT_DIR = "server.tomcat.basedir";

	/**
	 * tomcat 日志配置
	 */
	String TOMCAT_ACCESS_LOG = "server.tomcat.accesslog.enabled";
}
