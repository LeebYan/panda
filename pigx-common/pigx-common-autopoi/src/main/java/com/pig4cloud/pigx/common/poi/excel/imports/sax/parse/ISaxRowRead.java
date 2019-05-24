package com.pig4cloud.pigx.common.poi.excel.imports.sax.parse;

import java.util.List;

import com.pig4cloud.pigx.common.poi.excel.entity.sax.SaxReadCellEntity;

/**
 *
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 */
public interface ISaxRowRead {
	/**
	 * 获取返回数据
	 * 
	 * @param <T>
	 * @return
	 */
	public <T> List<T> getList();

	/**
	 * 解析数据
	 * 
	 * @param index
	 * @param datas
	 */
	public void parse(int index, List<SaxReadCellEntity> datas);

}
