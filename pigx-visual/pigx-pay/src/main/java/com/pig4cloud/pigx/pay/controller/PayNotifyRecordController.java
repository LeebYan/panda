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
import com.pig4cloud.pigx.pay.entity.PayNotifyRecord;
import com.pig4cloud.pigx.pay.service.PayNotifyRecordService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 异步通知记录
 *
 * @author lengleng
 * @date 2019-05-28 23:57:23
 */
@RestController
@AllArgsConstructor
@RequestMapping("/paynotifyrecord" )
@Api(value = "paynotifyrecord", tags = "paynotifyrecord管理")
public class PayNotifyRecordController {

    private final  PayNotifyRecordService payNotifyRecordService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param payNotifyRecord 异步通知记录
     * @return
     */
    @GetMapping("/page" )
    public R getPayNotifyRecordPage(Page page, PayNotifyRecord payNotifyRecord) {
        return R.ok(payNotifyRecordService.page(page, Wrappers.query(payNotifyRecord)));
    }


    /**
     * 通过id查询异步通知记录
     * @param id id
     * @return R
     */
    @GetMapping("/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(payNotifyRecordService.getById(id));
    }

    /**
     * 新增异步通知记录
     * @param payNotifyRecord 异步通知记录
     * @return R
     */
    @SysLog("新增异步通知记录" )
    @PostMapping
    @PreAuthorize("@pms.hasPermission('pay_paynotifyrecord_add')" )
    public R save(@RequestBody PayNotifyRecord payNotifyRecord) {
        return R.ok(payNotifyRecordService.save(payNotifyRecord));
    }

    /**
     * 修改异步通知记录
     * @param payNotifyRecord 异步通知记录
     * @return R
     */
    @SysLog("修改异步通知记录" )
    @PutMapping
    @PreAuthorize("@pms.hasPermission('pay_paynotifyrecord_edit')" )
    public R updateById(@RequestBody PayNotifyRecord payNotifyRecord) {
        return R.ok(payNotifyRecordService.updateById(payNotifyRecord));
    }

    /**
     * 通过id删除异步通知记录
     * @param id id
     * @return R
     */
    @SysLog("删除异步通知记录" )
    @DeleteMapping("/{id}" )
    @PreAuthorize("@pms.hasPermission('pay_paynotifyrecord_del')" )
    public R removeById(@PathVariable Long id) {
        return R.ok(payNotifyRecordService.removeById(id));
    }

}
