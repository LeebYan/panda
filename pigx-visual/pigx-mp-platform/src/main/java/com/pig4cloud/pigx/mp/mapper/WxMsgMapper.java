package com.pig4cloud.pigx.mp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pig4cloud.pigx.mp.entity.WxMsg;
import org.apache.ibatis.annotations.Mapper;

/**
 * 微信消息
 *
 * @author JL
 * @date 2019-05-28 16:12:10
 */
@Mapper
public interface WxMsgMapper extends BaseMapper<WxMsg> {
}
