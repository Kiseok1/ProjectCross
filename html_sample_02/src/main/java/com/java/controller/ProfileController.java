package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("profile")
public class ProfileController {
	
	

	@RequestMapping("/content")
	public String content() {
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
