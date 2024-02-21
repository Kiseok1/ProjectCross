
package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.AlramCrossUserDto;
import com.java.dto.AlramDto;

@Mapper
public interface AlramMapper {
	//알람 전체 가져오기
	List<AlramCrossUserDto> selectAlram(String user_id);
	//확인한 알람 목록 가져오기
	List<AlramCrossUserDto> selectChecked(String user_id);
	//알람삭제
	void alramDelect(int alram_id);
	//알람확인
	void alramChecked(String user_id);
	//언급된알람 모음
	List<AlramCrossUserDto> Mentionalram(String user_id);
	//유저 밴
	void alramBan(String source_id);
	//차단유저목록
	List<AlramCrossUserDto> selectBanUser(String user_id);
	//유저 차단해제
	void UserUnBan(String source_id);
	//아이디 변경
	void accountUpdate1(String user_id, String org_id);
	void accountUpdate2(String user_id, String org_id);
	//팔로우 알람
	void insertFollowAlram(String source_id, String target_id);
	//댓글 알람
	void insertReplyAlram(String target_id, String source_id, int post_id);
	//좋아요 알람
	void insertLikeAlram(String target_id, String user_id, String post_id);
	//알람차단유저 확인
	void banCheck(String source_id);

}

