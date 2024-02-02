package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface User_followMapper {

	//팔로우->팔로잉
	void insertFollow1(String source_id, String target_id);
	void insertFollow2(String source_id, String target_id);
	//팔로잉->팔로우(언팔)
	void deleteFollow(String source_id, String target_id);

}
