package com.pig4cloud.pigx.common.poi.handler.inter;

/**
 * 接口自定义处理类
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public interface IExcelReadRowHanlder<T> {
	/**
	 * 处理解析对象
	 *
	 * @param t
	 */
	void hanlder(T t);

}
