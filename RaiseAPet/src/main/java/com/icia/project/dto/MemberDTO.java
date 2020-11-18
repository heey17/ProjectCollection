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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public MultipartFile getUserImageFile() {
		return userImageFile;
	}
	public void setUserImageFile(MultipartFile userImageFile) {
		this.userImageFile = userImageFile;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserLock() {
		return userLock;
	}
	public void setUserLock(String userLock) {
		this.userLock = userLock;
	}
	public int getUserLockCount() {
		return userLockCount;
	}
	public void setUserLockCount(int userLockCount) {
		this.userLockCount = userLockCount;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getNaverId() {
		return naverId;
	}
	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
}