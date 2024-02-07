package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cross_userDto;

@Mapper
public interface Cross_userMapper {

	//로그인확인
	Cross_userDto login(Cross_userDto cdto);


	//한명 아이디 가져오기
	Cross_userDto findId(String email);


	// 비밀번호 저장
	void savePW(String pw, String email);

}
