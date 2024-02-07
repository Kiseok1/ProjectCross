package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Cross_userDto;
import com.java.service.JoinMemberService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {
	@Autowired
	JoinMemberService joinmember;
	@Autowired
	HttpSession session;
	
	
	//로그인페이지
	@RequestMapping("/login")
	public String login() {
		return "/login/login";
	}
	//아이디찾기
	@RequestMapping("/findId")
	public String findId() {
		return "/login/findId";
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
