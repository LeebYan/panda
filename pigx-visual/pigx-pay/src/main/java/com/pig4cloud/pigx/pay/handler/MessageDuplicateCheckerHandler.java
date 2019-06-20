package com.pig4cloud.pigx.pay.handler;

/**
 * @author lengleng
 * @date 2019-06-14
 * <p>
 * 消息去重
 */
public interface MessageDuplicateCheckerHandler {
	/**
	 * 判断回调消息是否重复.
	 *
	 * @param messageId messageId需要根据上面讲的方式构造
	 * @return 如果是重复消息，返回false，否则返回true
	 */
	boolean isDuplicate(String messageId);
}
