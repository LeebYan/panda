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

package com.pig4cloud.pigx.ureport.config;

import lombok.SneakyThrows;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import java.net.URLEncoder;

/**
 * WebSecurityConfigurer
 *
 * @author lengleng
 * @date 2020-12-05
 */
@Configuration
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {

	@Override
	@SneakyThrows
	protected void configure(HttpSecurity http) {
		http.formLogin()
				.loginPage("/login.html")
				.loginProcessingUrl("/login")
				.failureHandler((request, response, exception) -> {
					response.sendRedirect("/login.html?error=" + URLEncoder.encode(exception.getLocalizedMessage(), "utf-8"));
				})
				.and()
				.authorizeRequests()
				.antMatchers("/login.html", "/login").permitAll()
				.anyRequest()
				.authenticated()
				.and()
				.csrf().disable();
	}

	/**
	 * 不拦截静态资源
	 *
	 * @param web
	 */
	@Override
	public void configure(WebSecurity web) {
		web.ignoring().antMatchers("/favicon.ico", "/css/**", "/error");
	}


}
