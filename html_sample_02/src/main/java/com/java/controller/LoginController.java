package com.java.controller;

import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import com.java.dto.Cross_userDto;
import com.java.service.EmailService;
import com.java.service.TestService;
import com.java.service.JoinMemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired TestService Tservice;
	@Autowired EmailService emailService;
	@Autowired HttpSession session;
	@Autowired JoinMemberService joinmember;

	//로그인페이지
	@RequestMapping("/login")
	public String login() {

		session.invalidate();

		System.out.println("login");

		return "/login/login";
	}
	
	//로그인확인
	@PostMapping("/ajaxLogin")
	@ResponseBody
	public String ajaxLogin(Cross_userDto cdto) {
		System.out.println("con id : "+cdto.getUser_id());
		System.out.println("con pw : "+cdto.getPassword());
		
		int result = Tservice.login(cdto);
		
		return result+"";	
		
	}
	
	//카카오로그인
		@GetMapping("/kaka")
		@ResponseBody
		public String oauth(String code) {
			//코드 값 받기
			System.out.println("kakao code : "+ code);
			String tokenUrl = "https://kauth.kakao.com/oauth/token";
			String content_type = "application/x-www-form-urlencoded;charset=utf-8";
			String grant_type = "authorization_code";
			String client_id = "fe714f17477232187f3fb8741b56d8bd";
			String redirect_uri = "http://localhost:8000/kakao/oauth";
			//code = code;

			//토큰키 받기
			//java에서 url접속
			//HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//headers,body
			RestTemplate rt = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type",content_type);

			//body부분 - HttpBody MultiValueMap 오브젝트 생성
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", grant_type);
			params.add("client_id", client_id);
			params.add("redirect_uri", redirect_uri);
			params.add("code", code);

			// HttpEntity에 HttpHeaders headers,MultiValueMap params을 1개로 합치기
			HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params,headers);

			//카카오서버로 url전송해서 토큰키return 받기
			// 매개변수 : url링크, 전송방식-post, (headers,body),String.class형태로 전송
		    ResponseEntity<String> response = rt.exchange(tokenUrl, HttpMethod.POST, kakaoTokenRequest,String.class);

		    System.out.println("카카오 토큰 요청 응답 : "+response);

			return "success";
		}
		
		//네이버로그인
		@GetMapping("/naver")
		@ResponseBody

		public String oauth01(String code) {
			//코드 값 받기
			System.out.println("naver code : "+ code);
			String tokenUrl = "https://nid.naver.com/oauth2.0/token";
			String content_type = "application/x-www-form-urlencoded;charset=utf-8";
			String grant_type = "authorization_code";
			String client_id = "7g_j2G60OUulN4ds5aL_";
			String client_secret = "EKdvvHgj_l";
			String redirect_uri = "http://localhost:8000/naver/oauth01";
			String state = "test";
			//code = code;

			//토큰키 받기
			//java에서 url접속
			//HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//headers,body
			RestTemplate rt = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.add("content_type",content_type);

			//body부분 - HttpBody MultiValueMap 오브젝트 생성
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			params.add("grant_type", grant_type);
			params.add("client_id", client_id);
			params.add("client_secret", client_secret);
			params.add("state", state);
			params.add("redirect_uri", redirect_uri);
			params.add("code", code);

			// HttpEntity에 HttpHeaders headers,MultiValueMap params을 1개로 합치기
			HttpEntity<MultiValueMap<String, String>> naverTokenRequest = new HttpEntity<>(params,headers);

			//카카오서버로 url전송해서 토큰키return 받기
			// 매개변수 : url링크, 전송방식-post, (headers,body),String.class형태로 전송
		    ResponseEntity<String> response = rt.exchange(tokenUrl, HttpMethod.POST, naverTokenRequest,String.class);

		    System.out.println("네이버 토큰 요청 응답 : "+response);


			return "success";
		}

	//아이디찾기
	@RequestMapping("/findId")
	public String findId() {
		return "/login/findId";
	}
	
	@PostMapping("/EmailId")//아이디 찾기 - 이메일 발송
	@ResponseBody
	public String idsearch(String email) {
		System.out.println("Lcon 이메일 : "+email);
		
		String result = emailService.emailSend2(email);
		
		return "success : "+result;
	}
	
	
	@PostMapping("/EmailPw")//비밀번호 찾기 - 이메일 발송
	@ResponseBody
	public String pwsearch(String email) {
		System.out.println("Lcon 이메일 : "+email);
		
		String result = emailService.emailSend3(email);
		
		return "success : "+result;
	}
	
	@PostMapping("/Emailidchk")//아이디찾기 - 인증번호 확인
	@ResponseBody
	public String Emailidchk(String Idcodechk, String email) {
		System.out.println("result idcheck : "+Idcodechk);
		
		//service 연결 - 인증번호 확인 : db연결해서 확인, session
		String result = "fail";
		String idcode = (String)session.getAttribute("email_idcode");
		if(Idcodechk.equals(idcode)) {
			System.out.println("CON Em : "+email );
			Cross_userDto findId =  Tservice.findId(email);
			result = findId.getUser_id();
		}
		
		session.invalidate();
		return result;
	}
	
	@PostMapping("/emailPwfind")//비밀번호찾기 - 인증번호 확인
	@ResponseBody
	public String emailPwfind(String emailpwcode) {
		System.out.println("result pwcheck : "+emailpwcode);
		
		//service 연결 - 인증번호 확인 : db연결해서 확인, session
		String result = "fail";
		String pwcode = (String)session.getAttribute("email_pwcode");
		System.out.println("pwcode : "+pwcode);
	
		if(emailpwcode.equals(pwcode)) {
			result = "success";
		}
		
		session.invalidate();
		return result;
	}
	
	@RequestMapping("/savePW")
	@ResponseBody
	public String savePW(String pw, String email) {
		
		System.out.println("pw : "+pw);
		System.out.println("email : "+email);
		Tservice.savePW(pw, email);
		
		return "success";
	}
	

	//비밀번호찾기
	@RequestMapping("/findPw")
	public String findPw() {
		return "/login/findPw";
	}
	//약관동의
	@RequestMapping("/useAgree")
	public String useAgree() {
		return "/login/useAgree";
	}
	
	//회원가입
	@GetMapping("/joinMember")
	public String joinMember(Cross_userDto crossDto) {
		return "/login/joinMember";
	}
	
	/*
	 * @RequestMapping("/ajaxLogin")
	 * 
	 * @ResponseBody public String ajaxLogin() {
	 * 
	 * session.setAttribute("session_id", "aaa");
	 * //session.setAttribute("session_image", "1706762836556_star_yellow.png");
	 * session.setAttribute("session_image", "1.jpg");
	 * session.setAttribute("session_name","Name111");
	 * 
	 * return "Test";
	 * 
	 * }
	 */

	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(Cross_userDto crossDto) {
		String result = "";
		Cross_userDto crossdto = joinmember.idCheck(crossDto);
		if(crossdto == null) {
			result ="사용가능";
			
		}else {
			result="사용불가";
		}
		return result;
	}
	
	@PostMapping("email")
	@ResponseBody
	public String email(String email,String email1) {
		System.out.println("1"+email);
		System.out.println("2"+email1);
		String result = joinmember.emailsend(email,email1);
		return "success: "+ result;
	}
	
	//인증번호 확인
	@ResponseBody
	@PostMapping("emailCheck")
	public String emailCheck(String check) {
		System.out.println("확인 : "+ check);
		//service 연결 - 인증번호 확인 : db연결해서 확인, session
		String result = "fail";
		String pwcode = (String) session.getAttribute("email_pwcode");
		System.out.println("LoginController pwcode : "+pwcode);
		if(check.equals(pwcode)) {
			result = "success";
		}
		System.out.println("결과값 : "+result ) ;
		return result;
	}
	
	//회원가입
	@ResponseBody
	@RequestMapping("joinCheck")
	public String joinCheck(Cross_userDto crossuserdto, String userid, String username, String password1, String emailAll) {
		System.out.println("joinCheck id : "+ userid);
		crossuserdto.setUser_id(userid);
		crossuserdto.setName(username);
		crossuserdto.setPassword(password1);
		crossuserdto.setEmail(emailAll);
		//service 연결
		joinmember.joinCheck(crossuserdto);
		return "/login";
	}
	
}
