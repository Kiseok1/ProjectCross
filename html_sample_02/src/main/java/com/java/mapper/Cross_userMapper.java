package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cross_userDto;

@Mapper
public interface Cross_userMapper {

	Cross_userDto getUserProfile(String user_id);
}
