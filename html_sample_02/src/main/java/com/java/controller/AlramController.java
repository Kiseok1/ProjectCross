package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("alram")
public class AlramController {

	@RequestMapping("/alram")
	public String alram() {
		return "/alram/alram";
	}
	@RequestMapping("/alramCheck")
	public String alramCheck() {
		return "/alram/alramCheck";
	}
	@RequestMapping("/Mention")
	public String Mention() {
		return "/alram/Mention";
	}
	
}
