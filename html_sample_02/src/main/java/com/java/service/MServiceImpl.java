
package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.MessCrossMediaDto;
import com.java.dto.MessageDto;
import com.java.mapper.MessageMapper;

@Service
public class MServiceImpl implements MService {

	@Autowired MessageMapper messageMapper;
	
	@Override//받은 쪽지 전체 가져오기
	public ArrayList<MessCrossMediaDto> receiveAll(String id) {
		ArrayList<MessCrossMediaDto> list = messageMapper.receiveAll(id);
		return list;
	}

	@Override//보낸 쪽지 전체 가져오기
	public List<MessCrossMediaDto> sendAll(String id) {
		List<MessCrossMediaDto> list2 = messageMapper.sendAll(id);
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

	@Override//모달창 데이터 받은글 가져오기
	public Cross_userDto UserData(String user_id) {
		Cross_userDto CDto = messageMapper.UserData(user_id);
		return CDto;
	}

	@Override//받은쪽지 검색
	public List<MessCrossMediaDto> search2(String input) {
		List<MessCrossMediaDto> search2 = messageMapper.search2(input);
		return search2;
	}

	@Override//보낸쪽지 검색
	public List<MessCrossMediaDto> search3(String input) {
		List<MessCrossMediaDto> search3 = messageMapper.search3(input);
		return search3;
	}

	//보낸글 선택삭제하기
	@Override
	public void deleteMSelect(int msg_id) {
		messageMapper.deleteMSelect(msg_id);
		
	}
	@Override
	public void deleteMedia(int msg_id) {
		messageMapper.deleteMedia(msg_id);
		
	}

	@Override//메시지 저장하기
	public void mInsert(MediaDto mdto2) {
		messageMapper.mInsert(mdto2);
		
	}
	@Override
	public void mInsert2(MessageDto mdto) {
		messageMapper.mInsert2(mdto);
		
		
	}

	@Override//check update
	public MessCrossMediaDto checkUpdate(int msg_id, String stat) {
		MessCrossMediaDto mcDto = null;
		if(stat.equals("send")) {
			mcDto = messageMapper.sendOne(msg_id);			
		} else {
			mcDto = messageMapper.receiveOne(msg_id); 			
			messageMapper.checkUpdate(msg_id);
		}
		
		return mcDto;
	}

	

}

