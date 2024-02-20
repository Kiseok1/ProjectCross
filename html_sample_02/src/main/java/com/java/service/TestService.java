package com.java.service;

import com.java.dto.Cross_userDto;

public interface TestService {

	//로그인확인
	int login(Cross_userDto cdto);

	//한명 아이디 가져오기
	Cross_userDto findId(String email);

	//비밀번호찾기 - 비밀번호 저장
	String savePW(String pw, String email);

	

	

	
	

	
	

	

}
