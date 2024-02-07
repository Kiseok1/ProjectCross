package com.java.controller;

import org.apache.catalina.Session;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/")	
	public String index(){
		session.setAttribute("session_id","aaa");
		System.out.println("sessionId :"+session.getAttribute("session_id"));
		return "index";
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
	
	
	@RequestMapping("location")
	@ResponseBody
	public String location()
	{
		String param ="Location";
		
		return param;
	}
	
	@RequestMapping("analystic")
	public String analystic() {
		return "analystic";
	}
	
	@PostMapping("selectedAnalysis")
	@ResponseBody
	public JSONObject selectedAnalysis(int post_id)
	{
		JSONObject jobj = new JSONObject();

		jobj.put("viewhit0", "10");
		jobj.put("viewhit6", "25");
		jobj.put("viewhit12", "30");
		jobj.put("viewhit18", "35");

		
		return jobj;
	}

	
	
	
	
	
	
	
	
	
	
	
}
