package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.AlramDto;
import com.java.mapper.AlramMapper;

@Service
public class AlramServiceImpl implements AlramService {
	@Autowired
	AlramMapper alramMapper;
	
	//알람 전체 가져오기
	@Override
	public List<AlramDto> selectAlram(String user_id) {
		System.out.println(""+user_id);
		List<AlramDto> list = alramMapper.selectAlram(user_id);
		return list;
	}
	//확인한 알람 가져오기
	@Override
	public List<AlramDto> selectChecked(String user_id) {
		List<AlramDto> list = alramMapper.selectChecked(user_id);
		return list;
	}
	//알람 삭제
	@Override
	public void alramDelect(int alram_id) {
		alramMapper.alramDelect(alram_id);
	}
	//알람확인
	@Override
	public void alramChecked(String user_id) {
		alramMapper.alramChecked(user_id);
		
	}
	//언급된 알람 모음
	@Override
	public List<AlramDto> Mentionalram(String user_id) {
		List<AlramDto> list = alramMapper.Mentionalram(user_id);
		return list;
	}
	//유저 밴
	@Override
	public void alramBan(String source_id) {
		alramMapper.alramBan(source_id);
	}
	//차단유저목록
	@Override
	public List<AlramDto> selectBanUser(String user_id) {
		List<AlramDto> list = alramMapper.selectBanUser(user_id);
		return list;
	}
	//유저 차단 해제
	@Override
	public void UserUnBan(String source_id) {
		alramMapper.UserUnBan(source_id);
		
	}
	
	

}
