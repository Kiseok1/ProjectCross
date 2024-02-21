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
	public String images(Model model,String keyword) {
		System.out.println("keyword :"+keyword);
		List<PostDto> list = null;
		Map<String, Object> map = new HashMap<>();
		if(keyword==null || keyword.equals("")) {
			map = PService.selectMedia();
		}else {
			map = PService.selectKeyWordMedia(keyword);
		}
		
		model.addAttribute("plist", map.get("plist"));
		model.addAttribute("ulist", map.get("ulist"));
		model.addAttribute("mlist", map.get("mlist")); 
		model.addAttribute("flist", map.get("flist"));
		 model.addAttribute("ilist", map.get("ilist"));

		map.put("list", list);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		
		return "/search/images";
	}
	
	
	//최신순 게시글 정렬 (기존)
//	@RequestMapping("/search")
//	public String search(Model model,String keyword) {
//		System.out.println("keyword :"+keyword);
//		List<PostDto> list = null;
//		if(keyword==null) {
//			list = PService.selectnewest();
//		}else {
//			list = PService.selectKeyWord(keyword);
//		}
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", list);
//		map.put("keyword",keyword);
//		System.out.println("map :"+map);
//		model.addAttribute("map",map);
//		return "/search/search";
//	}
	

	//최신순 게시글 정렬
	@RequestMapping("/search")
	public String search(Model model,String keyword) {
		System.out.println("keyword :"+keyword);
		List<PostDto> list = null;

		Map<String, Object> map = new HashMap<>();
		if(keyword==null || keyword.equals("")) {
			map = PService.selectnewest2();
		}else {
			map = PService.selectKeyWord2(keyword);
		}
		
		model.addAttribute("plist", map.get("plist"));
		model.addAttribute("ulist", map.get("ulist"));
		model.addAttribute("mlist", map.get("mlist")); 
		model.addAttribute("recount", map.get("recount")); 
		model.addAttribute("renoted", map.get("renoted"));
		model.addAttribute("facount", map.get("facount")); 
		model.addAttribute("favorited", map.get("favorited"));
		model.addAttribute("replycount", map.get("replycount"));
		

		map.put("list", list);
		map.put("keyword",keyword);

		model.addAttribute("map",map);
		return "/search/search";
	}
	

	//인기순 게시글 정렬 (기존)
//	@RequestMapping("/search_in")
//	public String search_in(Model model,String keyword) {
//		System.out.println("keyword :"+keyword);
//		List<PostDto> list = null;
//		if(keyword==null) {
//			list = PService.selectLike();
//		}else {
//			list = PService.selectKeyWord_Like(keyword);
//		}
//		Map<String, Object> map = new HashMap<>();
//		map.put("list", list);
//		map.put("keyword",keyword);
//		model.addAttribute("map",map);
//		return "/search/search_in";
//	}
	
	//인기순 게시글 정렬 

	@RequestMapping("/search_in")
	public String search_in(Model model,String keyword) {
		System.out.println("keyword :"+keyword);
		List<PostDto> list = null;

		Map<String, Object> map = new HashMap<>();
		if(keyword==null || keyword.equals("")) {
			map = PService.selectLike2();
		}else {
			map = PService.selectKeyWord_Like2(keyword);
		}
		
		model.addAttribute("plist", map.get("plist"));
		model.addAttribute("ulist", map.get("ulist"));
		model.addAttribute("mlist", map.get("mlist")); 
		model.addAttribute("recount", map.get("recount")); 
		model.addAttribute("renoted", map.get("renoted"));
		model.addAttribute("facount", map.get("facount")); 
		model.addAttribute("favorited", map.get("favorited"));
		model.addAttribute("replycount", map.get("replycount"));
		

		map.put("list", list);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		return "/search/search_in";
	}

	//유저목록 보여주기
	@RequestMapping("/user")
	public String user(Model model,String keyword) {
		List<Cross_userDto> list = null;

		Map<String, Object> map = new HashMap<>();
		
		if(keyword==null || keyword.equals("")) {
			map = PService.selectAlluser();
		}else {
			map = PService.selectKeyWord_user(keyword);
		}
		
		
		map.put("list", list);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		model.addAttribute("following",map.get("following"));
		model.addAttribute("follower",map.get("follower"));
		
		
		

		return "/search/user";
	}
	@PostMapping("/likeUp")
	@ResponseBody
	public String likeUp(int post_id) {
		PService.likeUp(post_id);
		return "완료";
	}
	
}
