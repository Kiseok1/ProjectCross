package com.java.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.BookmarkService;
import com.java.service.PostService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("bookmark")
public class BookmarkController {
	
	@Autowired HttpSession session;
	@Autowired BookmarkService bookmarkService;
	@Autowired PostService postService;
	
	@RequestMapping("/bookmark")
	public String bookmark(Model model) {
		
		String id= session.getAttribute("session_id").toString();
		Map<String, Object> map =  postService.getMyBookmark(id);
		
		model.addAttribute("plist", map.get("plist"));
		model.addAttribute("ulist", map.get("ulist"));
		model.addAttribute("mlist", map.get("mlist")); 
		model.addAttribute("recount", map.get("recount")); 
		model.addAttribute("renoted", map.get("renoted"));
		model.addAttribute("facount", map.get("facount")); 
		model.addAttribute("favorited", map.get("favorited"));
		model.addAttribute("replycount", map.get("replycount"));		
		
		return "/bookmark/bookmark";
	}
	
	@PostMapping("/bookmarkUpdate")
	@ResponseBody
	public String bookmarkUpdate(String stat, String post_id) {
		String user_id = session.getAttribute("session_id").toString();
		bookmarkService.bookmarkUpdate(stat,post_id,user_id);
		return "";
	}

}
