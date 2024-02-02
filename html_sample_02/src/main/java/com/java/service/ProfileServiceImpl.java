package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.mapper.Cross_userMapper;
import com.java.mapper.ProfileMapper;
import com.java.mapper.User_followMapper;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired ProfileMapper profileMapper;
	@Autowired Cross_userMapper cross_userMapper;
	@Autowired User_followMapper user_followMapper;

	@Override
	public ArrayList<PostDto> selectDefault(String id) {
		ArrayList<PostDto> list = profileMapper.selectDefault(id);
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
	
}
