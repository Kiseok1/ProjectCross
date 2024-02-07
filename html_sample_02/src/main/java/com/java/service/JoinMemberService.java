package com.java.service;

import com.java.dto.Cross_userDto;

public interface JoinMemberService {

	//회원가입시 아이디 중복확인
	Cross_userDto idCheck(Cross_userDto crossDto);



	//회원가입시 이메일 발송
	String emailsend(String email, String email1);


	//회원가입 아이디 정보 입력
	void joinCheck(Cross_userDto crossuserdto);

}
