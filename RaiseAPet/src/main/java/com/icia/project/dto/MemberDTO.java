package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
		
	private String userId; // 회원 아이디
	private String userPw; // 회원 비밀번호
	private String userName; // 회원 이름
	private MultipartFile userImageFile; // 회원 프로필 파일
	private String userImage; // 회원 프로필 파일 이름
	private String userBirth; // 회원 생년월일
	private String userAddress; // 회원 주소
	private String postcode; // 우편번호
	private String address; // 주소
	private String detailAddress; // 상세주소
	private String extraAddress; //참고사항
	private String userGender; // 회원 성별
	private String userEmail; // 회원 이메일
	private String userPhone; // 회원 전화번호
	private String userLock; // 회원 정지 유무
	private int userLockCount; // 회원 정지 횟수
	private int userPoint; // 회원 포인트
	private String naverId, kakaoId;
	private String key;
}