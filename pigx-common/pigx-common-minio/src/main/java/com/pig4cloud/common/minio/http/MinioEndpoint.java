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

package com.pig4cloud.common.minio.http;

import com.pig4cloud.common.minio.service.MinioTemplate;
import com.pig4cloud.common.minio.vo.MinioItem;
import com.pig4cloud.common.minio.vo.MinioObject;
import io.minio.messages.Bucket;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * minio 对外提供服务端点
 *
 * @author lengleng
 * <p>
 * minio.endpoint.enable
 */
@ConditionalOnProperty(name = "minio.endpoint.enable", havingValue = "true")
@RestController
@AllArgsConstructor
@RequestMapping("${minio.endpoint.name:/minio}")
public class MinioEndpoint {
	private final MinioTemplate template;

	/**
	 * Bucket Endpoints
	 */
	@PostMapping("/bucket/{bucketName}")
	public Bucket createBucker(@PathVariable String bucketName) throws Exception {

		template.createBucket(bucketName);
		return template.getBucket(bucketName).get();

	}

	@GetMapping("/bucket")
	public List<Bucket> getBuckets() throws Exception {
		return template.getAllBuckets();
	}

	@GetMapping("/bucket/{bucketName}")
	public Bucket getBucket(@PathVariable String bucketName) throws Exception {
		return template.getBucket(bucketName).orElseThrow(() -> new IllegalArgumentException("Bucket Name not found!"));
	}

	@DeleteMapping("/bucket/{bucketName}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public void deleteBucket(@PathVariable String bucketName) throws Exception {

		template.removeBucket(bucketName);
	}

	/**
	 * Object Endpoints
	 */

	@PostMapping("/object/{bucketName}")
	public MinioObject createObject(@RequestBody MultipartFile object, @PathVariable String bucketName) throws Exception {
		String name = object.getOriginalFilename();
		template.putObject(bucketName, name, object.getInputStream(), object.getSize(), object.getContentType());
		return new MinioObject(template.getObjectInfo(bucketName, name));

	}

	@PostMapping("/object/{bucketName}/{objectName}")
	public MinioObject createObject(@RequestBody MultipartFile object, @PathVariable String bucketName, @PathVariable String objectName) throws Exception {
		template.putObject(bucketName, objectName, object.getInputStream(), object.getSize(), object.getContentType());
		return new MinioObject(template.getObjectInfo(bucketName, objectName));

	}


	@GetMapping("/object/{bucketName}/{objectName}")
	public List<MinioItem> filterObject(@PathVariable String bucketName, @PathVariable String objectName) throws Exception {

		return template.getAllObjectsByPrefix(bucketName, objectName, true);

	}

	@GetMapping("/object/{bucketName}/{objectName}/{expires}")
	public Map<String, Object> getObject(@PathVariable String bucketName, @PathVariable String objectName, @PathVariable Integer expires) throws Exception {
		Map<String, Object> responseBody = new HashMap<>(8);
		// Put Object info
		responseBody.put("bucket", bucketName);
		responseBody.put("object", objectName);
		responseBody.put("url", template.getObjectURL(bucketName, objectName, expires));
		responseBody.put("expires", expires);
		return responseBody;
	}

	@DeleteMapping("/object/{bucketName}/{objectName}/")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public void deleteObject(@PathVariable String bucketName, @PathVariable String objectName) throws Exception {

		template.removeObject(bucketName, objectName);
	}


}
