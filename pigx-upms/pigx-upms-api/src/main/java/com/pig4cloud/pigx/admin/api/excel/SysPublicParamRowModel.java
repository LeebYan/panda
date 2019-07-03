package com.pig4cloud.pigx.admin.api.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 公共参数Excel导出实体
 *
 * @author lishangbu
 * @date 2019-07-03
 */
@Data
@ApiModel(value = "公共参数Excel导出实体")
@EqualsAndHashCode(callSuper = true)
public class SysPublicParamRowModel extends BaseRowModel {
	private static final long serialVersionUID = 1L;
	/**
	 * 编号
	 */
	@ExcelProperty(index = 0 ,value = "公共参数编号")
	@ApiModelProperty(value = "公共参数编号")
	private Long publicId;
	/**
	 * 公共参数名称
	 */
	@ExcelProperty(index = 1 ,value = "公共参数名称")
	@ApiModelProperty(value = "公共参数名称", required = true, example = "公共参数名称")
	private String publicName;
	/**
	 * 公共参数地址值,英文大写+下划线
	 */
	@ExcelProperty(index = 2,value = "公共参数地址")
	@ApiModelProperty(value = "键[英文大写+下划线]", required = true, example = "PIGX_PUBLIC_KEY")
	private String publicKey;
	/**
	 * 值
	 */
	@ExcelProperty(index = 3,value = "值")
	@ApiModelProperty(value = "值", required = true, example = "999")
	private String publicValue;
	/**
	 * 状态（1有效；2无效；）
	 */
	@ExcelProperty(index = 4,value = "状态")
	@ApiModelProperty(value = "标识[1有效；2无效]", example = "1")
	private String status;
	/**
	 * 删除状态（0：正常 1：已删除）
	 */
	@ExcelProperty(index = 5,value = "删除状态")
	@ApiModelProperty(value = "状态[0-正常，1-删除]", example = "0")
	private String delFlag;
	/**
	 * 公共参数编码
	 */
	@ExcelProperty(index = 6,value = "公共参数编码")
	@ApiModelProperty(value = "编码", example = "^(PIG|PIGX)$")
	private String validateCode;
	/**
	 * 创建时间
	 */
	@ExcelProperty(index = 7,value = "创建时间")
	@ApiModelProperty(value = "创建时间", example = "2019-03-21 12:28:48")
	private Date createTime;
	/**
	 * 修改时间
	 */
	@ExcelProperty(index = 8,value = "修改时间")
	@ApiModelProperty(value = "修改时间", example = "2019-03-21 12:28:48")
	private Date updateTime;
	/**
	 * 是否是系统内置
	 */
	@ExcelProperty(index = 9,value = "系统内置标识")
	@ApiModelProperty(value = "是否是系统内置")
	private String system;
	/**
	 * 配置类型：0-默认；1-检索；2-原文；3-报表；4-安全；5-文档；6-消息；9-其他
	 */
	@ExcelProperty(index = 10,value = "配置类型")
	@ApiModelProperty(value = "类型[1-检索；2-原文...]", example = "1")
	private String publicType;
}
