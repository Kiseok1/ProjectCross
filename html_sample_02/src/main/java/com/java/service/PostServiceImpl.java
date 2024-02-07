package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.PostDto;
import com.java.mapper.Cross_userMapper;
import com.java.mapper.MediaMapper;
import com.java.mapper.PostMapper;

import jakarta.servlet.http.HttpSession;

@Service
public  class PostServiceImpl implements PostService {

	@Autowired
	PostMapper postMapper;
	@Autowired
	Cross_userMapper cUserMapper;
	@Autowired
	MediaMapper mediaMapper;
	
	@Autowired HttpSession session;
	
	@Override
	public int sendPost(PostDto postDto) {
		
		int result = postMapper.sendPost(postDto);
		
		return result;
	}

	@Override
	public Map<String, Object> getMyTimeline(String id) {
		
		Map<String, Object> map = new HashMap<>();
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
				
		
		ArrayList<PostDto> plist = postMapper.getMyTimeline(id);

		
		for(int i = 0 ; i < plist.size() ; i++)
		{
			ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
			mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
			recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
			renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
			facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
			favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
			replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
			postMapper.updateHit(plist.get(i).getPost_id());
		}
		
		map.put("plist", plist);
		map.put("ulist", ulist);
		map.put("mlist", mlist);
		map.put("recount", recount);
		map.put("renoted", renoted);
		map.put("facount", facount);
		map.put("favorited", favorited);
		map.put("replycount", replycount);
		
		return map;
	}

	@Override
	public Map<String, Object> getSelected(int post_id) {
		
		Map<String, Object> map = new HashMap<>();
		
		ArrayList<Cross_userDto> ulist = new ArrayList<>();
		ArrayList<MediaDto> mlist = new ArrayList<>();
		ArrayList<Integer> recount = new ArrayList<>();
		ArrayList<Integer> renoted = new ArrayList<>();
		ArrayList<Integer> facount = new ArrayList<>();
		ArrayList<Integer> favorited = new ArrayList<>();
		ArrayList<Integer> replycount = new ArrayList<>();
				
		ArrayList<PostDto> plist = postMapper.getSelected(post_id);
		

		if(plist.size() >0)
		{
			
			for(int i = 0 ; i < plist.size() ; i++)
			{
				ulist.add(cUserMapper.getUserProfile(plist.get(i).getUser_id()));
				mlist.add(mediaMapper.getMedia(plist.get(i).getPost_id()));
				recount.add(postMapper.getRenoteCounter(plist.get(i).getPost_id()));
				renoted.add(postMapper.myRenoteCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				facount.add(postMapper.getFavorCounter(plist.get(i).getPost_id()));
				favorited.add(postMapper.myFavorCounter(session.getAttribute("session_id").toString(),plist.get(i).getPost_id()));
				replycount.add(postMapper.getReplyCounter(plist.get(i).getPost_id()));
			}
			
			map.put("plist", plist);
			map.put("ulist", ulist);
			map.put("mlist", mlist);
			map.put("recount", recount);
			map.put("renoted", renoted);
			map.put("facount", facount);
			map.put("favorited", favorited);
			map.put("replycount", replycount);
		}

		return map;
	}

	@Override
	public int sendModalPost(PostDto postDto) {
		
		postMapper.upStep(postDto);
		
		
		int result = postMapper.sendModalPost(postDto);
		return result;
	}

	@Override
	public void deleteOne(int post_id) {

		int result = postMapper.deleteOne(post_id);
		
		
	}

	@Override
	public PostDto getSeletedHit(int post_id) {
		
		PostDto pdto = postMapper.getSeletedHit(post_id);
		
		return  pdto;
	}

	@Override
	public void repeatOn(int post_id) {
		postMapper.repeatOn(post_id);
		
	}

	@Override
	public void repeatOff(int post_id) {
		// TODO Auto-generated method stub
		postMapper.repeatOff(post_id);
		
	}

	@Override
	public void favoriteOn(int post_id) {
		// TODO Auto-generated method stub
		postMapper.favoriteOn(post_id);
		
	}

	@Override
	public void favoriteOff(int post_id) {
		// TODO Auto-generated method stub
		postMapper.favoriteOff(post_id);
		
	}

}
