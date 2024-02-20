package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.MessCrossMediaDto;
import com.java.dto.MessageDto;
import com.java.service.MService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("message")
public class MessageController {
	
	@Autowired
	MService mService;
	@Autowired
	HttpSession session;
	
	@GetMapping("/index")
	public String mindex() {
		return "/message/index";
	}

	@PostMapping("/doMInsert")//게시글 저장하기
	public String doMInsert(MessageDto mdto, MediaDto mdto2,
			List<MultipartFile> files, Model model) throws Exception{
		String orgName = "";
		String newName = "";
		String mergeName = "";
		int i=0;
		for(MultipartFile file:files) {
			//파일 첨부하기
			orgName = file.getOriginalFilename();
			System.out.println("MessageController 파일첨부 이름 : "+ orgName);
			long time = System.currentTimeMillis();
			newName = time + "_" + orgName; //중복방지를 위해 새로운 이름변경
			String upload = "c:/upload/"; //파일 업로드 위치
			File f = new File(upload+newName);
			file.transferTo(f); //파일을 저장 위치에 저장시킴.
			
			//파일이름을 저장하기
			if(i==0) mergeName += time+"_"+orgName;
			else mergeName += ","+time+"_"+orgName;
			i++;
		}
		
		//게시글&파일 저장
		mdto2.setFile_name(mergeName); //파일이름을 MediaDto에 저장시킴
		System.out.println("MessageController 최종 파일첨부 이름 : "+mergeName);
		
		//db연결
		System.out.println("target id : "+mdto.getTarget_id());
		mdto.setSource_id((String)session.getAttribute("session_id"));
		mService.mInsert2(mdto);
		mService.mInsert(mdto2);
		return "/message/index";
	}

	@PostMapping("/search")//검색 결과 가져오기
	@ResponseBody
	public List<Cross_userDto>search(String input) {
		System.out.println("MessageController search input : "+input);
		List<Cross_userDto> list3 = mService.searchAll(input);
		return list3;
	}

	@PostMapping("/search2")//검색 받은 쪽지결과 가져오기
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
	
	@RequestMapping("/head")
	public String head(Model model) {
		//답글 모두 가져오기
		ArrayList<MessCrossMediaDto> list = mService.receiveAll((String)session.getAttribute("session_id"));
		 // list가 비어있는지 여부에 따라 result 설정
	    model.addAttribute("list", list);
		
		return "/message/head";
	}
	
	@PostMapping("/receiveOne")//받은글 한개 가져오기
	@ResponseBody
	public MessCrossMediaDto receiveOne(int msg_id) {
		System.out.println("MessageController receiveOne : "+msg_id);
		MessCrossMediaDto mcDto = mService.receiveOne(msg_id);  
		return mcDto;
	}

	@PostMapping("/checkUpdate")//check update
	@ResponseBody
	public MessCrossMediaDto checkUpdate(int msg_id, String stat) {
		System.out.println("MessageController checkUpdate : "+msg_id);
		System.out.println(stat);
		MessCrossMediaDto mcDto = mService.checkUpdate(msg_id,stat); 
		System.out.println(mcDto.getMessageDto().getChecked());
		return mcDto;
	}
	
	@GetMapping("/head2")
	public String head2(Model model) {
		
		List<MessCrossMediaDto> list2 = mService.sendAll((String)session.getAttribute("session_id"));
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
