package com.pig4cloud.common.excel.annotation;

import org.apache.poi.ss.usermodel.IndexedColors;

import java.lang.annotation.*;

/**
 * 单元格字体
 *
 * @author lishangbu
 * @date 2019-06-11
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface CellFontFormat {

	String fontName() default "宋体";

	short fontHeightInPoints() default 11;

	IndexedColors fontColor() default IndexedColors.BLACK;

}