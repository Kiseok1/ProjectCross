package com.java.service;

import java.util.ArrayList;
import java.util.List;

import com.java.dto.Cross_userDto;
import com.java.dto.MessCrossMediaDto;
import com.java.dto.MessageDto;

public interface MService {

	//받은 쪽지 전체 가져오기
	ArrayList<MessCrossMediaDto> receiveAll();

	//보낸 쪽지 전체 가져오기
	List<MessCrossMediaDto> sendAll();

	//검색 결과 가져오기
	List<Cross_userDto> searchAll(String input);

	//보낸글 한개 가져오기
	MessCrossMediaDto sendOne(int msg_id);

	//받은글 한개 가져오기
	MessCrossMediaDto receiveOne(int msg_id);


}
