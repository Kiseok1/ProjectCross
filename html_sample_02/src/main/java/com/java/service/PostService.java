package com.java.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;

@Service
public interface PostService {
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
