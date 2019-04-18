/*
 * Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.nacos;

import com.alibaba.nacos.core.utils.Constants;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author nacos
 * <p>
 * nacos console 源码运行，方便开发
 * 生产建议从官网下载最新版配置运行
 */
@EnableScheduling
@SpringBootApplication
public class PigxNacosApplication {

	public static void main(String[] args) {
		System.setProperty("server.tomcat.basedir", "logs");
		System.setProperty("nacos.home", "pigx-config");
		System.setProperty("user.home", "logs");
		System.setProperty(Constants.STANDALONE_MODE_PROPERTY_NAME, "true");
		SpringApplication.run(PigxNacosApplication.class, args);
	}
}
