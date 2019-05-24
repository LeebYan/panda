package com.pig4cloud.pigx.common.poi.excel.entity.enmus;

import com.pig4cloud.pigx.common.poi.excel.export.styler.ExcelExportStylerBorderImpl;
import com.pig4cloud.pigx.common.poi.excel.export.styler.ExcelExportStylerColorImpl;
import com.pig4cloud.pigx.common.poi.excel.export.styler.ExcelExportStylerDefaultImpl;

/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * 插件提供的几个默认样式
 */
public enum ExcelStyleType {

	NONE("默认样式", ExcelExportStylerDefaultImpl.class),
	BORDER("边框样式", ExcelExportStylerBorderImpl.class),
	COLOR("间隔行样式", ExcelExportStylerColorImpl.class);

	private String name;
	private Class<?> clazz;

	ExcelStyleType(String name, Class<?> clazz) {
		this.name = name;
		this.clazz = clazz;
	}

	public Class<?> getClazz() {
		return clazz;
	}

	public String getName() {
		return name;
	}

}
