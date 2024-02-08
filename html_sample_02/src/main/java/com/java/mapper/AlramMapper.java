package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.AlramDto;

@Mapper
public interface AlramMapper {
	//알람 전체 가져오기
	List<AlramDto> selectAlram(String user_id);
	//확인한 알람 목록 가져오기
	List<AlramDto> selectChecked(String user_id);
	//알람삭제
	void alramDelect(int alram_id);
	//알람확인
	void alramChecked(String user_id);
	//언급된알람 모음
	List<AlramDto> Mentionalram(String user_id);
	//유저 밴
	void alramBan(String source_id);
	//차단유저목록
	List<AlramDto> selectBanUser(String user_id);
	//유저 차단해제
	void UserUnBan(String source_id);

}
