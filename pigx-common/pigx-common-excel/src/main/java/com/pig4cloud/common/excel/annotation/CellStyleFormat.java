package com.pig4cloud.common.excel.annotation;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;

import java.lang.annotation.*;

/**
 * 单元格样式
 *
 * @author lishangbu
 * @date 2019-06-11
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface CellStyleFormat {

	/**
	 * 水平居中方式 默认居中
	 * @see HorizontalAlignment
	 */
	HorizontalAlignment horizontalalignment() default HorizontalAlignment.CENTER;

	/**
	 *
	 * 垂直居中方式 默认居中
	 * @see VerticalAlignment
	 */
	VerticalAlignment verticalAlignment() default VerticalAlignment.CENTER;


	/**
	 * 边框方式 默认无
	 * @see BorderStyle
	 */
	BorderStyle borderStyle() default BorderStyle.NONE;


	/**
	 * 边框颜色 默认白
	 * @see IndexedColors
	 */
	IndexedColors borderColor() default IndexedColors.WHITE;


	/**
	 * 字体设置
	 * @see org.apache.poi.xssf.usermodel.XSSFFont
	 * @see org.apache.poi.hssf.usermodel.HSSFFont
	 */
	CellFontFormat cellFont() default @CellFontFormat();


	/**
	 * 背景颜色
	 * @see IndexedColors
	 */
	IndexedColors fillBackgroundColor() default IndexedColors.WHITE;


	/**
	 * 单元格是否换行
	 */
	boolean warpText() default false;

}