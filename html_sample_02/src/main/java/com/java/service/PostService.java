
package com.java.service;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;


public interface PostService {

	int sendPost(PostDto postDto);


	Map<String, Object> getMyTimeline(String id);


	Map<String, Object> getSelected(int post_id);


	int sendModalPost(PostDto postDto);


	void deleteOne(int post_id);


	PostDto getSeletedHit(int post_id);


	void repeatOn(int post_id);


	void repeatOff(int post_id);


	void favoriteOn(int post_id);


	void favoriteOff(int post_id);

	//인기순으로 게시글 정렬
	List<PostDto> selectLike();
	//최신순으로 게시글 정렬
	List<PostDto> selectnewest();
	//유저 전부 가져오기
	List<Cross_userDto> selectAlluser();
	//게시글 검색(최신)
	List<PostDto> selectKeyWord(String keyword);
	//게시글 검색(인기)
	List<PostDto> selectKeyWord_Like(String keyword);
	//유저 검색
	List<Cross_userDto> selectKeyWord_user(String keyword);
	//좋아요 증가
	void likeUp(int post_id);

}

