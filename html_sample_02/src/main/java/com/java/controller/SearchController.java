package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Cross_userDto;
import com.java.dto.PostDto;
import com.java.service.PostService;

@Controller
@RequestMapping("search")
public class SearchController {
@Autowired
PostService PService;

	@RequestMapping("/images")
	public String images() {
		return "/search/images";
	}
	//최신순 게시글 정렬
	@RequestMapping("/search")
	public String search(Model model,String keyword) {
		System.out.println("keyword :"+keyword);
		List<PostDto> list = null;
		if(keyword==null) {
			list = PService.selectnewest();
		}else {
			list = PService.selectKeyWord(keyword);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("keyword",keyword);
		System.out.println("map :"+map);
		model.addAttribute("map",map);
		return "/search/search";
	}
	
	//인기순 게시글 정렬
	@RequestMapping("/search_in")
	public String search_in(Model model,String keyword) {
		System.out.println("keyword :"+keyword);
		List<PostDto> list = null;
		if(keyword==null) {
			list = PService.selectLike();
		}else {
			list = PService.selectKeyWord_Like(keyword);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		return "/search/search_in";
	}
	//유저목록 보여주기
	@RequestMapping("/user")
	public String user(Model model,String keyword) {
		List<Cross_userDto> list = null;
		if(keyword==null) {
			list = PService.selectAlluser();
		}else {
			list = PService.selectKeyWord_user(keyword);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		return "/search/user";
	}
	@PostMapping("/likeUp")
	@ResponseBody
	public String likeUp(int post_id) {
		PService.likeUp(post_id);
		return "완료";
	}
	
}
