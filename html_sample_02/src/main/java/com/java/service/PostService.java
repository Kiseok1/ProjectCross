
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


	int repeatOn(int post_id);


	int repeatOff(int post_id);


	int favoriteOn(int post_id);


	int favoriteOff(int post_id);

	Map<String, Object> getMyTimelineMore(String id, int pageCounter);


	//인기순으로 게시글 정렬
	List<PostDto> selectLike();
	Map<String, Object> selectLike2();
	//최신순으로 게시글 정렬
	List<PostDto> selectnewest();
	Map<String, Object> selectnewest2();
	//유저 전부 가져오기
	Map<String, Object> selectAlluser();
	//게시글 검색(최신)
	List<PostDto> selectKeyWord(String keyword);
	Map<String, Object> selectKeyWord2(String keyword);
	//게시글 검색(인기)
	List<PostDto> selectKeyWord_Like(String keyword);
	Map<String, Object> selectKeyWord_Like2(String keyword);
	//유저 검색
	Map<String, Object> selectKeyWord_user(String keyword);
	//좋아요 증가
	void likeUp(int post_id);

	//미디어 검색(기본)
	Map<String, Object> selectMedia();
	//미디어 검색(키워드)
	Map<String, Object> selectKeyWordMedia(String keyword);

	//북마크된 포스트 가져오기
	Map<String, Object> getMyBookmark(String id);







	

}


