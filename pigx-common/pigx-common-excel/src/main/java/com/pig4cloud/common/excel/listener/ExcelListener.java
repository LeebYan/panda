package com.pig4cloud.common.excel.listener;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import lombok.Getter;
import lombok.Setter;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Excel监听器
 * 可以根据需要，自定义处理获取到的数据
 *
 * @author lishangbu
 * @date 2019-06-11
 */
public class ExcelListener extends AnalysisEventListener {

	/**
	 * 自定义用于暂时存储data,可以通过实例获取该值
	 */
	@Setter
	@Getter
	private List<Object> dataList = new ArrayList<>();

	/**
	 * 通过 AnalysisContext 对象还可以获取当前 sheet，当前行等数据
	 */
	@Override
	public void invoke(Object object, AnalysisContext context) {
		// 数据存储到list，供批量处理，或后续自己业务逻辑处理。
		if (!checkObjAllFieldsIsNull(object)) {
			dataList.add(object);
		}
	}

	@Override
	public void doAfterAllAnalysed(AnalysisContext context) {
		//do something
	}

	private static final String SERIAL_VERSION_UID = "serialVersionUID";

	/**
	 * 判断对象中属性值是否全为空
	 *
	 * @param object
	 * @return true为空false不为空
	 */
	private static boolean checkObjAllFieldsIsNull(Object object) {
		if (ObjectUtil.isNull(object)) {
			return true;
		}
		try {
			for (Field f : object.getClass().getDeclaredFields()) {
				f.setAccessible(true);
				//只校验带ExcelProperty注解的属性
				ExcelProperty property = f.getAnnotation(ExcelProperty.class);
				if (ObjectUtil.isNull(property) || SERIAL_VERSION_UID.equals(f.getName())) {
					continue;
				}
				if (ObjectUtil.isNotNull(f.get(object)) && StrUtil.isNotBlank(f.get(object).toString())) {
					return false;
				}
			}
		} catch (Exception e) {
			//do something
		}
		return true;
	}

}