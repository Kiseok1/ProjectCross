package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.catalina.valves.JsonAccessLogValve;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UrlPathHelper;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.java.dto.Cross_userDto;
import com.java.dto.MediaDto;
import com.java.dto.PostDto;
import com.java.service.MediaService;
import com.java.service.PostService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	
	@Autowired HttpSession session;
	@Autowired
	PostService postService;
	@Autowired
	MediaService mediaService;


	@RequestMapping("/")
	public String index(Model model) {
		
		String url ="/index";
		String id=null;
		
		
		if(session.getAttribute("session_id")==null)
		{
			url = "/login/login";
		}
		else
		{
			id= session.getAttribute("session_id").toString();
			Map<String, Object> map =  postService.getMyTimeline(id);
			
			model.addAttribute("plist", map.get("plist"));
			model.addAttribute("ulist", map.get("ulist"));
			model.addAttribute("mlist", map.get("mlist")); 
			model.addAttribute("recount", map.get("recount")); 
			model.addAttribute("renoted", map.get("renoted"));
			model.addAttribute("facount", map.get("facount")); 
			model.addAttribute("favorited", map.get("favorited"));
			model.addAttribute("replycount", map.get("replycount"));
			
			model.addAttribute("user_id",session.getAttribute("session_id").toString());
			model.addAttribute("user_profile",session.getAttribute("session_image").toString());
			model.addAttribute("user_name",session.getAttribute("session_name").toString());
		}
		
		
		return url;

	}
	
	@PostMapping("/getPostAjax")
	@ResponseBody
	public JSONObject getPostAjax(int pageCounter)
	{
		JSONObject jobj = new JSONObject();
		String id=null;
		System.out.println("pageCounter : "+pageCounter);
		
		
		
		
		if(session.getAttribute("session_id")==null)
		{
			jobj = null;
		}
		else
		{
			id= session.getAttribute("session_id").toString();
			Map<String, Object> map =  postService.getMyTimelineMore(id,pageCounter);
			
			
			
			
			JSONArray plist = new JSONArray();
			JSONArray ulist = new JSONArray();
			JSONArray mlist = new JSONArray();
			JSONArray recount = new JSONArray();
			JSONArray renoted = new JSONArray();
			JSONArray facount = new JSONArray();
			JSONArray favorited = new JSONArray();
			JSONArray replycount = new JSONArray();
			
			
			jobj.put("pageCounter", pageCounter);
			
			for(int i = 0 ; i < ((ArrayList<PostDto>)map.get("plist")).size() ; i++)
			{
				plist.add(i, ((ArrayList<PostDto>)map.get("plist")).get(i) );
				ulist.add(i, ((ArrayList<Cross_userDto>)map.get("ulist")).get(i) );
				mlist.add(i, ((ArrayList<MediaDto>)map.get("mlist")).get(i) );
				recount.add(i, ((ArrayList<Integer>)map.get("recount")).get(i) );
				renoted.add(i, ((ArrayList<Integer>)map.get("renoted")).get(i) );
				facount.add(i, ((ArrayList<Integer>)map.get("facount")).get(i) );
				favorited.add(i, ((ArrayList<Integer>)map.get("favorited")).get(i) );
				replycount.add(i, ((ArrayList<Integer>)map.get("replycount")).get(i) );
			}
			
			
			jobj.put("plist", plist);
			jobj.put("ulist", ulist);
			jobj.put("mlist", mlist); 
			
			jobj.put("recount", recount); 
			jobj.put("renoted", renoted);
			jobj.put("facount", facount); 
			jobj.put("favorited", favorited);
			jobj.put("replycount", replycount);
			
			
			jobj.put("user_id",session.getAttribute("session_id").toString());
			jobj.put("user_profile",session.getAttribute("session_image").toString());
			jobj.put("user_name",session.getAttribute("session_name").toString());
			

		}
		
		
		return jobj;
	}
	
	
	@RequestMapping("/viewContent")
	public String view(int post_id, Model model) {
		
		Map<String, Object> postMap = postService.getSelected(post_id);

		model.addAttribute("plist",postMap.get("plist"));
		model.addAttribute("mlist",postMap.get("mlist"));
		model.addAttribute("ulist",postMap.get("ulist"));
		model.addAttribute("recount",postMap.get("recount"));
		model.addAttribute("renoted", postMap.get("renoted"));
		model.addAttribute("facount", postMap.get("facount")); 
		model.addAttribute("favorited", postMap.get("favorited"));
		model.addAttribute("replycount", postMap.get("replycount"));
		model.addAttribute("bookmarked", postMap.get("bookmarked"));
		
		return "/view";
	}
	
	@RequestMapping("/sidebar")
	public String sidebar() {
		return "/sidebar";
	}
	
	@RequestMapping("/main")
	public String profile() {
		return "/profile/main";
	}
	
	
	@RequestMapping("/location")
	@ResponseBody
	public String location()
	{
		String param ="Location";
		
		return param;
	}
	
	@RequestMapping("analystic")
	public String analystic() {
		return "/analystic";
	}
	
	@PostMapping("/selectedAnalysis")
	@ResponseBody
	public JSONObject selectedAnalysis(int post_id)
	{
		JSONObject jobj = new JSONObject();
		
		PostDto pdto = postService.getSeletedHit(post_id);

		jobj.put("viewhit0", pdto.getViewhit0());
		jobj.put("viewhit6", pdto.getViewhit6());
		jobj.put("viewhit12", pdto.getViewhit12());
		jobj.put("viewhit18", pdto.getViewhit18());

		jobj.put("hit", pdto.getHit());
		
		return jobj;
	}

	
	@PostMapping("sendPost")
	@ResponseBody
	public JSONObject sendPost(PostDto postDto, @RequestPart List<MultipartFile> files, Model model)
	{
		
		JSONObject jobj = new JSONObject();
		
		MediaDto mediaDto = new MediaDto();
		
		String orgName ="";
		String newName ="";
		String MergeName="";
		String types ="";
		int totalsize=0;

		postDto.setUser_id(session.getAttribute("session_id").toString());
		
		System.out.println("ID : " + postDto.getUser_id());
		System.out.println("postDto.content : "+postDto.getPcontent());
		System.out.println("postDto.loc : "+postDto.getPlocation() );
		
		int numberOfFiles = 0 ;
		for(MultipartFile file : files)
		{
			orgName = file.getOriginalFilename();
			
			System.out.println("Media Type : " + file.getContentType());
			
			if(file.getContentType().contains("application"))
			{
				break;
			}
			long time = System.currentTimeMillis();
			newName = time+"_"+orgName;
			
			MergeName += newName+",";
			types += file.getContentType()+",";
			totalsize += file.getSize();
			
			String upload = "C:/upload/";
			
			File f = new File(upload+newName);
			try {
				
				file.transferTo(f);
				mediaDto.setFile_name(newName);
				System.out.println("newName : " + newName);
				numberOfFiles++;
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int result = postService.sendPost(postDto);
		int post_id = postDto.getPost_id();
		
		if(totalsize>0)
		{
			MergeName = MergeName.substring(0, MergeName.length()-1);
			mediaDto.setFile_name(MergeName);
			
			mediaDto.setPost_id(post_id);
			types = types.substring(0, types.length()-1);
			mediaDto.setFile_type(types);
			mediaDto.setFile_size(totalsize);
			
			mediaService.sendPost(mediaDto);
		}

		System.out.println("MergeName : " + mediaDto.getFile_name());


		System.out.println("return Post ID : " + post_id );
		
		jobj.put("post", postDto);
		jobj.put("files",MergeName);
		jobj.put("type", types);
		jobj.put("nof", numberOfFiles);
		jobj.put("name", session.getAttribute("session_name"));
		jobj.put("profile",session.getAttribute("session_image"));

		
		return jobj;
	}
	
	
	@PostMapping("modalSendPost")
	@ResponseBody
	public JSONObject modalSendPost(PostDto postDto, @RequestPart List<MultipartFile> files, Model model)
	{
		
		JSONObject jobj = new JSONObject();
		
		MediaDto mediaDto = new MediaDto();
		
		String orgName ="";
		String newName ="";
		String MergeName="";
		String types ="";
		int totalsize=0;
		
		
		

		postDto.setUser_id(session.getAttribute("session_id").toString());
		
		System.out.println("ID : " + postDto.getUser_id());
		System.out.println("postDto.content : "+postDto.getPcontent());
		System.out.println("postDto.loc : "+postDto.getPlocation() );

		
		int numberOfFiles = 0 ;
		for(MultipartFile file : files)
		{
			orgName = file.getOriginalFilename();
			
			System.out.println("Media Type : " + file.getContentType());
			
			if(file.getContentType().contains("application"))
			{
				break;
			}
			long time = System.currentTimeMillis();
			newName = time+"_"+orgName;
			
			MergeName += newName+",";
			types += file.getContentType()+",";
			totalsize += file.getSize();
			
			String upload = "C:/upload/";
			
			File f = new File(upload+newName);
			try {
				
				file.transferTo(f);
				mediaDto.setFile_name(newName);
				System.out.println("newName : " + newName);
				numberOfFiles++;
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int result = postService.sendModalPost(postDto);
		int post_id = postDto.getPost_id();
		
		if(totalsize>0)
		{
			MergeName = MergeName.substring(0, MergeName.length()-1);
			mediaDto.setFile_name(MergeName);
			
			mediaDto.setPost_id(post_id);
			types = types.substring(0, types.length()-1);
			mediaDto.setFile_type(types);
			mediaDto.setFile_size(totalsize);
			
			mediaService.sendPost(mediaDto);
		}

		System.out.println("MergeName : " + mediaDto.getFile_name());


		System.out.println("return Post ID : " + post_id );
		
		 jobj.put("post", postDto); 
		 jobj.put("files",MergeName); 
		 jobj.put("type", types); 
		 jobj.put("nof", numberOfFiles); 
		 jobj.put("name", session.getAttribute("session_name"));
		 jobj.put("profile",session.getAttribute("session_image"));
		
		return jobj;
	}

	
	@PostMapping("deleteOne")
	@ResponseBody
	public int deleteOne(int post_id)
	{
		
		postService.deleteOne(post_id);
		return 0;
	}
	
	@PostMapping("repeatOn")
	@ResponseBody
	public int repeatOn(int post_id)
	{
		int count = postService.repeatOn(post_id);
		return count;
	}
	
	@PostMapping("repeatOff")
	@ResponseBody
	public int repeatOff(int post_id)
	{
		int count = postService.repeatOff(post_id);
		return count;
	}
	
	@PostMapping("favoriteOn")
	@ResponseBody
	public int favoriteOn(int post_id)
	{
		int count = postService.favoriteOn(post_id);
		return count;
	}
	
	@PostMapping("favoriteOff")
	@ResponseBody
	public int favoriteOff(int post_id)
	{
		int count = postService.favoriteOff(post_id);
		return count;
	}
	
	
	
}
