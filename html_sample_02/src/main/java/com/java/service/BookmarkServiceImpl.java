package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.BookmarkMapper;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired BookmarkMapper bookmarkMapper; 
	
	//북마크 버튼 클릭
	@Override
	public void bookmarkUpdate(String stat, String post_id, String user_id) {
		if(stat.equals("check")) {
			bookmarkMapper.bookmarkCheck(post_id,user_id);
		} else {
			bookmarkMapper.bookmarkCancel(post_id,user_id);
		}
		
	}

}
