package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper {

	//post 좋아요 카운트Up
	void likeUp(String post_id);
	//post 좋아요 카운트Down
	void likeDown(String post_id);
	
	
}
