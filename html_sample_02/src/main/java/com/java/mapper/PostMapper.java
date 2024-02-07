package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.PostDto;
import com.java.dto.RenoteDto;

@Mapper
public interface PostMapper {

	int sendPost(PostDto postDto);

	ArrayList<PostDto> getMyTimeline(String id);

	ArrayList<PostDto> getSelected(int post_id);

	int sendModalPost(PostDto postDto);

	PostDto getMaxStep(int post_id);
	
	int upStep(PostDto postDto);
	
	int deleteOne(int post_id);
	
	int getRenoteCounter(int post_id);

	RenoteDto getRenote(int post_id);

	int myRenoteCounter(String user_id, int post_id);

	int getFavorCounter(int post_id);

	int myFavorCounter(String user_id, int post_id);

	PostDto getSeletedHit(int post_id);

	int getReplyCounter(int post_id);

	void updateHit(int post_id);

	void repeatOn(int post_id);

	void repeatOff(int post_id);

	void favoriteOn(int post_id);

	void favoriteOff(int post_id);

}
