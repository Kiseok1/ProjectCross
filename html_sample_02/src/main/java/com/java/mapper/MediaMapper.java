package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.MediaDto;

@Mapper
public interface MediaMapper {

	//미디어 저장(포스트)
	int sendPost(MediaDto mediaDto);
	
	//포스트에 표시할 미디어 불러오기
	MediaDto getMedia(int post_id);

}
