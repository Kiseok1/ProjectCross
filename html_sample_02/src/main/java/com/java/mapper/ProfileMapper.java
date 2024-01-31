package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.PostDto;

@Mapper
public interface ProfileMapper {

	ArrayList<PostDto> selectDefault(String id);

}
