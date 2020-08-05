package com.pig4cloud.pigx.codegen.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.codegen.entity.ColumnEntity;
import com.pig4cloud.pigx.common.data.datascope.PigxBaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author lengleng
 * @date 2020/5/18
 */
@Mapper
public interface GenTableColumnMapper extends PigxBaseMapper<ColumnEntity> {

	/**
	 * 分页查询表分页信息
	 * @param page
	 * @param tableName
	 * @param dsName
	 * @return
	 */
	@DS("#last")
	IPage<ColumnEntity> selectTableColumn(Page page, @Param("tableName") String tableName,
			@Param("dsName") String dsName);

	/**
	 * 查询表全部列信息
	 * @param tableName
	 * @param dsName
	 * @return
	 */
	@DS("#last")
	List<ColumnEntity> selectTableColumn(@Param("tableName") String tableName, @Param("dsName") String dsName);

	/**
	 * 查询表全部列信息
	 * @param tableName 表名称
	 * @param dsName 数据源名称
	 * @return
	 */
	@DS("#last")
	List<Map<String, String>> selectMapTableColumn(@Param("tableName") String tableName, String dsName);

}
