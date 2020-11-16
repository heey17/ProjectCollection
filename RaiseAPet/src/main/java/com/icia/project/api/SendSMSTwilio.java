package com.icia.project.api;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SendSMSTwilio {
	
	  // Find your Account Sid and Token at twilio.com/user/account
	  public static final String ACCOUNT_SID = "AC8237185a0bb879943187536f7ccd2f7b";
	  public static final String AUTH_TOKEN = "739a997d5904f7375d99ed75840dfceb";
	  
	  // SMS 전송
	  public static int sendSMS (String phoneNum) {
		  
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    
	    // 휴대폰 인증번호 생성
	    int authNum = randomRange(100000, 999999);
	    
	    
	    // 전송대상 휴대폰 번호
	    String sendTarget = "+"+ "82" + phoneNum;
	    // 평가판이라서 하나의 번호로만 보낼 수 있음.
	    
	    // 전송 메세지
	    String authMsg = "레어펫(Raise A Pet) 인증번호는 [" + authNum + "]입니다." ;
	    
	    Message message = Message.creator(
	    	// to
	    	new PhoneNumber(sendTarget),
	        // from
	    	new PhoneNumber("+12057515551"), 
	        // message
	    	authMsg).create();
	    
		return authNum;
		
	  }
	    
	  // 인증번호 범위 지정
	  public static int randomRange(int n1, int n2) {
	    return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	  }
	  
	  
	}