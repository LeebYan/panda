/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */
package com.pig4cloud.pigx.pay.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pig4cloud.pigx.pay.entity.PayCheckBatch;
import com.pig4cloud.pigx.pay.mapper.PayCheckBatchMapper;
import com.pig4cloud.pigx.pay.service.PayCheckBatchService;
import org.springframework.stereotype.Service;

/**
 * 批量对账
 *
 * @author lengleng
 * @date 2019-05-28 23:57:38
 */
@Service
public class PayCheckBatchServiceImpl extends ServiceImpl<PayCheckBatchMapper, PayCheckBatch> implements PayCheckBatchService {

}
