package com.java.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.MessCrossMediaDto;
import com.java.dto.MessageDto;

@Mapper
public interface MessageMapper {

	//받은 쪽지 전체 가져오기
	ArrayList<MessCrossMediaDto> receiveAll(String id);

	//보낸 쪽지 전체 가져오기
	List<MessCrossMediaDto> sendAll(String id);

	//검색 결과 가져오기
	List<Cross_userDto> searchAll(String input);

	//보낸글 한개 가져오기
	MessCrossMediaDto sendOne(int msg_id);

	//받은글 한개 가져오기
	MessCrossMediaDto receiveOne(int msg_id);
	//유저 정보 모달창
	Cross_userDto UserData(String user_id);

	//받은쪽지 검색
	List<MessCrossMediaDto> search2(String input);

	//보낸쪽지 검색
	List<MessCrossMediaDto> search3(String input);


	//보낸글 선택삭제하기
	void deleteMSelect(int msg_id);
	void deleteMedia(int msg_id);

	//메시지 저장하기
	
	void mInsert2(MessageDto mdto);
	void mInsert(MediaDto mdto2);

	//check update
	void checkUpdate(int msg_id);

	//아이디 변경
	void accountUpdate1(String user_id, String org_id);
	void accountUpdate2(String user_id, String org_id);
	


}

