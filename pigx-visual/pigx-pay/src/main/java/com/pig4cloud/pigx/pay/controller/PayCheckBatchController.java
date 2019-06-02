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

package com.pig4cloud.pigx.pay.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import com.pig4cloud.pigx.pay.entity.PayCheckBatch;
import com.pig4cloud.pigx.pay.service.PayCheckBatchService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 批量对账
 *
 * @author lengleng
 * @date 2019-05-28 23:57:38
 */
@RestController
@AllArgsConstructor
@RequestMapping("/paycheckbatch" )
@Api(value = "paycheckbatch", tags = "paycheckbatch管理")
public class PayCheckBatchController {

    private final  PayCheckBatchService payCheckBatchService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param payCheckBatch 批量对账
     * @return
     */
    @GetMapping("/page" )
    public R getPayCheckBatchPage(Page page, PayCheckBatch payCheckBatch) {
        return R.ok(payCheckBatchService.page(page, Wrappers.query(payCheckBatch)));
    }


    /**
     * 通过id查询批量对账
     * @param id id
     * @return R
     */
    @GetMapping("/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(payCheckBatchService.getById(id));
    }

    /**
     * 新增批量对账
     * @param payCheckBatch 批量对账
     * @return R
     */
    @SysLog("新增批量对账" )
    @PostMapping
    @PreAuthorize("@pms.hasPermission('pay_paycheckbatch_add')" )
    public R save(@RequestBody PayCheckBatch payCheckBatch) {
        return R.ok(payCheckBatchService.save(payCheckBatch));
    }

    /**
     * 修改批量对账
     * @param payCheckBatch 批量对账
     * @return R
     */
    @SysLog("修改批量对账" )
    @PutMapping
    @PreAuthorize("@pms.hasPermission('pay_paycheckbatch_edit')" )
    public R updateById(@RequestBody PayCheckBatch payCheckBatch) {
        return R.ok(payCheckBatchService.updateById(payCheckBatch));
    }

    /**
     * 通过id删除批量对账
     * @param id id
     * @return R
     */
    @SysLog("删除批量对账" )
    @DeleteMapping("/{id}" )
    @PreAuthorize("@pms.hasPermission('pay_paycheckbatch_del')" )
    public R removeById(@PathVariable Long id) {
        return R.ok(payCheckBatchService.removeById(id));
    }

}
