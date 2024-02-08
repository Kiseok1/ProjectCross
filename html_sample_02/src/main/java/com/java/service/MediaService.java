package com.java.service;

import com.java.dto.MediaDto;

public interface MediaService {

	int sendPost(MediaDto mediaDto);

	MediaDto getSelected(int post_id);

}
