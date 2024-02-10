package com.java.service;

import java.util.ArrayList;
import java.util.Map;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.dto.PostLikeDto;
import com.java.dto.PostMediaUserDto;
import com.java.dto.User_followDto;

public interface ProfileService {

	//작성글 가져오기
	ArrayList<PostMediaUserDto> selectDefault(String id);

	Cross_userDto selectOne(String id);

	//아이디 이메일 변경
	void accountUpdate(Cross_userDto udto, String org_id);

	//비번 변경
	void pwUpdate(String cur_pw, String new_pw, String user_id);

	//프로필 변경
	void profileUpdate(String name, String profile_txt, String user_loc, String user_url, String header_img, String profile_img, String user_id);

	//팔로우->팔로잉
	void insertFollow(String source_id, String target_id);

	//팔로잉->팔로우(언팔)
	void deleteFollow(String source_id, String target_id);

	//팔로우 정보 가져오기
	User_followDto selectFollowInfo(String id, String your_id);

	//좋아요 추가
	void likeUp(String user_id, String post_id);
	//좋아요 삭제
	void likeDown(String user_id, String post_id);
	//좋아요 수
	int likeCount(String post_id);
	//내가 좋아요 한 글
	ArrayList<PostLikeDto> selectLike(String id);

	//미디어 불러오기
	ArrayList<PostMediaUserDto> selectMedia(String id);

	//내가 작성한 글 불러오기
	Map<String, Object> getMypost(String id);

	//좋아요한 글 가져오기
	Map<String, Object> getMylike(String id);
	
	//좋아요한 글 가져오기
	Map<String, Object> getMymedia(String id);
	
	//------------------------------------------------------
	
	//좋아요한 글 불러오기
	ArrayList<PostMediaUserDto> selectLikePost(String id);

}
