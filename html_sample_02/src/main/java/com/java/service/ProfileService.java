package com.java.service;

import java.util.ArrayList;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;

public interface ProfileService {

	ArrayList<PostDto> selectDefault(String id);

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

}
