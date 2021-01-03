package com.pig4cloud.pigx.common.gray.rule;

import cn.hutool.core.util.ReflectUtil;
import com.pig4cloud.pigx.common.core.constant.ServiceNameConstants;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.cloud.loadbalancer.annotation.LoadBalancerClientSpecification;
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar;
import org.springframework.core.type.AnnotationMetadata;

import java.lang.reflect.Field;

/**
 * @author lengleng
 * @date 2020/11/20
 */
public class GrayLoadBalancerClientConfigurationRegistrar implements ImportBeanDefinitionRegistrar {

	private static void registerClientConfiguration(BeanDefinitionRegistry registry, Object name,
			Object configuration) {
		BeanDefinitionBuilder builder = BeanDefinitionBuilder
				.genericBeanDefinition(LoadBalancerClientSpecification.class);
		builder.addConstructorArgValue(name);
		builder.addConstructorArgValue(configuration);
		registry.registerBeanDefinition(name + ".LoadBalancerClientSpecification", builder.getBeanDefinition());
	}

	@Override
	public void registerBeanDefinitions(AnnotationMetadata metadata, BeanDefinitionRegistry registry) {
		Field[] fields = ReflectUtil.getFields(ServiceNameConstants.class);

		// 遍历服务名称，注入支持灰度策略的负载均衡器
		for (Field field : fields) {
			Object fieldValue = ReflectUtil.getFieldValue(ServiceNameConstants.class, field);
			registerClientConfiguration(registry, fieldValue, GrayLoadBalancerClientConfiguration.class);
		}
	}

}
