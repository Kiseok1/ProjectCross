package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.PostMediaUserDto;

@Mapper
public interface PostMapper {

	//post 좋아요 카운트Up
	void likeUp(String post_id);
	//post 좋아요 카운트Down
	void likeDown(String post_id);
	
	//미디어 불러오기
	ArrayList<PostMediaUserDto> selectMedia(String id);
	
	
}
