package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkMapper {

	//북마크 체크
	void bookmarkCheck(String post_id, String user_id);
	//북마크 취소
	void bookmarkCancel(String post_id, String user_id);
	//계정정보 변경
	void accountUpdate(String user_id, String org_id);
	void accountUpdate_renote(String user_id, String org_id);

}
