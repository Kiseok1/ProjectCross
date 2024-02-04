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
import com.java.dto.PostLikeDto;
import com.java.dto.PostMediaUserDto;
import com.java.dto.User_followDto;
import com.java.service.ProfileService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("profile")
public class ProfileController {
	
	@Autowired HttpSession session;
	
	@Autowired ProfileService pService;

	//프로필 페이지 이동
	@RequestMapping("/content")
	public String content(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		ArrayList<PostDto> list = pService.selectDefault(id);
		ArrayList<PostLikeDto> list2 = pService.selectLike(id);
		
		model.addAttribute("udto",udto);
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		
		return "/profile/content";
	}
	
	@RequestMapping("/media")
	public String media(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		ArrayList<PostMediaUserDto> list = pService.selectMedia(id);
		
		model.addAttribute("udto",udto);
		model.addAttribute("list",list);
		
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
	
	//상대방 프로필 이동
	@RequestMapping("/your_content")
	public String your_content(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		//본인 정보 가져오기
		Cross_userDto udto = pService.selectOne(id);
		
		//상대방 게시글 가져오기
		ArrayList<PostDto> list = pService.selectDefault(your_id);
		ArrayList<PostLikeDto> list2 = pService.selectLike(id);
		//상대방 정보 가져오기
		Cross_userDto udto2 = pService.selectOne(your_id);
		//팔로우 정보 가져오기
		User_followDto followDto = pService.selectFollowInfo(id,your_id);
		
		model.addAttribute("udto",udto);
		model.addAttribute("list",list);
		model.addAttribute("udto2",udto2);
		model.addAttribute("followDto",followDto);
		model.addAttribute("list2",list2);
		
		return "/profile/your_content";
	}
	
	@RequestMapping("/your_media")
	public String your_media(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		//본인 정보 가져오기
		Cross_userDto udto = pService.selectOne(id);
		
		//상대방 정보 가져오기
		Cross_userDto udto2 = pService.selectOne(your_id);
		//팔로우 정보 가져오기
		User_followDto followDto = pService.selectFollowInfo(id,your_id);
		
		model.addAttribute("udto",udto);		
		model.addAttribute("udto2",udto2);
		model.addAttribute("followDto",followDto);
		
		return "/profile/your_media";
	}
	
	@RequestMapping("/your_reply")
	public String your_reply(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		//본인 정보 가져오기
		Cross_userDto udto = pService.selectOne(id);
		
		//상대방 정보 가져오기
		Cross_userDto udto2 = pService.selectOne(your_id);
		//팔로우 정보 가져오기
		User_followDto followDto = pService.selectFollowInfo(id,your_id);
		
		model.addAttribute("udto",udto);		
		model.addAttribute("udto2",udto2);
		model.addAttribute("followDto",followDto);
		
		return "/profile/your_reply";
	}
	
	@RequestMapping("/your_like")
	public String your_like(Model model) {
		String your_id = "ddd";
		String id = (String) session.getAttribute("session_id");
		//본인 정보 가져오기
		Cross_userDto udto = pService.selectOne(id);
		
		//상대방 정보 가져오기
		Cross_userDto udto2 = pService.selectOne(your_id);
		//팔로우 정보 가져오기
		User_followDto followDto = pService.selectFollowInfo(id,your_id);
		
		model.addAttribute("udto",udto);		
		model.addAttribute("udto2",udto2);
		model.addAttribute("followDto",followDto);
		
		return "/profile/your_like";
	}
	
	
	//mypage 메인 이동
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/mypage";
	}
	
	//mypage - 계정정보 이동
	@RequestMapping("/mypage_account")
	public String mypage_account(Model model) {
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		model.addAttribute("udto",udto);
		return "/profile/mypage_account";
	}
	
	//mypage - 비밀번호 변경 이동
	@RequestMapping("/mypage_pw_modify")
	public String mypage_pw_modify(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/mypage_pw_modify";
	}
	
	//mypage - 프로필 수정 이동
	@RequestMapping("/profile_modify")
	public String profile_modify(Model model) {
		
		String id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(id);
		
		model.addAttribute("udto",udto);
		
		return "/profile/profile_modify";
	}
	
	//계정정보 변경
	@PostMapping("/accountUpdate")
	@ResponseBody
	public String accountUpdate(Cross_userDto udto,String org_id,Model model) {
		String result = "";
		
		pService.accountUpdate(udto,org_id);

		return result;
	}
	
	//비밀번호 변경
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
	
	//프로필 수정
	@PostMapping("/profileUpdate")
	@ResponseBody
	public String profileUpdate(String name, String profile_txt, String user_loc, String user_url, String header_img, String profile_img) {
		String user_id = (String) session.getAttribute("session_id");
		Cross_userDto udto = pService.selectOne(user_id);
		pService.profileUpdate(name,profile_txt,user_loc,user_url,header_img,profile_img,user_id);
		String result = "변경이 완료되었습니다.";
		
		return result;
	}
	
	//프로필 수정 - 이미지 업로드
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
		} 
		return upFName;
	}
	
	//팔로우
	@PostMapping("/followBtn")
	@ResponseBody
	public String followBtn(String stat, String target_id) {
		String source_id = (String) session.getAttribute("session_id");
		if(stat.equals("insert")) {
			pService.insertFollow(source_id,target_id);
		} else if(stat.equals("delete")) {
			pService.deleteFollow(source_id,target_id);
		}
		
		String result = "";
		
		return result;
	}
	
	//좋아요
	@PostMapping("/likeUpdate")
	@ResponseBody
	public String likeUpdate(String stat, String post_id) {
		int likeCount=0;
		String user_id = (String) session.getAttribute("session_id");
		if(stat.equals("likeUp")) {
			pService.likeUp(user_id,post_id);
			likeCount = pService.likeCount(post_id);
		} else if(stat.equals("likeDown")) {
			pService.likeDown(user_id,post_id);
			likeCount = pService.likeCount(post_id);
		}
		
		
		
		return likeCount+"";
	}
	
}
