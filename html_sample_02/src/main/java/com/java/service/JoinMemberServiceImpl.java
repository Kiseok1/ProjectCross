
package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.java.dto.Cross_userDto;
import com.java.mapper.JoinMemberMapper;

import jakarta.mail.Message.RecipientType;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.servlet.http.HttpSession;

@Service
public class JoinMemberServiceImpl implements JoinMemberService {

	@Autowired
	JoinMemberMapper joinmembermapper;
	@Autowired
	HttpSession session;
	
	@Autowired
	JavaMailSender mailSender;
	
	//회원가입시 아이디 중복확인
	@Override
	public Cross_userDto idCheck(Cross_userDto crossDto) {
		Cross_userDto crossdto = joinmembermapper.idCheck(crossDto);
		return crossdto;
	}

	//회원가입시 이메일 발송
	@Override
	@Async
	public String emailsend(String email, String email1) {
		System.out.println("emailserviceImpl email : "+ email );
		System.out.println("emailserviceImpl email1 : "+ email1 );
		//인증코드 생성
		String pwcode = getCreateKey();
		String Allemail = email+"@"+email1 ;
		//이메일 전송
		jakarta.mail.internet.MimeMessage message = mailSender.createMimeMessage();
		try {
			message.setSubject("[안내] 님 회원가입 이메일 인증코드 발송안내","utf-8");
			String htmlData = "<table align='center' style='margin:0 0 0 40px;border:1px #D9D9D9 solid;'>\r\n"
					+ "	<tr>\r\n"
					+ "	 <td style='width:618px;height:220px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#F9F9F9;'>\r\n"
					+ "	  <p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;'><img src='https://cfm.kt.com/images/v2/layout/gnb-ktlogo.png' alt='비밀번호 찾기를 요청하셨습니다.' /></p>\r\n"
					+ "	  <p style='width:620px;margin:10px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1;'>아래의 인증코드는 회원가입에 필요한 인증코드입니다.</p>\r\n"
					+ "	  <p style='width:620px;margin:28px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>회원가입 인증코드 : <span style='color:#F7703C;line-height:1;'>"+pwcode+"</span></strong></p>\r\n"
					+ "	  <p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>회원가입에 필요한 인증코드를 발송해 드렸습니다. <br/>인증코드를 인증번호입력에 넣고 인증번호확인 버튼을 클릭해 주세요.</p>\r\n"
					+ "	</td>\r\n"
					+ "	</tr>\r\n"
					+ "	</table>";
			message.setText(htmlData,"utf-8","html");							//내용
			message.setFrom(new InternetAddress("gustjrtop123gmail.com"));		//보내는사람
			message.addRecipient(RecipientType.TO,new InternetAddress(Allemail));	//받는사람
			mailSender.send(message); 
			session.setAttribute("email_pwcode",pwcode);
		
		
		
		}catch (MessagingException e) {e.printStackTrace();
		}
		System.out.println("이메일 전송 완료 !");
		
		
		
		
		return pwcode;
	}
	public String emailsend2(String email, String email1) {
		System.out.println("emailserviceImpl email : "+ email );
		System.out.println("emailserviceImpl email1 : "+ email1 );
		//인증코드 생성
		String pwcode = getCreateKey();
		String Allemail = email+"@"+email1 ;
		//이메일 전송
		jakarta.mail.internet.MimeMessage message = mailSender.createMimeMessage();
		try {
			message.setSubject("[안내] 님 회원가입 이메일 인증코드 발송안내","utf-8");
			String htmlData = "<table align='center' style='margin:0 0 0 40px;border:1px #D9D9D9 solid;'>\r\n"
					+ "					<tr>\r\n"
					+ "						<td style='width:618px;height:220px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#F9F9F9;'>\r\n"
					+ "							<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;'><img src='https://cfm.kt.com/images/v2/layout/gnb-ktlogo.png' alt='비밀번호 찾기를 요청하셨습니다.' /></p>\r\n"
					+ "							<p style='width:620px;margin:10px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1;'>아래의 인증코드는 회원가입에 필요한 인증코드입니다.</p>\r\n"
					+ "							<p style='width:620px;margin:28px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>회원가입 인증코드 : <span style='color:#F7703C;line-height:1;'>dasdw2341</span></strong></p>\r\n"
					+ "							<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>회원가입에 필요한 인증코드를 발송해 드렸습니다. <br/>인증코드를 인증번호입력에 넣고 인증번호확인 버튼을 클릭해 주세요.</p>\r\n"
					+ "						</td>\r\n"
					+ "					</tr>\r\n"
					+ "				</table>";
			message.setText(htmlData,"utf-8","html");							//내용
			message.setFrom(new InternetAddress("gustjrtop123gmail.com"));		//보내는사람
			message.addRecipient(RecipientType.TO,new InternetAddress(Allemail));	//받는사람
			mailSender.send(message); 
			session.setAttribute("email_pwcode",pwcode);
			System.out.println("email3_pwcode pw : "+ pwcode);
			
			
			
		}catch (MessagingException e) {e.printStackTrace();
		}
		System.out.println("이메일 전송 완료 !");
		
		
		
		
		return pwcode;
	}

	
	
	private String getCreateKey() {
		String pwcode = "";
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9',
				'a','b','c','d','e','f','g','h','i','j',
				'k','l','m','n','o','p','q','r','s','t',
				'u','v','w','x','y','z'
		};
		int idx = 0;
		for(int i =0;i<6;i++) {
			idx=(int)(Math.random()*36);
			pwcode += charSet[idx];
		}
		System.out.println("비밀번호 인증코드 : "+pwcode);
		return pwcode;
	}

	//회원가입
	@Override
	public void joinCheck(Cross_userDto crossuserdto) {
		
		joinmembermapper.joinCheck(crossuserdto);
	}

}

