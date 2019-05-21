/**
 * @author: Luckly
 * @date: 2019-05-20
 * <p>
 * 对POI用到的模板进行缓存,进行统一管理,缓存工具暂时使用guava(脱离配置文件)
 * 缓存方式统一为byte[] 屏蔽文件类型的差异
 * 缓存获取方式,URL或者URL+index(EXcel的)
 */
package com.pig4cloud.pigx.common.poi.cache;