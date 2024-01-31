package com.java.service;

import java.util.ArrayList;

import com.java.dto.PostDto;

public interface ProfileService {

	ArrayList<PostDto> selectDefault(String id);

}
