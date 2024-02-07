package com.java.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.NaverDto;
import com.java.dto.access_token;

import jakarta.servlet.http.HttpSession;

@Controller
public class NaverController {
	
	@Autowired HttpSession session;


	@PostMapping("naverLogin")
	public String naverLogin() {
		return "naverLogin";
	}


	//네이버로그인
	//http://localhost:8000/kakao/oauth
	@GetMapping("/naver/oauth01")
	//@ResponseBody
	public String oauth01(String code) throws Exception {
		//**** code값 가져오기
		//code값 받기
		System.out.println("naver code : "+code);

		//token키 받기
		//headers에 담기
		//String content_type = "application/x-www-form-urlencoded;charset=utf-8";
		//body에 담기
		String tokenUrl = "https://nid.naver.com/oauth2.0/token";
		String content_type = "application/x-www-form-urlencoded;charset=utf-8";
		String grant_type = "authorization_code";
		String client_id = "7g_j2G60OUulN4ds5aL_";
		String client_secret = "EKdvvHgj_l";
		String state = "test";
		String redirect_uri = URLEncoder.encode("http://localhost:8000/naver/oauth01", "UTF-8");
		String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
		//code = code;

		//**** 토큰키 가져오기
		// 공공데이터에서 사용 : HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		//url전송 객체 선언
		RestTemplate rt = new RestTemplate();

		//HttpHeaders 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("content_type",content_type);

		//body 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type",grant_type);
		params.add("client_id",client_id);
		params.add("redirect_uri",redirect_uri);
		params.add("client_secret",client_secret);
		params.add("state", state);
		params.add("code",code);

		// 합치는 오브젝트 생성 : HttpHeaders와 MultiValueMap을 합쳐서 전송
		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<>(params,headers);

		//http전송 : post방식, 응답은 response
		ResponseEntity<String> response = rt.exchange(
				tokenUrl, HttpMethod.POST, tokenRequest, String.class);

		//json데이터를 java오브젝트로 변환 : ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		access_token Access_token = null;

		//json데이터를 java오브젝트로 변경
		try {
			Access_token = objectMapper.readValue(response.getBody(), access_token.class);
		} catch (Exception e) { e.printStackTrace(); }

		System.out.println("네이버 토큰키 : "+response);
		System.out.println("네이버 토큰키 getBody : "+response.getBody());
	    System.out.println("네이버 엑세스 getAccess_token : "+Access_token.getAccess_token());
	    System.out.println("네이버 엑세스 getExpires_in : "+Access_token.getExpires_in());

	    // *** 사용자 정보가져오기
	    //HttpHeaders 오브젝트 생성
	    HttpHeaders headers_user = new HttpHeaders();
	    headers_user.add("content_type", content_type);
	    headers_user.add("Authorization", "Bearer "+Access_token.getAccess_token());

		// 합치는 오브젝트 생성 : HttpHeaders와 MultiValueMap을 합쳐서 전송
		HttpEntity<MultiValueMap<String, String>> tokenRequest_user = new HttpEntity<>(headers_user);
	    String userUrl = "https://openapi.naver.com/v1/nid/me";
		//http전송 : post방식, 응답은 response
		ResponseEntity<String> response_user = rt.exchange(
				userUrl, HttpMethod.POST, tokenRequest_user, String.class);

		//--------
	    //json데이터를 java오브젝트로 변환 : ObjectMapper
	    ObjectMapper objectMapper2 = new ObjectMapper();
	    NaverDto naverDto = null;

		//json데이터를 java오브젝트로 변경
		try {
			naverDto = objectMapper2.readValue(response_user.getBody(), NaverDto.class);
		} catch (Exception e) { e.printStackTrace(); }

		
		 System.out.println("네이버사용자정보 response_user : "+response_user);
		 System.out.println("네이버사용자정보 naverDto id : "+naverDto.getId());
		 System.out.println("네이버사용자정보 naverDto email : "+naverDto.getEmail());
		 System.out.println("네이버사용자정보 naverDto Profile_image : "+naverDto.getProfile_image());
		 

	    //--- 로그인 시켜줌. member 테이블에 id : id, pass: id_1234567890
		session.setAttribute("session_id", naverDto.getId());
	    session.setAttribute("session_name", naverDto.getName());



		return "redirect:/";
		//return "사용자 정보 response_user : "+response_user;
	}

}
