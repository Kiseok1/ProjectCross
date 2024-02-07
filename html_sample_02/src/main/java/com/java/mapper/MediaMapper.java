package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.MediaDto;

@Mapper
public interface MediaMapper {

	int sendPost(MediaDto mediaDto);

	MediaDto getMedia(int post_id);

}
