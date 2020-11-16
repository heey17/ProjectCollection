package com.icia.project.controller;

import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.PasswordAuthentication;
import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.User;
import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.icia.project.api.KakaoApi;
import com.icia.project.api.NaverJoinApi;
import com.icia.project.api.NaverLoginApi;
import com.icia.project.api.SendSMSTwilio;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.service.MemberService;
import com.icia.project.service.UserMailSendService;

import oracle.jdbc.driver.Message;

@Controller
public class MemberController {

	@Autowired
	MemberService mSvc;
	
	@Autowired
	HttpSession session;
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	private NaverLoginApi naverLoginApi;
	
	@Autowired
	private NaverJoinApi naverJoinApi;
	
	private String apiResult;
	
	@Autowired
	private UserMailSendService mailsender;
	
	@Autowired
	private SendSMSTwilio phonesender;
	
	// 아이디 중복검사
	@RequestMapping(value="/idoverlap")
	public @ResponseBody String IdOverlap(@RequestParam("userId") String userId) {
		// @ResponseBody : ajax 받아오기 위해서 설정함.
		
		String resultMsg = mSvc.idOverlap(userId);
		
		return resultMsg;
	}
	
	// 전화번호 중복검사
	@RequestMapping(value="/phoneoverlap")
	public @ResponseBody String PhoneOverlap(@RequestParam("userPhone") String userPhone) {
		// @ResponseBody : ajax 받아오기 위해서 설정함.
		
		String resultMsg = mSvc.phoneOverlap(userPhone);
		
		return resultMsg;
	}
	
	// 이메일 중복검사
	@RequestMapping(value="/emailoverlap")
	public @ResponseBody String Emailoverlap(@RequestParam("userEmail") String userEmail) {
		// @ResponseBody : ajax 받아오기 위해서 설정함.
		
		String resultMsg = mSvc.emailoverlap(userEmail);
		
		return resultMsg;
	}
	
	// 비밀번호 확인(수정)
	@RequestMapping(value="/modifyPwCheck", method=RequestMethod.POST)
	public @ResponseBody String ModifyPwCheck(@RequestParam("passConfirm") String passConfirm) {
		// @ResponseBody : ajax 받아오기 위해 설정함.
		
		String resultMsg = mSvc.pwCheck(passConfirm);
		// pwCheck라는 method명을 가진 service로 보내는 이유는 탈퇴와 하는 동작이 같기 때문에
		
		return resultMsg;
	}
	
	// 비밀번호 확인(탈퇴)
	@RequestMapping(value="/deletePwCheck", method=RequestMethod.POST)
	public @ResponseBody String DeletePwCheck(@RequestParam("passConfirm") String passConfirm) {
		// @ResponseBody : ajax 받아오기 위해 설정함.
		
		String resultMsg = mSvc.pwCheck(passConfirm);
		// pwCheck라는 method명을 가진 service로 보내는 이유는 탈퇴와 하는 동작이 같기 때문에
		
		return resultMsg;
	}
	
	// 일반 회원가입
	@RequestMapping(value="/memberJoin")
	public ModelAndView MemberJoin(@ModelAttribute MemberDTO member, HttpServletRequest request) throws IllegalStateException, IOException {
		
		mav = mSvc.memberJoin(member);
		
		session.invalidate();
		// 회원가입 때 전화번호 or 이메일 본인인증에서 set된 session 초기화
		
		return mav;
	}
	
	// 회원가입 시 전화번호 인증번호 발송
	@RequestMapping(value="/phoneNumSender")
	public @ResponseBody String PhoneNumSender(@RequestParam("phone") String phoneNum) {
		
		if(phoneNum != null) {
			int authNum = phonesender.sendSMS(phoneNum);
			// 회원가입 시 입력한 전화번호로 인증번호를 발송
			session.setAttribute("authNum", authNum);
		}
		
		String resultMsg = "OK";
		
		return resultMsg;
	}
	
	// 회원가입 시 이메일 인증번호 발송
	@RequestMapping(value="/emailNumSender")
	public @ResponseBody String EmailNumSender(@RequestParam("email") String userEmail) {
		
		if(userEmail != null) {
			mailsender.joinMailSend(userEmail);
			// 회원가입 시 입력한 이메일로 인증번호를 발송
		}
			
		String resultMsg = "OK";
		
		return resultMsg;
	}
	
