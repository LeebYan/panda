package com.pig4cloud.pigx.common.core.constant.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author lengleng
 * @date 2020-02-17
 * <p>
 * 菜单类型
 */
@Getter
@AllArgsConstructor
public enum MenuTypeEnum {

	/**
	 * 左侧菜单
	 */
	LEFT_MENU("0", "left"),

	/**
	 * 顶部菜单
	 */
	TOP_MENU("2", "top"),

	/**
	 * 按钮
	 */
	BUTTON("1", "button");

	/**
	 * 类型
	 */
	private String type;
	/**
	 * 描述
	 */
	private String description;
}
