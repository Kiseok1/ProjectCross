package com.java.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Cross_userDto;
import com.java.dto.MessCrossDto;
import com.java.service.MService;

@Controller
@RequestMapping("message")
public class MessageController {
	
	@Autowired
	MService mService;
	
	
	@GetMapping("/index")
	public String mindex() {
		return "/message/index";
	}

	@PostMapping("/search")//검색 결과 가져오기
	@ResponseBody
	public List<Cross_userDto>search(String input) {
		System.out.println("MessageController search input : "+input);
		List<Cross_userDto> list3 = mService.searchAll(input);
		return list3;
	}
	
	@GetMapping("/head")
	public String head(Model model) {
		
		ArrayList<MessCrossDto> list = mService.receiveAll();
		model.addAttribute("list", list);
		System.out.println("MessageController head source_id :"+list.get(0).getMessageDto().getSource_id());
		
		return "/message/head";
	}
	@GetMapping("/head2")
	public String head2(Model model) {
		
		List<MessCrossDto> list2 = mService.sendAll();
		model.addAttribute("list2", list2);
		
		return "/message/head2";
	}

}
