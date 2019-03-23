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

package com.pig4cloud.pigx.daemon.quartz.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pig4cloud.pigx.common.core.constant.CommonConstants;
import com.pig4cloud.pigx.common.core.util.R;
import com.pig4cloud.pigx.common.data.tenant.TenantContextHolder;
import com.pig4cloud.pigx.common.log.annotation.SysLog;
import com.pig4cloud.pigx.common.security.util.SecurityUtils;
import com.pig4cloud.pigx.daemon.quartz.entity.SysJob;
import com.pig4cloud.pigx.daemon.quartz.entity.SysJobLog;
import com.pig4cloud.pigx.daemon.quartz.service.SysJobLogService;
import com.pig4cloud.pigx.daemon.quartz.service.SysJobService;
import com.pig4cloud.pigx.daemon.quartz.util.TaskUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.quartz.Scheduler;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import static com.pig4cloud.pigx.daemon.quartz.constant.enums.PigxQuartzEnum.*;


/**
 * @author frwcloud
 * @date 2019-01-27 10:04:42
 * <p>
 * 定时任务管理
 */
@RestController
@AllArgsConstructor
@RequestMapping("/sysjob")
@Api(value = "sysjob", description = "定时任务")
public class SysJobController {
	private final SysJobService sysJobService;
	private final SysJobLogService sysJobLogService;
	private final TaskUtil taskUtil;
	private final Scheduler scheduler;

	/**
	 * 定时任务分页查询
	 *
	 * @param page   分页对象
	 * @param sysJob 定时任务调度表
	 * @return
	 */
	@GetMapping("/page")
	@ApiOperation(value = "分页定时业务查询")
	public R getSysJobPage(Page page, SysJob sysJob) {
		sysJob.setTenantId(TenantContextHolder.getTenantId());
		return R.builder().data(sysJobService.page(page, Wrappers.query(sysJob))).build();
	}


	/**
	 * 通过id查询定时任务
	 *
	 * @param jobId id
	 * @return R
	 */
	@GetMapping("/{jobId}")
	@ApiOperation(value = "唯一标识查询定时任务")
	public R getById(@PathVariable("jobId") Integer jobId) {
		return R.builder().data(sysJobService.getById(jobId)).build();
	}

	/**
	 * 新增定时任务
	 *
	 * @param sysJob 定时任务调度表
	 * @return R
	 */
	@SysLog("新增定时任务")
	@PostMapping
	@PreAuthorize("@pms.hasPermission('job_sysjob_add')")
	@ApiOperation(value = "新增定时任务")
	public R save(@RequestBody SysJob sysJob) {
		sysJob.setJobStatus(JOBSTATUSRELEASE.getType());
		sysJob.setCreateBy(SecurityUtils.getUser().getUsername());
		sysJob.setTenantId(TenantContextHolder.getTenantId());
		return R.builder().data(sysJobService.save(sysJob)).build();
	}

	/**
	 * 修改定时任务
	 *
	 * @param sysJob 定时任务调度表
	 * @return R
	 */
	@SysLog("修改定时任务")
	@PutMapping
	@PreAuthorize("@pms.hasPermission('job_sysjob_edit')")
	@ApiOperation(value = "修改定时任务")
	public R updateById(@RequestBody SysJob sysJob) {
		sysJob.setUpdateBy(SecurityUtils.getUser().getUsername());
		SysJob querySysJob = this.sysJobService.getById(sysJob.getJobId());
		if (JOBSTATUSNOTRUNNING.getType().equals(querySysJob.getJobStatus())) {
			this.taskUtil.addOrUpateJob(sysJob, scheduler);
			sysJobService.updateById(sysJob);
		} else if (JOBSTATUSRELEASE.getType().equals(querySysJob.getJobStatus())) {
			sysJobService.updateById(sysJob);
		}
		return R.builder().build();
	}

	/**
	 * 通过id删除定时任务
	 *
	 * @param jobId id
	 * @return R
	 */
	@SysLog("删除定时任务")
	@DeleteMapping("/{jobId}")
	@PreAuthorize("@pms.hasPermission('job_sysjob_del')")
	@ApiOperation(value = "唯一标识查询定时任务，暂停任务才能删除")
	public R removeById(@PathVariable Integer jobId) {
		SysJob querySysJob = this.sysJobService.getById(jobId);
		if (JOBSTATUSNOTRUNNING.getType().equals(querySysJob.getJobStatus())) {
			this.taskUtil.removeJob(querySysJob, scheduler);
			this.sysJobService.removeById(jobId);
		} else if (JOBSTATUSRELEASE.getType().equals(querySysJob.getJobStatus())) {
			this.sysJobService.removeById(jobId);
		}
		return R.builder().build();
	}

	/**
	 * 暂停全部定时任务
	 *
	 * @return
	 */
	@SysLog("暂停全部定时任务")
	@PostMapping("/shutdownJobs")
	@PreAuthorize("@pms.hasPermission('job_sysjob_shutdownJobs')")
	@ApiOperation(value = "暂停全部定时任务")
	public R shutdownJobs() {
		taskUtil.pauseJobs(scheduler);
		int count = this.sysJobService.count(new LambdaQueryWrapper<SysJob>()
				.eq(SysJob::getJobStatus, JOBSTATUSRUNNING.getType()));
		if (count <= 0) {
			return R.builder().msg("无正在运行定时任务").build();
		} else {
			//更新定时任务状态条件，运行状态2更新为暂停状态2
			this.sysJobService.update(SysJob.builder()
					.jobStatus(JOBSTATUSNOTRUNNING.getType()).build(), new UpdateWrapper<SysJob>()
					.lambda().eq(SysJob::getJobStatus, JOBSTATUSRUNNING.getType()));
			return R.builder().msg("暂停成功").build();
		}
	}

