package com.pig4cloud.pigx.common.security.serializer;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * AccessTokenMixIn
 *
 * @author dream.lu
 */
@JsonTypeInfo(use = JsonTypeInfo.Id.CLASS, property = "@class")
@JsonSerialize(using = AccessTokenJackson2Serializer.class)
@JsonDeserialize(using = AccessTokenJackson2Deserializer.class)
public class AccessTokenMixIn {

}
