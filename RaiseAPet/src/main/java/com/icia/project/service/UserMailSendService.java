package com.icia.project.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	

	
	@Autowired
	HttpSession session;
		
	// 이메일 난수 만드는 메서드
	private String init() {
		
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			}else {
				continue;
			}
		} while(sb.length() < size);
		if(lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 시 인증번호 이메일 발송
	public void joinMailSend(String userEmail) {
			
		String key = getKey(false, 5);
		// 인증번호 길이 조정 하는 곳
		
		session.setAttribute("key", key);
		// 인증번호 발송하고 ajax로 인증번호가 같은 지 확인하기 위해서 key(난수)를 session에 담음.
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 :p 레어펫(Raise A Pet) 입니다!</h2><br><br>" +
					"<p>인증번호 확인 후 회원가입 하실 수 있습니다.</p><br>" + "<p>인증번호는 "
					+ key +"입니다</p>";
			
			try {
				mail.setSubject("[본인인증] 레어펫(Raise A Pet) :p 회원가입 인증번호 메일 입니다.", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
				mailSender.send(mail);
			} catch (MessagingException  e) {
				e.printStackTrace();
			}
		
	}
	
	// 비밀번호 찾기 이메일 발송
	public void mailSend(String userEmail) {
			
		String key = getKey(false, 5);
		// 인증번호 길이 조정 하는 곳
		
		session.setAttribute("key", key);
		// 인증번호 발송하고 ajax로 인증번호가 같은 지 확인하기 위해서 key(난수)를 session에 담음.
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 :p 레어펫(Raise A Pet) 입니다!</h2><br><br>" +
					"<p>인증번호를 입력 하시면 비밀번호를 수정 하실 수 있습니다</p><br>" + "<p>인증번호는 "
					+ key +"입니다</p>";
			
			try {
				mail.setSubject("[본인인증] 레어펫(Raise A Pet) :p 비밀번호 찾기 인증번호 메일 입니다.", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
				mailSender.send(mail);
			} catch (MessagingException  e) {
				e.printStackTrace();
			}
		
	}

}
