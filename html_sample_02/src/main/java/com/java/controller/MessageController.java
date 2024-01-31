package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("message")
public class MessageController {
	
	@RequestMapping("/index")
	public String mindex() {
		return "/message/index";
	}
	@RequestMapping("/head")
	public String head() {
		return "/message/head";
	}
	@RequestMapping("/head2")
	public String head2() {
		return "/message/head2";
	}

}
