package com.java.controller;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	
	@Autowired HttpSession session;
	
	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	
	@RequestMapping("viewContent")
	public String view() {
		return "/view";
	}
	
	@RequestMapping("sidebar")
	public String sidebar() {
		return "/sidebar";
	}
	
	@RequestMapping("main")
	public String profile() {
		return "/profile/main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
