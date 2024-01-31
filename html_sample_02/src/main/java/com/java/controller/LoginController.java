package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@RequestMapping("/login")
	public String login() {
		return "/login/login";
	}
	
	@RequestMapping("/findId")
	public String findId() {
		return "/login/findId";
	}
	
	@RequestMapping("/findPw")
	public String findPw() {
		return "/login/findPw";
	}
	
	@RequestMapping("/useAgree")
	public String useAgree() {
		return "/login/useAgree";
	}
	
	@RequestMapping("/joinMember")
	public String joinMember() {
		return "/login/joinMember";
	}
}
