package com.pig4cloud.pigx.ureport.config;

import com.bstek.ureport.definition.datasource.BuildinDatasource;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;

/**
 * @author lengleng
 * @date 2020/11/30
 */
@Component
@RequiredArgsConstructor
public class InnerDatasource implements BuildinDatasource {
	private final DataSource datasource;

	@Override
	public String name() {
		return "内部数据源";
	}

	@SneakyThrows
	@Override
	public Connection getConnection() {
		// 通过yaml 配置数据源信息
		return datasource.getConnection();
	}
}