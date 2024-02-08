package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

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
	
	@RequestMapping("/ajaxLogin")
	@ResponseBody
	public String ajaxLogin() {
		
		session.setAttribute("session_id", "aaa");
		//session.setAttribute("session_image", "1706762836556_star_yellow.png");
		session.setAttribute("session_image", "1.jpg");
		session.setAttribute("session_name","Name111");
		
		return "Test";	
		
	}
}
