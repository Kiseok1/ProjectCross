package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.mapper.Cross_userMapper;
import com.java.mapper.ProfileMapper;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired ProfileMapper profileMapper;
	@Autowired Cross_userMapper cross_userMapper;

	@Override
	public ArrayList<PostDto> selectDefault(String id) {
		ArrayList<PostDto> list = profileMapper.selectDefault(id);
		return list;
	}

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
	
}
