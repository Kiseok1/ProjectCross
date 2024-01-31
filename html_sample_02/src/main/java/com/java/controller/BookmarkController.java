package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("bookmark")
public class BookmarkController {
	
	@RequestMapping("/bookmark")
	public String bookmark() {
		return "/bookmark/bookmark";
	}

}
