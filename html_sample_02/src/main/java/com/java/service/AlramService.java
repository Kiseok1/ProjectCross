package com.java.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.java.dto.AlramCrossUserDto;
import com.java.dto.AlramDto;

@Service
public interface AlramService {
	//알람 전체 가져오기
	List<AlramCrossUserDto> selectAlram(String user_id);
	//확인한 알람 전체 가져오기
	List<AlramCrossUserDto> selectChecked(String user_id);
	//알람 삭제
	void alramDelect(int alram_id);
	//알람 확인
	void alramChecked(String user_id);
	//언급된 알람 모음
	List<AlramCrossUserDto> Mentionalram(String user_id);
	//차단 유저 
	void alramBan(String source_id);
	//차단유저목록
	List<AlramDto> selectBanUser(String user_id);
	//유저 차단해제
	void UserUnBan(String source_id);

}
