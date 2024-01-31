package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired HttpSession session;
	
	@RequestMapping("/login")
	public String login() {
		session.invalidate();
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
