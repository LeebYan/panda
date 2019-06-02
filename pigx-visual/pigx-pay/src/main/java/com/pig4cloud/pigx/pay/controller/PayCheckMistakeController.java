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
import com.pig4cloud.pigx.pay.entity.PayCheckMistake;
import com.pig4cloud.pigx.pay.service.PayCheckMistakeService;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;


/**
 * 差错
 *
 * @author lengleng
 * @date 2019-05-28 23:57:50
 */
@RestController
@AllArgsConstructor
@RequestMapping("/paycheckmistake" )
@Api(value = "paycheckmistake", tags = "paycheckmistake管理")
public class PayCheckMistakeController {

    private final  PayCheckMistakeService payCheckMistakeService;

    /**
     * 分页查询
     * @param page 分页对象
     * @param payCheckMistake 差错
     * @return
     */
    @GetMapping("/page" )
    public R getPayCheckMistakePage(Page page, PayCheckMistake payCheckMistake) {
        return R.ok(payCheckMistakeService.page(page, Wrappers.query(payCheckMistake)));
    }


    /**
     * 通过id查询差错
     * @param id id
     * @return R
     */
    @GetMapping("/{id}" )
    public R getById(@PathVariable("id" ) Long id) {
        return R.ok(payCheckMistakeService.getById(id));
    }

    /**
     * 新增差错
     * @param payCheckMistake 差错
     * @return R
     */
    @SysLog("新增差错" )
    @PostMapping
    @PreAuthorize("@pms.hasPermission('pay_paycheckmistake_add')" )
    public R save(@RequestBody PayCheckMistake payCheckMistake) {
        return R.ok(payCheckMistakeService.save(payCheckMistake));
    }

    /**
     * 修改差错
     * @param payCheckMistake 差错
     * @return R
     */
    @SysLog("修改差错" )
    @PutMapping
    @PreAuthorize("@pms.hasPermission('pay_paycheckmistake_edit')" )
    public R updateById(@RequestBody PayCheckMistake payCheckMistake) {
        return R.ok(payCheckMistakeService.updateById(payCheckMistake));
    }

    /**
     * 通过id删除差错
     * @param id id
     * @return R
     */
    @SysLog("删除差错" )
    @DeleteMapping("/{id}" )
    @PreAuthorize("@pms.hasPermission('pay_paycheckmistake_del')" )
    public R removeById(@PathVariable Long id) {
        return R.ok(payCheckMistakeService.removeById(id));
    }

}
