package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.mapper.Cross_userMapper;

import jakarta.mail.MessagingException;
import jakarta.mail.Message.RecipientType;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	Cross_userMapper tmapper;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override // 로그인확인
	public int login(Cross_userDto cdto) {
		int result = 0;
		Cross_userDto cdto2 = tmapper.login(cdto);
		if(cdto2 != null) {
			session.setAttribute("session_id", cdto2.getUser_id());
			session.setAttribute("session_name", cdto2.getName());
			if(cdto2.getProfile_img()==null) {
				session.setAttribute("session_image", "proflie_default.png");
			} else {
				session.setAttribute("session_image", cdto2.getProfile_img());
			}
			result = 1;
		}
		
		return result;
	}


	@Override // 아이디 찾기 - 한명 아이디 띄우기
	public Cross_userDto findId(String email) {
		Cross_userDto findId = tmapper.findId(email);
		
		return findId;
	}

	@Override // 비밀번호찾기 - 비밀번호 저장
	public String savePW(String pw, String email) {
		 tmapper.savePW(pw, email);
		return "성공";
	}
	


	
}
		
		
	


	







	


