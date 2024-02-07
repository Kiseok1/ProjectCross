package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.dto.PostLikeDto;
import com.java.dto.PostMediaUserDto;
import com.java.dto.User_followDto;
import com.java.mapper.Cross_userMapper;
import com.java.mapper.PostLikeMapper;
import com.java.mapper.PostMapper;
import com.java.mapper.ProfileMapper;
import com.java.mapper.User_followMapper;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired ProfileMapper profileMapper;
	@Autowired Cross_userMapper cross_userMapper;
	@Autowired User_followMapper user_followMapper;
	@Autowired PostLikeMapper postLikeMapper;
	@Autowired PostMapper postMapper;

	//작성글 가져오기
	@Override
	public ArrayList<PostMediaUserDto> selectDefault(String id) {
		ArrayList<PostMediaUserDto> list = postMapper.selectDefault(id);
		PostMediaUserDto dummy = new PostMediaUserDto();
		dummy.setPostDto(new PostDto());
		list.add(dummy);
		return list;
	}

	//개인 정보 가져오기
	@Override
	public Cross_userDto selectOne(String id) {
		Cross_userDto udto = cross_userMapper.selectOne(id);
		return udto;
	}

	//아이디 이메일 변경
	@Override
	public void accountUpdate(Cross_userDto udto,String org_id) {
		String user_id= udto.getUser_id();
		String email = udto.getEmail();
		cross_userMapper.accountUpdate(user_id,email,org_id);
		
	}

	//비번 변경
	@Override
	public void pwUpdate(String cur_pw, String new_pw, String user_id) {
		cross_userMapper.pwUpadte(cur_pw,new_pw,user_id);
		
	}

	//프로필 변경
	@Override
	public void profileUpdate(String name, String profile_txt, String user_loc, String user_url, String header_img, String profile_img, String user_id) {
		cross_userMapper.profileUpdate(name,profile_txt,user_loc,user_url,header_img,profile_img,user_id);
		
	}

	//팔로우->팔로잉
	@Override
	public void insertFollow(String source_id, String target_id) {
		user_followMapper.insertFollow1(source_id,target_id);
		user_followMapper.insertFollow2(source_id,target_id);
		
	}

	//팔로잉->팔로우(언팔)
	@Override
	public void deleteFollow(String source_id, String target_id) {
		user_followMapper.deleteFollow(source_id,target_id);
		
	}

	//팔로우 정보 가져오기
	@Override
	public User_followDto selectFollowInfo(String id, String your_id) {
		User_followDto followDto = user_followMapper.selectFollowInfo(id,your_id);  
		return followDto;
	}

	//좋아요 추가
	@Override
	public void likeUp(String user_id, String post_id) {
		postLikeMapper.likeUp(user_id,post_id);
		postMapper.likeUp(post_id);
	}

	//좋아요 삭제
	@Override
	public void likeDown(String user_id, String post_id) {
		postLikeMapper.likeDown(user_id,post_id);
		postMapper.likeDown(post_id);
		
	}

	//좋아요 수
	@Override
	public int likeCount(String post_id) {
		int likeCount = postLikeMapper.likeCount(post_id);
		return likeCount;
	}

	//좋아요한 글
	@Override
	public ArrayList<PostLikeDto> selectLike(String id) {
		ArrayList<PostLikeDto> list = postLikeMapper.selectLike(id);
		
		return list;
	}

	//미디어 불러오기
	@Override
	public ArrayList<PostMediaUserDto> selectMedia(String id) {
		ArrayList<PostMediaUserDto> list = postMapper.selectMedia(id);
		return list;
	}

	//좋아요한 글 불러오기
	@Override
	public ArrayList<PostMediaUserDto> selectLikePost(String id) {
		ArrayList<PostMediaUserDto> list = postMapper.selectLikePost(id);
		PostMediaUserDto dummy = new PostMediaUserDto();
		dummy.setPostDto(new PostDto());
		list.add(dummy);
		return list;
	}
	
	
	
	
	
	
	
}
