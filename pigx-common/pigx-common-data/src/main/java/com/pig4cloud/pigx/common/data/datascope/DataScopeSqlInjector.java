package com.pig4cloud.pigx.common.data.datascope;

import com.baomidou.mybatisplus.core.injector.AbstractMethod;
import com.baomidou.mybatisplus.core.injector.DefaultSqlInjector;

import java.util.List;

/**
 * @author lengleng
 * @date 2020/4/26
 */
public class DataScopeSqlInjector extends DefaultSqlInjector {

	@Override
	public List<AbstractMethod> getMethodList(Class<?> mapperClass) {
		List<AbstractMethod> methodList = super.getMethodList(mapperClass);
		methodList.add(new SelectListByScope());
		methodList.add(new SelectPageByScope());
		return methodList;
	}

}
