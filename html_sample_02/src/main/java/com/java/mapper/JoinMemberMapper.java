
package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cross_userDto;

@Mapper
public interface JoinMemberMapper {

	//회원가입시 아이디 중복체크
	Cross_userDto idCheck(Cross_userDto crossDto);

	//회원가입 최종확인 정보등록
	void joinCheck(Cross_userDto crossuserdto);


}
