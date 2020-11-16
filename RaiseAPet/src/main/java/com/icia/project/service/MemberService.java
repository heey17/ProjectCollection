package com.icia.project.service;

 import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Spliterator;
import java.util.Spliterators;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Splitter;
import com.icia.project.dao.MemberDAO;
import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;
import com.icia.project.dto.ReviewDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO mDAO;
	
	@Autowired
	HttpSession session;
	
	ModelAndView mav = new ModelAndView();
	
	MemberDTO memberDTO = new MemberDTO();
	
	CouponDTO couponDTO = new CouponDTO();
	
	ReviewDTO reviewDTO = new ReviewDTO();
	
	GoodsDTO goodsDTO = new GoodsDTO();
	
	BeautyDTO beautyDTO = new BeautyDTO();
	
	MedicalDTO medicalDTO = new MedicalDTO();
	
	HotelDTO hotelDTO = new HotelDTO();
	
	SimpleDateFormat date = new SimpleDateFormat("yyMMdd_hhmmss");
	Date time = new Date();
	
	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	// 아이디 중복 검사
	public String idOverlap(String userId) {
		
		String idCheck = mDAO.idOverlap(userId);
		String resultMsg = null;
		
		if(idCheck==null) {
			resultMsg = "OK";
		} else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 전화번호 중복 검사
	public String phoneOverlap(String userPhone) {
		
		String phoneCheck = mDAO.phoneOverlap(userPhone);
		String resultMsg1 = null;
		
		if(phoneCheck==null) {
			resultMsg1 = "OK";
		} else {
			resultMsg1 = "NO";
		}
		
		return resultMsg1;
	}
	
	// 이메일 중복 검사
	public String emailoverlap(String userEmail) {
		
		String emailCheck = mDAO.emailOverlap(userEmail);
		String resultMsg1 = null;
		
		if(emailCheck==null) {
			resultMsg1 = "OK";
		} else {
			resultMsg1 = "NO";
		}
		
		return resultMsg1;
	}

	// 비밀번호 확인(수정, 탈퇴)
	public String pwCheck(String passConfirm) {
		
		// session에 저장된 값을 가져와서 MemberDTO에 저장한다.
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		// 저장된 MemberDTO에서 userId를 가져와서 String 타입으로 저장한다.
		String userId = member.getUserId();
		
		// db에 있는 password 값
		String password = mDAO.pwCheck(userId);
		String resultMsg = null;
		
		if(password != null) {
			boolean result = pwEncoder.matches(passConfirm, password);
			
			if(result == true) {
				resultMsg="OK";
			}else {
				resultMsg="NO";
			}
		}
		
		return resultMsg;
	}
	
	// 회원가입
	public ModelAndView memberJoin(MemberDTO member) throws IllegalStateException, IOException {
		
		// [프로필]
		// 파일 받을 때 
		MultipartFile ImageFile = member.getUserImageFile(); 
		String ImageFileName =  date.format(time) + "ㅡ" + ImageFile.getOriginalFilename();
		  
		// 저장 할 공간 
		// webapp -> resources -> fileUpload folder를 만들고 -> show in 해서 파일 주소를 복사 해온다. 
		String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/memberFile/" + ImageFileName;
		 
		// 기본 이미지 설정
		if(!ImageFile.isEmpty()) { // 이미지가 있다면 
			ImageFile.transferTo(new File(savePath)); // file을 io로 import 한다.
			member.setUserImage(ImageFileName);
		} else { // ImageFile.Empty(), 이미지가 없다면
			member.setUserImage("기본 이미지.jpeg");
			// MemberDTO의 userImage 필드에 "기본 이미지.jpeg"를 set 한다.
		}
		
		// [주소]
		if(!member.getPostcode().equals("")) {
			String userAddress = member.getPostcode() + " " + member.getAddress() + " " + member.getDetailAddress() + " " + member.getExtraAddress();
			member.setUserAddress(userAddress);
		}else {
			String userAddress = "정보 없음";
			member.setUserAddress(userAddress);
		}
		
		// [비밀번호 암호화]
		String password = member.getUserPw(); // 입력한 비밀번호
		
		String encodePassword = pwEncoder.encode(password); // 암호화 비밀번호
		member.setUserPw(encodePassword); // 암호화 비밀번호 memberDTO에 set
		
		int joinResult = mDAO.memberJoin(member);
		
		if(joinResult > 0) {
			if(pwEncoder.matches(password, member.getUserPw())) {
				mav.setViewName("MemberLoginForm");
			}else {
				mav.setViewName("Index");
			}
		}
		
		return mav;
	}
	
	// 로그인
	public ModelAndView memberLogin(MemberDTO member) {
		
		// 암호화 된 비밀번호를 userId를 통해 db에서 가져오기
		String password = mDAO.loginPassword(member.getUserId());
		
		String password2 = member.getUserPw();
		
		// 받아온 password 값을 matches를 이용해 입력된 password와 비교
		// 둘이 같으면 true, 다르면 false
		boolean result = pwEncoder.matches(password2, password);	
		
		// 입력된 값과 password가 같을 경우
		if(result==true) {
			member.setUserPw(password);
			// 비교를 해서 true 값이 넘어오면 db에서 가져온 암호화 된 비밀번호를 MemberDTO에 set 한다.
			// set한 비밀번호를 sql에서 조건으로 줘서 id를 가져온다.
			MemberDTO loginResult = mDAO.memberLogin(member);
			
			if(loginResult != null) {
				if(loginResult.getUserId().equals("admin")) {
					session.setAttribute("loginUser", loginResult);
					mav.setViewName("AdminDashboard");
				}else {
					session.setAttribute("loginUser", loginResult);
					mav.setViewName("Index");
				}
			}else {
				mav.setViewName("MemberLoginForm");
			}
		}
		return mav;
	}

	// 아이디 찾기
	public String idFindOverlap(String userName, String userEmail) {
		
		String resultMsg = "";
		
		Map<String, String> userIdFind = new HashMap<String, String>();
		userIdFind.put("userNameKey", userName);
		userIdFind.put("userEmailKey", userEmail);
		// HashMap에 회원 이름과 회원 이메일을 넣고 dao로 넘긴다
		
		String userIdFindResult = mDAO.userIdFind(userIdFind);
		
		if(userIdFindResult != null) {
			session.setAttribute("userIdFindResult", userIdFindResult);
			resultMsg = "OK";
		}else { // userIdFindResult == null
			resultMsg = "NO";
		}
		
		return resultMsg;
	}

	// 비밀번호 찾기 - 이메일
	public String pwFindOverlapEmail(String userName, String userId, String userEmail) {
	
		String resultMsg = "";
		
		Map<String, String> userPwFind = new HashMap<String, String>();
		
		userPwFind.put("userIdKey", userId);
		userPwFind.put("userNameKey", userName);
		userPwFind.put("userEmailKey", userEmail);
		
		String userEmailResult = mDAO.userPwFindEmail(userPwFind);
		
		if(userEmailResult != null) {
			session.setAttribute("userPwFindEmail", userEmailResult);
			session.setAttribute("userPwFindId", userId); // 회원 비밀번호 수정 되는 곳에서 userId를 가져가야 update 할 수 있어서 설정
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}

	// 비밀번호 찾기 - 핸드폰
	public String pwFindOverlapPhone(String userName, String userId, String userPhone) {
		
		String resultMsg = "";
		
		Map<String, String> userPwFind = new HashMap<String, String>();
		
		userPwFind.put("userIdKey", userId);
		userPwFind.put("userNameKey", userName);
		userPwFind.put("userPhoneKey", userPhone);
		
		String userPhoneResult = mDAO.userPwFindPhone(userPwFind);
		
		if(userPhoneResult != null) {
			session.setAttribute("userPwFindPhone", userPhoneResult);
			session.setAttribute("userPwFindId", userId); // 회원 비밀번호 수정 되는 곳에서 userId를 가져가야 update 할 수 있어서 설정
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}

	// 회원가입 시 전화번호로 발송한 인증번호가 같은 지 확인하는 곳
	public String phoneNumCheck(int phoneConfirmNum) {
		
		int phoneConfirm = (int) session. getAttribute("authNum");
		// 전화번호로 인증번호 보낼 때 생성된 인증번호

		String resultMsg = "";
		
		if(phoneConfirmNum == phoneConfirm) { // 인증번호가 일치하면
			resultMsg = "OK";
		}else { // 인증번호가 일치하지 않는다면
			resultMsg = "NO";
		}
		
		return resultMsg;
	}

	// 회원가입 시 이메일로 발송한 인증번호가 같은 지 확인하는 곳
	public String emailNumCheck(String emailConfirmNum) {
		
		String emailConfirm = (String) session.getAttribute("key");
		// 이메일로 인증번호 보낼 때 생성된 인증번호
		
		String resultMsg = "";
		
		if(emailConfirm.equals(emailConfirmNum)) { // 인증번호가 일치하면
			resultMsg = "OK";
		}else { // 인증번호가 일치하지 않는다면
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 이메일 인증번호 같은 지 확인
	public String keyConfirmEmail(String key, String keyConfirm) {
		
		String resultMsg = "";
		
		if(key.equals(keyConfirm)) { // key와 keyConfirm이 같다면
			resultMsg = "OK";
		}else { // key != keyConfirm : key와 keyConfirm이 다르다면
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 비밀번호 찾기 전화번호 인증번호 같은 지 확인
	public String keyConfirmPhone(int keyConfirm, int key) {
		
		String resultMsg = "";
		
		if(keyConfirm == key) {
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 새비밀번호로 수정
	public ModelAndView newPassword(String userId, String userPw) {
		
		// 새로 입력한 비밀번호를 암호화 시킨다.
		// 입력한 비밀번호 : userPw
		String encodePassword = pwEncoder.encode(userPw); // 암호화 비밀번호
		
		// HashMap 써서 조건에 쓸 userId와 update value에 쓸 userPw를 담는다.
		Map <String, String> passwordMap = new HashMap<String, String>();
		passwordMap.put("userIdKey", userId);
		passwordMap.put("userPwKey", encodePassword);
		// 암호화 시킨 비밀번호를 userPwKey에 넣는다.
		
		int newPasswordResult = mDAO.newPassword(passwordMap);
		
		session.removeAttribute("userPwFindPhone");
		session.removeAttribute("userPwFindEmail");
		session.removeAttribute("userPwFindId");
		
		if(newPasswordResult > 0) {
			mav.setViewName("MemberLoginForm");
		}else {
			mav.setViewName("Index");
		}
		
		return mav;
	}
	
	// 네이버로 로그인
	public ModelAndView naverLogin(String userNaver) {
		
		MemberDTO member = mDAO.naverLogin(userNaver);
		
		mav.addObject("member", member);
		mav.setViewName("Index");
		
		session.setAttribute("loginUser", member);
		// 네이버로 로그인 했을 때 select 해온 값을 loginUser session에 넣어서 일반 회원과 연동 되도록 한다.
		
		return mav;
	}
	
	// 카카오로 로그인
	public ModelAndView kakaoLogin(String userKakao) {
		
		MemberDTO member = mDAO.kakaoLogin(userKakao);
		
		mav.addObject("member", member);
		session.setAttribute("loginUser", member);
		mav.setViewName("Index");
		
		return mav;
	}
	
	// 회원 탈퇴
	public ModelAndView memberDelete() {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int deleteResult = mDAO.memberDelete(userId);
		
		if(deleteResult > 0) {
			// 탈퇴를 하면 session도 같이 초기화 시켜줘야 Index.jsp로 갔을 때 로그인, 회원가입이 뜬다.
			session.invalidate();
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("Fail");
		}
		
		return mav;
	}
	
	// 회원 수정
	public ModelAndView memberModify(MemberDTO member) throws IllegalStateException, IOException {
		
		// [프로필]
		// 파일 받을 때 
		MultipartFile ImageFile = member.getUserImageFile(); 
		
		if(!ImageFile.isEmpty()) { // 이미지가 있다면 
			String ImageFileName =  date.format(time) + "ㅡ" + ImageFile.getOriginalFilename();
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/memberFile/" + ImageFileName;
			ImageFile.transferTo(new File(savePath)); // file을 io로 import 한다.
			member.setUserImage(ImageFileName);
		}else { // 이미지가 없다면
			// MemberDTO에 loginUser라는 이름의 변수에 session을 넣어서
			// session에 있는 값을 member에 넣으면 수정이 된다.
			MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
			member.setUserImage(loginUser.getUserImage());
		}
		
		// [주소]
		if(!member.getPostcode().equals("")) {
			String userAddress1 = member.getPostcode() + " " + member.getAddress() + " " + member.getDetailAddress() + " " + member.getExtraAddress();
			member.setUserAddress(userAddress1);
		}else {
			member.setUserAddress(member.getUserAddress());
		}
		
		// [성별]
		String userGender = member.getUserGender();
		
		if(userGender == null) {
			MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
			member.setUserGender(loginUser.getUserGender());
		}
		
		int modifyResult = mDAO.memberModify(member);
		
		String userId = member.getUserId();
		
		// 수정된 내용을 session에 저장
		if(modifyResult > 0) {
			MemberDTO selectResult = mDAO.selectMember(userId);
			
			if(selectResult != null) {
				session.setAttribute("loginUser", selectResult);
				mav.setViewName("MemberMyPage");
			}
		}else {
			mav.setViewName("Fail");
		}
		
		return mav;
	}
	
	// 로그인 확인
	public String loginCheck(String userId, String userPw) {
		
		String resultMsg = null;
		
		// HashMap의 key 이름을 설정한다.
		String userIdKey = "userIdKey";
		String userPwKey = "userPwKey";
		
		// 1. HashMap 객체 생성
		Map<String, String> loginCheck = new HashMap<String, String>();
		
		// 2. loginCheck에 .put을 사용하여서 입력한 값을 저장
		// 
		loginCheck.put("userIdKey", userId);
		loginCheck.put("userPwKey", userPw);
		
		// 3. 암호화된 비밀번호를 db에서 가져오기
		String confirmPw = mDAO.pwCheck(userId);
		
		// 4. boolean 타입을 이용하여 비교한 값을 confirm 변수명에 넣는다.
		
		if(confirmPw != null) { // db에서 가져온 암호화된 비밀번호가 != null이라면
			boolean confirm = pwEncoder.matches(userPw, confirmPw); // 비교를 해서
								// matches의 순서가 중요한 거 같음 (앞 : 입력한 값, 뒤 : 암호화 된 값)
			
			if(confirm == true) { // 둘이 같다면
				String loginCheckResult = mDAO.loginCheck(loginCheck);
				resultMsg = "OK";	
			}else { // 둘이 같지 않다면(아이디는 알지만 비밀번호가 틀린 경우
				resultMsg = "NO";
			}
		}else { // null이라면, db에서 가져온 암호화된 비밀번호가 없다면 (로그인이 안된다는 얘기)
			resultMsg = "NO";
		}
		return resultMsg;
	}
	
	// 쿠폰함 조회
	public ModelAndView memberCouponList() {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		List<CouponDTO> memberCouponListResult = mDAO.memberCouponList(userId);
		
		mav.addObject("memberCouponList", memberCouponListResult);
		mav.setViewName("MemberCouponList");
		
		return mav;
	}
	
	// 리뷰내역 조회
	public ModelAndView memberReviewList() {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		List<ReviewDTO> memberReviewListResult = mDAO.memberReviewList(userId);
		
		mav.setViewName("redirect:/reviewPagingList");
		
		return mav;
	}
	
	// 문의내역 조회
	public ModelAndView memberAskList() {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		List<GoodsDTO> memberAskListResult = mDAO.memberAskList(userId);
		
		mav.setViewName("redirect:/askPagingList");
		
		return mav;
	}
	
	// 장바구니 조회
	public ModelAndView memberBasketList() {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		List<GoodsDTO> memberBasketListResult = mDAO.memberBasketList(userId);
		
		mav.setViewName("redirect:/basketPagingList");
		
		return mav;
	}
	
	// 장바구니 내역 개별 삭제
	public String basketDelete(int goodsNum) {
		
		String resultMsg = null;
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		Map<String, Object> basketDelete = new HashMap<String, Object>();
		
		basketDelete.put("userIdKey", userId);
		basketDelete.put("goodsNumKey", goodsNum);
		
		int basketDeleteResult = mDAO.basketDelete(basketDelete);
		
		if(basketDeleteResult > 0) {
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 장바구니 수량 변경
	public String cartStockChange(int basketCount, int goodsNum) {
		
		String resultMsg = null;
		
		// 수량을 변경해서 장바구니 내역을 다시 조회 할 수 있도록
		Map<String, Object> basketInfo = new HashMap<String, Object>();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		basketInfo.put("userIdKey", member.getUserId());
		basketInfo.put("goodsNumKey", goodsNum);
		basketInfo.put("basketCountKey", basketCount);
		
		int basketCountResult = mDAO.basketCount1(basketInfo);
		
		if(basketCountResult > 0) {
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 장바구니 내역 선택 삭제
	public String itemDelete(int goodsNum) {
		
		String resultMsg = null;
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		
		Map<String, Object> itemDeleteMap = new HashMap<String, Object>();
		itemDeleteMap.put("userIdKey", member.getUserId());
		itemDeleteMap.put("goodsNumKey", goodsNum);
		
		int basketDeleteResult = mDAO.basketDelete(itemDeleteMap);
		
		if(basketDeleteResult > 0) {
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 쿠폰함 갯수
	public String couponCount() {
		
		String resultMsg = null;
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int couponCountResult = mDAO.couponCount(userId);
		
		if(couponCountResult >= 0) {
			session.setAttribute("couponCount", couponCountResult);
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 결제내역 조회
	public ModelAndView memberPaymentList() {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		// 미용
		List<BeautyDTO> beautyPaymentListResult = mDAO.beautyPaymentList(userId);
		// 호텔
		List<HotelDTO> hotelPaymentListResult = mDAO.hotelPaymentList(userId);
		// 병원
		List<MedicalDTO> medicalPaymentListResult = mDAO.medicalPaymentList(userId);
		// 용품
		List<GoodsDTO> goodsPaymentListResult = mDAO.goodsPaymentList(userId);
		
		mav.addObject("beautyPaymentList", beautyPaymentListResult);
		mav.addObject("hotelPaymentList", hotelPaymentListResult);
		mav.addObject("medicalPaymentList", medicalPaymentListResult);
		mav.addObject("goodsPaymentList", goodsPaymentListResult);
		
		mav.setViewName("redirect:/paymentPagingList");
		
		return mav;
	}
	
	private static final int PAGE_LIMIT = 5; // 한 페이지에 보여 줄 게시물 갯수
	private static final int BLOCK_LIMIT = 5; // 화면에 보여 줄 페이지 번호 갯수
	
	// 결제내역 - 호텔 페이징
	public ModelAndView hotelPaymentPagingList(int hotelPage) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.hotelPaymentListCount(userId);
		
		int startRow = (hotelPage-1) * PAGE_LIMIT + 1;
		int endRow = hotelPage * PAGE_LIMIT;
		
		paging.setPage(hotelPage);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)hotelPage/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> hotelPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		hotelPagingResult.put("userIdKey", userId);
		hotelPagingResult.put("startRowKey", paging.getStartRow());
		hotelPagingResult.put("endRowKey", paging.getEndRow());
		
		List<HotelDTO> hotelPagingList = mDAO.hotelPagingList(hotelPagingResult);
		
		mav.addObject("hotelPagingList", hotelPagingList);
		mav.addObject("hotelPaging", paging);
		mav.setViewName("MemberPaymentList");
		
		return mav;
	}
	
	// 결제내역 - 미용 페이징
	public ModelAndView beautyPaymentPagingList(int beautyPage) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.beautyPaymentListCount(userId);
		
		int startRow = (beautyPage-1) * PAGE_LIMIT + 1;
		int endRow = beautyPage * PAGE_LIMIT;
		
		paging.setPage(beautyPage);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)beautyPage/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> beautyPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		beautyPagingResult.put("userIdKey", userId);
		beautyPagingResult.put("startRowKey", paging.getStartRow());
		beautyPagingResult.put("endRowKey", paging.getEndRow());
		
		List<HotelDTO> beautyPagingList = mDAO.beautyPagingList(beautyPagingResult);
		
		mav.addObject("beautyPagingList", beautyPagingList);
		mav.addObject("beautyPaging", paging);
		mav.setViewName("MemberPaymentList");
		
		return mav;
	}
	
	// 결제내역 - 병원 페이징
	public ModelAndView medicalPaymentPagingList(int medicalPage) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.medicalPaymentListCount(userId);
		
		int startRow = (medicalPage-1) * PAGE_LIMIT + 1;
		int endRow = medicalPage * PAGE_LIMIT;
		
		paging.setPage(medicalPage);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)medicalPage/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> medicalPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		medicalPagingResult.put("userIdKey", userId);
		medicalPagingResult.put("startRowKey", paging.getStartRow());
		medicalPagingResult.put("endRowKey", paging.getEndRow());
		
		List<MedicalDTO> medicalPagingList = mDAO.medicalPagingList(medicalPagingResult);
		
		mav.addObject("medicalPagingList", medicalPagingList);
		mav.addObject("medicalPaging", paging);
		mav.setViewName("MemberPaymentList");
		
		return mav;
	}
	
	// 결제내역 - 용품 페이징
	public ModelAndView goodsPaymentPagingList(int goodsPage) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.goodsPaymentListCount(userId);
		
		int startRow = (goodsPage-1) * PAGE_LIMIT + 1;
		int endRow = goodsPage * PAGE_LIMIT;
		
		paging.setPage(goodsPage);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)goodsPage/BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> goodsPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		goodsPagingResult.put("userIdKey", userId);
		goodsPagingResult.put("startRowKey", paging.getStartRow());
		goodsPagingResult.put("endRowKey", paging.getEndRow());
		
		List<GoodsDTO> goodsPagingList = mDAO.goodsPagingList(goodsPagingResult);
		
		mav.addObject("goodsPagingList", goodsPagingList);
		mav.addObject("goodsPaging", paging);
		mav.setViewName("MemberPaymentList");
		
		return mav;
	}
	
	private static final int PAGE_LIMIT1 = 10; // 한 페이지에 보여 줄 게시물 갯수
	private static final int BLOCK_LIMIT1 = 10; // 화면에 보여 줄 페이지 번호 갯수
	
	// 리뷰내역 페이징
	public ModelAndView reviewPagingList(int page) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.reviewListCount(userId);
		
		int startRow = (page-1) * PAGE_LIMIT1 + 1;
		int endRow = page * PAGE_LIMIT1;
		
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT1));
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT1)))-1) * BLOCK_LIMIT1 + 1;
		int endPage = startPage + BLOCK_LIMIT1 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> reviewPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		reviewPagingResult.put("userIdKey", userId);
		reviewPagingResult.put("startRowKey", paging.getStartRow());
		reviewPagingResult.put("endRowKey", paging.getEndRow());
		
		List<ReviewDTO> reviewPagingList = mDAO.reviewPagingList(reviewPagingResult);
		
		mav.addObject("reviewPagingList", reviewPagingList);
		mav.addObject("paging", paging);
		mav.setViewName("MemberReviewList");
		
		return mav;
	}
	
	// 문의내역 페이징
	public ModelAndView askPagingList(int page) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.askListCount(userId);
		
		int startRow = (page-1) * PAGE_LIMIT1 + 1;
		int endRow = page * PAGE_LIMIT1;
		
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT1));
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT1)))-1) * BLOCK_LIMIT1 + 1;
		int endPage = startPage + BLOCK_LIMIT1 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> askPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		askPagingResult.put("userIdKey", userId);
		askPagingResult.put("startRowKey", paging.getStartRow());
		askPagingResult.put("endRowKey", paging.getEndRow());
		
		List<GoodsDTO> askPagingList = mDAO.askPagingList(askPagingResult);
		
		mav.addObject("askPagingList", askPagingList);
		mav.addObject("paging", paging);
		mav.setViewName("MemberAskList");
		
		return mav;
	}
	
	// 장바구니 페이징
	public ModelAndView basketPagingList(int page) {
		
		PageDTO paging = new PageDTO();
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		int listCount = mDAO.basketListCount(userId);
		
		int startRow = (page-1) * PAGE_LIMIT1 + 1;
		int endRow = page * PAGE_LIMIT1;
		
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		int maxPage = (int)(Math.ceil((double)listCount/PAGE_LIMIT1));
		int startPage = (((int)(Math.ceil((double)page/BLOCK_LIMIT1)))-1) * BLOCK_LIMIT1 + 1;
		int endPage = startPage + BLOCK_LIMIT1 - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		
		Map<Object, Object> basketPagingResult = new HashMap<Object, Object>();
		
		String userIdKey = "userIdKey";
		String startRowKey = "startRowKey";
		String endRowKey = "endRowKey";
		
		basketPagingResult.put("userIdKey", userId);
		basketPagingResult.put("startRowKey", paging.getStartRow());
		basketPagingResult.put("endRowKey", paging.getEndRow());
		
		List<GoodsDTO> basketPagingList = mDAO.basketPagingList(basketPagingResult);
		
		mav.addObject("basketPagingList", basketPagingList);
		mav.addObject("paging", paging);
		mav.setViewName("MemberBasketList");
		
		return mav;
	}
	
	// 카카오페이 결제(선택)
	public String cardPayment(int goodsNum, int sum, int stock) {
		
		String resultMsg = null;
		
		Map<String, Object> cardPaymentMap = new HashMap<String, Object>();
		
		String userId = (String) session.getAttribute("loginUser.userId");
		
		cardPaymentMap.put("userIdKey", userId); // 회원 아이디
		cardPaymentMap.put("goodsNumKey", goodsNum); // 상품 번호
		cardPaymentMap.put("sumKey", sum); // 상품 합계 금액
		cardPaymentMap.put("stockKey", stock); // 갯수
		
		int paymentResult = mDAO.cardPaymentUpdate(cardPaymentMap);
		// 결제내역을 update 하기 위한 method
		
		return null;
	}

	// 신규 주소 업데이트
	public String addressUpdate(String postcode, String address, String detailAddress, String extraAddress) {
		
		String resultMsg = null;
		
		if(address!=null) {
			session.setAttribute("newAddress", address);
			// 업데이트 누르면 session에 저장되고 결제 후에는 session 삭제됨
			resultMsg = address;
		}else {
			resultMsg = null;
		}
		
		return resultMsg;
	}
	
	// -------------------------- 결제 insert, delete -------------------------------------

	// 결제내역 업데이트
	public String buyInfoUpdate(int goodsNum, int point, int couponCode, int payCheck, int total_pay, int addressCheck) {
			
		// -------------- 상품 정보를 띄우기 위한 설정 --------------
		
		// [회원 정보 불러오기]
		
		String resultMsg = null;
		String userAddress = null;
		String userId = null;
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		
		String address = (String) session.getAttribute("newAddress");
		// 신규 주소지를 업데이트 했을 경우 session에 담아서 가져옴.
		
		if(addressCheck == 0) { // 기존 배송지
			userAddress = member.getUserAddress(); // 신규 주소지가 없으면 기존 주소지를 가져오고
		}else { // 1 : 신규 배송지
			userAddress = address; // 신규 주소지가 있으면 신규 주소지로 가져간다.
		}
		
		userId = member.getUserId();
		// 조건에 설정하기 위해서 userId를 가져옴.
		
		// [상품 정보 불러오기]
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userIdKey", userId);
		map.put("goodsNumKey", goodsNum);
		map.put("addressKey", userAddress);
		
		GoodsDTO goodsInfo = mDAO.goodsInfo(map);
		
		// 상품 번호 : goodsNum
		// 상품 사진
		String goodsImage = goodsInfo.getGoodsImage1();
		// 상품 종류
		String goodsKind = goodsInfo.getKind();
		// 상품 이름
		String goodsName = goodsInfo.getGoodsName();
		// 상품 가격
		int goodsPrice = goodsInfo.getGoodsPrice();
		
		map.put("goodsImageKey", goodsImage);
		map.put("goodsKindKey", goodsKind);
		map.put("goodsNameKey", goodsName);
		
		// [장바구니 갯수 불러오기]
		GoodsDTO basketInfo = mDAO.basketInfo(map);
		// 상품 갯수
		int basketGoodsCount = basketInfo.getBasketGoodsCount();
		// 상품 갯수 * 상품 가격 = 합계 금액
		int basketPrice = total_pay;
		
		map.put("basketGoodsCountKey", basketGoodsCount);
		map.put("basketPriceKey", basketPrice);

		// [차감된 포인트 update]
		
		if(point == 0) {
			point = 0;
			map.put("userPointKey", point);
			int userPoint = mDAO.pointUpdate(map);
		}else {
			map.put("userPointKey", point);
			int userPoint = mDAO.pointUpdate(map);
		}
		
		// [결제내역 업데이트]
		int buyUpdate = mDAO.buyInfoUpdate(map);
		
		int memberPoint = basketPrice / 10;
		map.put("memberPointKey", memberPoint);
		
		int memberPointUpdate = mDAO.memberPointUpdate(map);
		
		// [장바구니 내역 삭제]
		int basketDelete = mDAO.basketInfoDelete(map);
		
		if(basketDelete > 0) {
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}

		// [사용한 쿠폰 삭제]
		if(payCheck == 1) {
			map.put("couponCodeKey", couponCode);
			int couponCodeDelete = mDAO.couponCodeDelete(map);
		}
		
		// [회원 정보 조회]

		int couponCount = mDAO.couponCount(userId);
		MemberDTO memberInfo = mDAO.selectMember(userId);
		
		session.setAttribute("couponCount", couponCount);
		session.setAttribute("loginUser", memberInfo);
		// 회원의 정보를 불러와서 session에 저장
				
		session.removeAttribute("newAddress");
		// 새 주소 session 삭제
		
		return resultMsg;
	}

	// 결제정보 입력 - 쿠폰함 조회
	public ModelAndView memberCoupon(String userId, int goodsPrice, int basketGoodsCount, int goodsNum) {

		int sum = basketGoodsCount * goodsPrice;
		// 상품 금액과 수량을 가져와서 합계를 구함.
		
		if(sum >= 10000) { // 합계가 만원 이상이면 member_coupon table을 select
			// 쿠폰함 조회
			List<CouponDTO> couponList = mDAO.userCouponList(userId);
			mav.addObject("userCoupon", couponList);
		}else {
			mav.addObject("userCoupon", null);
		}
	
		return mav;
	}
	
	// -------------------------- 장바구니 여러 개 결제 -----------------------------
	
	// 여러 개 선택하여 결제 (장바구니)
	public String itemSum(String goodsNum2) {
		
		// -------------- 상품 정보를 띄우기 위한 설정 --------------
		
		String AgoodsNum, AbasketGoodsCount, AgoodsPrice, AgoodsName;
		//        상품 번호, 상품 갯수, 상품 가격, 상품 이름
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		// 회원 아이디
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userIdKey", userId); // 회원 아이디
		map.put("goodsNumKey", goodsNum2); // 상품 번호
		
		GoodsDTO basketGoodsResult = mDAO.basketGoodsSelect(map);
		// 유저 아이디와 상품 번호를 map에 put 해서 상품 정보를 select 해온다.
		
		// SelectBasketGoodsBuy JSP에 출력만 할꺼라서 String 타입으로 변환 시킨다.
		AgoodsNum = Integer.toString(basketGoodsResult.getGoodsNum()); // 상품 번호
		AbasketGoodsCount = Integer.toString(basketGoodsResult.getBasketGoodsCount()); // 상품 갯수
		AgoodsName = basketGoodsResult.getGoodsName(); // 상품 이름
		AgoodsPrice = Integer.toString(basketGoodsResult.getGoodsPrice()); // 상품 가격
		
		String Ainfo = "상품번호 : " + AgoodsNum + " 상품 갯수  : " + AbasketGoodsCount + " 상품 이름  : " + AgoodsName + " 상품 가격 : " + AgoodsPrice;		
		
		return Ainfo;
	}
	
	// 쿠폰함 조회(다중 결제)
	public ModelAndView selectCouponList(int totalSum) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		if(totalSum >= 10000) { // 합계가 만원 이상이면 member_coupon table을 select
			// 쿠폰함 조회
			List<CouponDTO> couponList = mDAO.userCouponList(userId);
			mav.addObject("userCoupon", couponList); // 회원의 쿠폰함
		}else {
			mav.addObject("userCoupon", null);
		}
		
		return mav;
	}
	
	// 결제내역 업데이트 - 상품 코드를 가지고 상품 정보 불러오기(Select)
	public String selectBuyInfoUpdate(int goodsNum2, int addressCheck, int point, int total_pay, int payCheck, int couponCode) {
		
		String resultMsg = null;
		
		// 회원 아이디
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		
		// HashMap
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("goodsNumKey", goodsNum2); // 상품 번호
		map.put("userIdKey", userId); // 회원 아이디
		
		// --------------- 주소 ---------------------
		// 신규 주소지를 업데이트 했을 경우 session에 담아서 가져옴.
		String address = (String) session.getAttribute("newAddress");
		// 주소
		String userAddress;
		
		if(addressCheck == 0) { // 기존 배송지
			userAddress = member.getUserAddress(); // 신규 주소지가 없으면 기존 주소지를 가져오고
			map.put("addressKey", userAddress); // 주소
		}else { // 1 : 신규 배송지
			userAddress = address; // 신규 배송지
			map.put("addressKey", userAddress); // 주소
		}
				
		// ---------- 상품 코드를 가지고 정보 불러오기 ----------
		GoodsDTO goodsInfo = mDAO.selectBuyInfo(map);
		
		if(goodsInfo != null) {
			// 결제내역에 insert
			int basketGoodsCount = goodsInfo.getBasketGoodsCount(); // (상품 갯수)
			map.put("basketGoodsCountKey", basketGoodsCount); // 상품 갯수
			int goodsPrice = goodsInfo.getGoodsPrice(); // (상품 가격)
			int basketPrice = basketGoodsCount * goodsPrice; // (상품 갯수 * 상품 가격 = 상품 합계 가격)
			map.put("basketPriceKey", basketPrice); // 상품 합계 가격
		}
		
		// ------------- 결제내역 update -------------
		int paymentUpdate = mDAO.buyInfoUpdate(map);
		
		// ------------- 장바구니 delete -------------
		int paymentDelete = mDAO.basketInfoDelete(map);
		
		// ------------- 회원 포인트 update(기존 포인트 - 사용한 포인트) -------------
		map.put("userPointKey", point);
		// 기존 포인트 - 사용한 포인트
		int pointUpdate = mDAO.pointUpdate(map);
		
		// ------------- 회원 포인트 update(결제내역 만큼 포인트 +) -------------
		int memberPoint = (int) (total_pay * 0.05); // 결제내역에 따른 지급 포인트
		map.put("memberPointKey", memberPoint);
		int memberPointUpdate = mDAO.memberPointUpdate(map);
		
		// ------------- 쿠폰함에 사용한 쿠폰 삭제 -------------
		if(payCheck == 1) {
			map.put("couponCodeKey", couponCode);
			int couponCodeDelete = mDAO.couponCodeDelete(map);
		}
		
		// ------------- 포인트 차감 후 회원 정보 조회 -------------
		int couponCount = mDAO.couponCount(userId);
		MemberDTO memberInfo = mDAO.selectMember(userId);
		
		session.setAttribute("couponCount", couponCount);
		session.setAttribute("loginUser", memberInfo);
		
		session.removeAttribute("newAddress");
		// 새 주소 session 삭제
		
		if(couponCount > 0 && memberPointUpdate > 0) {
			resultMsg = "OK";
		}else {
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// -------------------------- 리뷰 작성 했는 지 확인 -------------------------------------
	
	// 호텔 리뷰
	public String hotelReviewCheck(int hotelReserveNum) {
		
		String resultMsg = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hotelReserveNumKey", hotelReserveNum);
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		map.put("userIdKey", userId);
		
		int reviewCheck = mDAO.hotelReviewCheck(map);
		
		if(reviewCheck == 0) { // 리뷰 작성 X
			resultMsg = "OK";
		}else { // 리뷰 작성 O
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 병원 리뷰
	public String medicalReviewCheck(int medicalReserveNum) {
		
		String resultMsg = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("medicalReserveNumKey", medicalReserveNum);
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		map.put("userIdKey", userId);
		
		int reviewCheck = mDAO.medicalReviewCheck(map);
		
		if(reviewCheck == 0) { // 리뷰 작성 X
			resultMsg = "OK";
		}else { // 리뷰 작성 O
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 미용 리뷰
	public String beautyReviewCheck(int beautyReserveNum) {
		
		String resultMsg = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beautyReserveNumKey", beautyReserveNum);
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		map.put("userIdKey", userId);
		
		int reviewCheck = mDAO.beautyReviewCheck(map);
		
		if(reviewCheck == 0) { // 리뷰 작성 X
			resultMsg = "OK";
		}else { // 리뷰 작성 O
			resultMsg = "NO";
		}
		
		return resultMsg;
	}
	
	// 용품 리뷰
	public String goodsReviewCheck(int goodsBuyNum) {
		
		String resultMsg = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goodsBuyNumKey", goodsBuyNum);
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String userId = member.getUserId();
		map.put("userIdKey", userId);
		
		int reviewCheck = mDAO.goodsReviewCheck(map);
		
		if(reviewCheck == 0) { // 리뷰 작성 X
			resultMsg = "OK";
		}else { // 리뷰 작성 O
			resultMsg = "NO";
		}
		
		return resultMsg;
	}

}
