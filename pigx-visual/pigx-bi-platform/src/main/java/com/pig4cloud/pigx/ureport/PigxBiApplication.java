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

package com.pig4cloud.pigx.ureport;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author lengleng
 * @date 2020-10-15 报表模块
 * <p>
 * 此模块由于使用的是ureport 封装报表设计器，无法区分租户权限较大建议不提供具体租户使用。
 * <p>
 * http://127.0.0.1:5006/ureport/designer
 */
@SpringCloudApplication
public class PigxBiApplication {

	public static void main(String[] args) {
		SpringApplication.run(PigxBiApplication.class, args);
	}

}
