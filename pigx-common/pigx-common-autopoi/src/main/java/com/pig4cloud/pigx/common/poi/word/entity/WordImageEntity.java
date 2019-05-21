package com.pig4cloud.pigx.common.poi.word.entity;

import lombok.Data;

/**
 * word导出,图片设置和图片信息
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Data
public class WordImageEntity {
	/**
	 * 地址
	 */
	public static String URL = "url";
	/**
	 * 数据
	 */
	public static String Data = "data";
	/**
	 * 图片输入方式
	 */
	private String type = URL;
	/**
	 * 图片宽度
	 */
	private int width;
	/**
	 * 图片高度
	 */
	private int height;
	/**
	 * 图片地址
	 */
	private String url;
	/**
	 * 图片信息
	 */
	private byte[] data;

	public WordImageEntity() {

	}

	public WordImageEntity(byte[] data, int width, int height) {
		this.data = data;
		this.width = width;
		this.height = height;
		this.type = Data;
	}

	public WordImageEntity(String url, int width, int height) {
		this.url = url;
		this.width = width;
		this.height = height;
	}

}
