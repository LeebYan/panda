package com.pig4cloud.pigx.common.poi.word.entity.params;

import lombok.Data;

/**
 * Excel 对象导出结构
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Data
public class ListParamEntity {
	/**
	 * 唯一值,在遍历中重复使用
	 */
	public static final String SINGLE = "single";
	/**
	 * 属于数组类型
	 */
	public static final String LIST = "list";
	/**
	 * 属性名称
	 */
	private String name;
	/**
	 * 目标
	 */
	private String target;
	/**
	 * 当是唯一值的时候直接求出值
	 */
	private Object value;
	/**
	 * 数据类型,SINGLE || LIST
	 */
	private String type;

	public ListParamEntity() {

	}

	public ListParamEntity(String name, Object value) {
		this.name = name;
		this.value = value;
		this.type = LIST;
	}

	public ListParamEntity(String name, String target) {
		this.name = name;
		this.target = target;
		this.type = LIST;
	}

}
