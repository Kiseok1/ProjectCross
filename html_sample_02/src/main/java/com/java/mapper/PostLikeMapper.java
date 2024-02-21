package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.PostLikeDto;

@Mapper
public interface PostLikeMapper {

	//좋아요 추가
	void likeUp(String user_id, String post_id);
	//좋아요 삭제
	void likeDown(String user_id, String post_id);
	//좋아요 수
	int likeCount(String post_id);
	//좋아요 한 글
	ArrayList<PostLikeDto> selectLike(String id);
	//아이디 변경
	void accountUpdate1(String user_id, String org_id);

	
	
}