	/**
	 * 启动全部定时任务
	 *
	 * @return
	 */
	@SysLog("启动全部定时任务")
	@PostMapping("/startJobs")
	@PreAuthorize("@pms.hasPermission('job_sysjob_startJob')")
	@ApiOperation(value = "启动全部定时任务")
	public R startJobs() {
		//更新定时任务状态条件，暂停状态3更新为运行状态2
		this.sysJobService.update(SysJob.builder().jobStatus(JOBSTATUSRUNNING
				.getType()).build(), new UpdateWrapper<SysJob>().lambda()
				.eq(SysJob::getJobStatus, JOBSTATUSNOTRUNNING.getType()));
		taskUtil.startJobs(scheduler);
		return R.builder().build();
	}

	/**
	 * 刷新全部定时任务
	 *
	 * @return
	 */
	@SysLog("刷新全部定时任务")
	@PostMapping("/refreshJobs")
	@PreAuthorize("@pms.hasPermission('job_sysjob_refreshJobs')")
	@ApiOperation(value = "刷新全部定时任务")
	public R refreshJobs() {
		sysJobService.list().forEach((sysjob) -> {
			if (JOBSTATUSRELEASE.getType().equals(sysjob.getJobStatus())
					|| JOBSTATUSDEL.getType().equals(sysjob.getJobStatus())) {
				taskUtil.removeJob(sysjob, scheduler);
			} else if (JOBSTATUSRUNNING.getType().equals(sysjob.getJobStatus())
					|| JOBSTATUSNOTRUNNING.getType().equals(sysjob.getJobStatus())) {
				taskUtil.addOrUpateJob(sysjob, scheduler);
			} else {
				taskUtil.removeJob(sysjob, scheduler);
			}
		});
		return R.builder().build();
	}

	/**
	 * 启动定时任务
	 *
	 * @param jobId
	 * @return
	 */
	@SysLog("启动定时任务")
	@GetMapping("/startJob/{jobId}")
	@PreAuthorize("@pms.hasPermission('job_sysjob_startJob')")
	@ApiOperation(value = "启动定时任务")
	public R startJob(@PathVariable("jobId") Integer jobId) {
		SysJob querySysJob = this.sysJobService.getById(jobId);
		if (querySysJob != null && JOBLOGSTATUFAIL.getType()
				.equals(querySysJob.getJobStatus())) {
			taskUtil.addOrUpateJob(querySysJob, scheduler);
		} else {
			taskUtil.resumeJob(querySysJob, scheduler);
		}
		//更新定时任务状态条件，暂停状态3更新为运行状态2
		this.sysJobService.updateById(SysJob.builder().jobId(jobId)
				.jobStatus(JOBSTATUSRUNNING.getType()).build());
		return R.builder().build();
	}

	/**
	 * 暂停定时任务
	 *
	 * @return
	 */
	@SysLog("暂停定时任务")
	@GetMapping("/shutdownJob/{jobId}")
	@PreAuthorize("@pms.hasPermission('job_sysjob_shutdownJob')")
	@ApiOperation(value = "暂停定时任务")
	public R shutdownJob(@PathVariable("jobId") Integer jobId) {
		SysJob querySysJob = this.sysJobService.getById(jobId);
		//更新定时任务状态条件，运行状态2更新为暂停状态3
		this.sysJobService.updateById(SysJob.builder().jobId(querySysJob.getJobId())
				.jobStatus(JOBSTATUSNOTRUNNING.getType()).build());
		taskUtil.pauseJob(querySysJob, scheduler);
		return R.builder().build();
	}

	/**
	 * 唯一标识查询定时执行日志
	 *
	 * @return
	 */
	@GetMapping("/getJobLog")
	@ApiOperation(value = "唯一标识查询定时执行日志")
	public R getJobLog(Page page, SysJobLog sysJobLog) {
		return R.builder().data(sysJobLogService.page(page, Wrappers.query(sysJobLog))).build();
	}

	/**
	 * 判断cron表达式是否正确
	 *
	 * @return
	 */
	@PostMapping("/isValidCron")
	@ApiOperation(value = "判断cron是否正确")
	public R isValidCron(@RequestParam String cronExpression) {
		return R.builder().data(this.taskUtil.isValidCron(cronExpression)
				? CommonConstants.SUCCESS : CommonConstants.FAIL).build();
	}

	/**
	 * 检验任务名称和任务组联合是否唯一
	 *
	 * @return
	 */
	@PostMapping("/isValidTaskName")
	@ApiOperation(value = "检验任务名称和任务组联合是否唯一")
	public R isValidTaskName(@RequestParam String jobName, @RequestParam String jobGroup) {
		return R.builder().data(this.sysJobService
				.count(Wrappers.query(SysJob.builder().jobName(jobName).jobGroup(jobGroup).build())) > 0
				? CommonConstants.FAIL : CommonConstants.SUCCESS).build();
	}
}
