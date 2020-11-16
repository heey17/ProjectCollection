package com.icia.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.dto.EventDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.ReportDTO;
import com.icia.project.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminSvc = new AdminService();
	private ModelAndView mav = new ModelAndView();

// 게시판 관리
	// 호텔
	//호텔 목록
	@RequestMapping(value = "hotelManagement", method = RequestMethod.GET)
	public ModelAndView hotelManagement() {
		mav = adminSvc.hotelManagement();
		return mav;
	}
	//호텔 방 작성
	@RequestMapping(value="hotelBoardWrite", method=RequestMethod.POST)
	public ModelAndView hotelBoardWrite(@ModelAttribute HotelDTO hotel, MultipartHttpServletRequest multiRequest) throws IllegalStateException, IOException {
		mav = adminSvc.hotelBoardWrite(hotel, multiRequest.getFiles("hotelImageFile"));
		return mav;
	}
	//호텔 방 상세보기
	@RequestMapping(value = "hotelBoardView", method = RequestMethod.GET)
	public ModelAndView hotelBoardView(@RequestParam(value="hotelCode") String hotelCode) {
		mav = adminSvc.hotelBoardView(hotelCode);
		return mav;
	}
	//호텔 수정 전 정보 가져오기
	@RequestMapping(value = "hotelBoardModify", method = RequestMethod.GET)
	public ModelAndView hotelBoardModify(@RequestParam(value="hotelCode") String hotelCode) {
		mav = adminSvc.hotelBoardModify(hotelCode);
		return mav;
	}
	//호텔 수정 처리
	@RequestMapping(value = "hotelBoardModifyProcess", method = RequestMethod.POST)
	public ModelAndView hotelBoardModifyProcess(@ModelAttribute HotelDTO hotel, MultipartHttpServletRequest multiRequest) throws IllegalStateException, IOException {
		mav = adminSvc.hotelBoardModifyProcess(hotel, multiRequest.getFiles("hotelRoomImageFile"));
		return mav;
	}
	// 호텔 삭제
	@RequestMapping(value = "hotelBoardDelete", method = RequestMethod.GET)
	public ModelAndView hotelBoardDelete(@RequestParam(value="hotelCode") String hotelCode){
		mav = adminSvc.hotelBoardDelete(hotelCode);
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 미용
	//미용사 목록
	@RequestMapping(value = "beautyManagement", method = RequestMethod.GET)
	public ModelAndView beautyManagement() {
		mav = adminSvc.beautyManagement();
		return mav;
	}
	//미용사 작성
	@RequestMapping(value="beautyBoardWrite", method=RequestMethod.POST)
	public ModelAndView beautyBoardWrite(@ModelAttribute BeautyDTO beauty) throws IllegalStateException, IOException {
		mav = adminSvc.beautyBoardWrite(beauty);
		return mav;
	}
	//미용사 상세보기
	@RequestMapping(value = "beautyBoardView", method = RequestMethod.GET)
	public ModelAndView beautyBoardView(@RequestParam(value="designerCode") String designerCode) {
		mav = adminSvc.beautyBoardView(designerCode);
		return mav;
	}
	//미용사 수정 전 정보 가져오기
	@RequestMapping(value = "beautyBoardModify", method = RequestMethod.GET)
	public ModelAndView beautyBoardModify(@RequestParam(value="designerCode") String designerCode) {
		mav = adminSvc.beautyBoardModify(designerCode);
		return mav;
	}
	//미용사 수정 처리
	@RequestMapping(value = "beautyBoardModifyProcess", method = RequestMethod.POST)
	public ModelAndView beautyBoardModifyProcess(@ModelAttribute BeautyDTO beauty) throws IllegalStateException, IOException {
		mav = adminSvc.beautyBoardModifyProcess(beauty);
		return mav;
	}
	// 미용사 삭제
	@RequestMapping(value = "beautyBoardDelete", method = RequestMethod.GET)
	public ModelAndView beautyBoardDelete(@RequestParam(value="designerCode") String designerCode) {
		mav = adminSvc.beautyBoardDelete(designerCode);
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 병원
	//의사 목록
	@RequestMapping(value = "medicalManagement", method = RequestMethod.GET)
	public ModelAndView medicalManagement() {
		mav = adminSvc.medicalManagement();
		return mav;
	}
	//의사 작성
	@RequestMapping(value="medicalBoardWrite", method=RequestMethod.POST)
	public ModelAndView medicalBoardWrite(@ModelAttribute MedicalDTO medical) throws IllegalStateException, IOException {
		mav = adminSvc.medicalBoardWrite(medical);
		return mav;
	}
	//의사 상세보기
	@RequestMapping(value = "medicalBoardView", method = RequestMethod.GET)
	public ModelAndView medicalBoardView(@RequestParam(value="doctorCode") String doctorCode) {
		mav = adminSvc.medicalBoardView(doctorCode);
		return mav;
	}
	//의사 수정 전 정보 가져오기
	@RequestMapping(value = "medicalBoardModify", method = RequestMethod.GET)
	public ModelAndView medicalBoardModify(@RequestParam(value="doctorCode") String doctorCode) {
		mav = adminSvc.medicalBoardModify(doctorCode);
		return mav;
	}
	//의사 수정 처리
	@RequestMapping(value = "medicalBoardModifyProcess", method = RequestMethod.POST)
	public ModelAndView medicalBoardModifyProcess(@ModelAttribute MedicalDTO medical) throws IllegalStateException, IOException {
		mav = adminSvc.medicalBoardModifyProcess(medical);
		return mav;
	}
	//의사 삭제
	@RequestMapping(value = "medicalBoardDelete", method = RequestMethod.GET)
	public ModelAndView medicalBoardDelete(@RequestParam(value="doctorCode") String doctorCode)  {
		mav = adminSvc.medicalBoardDelete(doctorCode);
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 교육
	//교육 목록
	@RequestMapping(value = "educationManagement", method = RequestMethod.GET)
	public ModelAndView educationManagement(@RequestParam(value="page", required=false, defaultValue="1") int page,
											@RequestParam(value="eduAnimalKind", required=false, defaultValue="") String eduAnimalKind) {
		mav = adminSvc.educationManagement(page, eduAnimalKind);
		return mav;
	}
	//교육 작성
	@RequestMapping(value="educationBoardWrite", method=RequestMethod.POST)
	public ModelAndView educationBoardWrite(@ModelAttribute EducationDTO education) throws IllegalStateException, IOException {
		mav = adminSvc.educationBoardWrite(education);
		return mav;
	}
	//교육 상세보기
	@RequestMapping(value = "educationBoardView", method = RequestMethod.GET)
	public ModelAndView educationBoardView(@RequestParam(value="eduNum") int eduNum) {
		mav = adminSvc.educationBoardView(eduNum);
		return mav;
	}
	//교육 수정 전 정보 가져오기
	@RequestMapping(value = "educationBoardModify", method = RequestMethod.GET)
	public ModelAndView educationBoardModify(@RequestParam(value="eduNum") int eduNum) {
		mav = adminSvc.educationBoardModify(eduNum);
		return mav;
	}
	//교육 수정 처리
	@RequestMapping(value = "educationBoardModifyProcess", method = RequestMethod.POST)
	public ModelAndView educationBoardModifyProcess(@ModelAttribute EducationDTO education) throws IllegalStateException, IOException {
		mav = adminSvc.educationBoardModifyProcess(education);
		return mav;
	}
	//교육 삭제
	@RequestMapping(value = "educationBoardDelete", method = RequestMethod.GET)
	public ModelAndView educationBoardDelete(@RequestParam(value="eduNum") int eduNum){
		mav = adminSvc.educationBoardDelete(eduNum);
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 용품
	//용품 목록
	@RequestMapping(value = "goodsManagement", method = RequestMethod.GET)
	public ModelAndView goodsManagement(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.goodsManagement(page);
		return mav;
	}
	//용품 작성
	@RequestMapping(value="goodsBoardWrite", method=RequestMethod.POST)
	public ModelAndView goodsBoardWrite(@ModelAttribute GoodsDTO goods, MultipartHttpServletRequest multiRequest) throws IllegalStateException, IOException {
		mav = adminSvc.goodsBoardWrite(goods, multiRequest.getFiles("goodsImageFile"));
		return mav;
	}
	//용품 상세보기
	@RequestMapping(value = "goodsBoardView", method = RequestMethod.GET)
	public ModelAndView goodsBoardView(@RequestParam(value="goodsNum") int goodsNum) {
		mav = adminSvc.goodsBoardView(goodsNum);
		return mav;
	}
	//용품 수정 전 정보 가져오기
	@RequestMapping(value = "goodsBoardModify", method = RequestMethod.GET)
	public ModelAndView goodsBoardModify(@RequestParam(value="goodsNum") int goodsNum) {
		mav = adminSvc.goodsBoardModify(goodsNum);
		return mav;
	}
	//용품 수정 처리
	@RequestMapping(value = "goodsBoardModifyProcess", method = RequestMethod.POST)
	public ModelAndView goodsBoardModifyProcess(@ModelAttribute GoodsDTO goods, MultipartHttpServletRequest multiRequest) throws IllegalStateException, IOException {
		mav = adminSvc.goodsBoardModifyProcess(goods, multiRequest.getFiles("goodsImageFile"));
		return mav;
	}
	//용품 삭제
	@RequestMapping(value = "goodsBoardDelete", method = RequestMethod.GET)
	public ModelAndView goodsBoardDelete(@RequestParam(value="goodsNum") int goodsNum) {
		mav = adminSvc.goodsBoardDelete(goodsNum);
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 이벤트
	//이벤트 목록
	@RequestMapping(value = "eventManagement", method = RequestMethod.GET)
	public ModelAndView eventManagement() {
		mav=adminSvc.eventManagement();
		return mav;
	}
	//이벤트 작성
	@RequestMapping(value="eventBoardWrite", method=RequestMethod.POST)
	public ModelAndView eventBoardWrite(@ModelAttribute EventDTO event) throws IllegalStateException, IOException {
		mav = adminSvc.eventBoardWrite(event);
		return mav;
	}
	//이벤트 상세보기
	@RequestMapping(value = "eventBoardView", method = RequestMethod.GET)
	public ModelAndView eventBoardView(@RequestParam(value="eventNum") int eventNum) {
		mav = adminSvc.eventBoardView(eventNum);
		return mav;
		}
	//이벤트 수정 전 정보 가져오기
	@RequestMapping(value = "eventBoardModify", method = RequestMethod.GET)
	public ModelAndView eventBoardModify(@RequestParam(value="eventNum") int eventNum) {
		mav = adminSvc.eventBoardModify(eventNum);
		return mav;
	}
	//이벤트 수정 처리
	@RequestMapping(value = "eventBoardModifyProcess", method = RequestMethod.POST)
	public ModelAndView eventBoardModifyProcess(@ModelAttribute EventDTO event) throws IllegalStateException, IOException {
		mav = adminSvc.eventBoardModifyProcess(event);
		return mav;
	}
	//이벤트 삭제
	@RequestMapping(value = "eventBoardDelete", method = RequestMethod.GET)
	public ModelAndView eventBoardDelete(@RequestParam(value="eventNum") int eventNum) {
		mav = adminSvc.eventBoardDelete(eventNum);
		return mav;
	}
	//쿠폰 리스트 불러오기
	@RequestMapping(value = "eventCouponList", method = RequestMethod.GET)
	public @ResponseBody List<CouponDTO> eventCouponList() {
		return adminSvc.eventCouponList();
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 리뷰 관리
	//리뷰 목록 조회
	@RequestMapping(value = "reviewBoardList", method = RequestMethod.GET)
	public ModelAndView reviewBoardList(@RequestParam(value="kind", required=false, defaultValue="호텔") String kind, 
										@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.reviewBoardList(kind, page);
		return mav;
	}
	//리뷰 블라인드 처리
	@RequestMapping(value = "reviewBlind", method = RequestMethod.GET)
	public @ResponseBody int reviewBlind(@RequestParam(value="reviewNum") int reviewNum) {
		int blindResult = adminSvc.reviewBlind(reviewNum);
		return blindResult;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 회원 관리	
	//회원 목록 조회
	@RequestMapping(value = "adminMemberList", method = RequestMethod.GET)
	public ModelAndView adminMemberList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.adminMemberList(page);
		return mav;
	}
	//회원 상세 보기
	@RequestMapping(value = "adminMemberView", method = RequestMethod.POST)
	public ModelAndView adminMemberView(@RequestParam(value="userId") String userId) {
		mav = adminSvc.adminMemberView(userId);
		return mav;
	}
	//회원 삭제
	@RequestMapping(value = "adminMemberDelete", method = RequestMethod.POST)
	public ModelAndView adminMemberDelete(@RequestParam(value="userId") String userId) {
		mav = adminSvc.adminMemberDelete(userId);
		return mav;
	}
	//신고 목록 조회
	@RequestMapping(value = "adminMemberReport", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> adminMemberReport(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		HashMap<String, Object> map = adminSvc.adminMemberReport(page);
		return map;
	}
	// 회원 회원 정지 폼으로 이동
	@RequestMapping(value = "adminMemberSuspendForm", method = RequestMethod.POST)
	public ModelAndView goAdminMemberSuspendForm(@ModelAttribute ReportDTO report) {
		mav.addObject("report", report);
		mav.setViewName("AdminMemberSuspendForm");
		return mav;
	}
	//신고 처리 AND 회원 정지 처리
	@RequestMapping(value = "adminMemberSuspend")
	public @ResponseBody int adminMemberSuspend(@ModelAttribute ReportDTO report,
												@RequestParam(value="suspendDeadLine") int suspendDeadLine) {
		int result = adminSvc.adminMemberSuspend(report, suspendDeadLine);
		
		return result;
	}
	//정지 회원 목록 조회
	@RequestMapping(value = "adminMemberSuspendList", method = RequestMethod.GET)
	public ModelAndView adminMemberSuspendList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.adminMemberSuspendList(page);
		return mav;
	}
	
	List<GoodsDTO> askList = new ArrayList<GoodsDTO>();
	//문의글 리스트 가져오기
	@RequestMapping(value = "adminAskList", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> adminAskList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		HashMap<String, Object> askList = adminSvc.adminAskList(page);
		return askList;
	}
	// 문의 답변 작성 폼으로 이동
	@RequestMapping(value = "adminAnswerForm", method = RequestMethod.POST)
	public ModelAndView adminAnswerForm(@ModelAttribute GoodsDTO goods) {
		mav.addObject("goods", goods);
		mav.setViewName("AdminAskAnswerForm");
		return mav;
	}
	//문의글 답변 작성
	@RequestMapping(value = "adminAskAnswer", method = RequestMethod.POST)
	public @ResponseBody int adminAskAnswer(@ModelAttribute GoodsDTO goods) {
		int askResult = adminSvc.adminAskAnser(goods);
		return askResult;
	}
	//쿠폰 작성
	@RequestMapping(value = "couponWrite", method = RequestMethod.POST)
	public ModelAndView couponWrite(@ModelAttribute CouponDTO coupon) {
		mav = adminSvc.couponWrite(coupon);
		return mav;
	}
	//쿠폰 발행
	@RequestMapping(value = "adminMemberGiveACoupon", method = RequestMethod.GET)
	public ModelAndView adminMemberGiveACoupon(HttpSession session, @RequestParam(value="couponCode") String couponCode) {
		mav = adminSvc.adminMemberGiveACoupon((MemberDTO)session.getAttribute("loginUser"), couponCode);
		return mav;
	}
	//쿠폰 리스트 불러오기
	@RequestMapping(value = "adminCouponList", method = RequestMethod.GET)
	public ModelAndView adminCouponList() {
		mav = adminSvc.adminCouponList();
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 예약 관리
	// 호텔
	@RequestMapping(value = "hotelReserveList", method = RequestMethod.GET)
	public ModelAndView adminHotelReserveList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.adminHotelReserveList(page);
		return mav;
	}
	//미용
	@RequestMapping(value = "beautyReserveList", method = RequestMethod.GET)
	public ModelAndView adminBeautyReserveList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.adminBeautyReserveList(page);
		return mav;
	}
	//병원
	@RequestMapping(value = "medicalReserveList", method = RequestMethod.GET)
	public ModelAndView adminMedicalReserveList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.adminMedicalReserveList(page);
		return mav;
	}
	//용품
	@RequestMapping(value = "goodsBuyList", method = RequestMethod.GET)
	public ModelAndView adminGoodsBuyList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = adminSvc.adminGoodsBuyList(page);
		return mav;
	}
	//용품 배송중으로 바꾸기
	
}
