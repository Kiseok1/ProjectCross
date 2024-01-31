package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("search")
public class SearchController {

	@RequestMapping("/images")
	public String images() {
		return "/search/images";
	}
	
	@RequestMapping("/search")
	public String search() {
		return "/search/search";
	}
	
	@RequestMapping("/search_in")
	public String search_in() {
		return "/search/search_in";
	}
	
	@RequestMapping("/user")
	public String user() {
		return "/search/user";
	}
}
