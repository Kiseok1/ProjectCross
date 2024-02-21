package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;

@Mapper
public interface Cross_userMapper {

	//정환(기석)작업
	//
	ArrayList<PostDto> selectDefault(String id);

	//개인정보 가져오기
	Cross_userDto selectOne(String id);

	//아이디 이메일 변경
	void accountUpdate(String user_id,String email,String org_id);

	//비번 변경
	void pwUpadte(String cur_pw, String new_pw, String user_id);

	//프로필 변경
	void profileUpdate(String name, String profile_txt, String user_loc, String user_url, String header_img, String profile_img, String user_id);


	//----------------------------------------------------------------------------
	//향연 작업
	//게시글에 표시할 개인정보 불러오기
	Cross_userDto getUserProfile(String user_id);

	//------------------------------------------------------------------------
	//여경 작업
	//로그인확인
	Cross_userDto login(Cross_userDto cdto);

	//한명 아이디 가져오기
	Cross_userDto findId(String email);

	// 비밀번호 저장
	void savePW(String pw, String email);

}


