package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.PostDto;
import com.java.service.ProfileService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("profile")
public class ProfileController {
	
	@Autowired HttpSession session;
	
	@Autowired ProfileService pService;

	@RequestMapping("/content")
	public String content() {
		
		String id = (String) session.getAttribute("session_id");
		ArrayList<PostDto> list = pService.selectDefault(id);
		
		
		return "/profile/content";
	}
	
	@RequestMapping("/media")
	public String media() {
		return "/profile/media";
	}
	
	@RequestMapping("/reply")
	public String reply() {
		return "/profile/reply";
	}
	
	@RequestMapping("/like")
	public String like() {
		return "/profile/like";
	}
	@RequestMapping("/mypage")
	public String mypage() {
		return "/profile/mypage";
	}
	
	@RequestMapping("/mypage_account")
	public String mypage_account() {
		return "/profile/mypage_account";
	}
	
	@RequestMapping("/mypage_pw_modify")
	public String mypage_pw_modify() {
		return "/profile/mypage_pw_modify";
	}
	
	@RequestMapping("/profile_modify")
	public String profile_modify() {
		return "/profile/profile_modify";
	}
}