	// 회원가입 시 전화번호로 받은 인증번호 일치하는 지 확인
	@RequestMapping(value="phoneNumCheck")
	public @ResponseBody String PhoneNumCheck(@RequestParam("phoneConfirmNum") int phoneConfirmNum) {
		
		String resultMsg = mSvc.phoneNumCheck(phoneConfirmNum);
		
		return resultMsg;
	}
	
	// 회원가입 시 이메일로 받은 인증번호가 일치하는 지 확인
	@RequestMapping(value="emailNumCheck")
	public @ResponseBody String EmailNumCheck(@RequestParam("emailConfirmNum") String emailConfirmNum) {
		
		String resultMsg = mSvc.emailNumCheck(emailConfirmNum);
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 이메일 발송
	@RequestMapping(value="/pwFindEmail")
	public @ResponseBody String PwFindEmail(HttpServletRequest request) throws IllegalStateException, IOException{
		
		String resultMsg = "";
		
		String userEmail = (String) session.getAttribute("userPwFindEmail");
		mailsender.mailSend(userEmail);
		resultMsg = "OK";
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 전화번호 전송
	@RequestMapping(value="/pwFindPhone")
	public @ResponseBody String PwFindPhone(@RequestParam("userPhone") String phoneNum) {
		
		String resultMsg = "";
		
		int authNum = phonesender.sendSMS(phoneNum);
		session.setAttribute("authNum", authNum);
		
		resultMsg = "OK";
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 이메일 인증번호 같은 지 확인
	@RequestMapping(value="/keyConfirmEmail")
	public @ResponseBody String KeyConfirmEmail(@RequestParam("keyConfirm") String keyConfirm) {
		
		String key = (String) session.getAttribute("key");
		
		String resultMsg = mSvc.keyConfirmEmail(key, keyConfirm);
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 전화번호 인증메일 같은 지 확인
	@RequestMapping(value="/keyConfirmPhone")
	public @ResponseBody String KeyConfirmPhone(@RequestParam("keyConfirm") int keyConfirm) {
		
		int key = (int) session.getAttribute("authNum");
		
		String resultMsg = mSvc.keyConfirmPhone(keyConfirm, key);
		
		return resultMsg;
	}
	
	// 일반 로그인
	@RequestMapping(value="/memberLogin")
	public ModelAndView MemberLogin(@ModelAttribute MemberDTO member) {
		
		mav = mSvc.memberLogin(member);
		
		return mav;
	}
	
	// 아이디 찾기
	@RequestMapping(value="/idfindoverlap")
	public @ResponseBody String IdFindOverlap(@RequestParam("userName") String userName, @RequestParam("userEmail") String userEmail) {
		
		String resultMsg = mSvc.idFindOverlap(userName, userEmail);
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 - 이메일
	@RequestMapping(value="/pwfindoverlapemail")
	public @ResponseBody String PwFindOverlapEmail(@RequestParam("userName") String userName, @RequestParam("userId") String userId, @RequestParam("userEmail") String userEmail) throws IllegalStateException, IOException{
		
		String resultMsg = mSvc.pwFindOverlapEmail(userName, userId, userEmail);
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 - 전화번호
	@RequestMapping(value="/pwfindoverlapphone")
	public @ResponseBody String PwFindOverlapPhone(@RequestParam("userName") String userName, @RequestParam("userId") String userId, @RequestParam("userPhone") String userPhone) {
		
		String resultMsg = mSvc.pwFindOverlapPhone(userName, userId, userPhone);
		
		return resultMsg; 
	}
	
	// 네이버 아이디로 회원가입
	@RequestMapping(value="/naverjoin")
	public ModelAndView naverJoin() {
		
		String naverUrl = naverJoinApi.getAuthorizationUrl(session);
		
		mav.addObject("naverurl", naverUrl);
		mav.setViewName("NaverLogin");
		
		return mav;
	}
	
	// 네이버 회원가입 할 때 네이버 로그인 성공 시 callback 호출 메소드
	@RequestMapping(value="/naverjoinok")
	public ModelAndView callbackJoin(@RequestParam("code") String code, @RequestParam("state") String state) throws IOException, ParseException{
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverJoinApi.getAccessToken(session, code, state);
		
		// 로그인 사용자 정보를 가져온다
		apiResult = naverJoinApi.getUserProfile(oauthToken);
		
		mav.addObject("result", apiResult);
		
		// apiResult에 담긴 내용이 JSON이기 때문에 String 변환 작업 수행
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		
		JSONObject member = (JSONObject) obj;
		JSONObject memberInfo = (JSONObject) member.get("response");
		
		// 네이버로 로그인 성공시 가져올 정보들
		String userNaver = (String) memberInfo.get("id");
		String userEmail= (String) memberInfo.get("email");
		String userName= (String) memberInfo.get("name");
		String userGender= (String) memberInfo.get("gender");
		String userBirth= (String) memberInfo.get("birthday");
		
		mav.addObject("naverid", userNaver);
		mav.setViewName("MemberJoinForm");
		
		return mav;
	}
	
	@Autowired
	private KakaoApi kakao;
	
	// 카카오 회원가입 api
	@RequestMapping(value="/join")
	public ModelAndView join(@RequestParam("code") String code) {

		String access_Token = kakao.getAccessTokenJoin(code);
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		
		// 클라이언트의 이메일이 존재 할 때 세션에 해당 이메일과 토큰 등록
		if(userInfo.get("email") != null) {
			
			mav.addObject("kakaoId", userInfo.get("email"));
			mav.setViewName("MemberJoinForm");
			session.setAttribute("access_Token", access_Token);
		}
		
		return mav;
	}
	
	// 네이버 아이디로 로그인(네이버 아이디로 사이트 가입 후 로그인)
	@RequestMapping(value="/naverLogin")
	public ModelAndView naverLogin() {
		
		String naverUrl = naverLoginApi.getAuthorizationUrl(session);
		
		mav.addObject("naverurl", naverUrl);
		mav.setViewName("NaverLogin");
		
		return mav;
	}
	
	// 네이버로 로그인 성공 시 callback 호출 메소드
	@RequestMapping(value = "/naverloginok")
	public ModelAndView callbackLogin(@RequestParam("code")String code, 
			@RequestParam("state") String state) throws IOException, 
			ParseException{
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginApi.getAccessToken(session, code, state);
		
		// 로그인 사용자 정보를 가져온다
		apiResult = naverLoginApi.getUserProfile(oauthToken);
		
		mav.addObject("result", apiResult);
		
		// apiResult에 담긴 내용이 JSON이기 때문에 String 변환 작업 수행
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		
		JSONObject member = (JSONObject) obj;
		JSONObject memberInfo = (JSONObject) member.get("response");
		
		// 네이버로 로그인 성공시 가져올 정보들
		String userNaver = (String) memberInfo.get("id");
		
		mav = mSvc.naverLogin(userNaver);
		
		mav.addObject("userNaver", userNaver);
		
		return mav;
		
	}
	
	// 카카오 로그인 api
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam("code") String code) {
		
		String access_Token = kakao.getAccessTokenLogin(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		
		if(userInfo.get("email") != null) {
			String userKakao = (String) userInfo.get("email");
			mav = mSvc.kakaoLogin(userKakao);
		}
		
		return mav;
	}
	
	// 일반 회원 로그아웃
	@RequestMapping(value="/memberLogout")
	public ModelAndView MemberLogout(@ModelAttribute MemberDTO member) {
		
		session.invalidate();
		mav.setViewName("Index");
		
		return mav;
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/memberDelete", method=RequestMethod.GET)
	public ModelAndView MemberDelete() {

		mav = mSvc.memberDelete();
		
		return mav;
	}
	
	// 회원 수정
	@RequestMapping(value="/memberModify", method=RequestMethod.POST)
	public ModelAndView MemberModify(@ModelAttribute MemberDTO member) throws IllegalStateException, IOException {
		
		mav = mSvc.memberModify(member);
		
		return mav;
	}
	
	// 로그인 확인
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public @ResponseBody String LoginCheck(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw) {
		
		String resultMsg = mSvc.loginCheck(userId, userPw);
		
		return resultMsg;
	}
	
	// 쿠폰함 조회
	@RequestMapping(value="/memberCouponList")
	public ModelAndView MemberCouponList() {
		
		mav = mSvc.memberCouponList();
		
		return mav;
	}
	
	// 리뷰내역 조회
	@RequestMapping(value="/memberReviewList")
	public ModelAndView MemberReviewList() {
		
		mav = mSvc.memberReviewList();
		
		return mav;
	}
	
	// 문의내역 조회
	@RequestMapping(value="/memberAskList")
	public ModelAndView MemberAskList() {
		
		mav = mSvc.memberAskList();
		
		return mav;
	}
	
	// 장바구니 조회
	@RequestMapping(value="/memberBasketList")
	public ModelAndView MemberBasketList() {
		
		mav = mSvc.memberBasketList();
		
		return mav;
	}
	
	// 장바구니 내역 개별 삭제
	@RequestMapping(value="/basketDelete", method=RequestMethod.GET)
	public @ResponseBody String BasketDelete(@RequestParam("goodsNum") int goodsNum) {
		
		String resultMsg = mSvc.basketDelete(goodsNum);
		
		return resultMsg;
	}
	
	// 장바구니 수량 변경
	@RequestMapping(value="/cartCountChange", method=RequestMethod.GET)
	public @ResponseBody String CartStockChange(@RequestParam("basketCount") int basketCount, @RequestParam("goodsNum") int goodsNum) {
		
		String resultMsg = mSvc.cartStockChange(basketCount, goodsNum);
		
		return resultMsg;
	}
	
	// 장바구니 내역 선택 삭제
	@RequestMapping(value="/itemDelete", method=RequestMethod.GET)
	public @ResponseBody String ItemDelete(@RequestParam("result") int goodsNum) {
		
		String resultMsg = mSvc.itemDelete(goodsNum);
		
		return resultMsg;
	}
	
	// 카카오페이 결제(선택)
	@RequestMapping(value="/cardPayment", method=RequestMethod.GET)
	public @ResponseBody String CardPayment(@RequestParam("goodsNum") int goodsNum, @RequestParam("sum") int sum, @RequestParam("stock") int stock) {
		
		String resultMsg = mSvc.cardPayment(goodsNum, sum, stock);
		
		return resultMsg;
	}
	
	// 쿠폰함 갯수
	@RequestMapping(value="/couponCount", method=RequestMethod.POST)
	public @ResponseBody String CouponCount() {
	
		String resultMsg = mSvc.couponCount();
			
		return resultMsg;
	}
	
	// 결제내역 
	@RequestMapping(value="memberPaymentList")
	public ModelAndView MemberPaymentList() {
		
		mav = mSvc.memberPaymentList();
		
		return mav;
	}
	
	// 결제내역 페이징
	@RequestMapping(value="paymentPagingList")
	public ModelAndView PaymentPagingList(@RequestParam(value="hotelPage", required=false, defaultValue="1") int hotelPage,
										  @RequestParam(value="beautyPage", required=false, defaultValue="1") int beautyPage,
										  @RequestParam(value="medicalPage", required=false, defaultValue="1") int medicalPage,
										  @RequestParam(value="goodsPage", required=false, defaultValue="1") int goodsPage) {
		
		if(hotelPage == 0) {
			hotelPage = 1;
		}
		
		if(beautyPage == 0) {
			beautyPage = 1;
		}
		
		if(medicalPage == 0) {
			medicalPage = 1;
		}
		
		if(goodsPage == 0) {
			goodsPage = 1;
		}
		
		mav = mSvc.hotelPaymentPagingList(hotelPage);
		mav = mSvc.beautyPaymentPagingList(beautyPage);
		mav = mSvc.medicalPaymentPagingList(medicalPage);
		mav = mSvc.goodsPaymentPagingList(goodsPage);
		
		return mav;
	}
	
	// 리뷰내역 페이징
	@RequestMapping(value="reviewPagingList")
	public ModelAndView ReviewPagingList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		if(page == 0) {
			page = 1;
		}
		
		mav = mSvc.reviewPagingList(page);
		
		return mav;
	}
	
	// 문의내역 페이징
	@RequestMapping(value="askPagingList")
	public ModelAndView AskPagingList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		if(page == 0) {
			page = 1;
		}
		
		mav = mSvc.askPagingList(page);
		
		return mav;
	}
	
	// 장바구니 페이징
	@RequestMapping(value="basketPagingList")
	public ModelAndView BasketPagingList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		if(page == 0) {
			page = 1;
		}
		
		mav = mSvc.basketPagingList(page);
		
		return mav;
	}
	
	// 새비밀번호로 수정
	@RequestMapping(value="/newPassword", method=RequestMethod.POST)
	public ModelAndView NewPassword(@RequestParam("userPw") String userPw) {
		
		String userId = (String) session.getAttribute("userPwFindId");
		
		mav = mSvc.newPassword(userId, userPw);
		
		session.invalidate();
		// key랑 authNum or key, userPwFindEmail or userPwFindPhone, userPwFindId랑 초기화
		
		return mav;
	}
	
	// 카카오페이 결제
	@RequestMapping(value="/basketGoodsBuy")
	public ModelAndView BasketGoodsBuy(@RequestParam("goodsNum") int goodsNum, @RequestParam("goodsPrice") int goodsPrice, @RequestParam("basketGoodsCount") int basketGoodsCount) {
		
		mav.addObject("goodsNum", goodsNum);
		mav.addObject("goodsPrice", goodsPrice);
		mav.addObject("basketGoodsCount", basketGoodsCount);
		int basketGoodsSum = goodsPrice * basketGoodsCount;
		mav.addObject("basketGoodsSum", basketGoodsSum);

		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		// 쿠폰함 조회
		mav = mSvc.memberCoupon(userId, goodsPrice, basketGoodsCount, goodsNum);
		
		mav.setViewName("BasketGoodsBuy");
		
		return mav;
	}
	
	// 신규 주소 업데이트
	@RequestMapping(value="/addressUpdate", method=RequestMethod.POST)
	public @ResponseBody String AddressUpdate(@RequestParam("postcode") String postcode, @RequestParam("address") String address, @RequestParam("detailAddress") String detailAddress, @RequestParam("extraAddress") String extraAddress) {

		session.removeAttribute("newAddress");
		String resultMsg = mSvc.addressUpdate(postcode, address, detailAddress, extraAddress);
		
		return resultMsg;
	}
	
	// -------------------------- 결제 insert, delete -------------------------------------
	
	// 결제내역 업데이트
	@RequestMapping(value="buyInfoUpdate", method=RequestMethod.GET)
	public @ResponseBody String BuyInfoUpdate(@RequestParam("goodsNum") int goodsNum, @RequestParam("point") int point, @RequestParam("couponCode") int couponCode, @RequestParam("payCheck") int payCheck, @RequestParam("total_pay") int total_pay, @RequestParam("addressCheck") int addressCheck) {
		
		String resultMsg = mSvc.buyInfoUpdate(goodsNum, point, couponCode, payCheck, total_pay, addressCheck);
		
		return resultMsg;
	}
	
	// -------------------------- 장바구니 여러 개 결제 -----------------------------
	
	// 여러 개 선택하여 결제 (장바구니)
	@RequestMapping(value="/itemSum")
	public ModelAndView ItemSum(@RequestParam("arr") String arr, @RequestParam("arrLength") int arrLength, @RequestParam("totalSum") int totalSum, @RequestParam("totalCount") int totalCount) {
		
		// -------------- 상품 정보를 띄우기 위한 설정 --------------
		
		String[] goodsNum;
		int x = 0;
		
		// 상품 번호를 session에 담아서 결제내역에 insert 할 때 사용
		session.setAttribute("arrSession", arr);
		session.setAttribute("arrLengthSession", arrLength);
		
		for(int i=0; i<arrLength; i++) {
			goodsNum = arr.split(",");
			String goodsNum2 = goodsNum[i];
			
			if(goodsNum2.equals("")) { // 배열에 값이 없을 경우(상품 번호)
				
			}else { // 배열에 값이 있을 경우(상품 번호)
				
				String Ainfo = mSvc.itemSum(goodsNum2);
				
				for(int j=x; j<x+1; j++) {
					if(x == 0) { // x가 0이면.
						String goodsInfo0 = Ainfo;
						x = 1;
						mav.addObject("goodsInfo0", goodsInfo0);
						break;
					}else if(x == 1){ // x가 1이면
						String goodsInfo1 = Ainfo;
						mav.addObject("goodsInfo1", goodsInfo1);
						x = 2;
						break;
					}else if(x == 2) { // x가 2이면
						String goodsInfo2 = Ainfo;
						mav.addObject("goodsInfo2", goodsInfo2);
						x = 3;
						break;
					}else if(x == 3) { // x가 3이면
						String goodsInfo3 = Ainfo;
						mav.addObject("goodsInfo3", goodsInfo3);
						x = 4;
						break;
					}else if(x == 4) { // x가 4이면
						String goodsInfo4 = Ainfo;
						mav.addObject("goodsInfo4", goodsInfo4);
						x = 5;
						break;
					}else if(x == 5) { // x가 5이면
						String goodsInfo5 = Ainfo;
						mav.addObject("goodsInfo5", goodsInfo5);
						x = 6;
						break;
					}else if(x == 6) { // x가 6이면
						String goodsInfo6 = Ainfo;
						mav.addObject("goodsInfo6", goodsInfo6);
						x = 7;
						break;
					}else if(x == 7) { // x가 7이면
						String goodsInfo7 = Ainfo;
						mav.addObject("goodsInfo7", goodsInfo7);
						x = 8;
						break;
					}else if(x == 8) { // x가 8이면
						String goodsInfo8 = Ainfo;
						mav.addObject("goodsInfo8", goodsInfo8);
						x = 9;
						break;
					}else if(x == 9) { // x가 9이면
						String goodsInfo9 = Ainfo;
						mav.addObject("goodsInfo9", goodsInfo9);
						x = 10;
						break;
					}
				}
			}
		}
		
		// -------------- 쿠폰함을 불러오기 위한 설정 --------------
		
		mav = mSvc.selectCouponList(totalSum);
		
		mav.addObject("totalSum", totalSum); // 총합계
		mav.addObject("totalCount", totalCount); // 총갯수
		mav.addObject("goodsInfoLength", x); // 상품 정보
		mav.setViewName("SelectBasketGoodsBuy");
		
		return mav;
	}
	
	// 결제내역 update, 장바구니 내역 delete
	@RequestMapping(value="selectBuyInfoUpdate")
	public @ResponseBody String SelectBuyInfoUpdate(@RequestParam("point") int point, @RequestParam("couponCode") int couponCode, @RequestParam("payCheck") int payCheck, @RequestParam("totalpay") int total_pay, @RequestParam("addressCheck") int addressCheck) {
		
		// 상품 코드(선택한 상품) - 배열
		String arr = (String) session.getAttribute("arrSession");
		// 상품 코드 길이(선택한 상품) - 배열
		int arrLength = (int) session.getAttribute("arrLengthSession");
		// 상품 코드(개별)
		String[] goodsNum;
		// resultMsg
		String resultMsg = null;
		
		for(int i=0; i<arrLength; i++) {
			goodsNum = arr.split(",");
			String goodsNum3 = goodsNum[i];
			
			if(goodsNum3.equals("")) {
			
			}else {
				int goodsNum2 = Integer.parseInt(goodsNum3);
		
				resultMsg = mSvc.selectBuyInfoUpdate(goodsNum2, addressCheck, point, total_pay, payCheck, couponCode);
			}
		}
		
		return resultMsg;
	}
	
	// -------------------------- 리뷰 작성 했는 지 확인 -------------------------------------
	
	// 호텔 리뷰 
	@RequestMapping(value="hotelReviewCheck")
	public @ResponseBody String HotelReviewCheck(@RequestParam("hotelReserveNum") int hotelReserveNum) {
		
		String resultMsg = mSvc.hotelReviewCheck(hotelReserveNum);
		
		return resultMsg;
	}
	
	// 병원 리뷰 
	@RequestMapping(value="medicalReviewCheck")
	public @ResponseBody String MedicalReviewCheck(@RequestParam("medicalReserveNum") int medicalReserveNum) {
		
		String resultMsg = mSvc.medicalReviewCheck(medicalReserveNum);
		
		return resultMsg;
	}
	
	// 미용 리뷰 
	@RequestMapping(value="beautyReviewCheck")
	public @ResponseBody String BeautyReviewCheck(@RequestParam("beautyReserveNum") int beautyReserveNum) {
		
		String resultMsg = mSvc.beautyReviewCheck(beautyReserveNum);
		
		return resultMsg;
	}
	
	// 용품 리뷰 
	@RequestMapping(value="goodsReviewCheck")
	public @ResponseBody String GoodsReviewCheck(@RequestParam("goodsBuyNum") int goodsBuyNum) {
		
		String resultMsg = mSvc.goodsReviewCheck(goodsBuyNum);
		
		return resultMsg;
	}
}
