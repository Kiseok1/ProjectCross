package com.java.controller;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.service.ProfileService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("profile")
public class ProfileController {
	
	@Autowired HttpSession session;
	
	@Autowired ProfileService pService;

	@RequestMapping("/content")
	public String content(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		ArrayList<PostDto> list = pService.selectDefault(id);
		
		model.addAttribute("udto",udto);
		model.addAttribute("list",list);
		
		return "/profile/content";
	}
	
	@RequestMapping("/media")
	public String media(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/media";
	}
	
	@RequestMapping("/reply")
	public String reply(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/reply";
	}
	
	@RequestMapping("/like")
	public String like(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/like";
	}
	
	@RequestMapping("/your_content")
	public String your_content(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		ArrayList<PostDto> list = pService.selectDefault(id);
		Cross_userDto udto2 = pService.selectOne(your_id);
		
		model.addAttribute("udto",udto);
		model.addAttribute("list",list);
		model.addAttribute("udto2",udto2);
		
		return "/profile/your_content";
	}
	
	@RequestMapping("/your_media")
	public String your_media(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		Cross_userDto udto2 = pService.selectOne(your_id);
		
		
		model.addAttribute("udto",udto);
		model.addAttribute("udto2",udto2);
		
		return "/profile/your_media";
	}
	
	@RequestMapping("/your_reply")
	public String your_reply(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		Cross_userDto udto2 = pService.selectOne(your_id);
		
		
		model.addAttribute("udto",udto);
		model.addAttribute("udto2",udto2);
		
		return "/profile/your_reply";
	}
	
	@RequestMapping("/your_like")
	public String your_like(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		Cross_userDto udto2 = pService.selectOne(your_id);
		
		
		model.addAttribute("udto",udto);
		model.addAttribute("udto2",udto2);
		
		return "/profile/your_like";
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/mypage";
	}
	
	@RequestMapping("/mypage_account")
	public String mypage_account(Model model) {
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		model.addAttribute("udto",udto);
		return "/profile/mypage_account";
	}
	
	@RequestMapping("/mypage_pw_modify")
	public String mypage_pw_modify(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/mypage_pw_modify";
	}
	
	@RequestMapping("/profile_modify")
	public String profile_modify(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/profile_modify";
	}
	
	@PostMapping("/accountUpdate")
	@ResponseBody
	public String accountUpdate(Cross_userDto udto,String org_id,Model model) {
		String result = "";
		
		pService.accountUpdate(udto,org_id);

		return result;
	}
	
	@PostMapping("/pwUpdate")
	@ResponseBody
	public String pwUpdate(String cur_pw, String new_pw) {
		String result = "";
		String user_id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(user_id);
		if(cur_pw.equals(udto.getPassword())) {
			pService.pwUpdate(cur_pw,new_pw,user_id);
			result = "패스워드를 변경하였습니다.";
		} else {
			result = "입력하신 패스워드가 기존패스워드와 일치하지 않습니다.";
		}
				
		return result;
	}
	
	@PostMapping("/profileUpdate")
	@ResponseBody
	public String profileUpdate(String name, String profile_txt, String user_loc, String user_url, String header_img, String profile_img) {
		String user_id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(user_id);
		pService.profileUpdate(name,profile_txt,user_loc,user_url,header_img,profile_img,user_id);
		String result = "변경이 완료되었습니다.";
		
		return result;
	}
	
	//내용부분 - 이미지 추가시 파일업로드
	@PostMapping("imgUpload")
	@ResponseBody
	public String imgUpload(@RequestPart MultipartFile file) throws Exception  {
		String upFName = "";
		if(!file.isEmpty()) {
			String oriFName = file.getOriginalFilename();
			long time = System.currentTimeMillis();
			upFName = time+"_"+oriFName;
			
			//파일업로드 부분
			String fupload = "c:/upload/";
			File f = new File(fupload+upFName);
			file.transferTo(f);
			
			//파일위치
			
		} 
		
		return upFName;
	}
	
	
}
