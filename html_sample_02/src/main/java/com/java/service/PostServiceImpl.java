package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.mapper.PostMapper;

@Service
public class PostServiceImpl implements PostService {
@Autowired
PostMapper PMapper;

	//인기순으로 게시글 정렬
	@Override
	public List<PostDto> selectLike() {
		List<PostDto> list = PMapper.selectLike();
		return list;
	}
	//최신순으로 게시글 정렬
	@Override
	public List<PostDto> selectnewest() {
		List<PostDto> list = PMapper.selectnewest();
		return list;
	}
	//유저 전부 가져오기
	@Override
	public List<Cross_userDto> selectAlluser() {
		List<Cross_userDto> list = PMapper.selectAlluser();
		return list;
	}
	//게시글 검색(최신)
	@Override
	public List<PostDto> selectKeyWord(String keyword) {
		List<PostDto> list = PMapper.selectKeyWord(keyword);
		return list;
	}
	//게시글 검색(인기)
	@Override
	public List<PostDto> selectKeyWord_Like(String keyword) {
		List<PostDto> list = PMapper.selectKeyWord_Like(keyword);
		return list;
	}
	//유저 검색
	@Override
	public List<Cross_userDto> selectKeyWord_user(String keyword) {
		List<Cross_userDto> list = PMapper.selectKeyWord_user(keyword);
		return list;
	}
	//좋아요 증가
	@Override
	public void likeUp(int post_id) {
		PMapper.likeUp(post_id);
		
	}

}
