package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.MediaDto;
import com.java.mapper.MediaMapper;

@Service
public class MediaServiceImpl implements MediaService {

	@Autowired MediaMapper mediaMapper;
	@Override
	public int sendPost(MediaDto mediaDto) {
		
		int result = mediaMapper.sendPost(mediaDto);
		return result;
	}
	@Override
	public MediaDto getSelected(int post_id) {
		MediaDto mdto = mediaMapper.getMedia(post_id);
		return mdto;
	}

}
