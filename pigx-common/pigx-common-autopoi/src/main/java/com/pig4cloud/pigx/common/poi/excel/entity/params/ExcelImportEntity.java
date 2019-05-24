package com.pig4cloud.pigx.common.poi.excel.entity.params;

import lombok.Data;

import java.util.List;

/**
 * excel 导入工具类,对cell类型做映射
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
@Data
public class ExcelImportEntity extends ExcelBaseEntity {
	/**
	 * 对应 Collection NAME
	 */
	private String collectionName;
	/**
	 * 保存图片的地址
	 */
	private String saveUrl;
	/**
	 * 保存图片的类型,1是文件,2是数据库
	 */
	private int saveType;
	/**
	 * 对应exportType
	 */
	private String classType;
	/**
	 * 校驗參數
	 */
	private ExcelVerifyEntity verify;
	/**
	 * 后缀
	 */
	private String suffix;
	/**
	 * list
	 */
	private List<ExcelImportEntity> list;


}
