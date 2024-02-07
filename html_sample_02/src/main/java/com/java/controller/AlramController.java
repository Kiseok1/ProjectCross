package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.AlramDto;
import com.java.service.AlramService;

import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("alram")
public class AlramController {
@Autowired
AlramService alramService;
@Autowired
HttpSession session;
	
	//알람 전부 가져오기
	@GetMapping("/alram")
	public String alram(String user_id,Model model) {
		user_id = (String)session.getAttribute("session_id");
		System.out.println("user_id :"+user_id);
		List<AlramDto> list = alramService.selectAlram(user_id);
		model.addAttribute("list",list);
		return "/alram/alram";
	}
	@GetMapping("/alramSet")
	public String alramSet() {
		return "alram/alramSet";
	}
	
	@GetMapping("alramCheck")
	public String alramCheck(String user_id,Model model) {
		user_id = (String)session.getAttribute("session_id");
		List<AlramDto> list = alramService.selectChecked(user_id);
		model.addAttribute("list",list);
		return "/alram/alramCheck";
	}
	//알람 삭제
	@PostMapping("alramDelect")
	@ResponseBody
	public int alramDelect(int alram_id) {
		alramService.alramDelect(alram_id);
		return alram_id;
	}
	//알람 확인
	@PostMapping("alramChecked")
	public String alramChecked(String user_id){
		user_id = (String)session.getAttribute("session_id");
		System.out.println("user_id:"+user_id);
		alramService.alramChecked(user_id);
		return "";
	}
	
	@GetMapping("alramMention")
	public String alramMention(String user_id,Model model) {
		
		user_id = (String)session.getAttribute("session_id");
		List<AlramDto> list = alramService.Mentionalram(user_id);
		model.addAttribute("list",list);
		return "/alram/alramMention";
	}
	@PostMapping("alramBan")
	@ResponseBody
	public String alramBan(String source_id) {
		System.out.println("source_id "+source_id);
		alramService.alramBan(source_id);
		return "success";
	}
	
	@GetMapping("alramBanUser")
	public String alramBanUser(String user_id,Model model) {
		user_id = (String)session.getAttribute("session_id");
		List<AlramDto> list = alramService.selectBanUser(user_id);
		model.addAttribute("list",list);
		return "alram/alramBanUser";
	}
	
	@PostMapping("UserUnBan")
	@ResponseBody
	public String UserUnBan(String source_id) {
		System.out.println("source_id "+source_id);
		alramService.UserUnBan(source_id);
		return "success";
	}
	
	
	
}
