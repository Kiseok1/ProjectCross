package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.MessCrossMediaDto;
import com.java.dto.MessageDto;
import com.java.mapper.MessageMapper;

@Service
public class MServiceImpl implements MService {

	@Autowired MessageMapper messageMapper;
	
	@Override//받은 쪽지 전체 가져오기
	public ArrayList<MessCrossMediaDto> receiveAll() {
		ArrayList<MessCrossMediaDto> list = messageMapper.receiveAll();
		return list;
	}

	@Override//보낸 쪽지 전체 가져오기
	public List<MessCrossMediaDto> sendAll() {
		List<MessCrossMediaDto> list2 = messageMapper.sendAll();
		return list2;
	}

	@Override//검색 결과 가져오기
	public List<Cross_userDto> searchAll(String input) {
		List<Cross_userDto> list3 = messageMapper.searchAll(input);
		return list3;
	}

	@Override//보낸글 한개 가져오기
	public MessCrossMediaDto sendOne(int msg_id) {
		MessCrossMediaDto mcDto = messageMapper.sendOne(msg_id);
		return mcDto;
	}

	@Override //받은글 한개 가져오기
	public MessCrossMediaDto receiveOne(int msg_id) {
		 MessCrossMediaDto mcDto = messageMapper.receiveOne(msg_id);
		return mcDto;
	}

}
