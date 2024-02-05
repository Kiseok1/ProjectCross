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
import com.java.dto.MessCrossMediaDto;
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

	@PostMapping("/search2")//검색  받은 쪽지결과 가져오기
	@ResponseBody
	public List<MessCrossMediaDto>search2(String input) {
		System.out.println("MessageController search input : "+input);
		List<MessCrossMediaDto> search2 = mService.search2(input);
		return search2;
	}

	@PostMapping("/search3")//검색 보낸 쪽지결과 가져오기
	@ResponseBody
	public List<MessCrossMediaDto>search3(String input) {
		System.out.println("MessageController search input : "+input);
		List<MessCrossMediaDto> search3 = mService.search3(input);
		return search3;
	}

	
	@GetMapping("/head")
	public String head(Model model) {
		//답글 모두 가져오기
		ArrayList<MessCrossMediaDto> list = mService.receiveAll();
		model.addAttribute("list", list);
		System.out.println("MessageController head source_id :"+list.get(0).getMessageDto().getSource_id());
		
		return "/message/head";
	}
	
	@PostMapping("/receiveOne")//받은글 한개 가져오기
	@ResponseBody
	public MessCrossMediaDto receiveOne(int msg_id) {
		System.out.println("MessageController sendOne : "+msg_id);
		MessCrossMediaDto mcDto = mService.receiveOne(msg_id);  
		return mcDto;
	}
	
	@GetMapping("/head2")
	public String head2(Model model) {
		
		List<MessCrossMediaDto> list2 = mService.sendAll();
		model.addAttribute("list2", list2);
		
		return "/message/head2";
	}
	
	@PostMapping("/sendOne")//보낸글 한개 가져오기
	@ResponseBody
	public MessCrossMediaDto sendOne(int msg_id) {
		System.out.println("MessageController sendOne : "+msg_id);
		MessCrossMediaDto mcDto = mService.sendOne(msg_id);  
		return mcDto;
	}

	@PostMapping("/deleteMSelect")//보낸글 선택삭제하기
	@ResponseBody
	public String deleteMSelect(int msg_id) {
		  mService.deleteMSelect(msg_id);
		  mService.deleteMedia(msg_id);
		return "성공";
	}
	
	@PostMapping("/UserData")//검색 결과 가져오기
	@ResponseBody
	public Cross_userDto UserData(String user_id) {
		System.out.println("MessageController search input : "+user_id);
		Cross_userDto CDto = mService.UserData(user_id);
		return CDto;
	}
	
	
	
}
