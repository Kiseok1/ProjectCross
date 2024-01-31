package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.PostDto;
import com.java.mapper.ProfileMapper;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired ProfileMapper profileMapper;

	@Override
	public ArrayList<PostDto> selectDefault(String id) {
		ArrayList<PostDto> list = profileMapper.selectDefault(id);
		return list;
	}
	
}
