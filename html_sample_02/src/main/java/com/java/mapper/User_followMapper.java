package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.User_followDto;

@Mapper
public interface User_followMapper {

	//팔로우->팔로잉
	void insertFollow1(String source_id, String target_id);
	void insertFollow2(String source_id, String target_id);
	//팔로잉->팔로우(언팔)
	void deleteFollow(String source_id, String target_id);
	
	//팔로우 정보 가져오기
	User_followDto selectFollowInfo(String id, String your_id);

}
