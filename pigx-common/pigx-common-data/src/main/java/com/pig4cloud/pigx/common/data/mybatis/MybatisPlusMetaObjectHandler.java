package com.pig4cloud.pigx.common.data.mybatis;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.pig4cloud.pigx.common.security.util.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Optional;

/**
 * Mybatis Plus的参数填充器
 * @author lishangbu
 * @date 2018/12/28
 * 利用Mybatis Plus的参数填充器设置一些公共信息参数
 * setFieldValByName方法传入的字段名称是Java Bean的属性
 * 其接口默认方法会自行进行判空之类的预处理，因此不需要我们进一步操作
 * MP 3.0.7将会变更这个方法
 */
@Component
@Slf4j
public class MybatisPlusMetaObjectHandler implements MetaObjectHandler {
	private static final String CREATE_USER     = "createUser";
	private static final String UPDATE_USER    = "updateUser";
	private static final String CREATE_TIME   = "createTime";
	private static final String UPDATE_TIME = "updateTime";

	@Override
	public void insertFill(MetaObject metaObject) {
		this.setFieldValByName(CREATE_TIME, LocalDateTime.now(),metaObject);
		this.setFieldValByName(CREATE_USER,getUserName(),metaObject);
	}

	@Override
	public void updateFill(MetaObject metaObject) {
		this.setFieldValByName(UPDATE_TIME,LocalDateTime.now(),metaObject);
		this.setFieldValByName(UPDATE_USER,getUserName(),metaObject);
	}

	/**
	 * 获取用户名信息
	 * 开启details属性的情况下，通过用户实体获取用户名
	 * 反之直接获取用户名
	 * @return
	 */
	private String getUserName(){
		return Optional.ofNullable(SecurityUtils.getUser().getUsername())
				.orElse(SecurityUtils.getUsername());
	}
}
