package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.dto.EventDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;
import com.icia.project.dto.ReportDTO;
import com.icia.project.dto.ReviewDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
//게시판 관리
	//호텔 목록
	public List<HotelDTO> hotelManagement() {
		return sql.selectList("AdminManagement.HotelList");
	}
	//호텔 방 작성
	public void hotelBoardWrite(HotelDTO hotel) {
		sql.insert("AdminManagement.HotelWrite", hotel);
	}
	//호텔 방 상세보기
	public HotelDTO hotelBoardView(String hotelCode) {
		return sql.selectOne("AdminManagement.HotelView", hotelCode);
	}
	//호텔 방 수정 처리
	public void hotelBoardModifyProcess(HotelDTO hotel) {
		sql.update("AdminManagement.HotelModify", hotel);
	}
	//호텔 방 삭제
	public void hotelBoardDelete(String hotelCode) {
		sql.delete("AdminManagement.HotelDelete", hotelCode);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//미용사 목록
	public List<BeautyDTO> beautyManagement() {
		return sql.selectList("AdminManagement.BeautyList");
	}
	//미용사 작성
	public void beautyBoardWrite(BeautyDTO beauty) {
		sql.insert("AdminManagement.BeautyWrite", beauty);
	}
	//미용사 상세보기
	public BeautyDTO beautyBoardView(String designerCode) {
		return sql.selectOne("AdminManagement.BeautyView", designerCode);
	}
	//미용사 수정 처리
	public void beautyBoardModifyProcess(BeautyDTO beauty) {
		sql.update("AdminManagement.BeautyModify", beauty);
	}
	//미용사 삭제
	public void beautyBoardDelete(String designerCode) {
		sql.delete("AdminManagement.BeautyDelete", designerCode);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//의사 목록
	public List<MedicalDTO> medicalManagement() {
		return sql.selectList("AdminManagement.DoctorList");
	}
	//의사 작성
	public void medicalBoardWrite(MedicalDTO medical) {
		sql.insert("AdminManagement.DoctoryWrite", medical);
	}
	//의사 상세보기
	public MedicalDTO medicalBoardView(String doctorCode) {
		return sql.selectOne("AdminManagement.DoctorView", doctorCode);
	}
	//의사 수정 처리
	public void medicalBoardModifyProcess(MedicalDTO medical) {
		sql.update("AdminManagement.DoctorModify", medical);
	}
	//의사 삭제
	public void medicalBoardDelete(String doctorCode) {
		sql.delete("AdminManagement.DoctorDelete", doctorCode);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//교육 목록 조회 전 카운트
	public int educationCount(String eduAnimalKind) {
		return sql.selectOne("AdminManagement.EducationCount", eduAnimalKind);
	}
	//교육 목록
	public List<EducationDTO> educationManagement(HashMap<String, Object> map) {
		return sql.selectList("AdminManagement.EducationList", map);
	}
	//교육 작성
	public void educationBoardWrite(EducationDTO education) {
		sql.insert("AdminManagement.EducationWrite", education);
	}
	//교육 상세보기
	public EducationDTO educationBoardView(int eduNum) {
		return sql.selectOne("AdminManagement.EducationView", eduNum);
	}
	//교육 수정 처리
	public void educationBoardModifyProcess(EducationDTO education) {
		sql.update("AdminManagement.EducationModify", education);
	}
	//교육 삭제
	public void educationBoardDelete(int eduNum) {
		sql.delete("AdminManagement.EducationDelete", eduNum);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//용품 목록 조회 전 카운트
	public int goodsListCount() {
		return sql.selectOne("AdminManagement.GoodsListCount");
	}
	//용품 목록
	public List<GoodsDTO> goodsManagement(PageDTO paging) {
		return sql.selectList("AdminManagement.GoodsList", paging);
	}
	//용품 작성
	public void goodsBoardWrite(GoodsDTO goods) {
		sql.insert("AdminManagement.GoodsWrite", goods);
	}
	//용품 상세보기
	public GoodsDTO goodsBoardView(int goodsNum) {
		return sql.selectOne("AdminManagement.GoodsView", goodsNum);
	}
	//용품 수정 처리
	public void goodsBoardModifyProcess(GoodsDTO goods) {
		sql.update("AdminManagement.GoodsModify", goods);
	}
	//용품 삭제
	public void goodsBoardDelete(int goodsNum) {
		sql.delete("AdminManagement.GoodsDelete", goodsNum);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//이벤트 목록
	public List<EventDTO> eventManagement() {
		return sql.selectList("AdminManagement.EventList");
	}
	//이벤트 작성
	public void eventBoardWrite(EventDTO event) {
		sql.insert("AdminManagement.EventWrite", event);
	}
	//이벤트 상세보기
	public EventDTO eventBoardView(int eventNum) {
		return sql.selectOne("AdminManagement.EventView", eventNum);
	}
	//이벤트 수정 처리
	public void eventBoardModifyProcess(EventDTO event) {
		sql.update("AdminManagement.EventModify", event);
	}
	//이벤트 삭제
	public void eventBoardDelete(int eventNum) {
		sql.delete("AdminManagement.EventDelete", eventNum);
	}
	//쿠폰 리스트 불러오기
	public List<CouponDTO> eventCouponList() {
		return sql.selectList("AdminManagement.EventCouponList");
	}
	//쿠폰 정보 불러오기
	public CouponDTO eventCoupon(String eventCouponCode){
		return sql.selectOne("AdminManagement.EventCoupon", eventCouponCode);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//리뷰 개수 세기
	public int ListCount(String kind) {
		return sql.selectOne("AdminManagement.ReviewCount", kind);
	}
	//호텔 리뷰 목록 조회
	public List<ReviewDTO> hotelReview(PageDTO paging) {
		return sql.selectList("AdminManagement.HotelReview",paging);
	}
	//미용 리뷰 목록 조회
	public List<ReviewDTO> beautyReview(PageDTO paging) {
		return sql.selectList("AdminManagement.BeautyReview",paging);
	}
	//병원 리뷰 목록 조회
	public List<ReviewDTO> medicalReview(PageDTO paging) {
		return sql.selectList("AdminManagement.MedicalReview",paging);
	}
	//용품 리뷰 목록 조회
	public List<ReviewDTO> goodsReview(PageDTO paging) {
		return sql.selectList("AdminManagement.GoodsReview",paging);
	}
	//리뷰 블라인드
	public int reviewBlind(int reviewNum) {
		return sql.update("AdminManagement.ReviewBlind", reviewNum);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//멤버 목록 조회 전 멤버 카운트
	public int memberCount() {
		return sql.selectOne("AdminManagement.MemberCount");
	}
	//회원 목록
	public List<MemberDTO> adminMemberList(PageDTO paging) {
		return sql.selectList("AdminManagement.MemberList",paging);
	}
	//회원 상세보기
	public MemberDTO adminMemberView(String userId) {
		return sql.selectOne("AdminManagement.MemberView", userId);
	}
	//회원 삭제
	public void adminMemberDelete(String userId) {
		sql.delete("AdminManagement.MemberDelete", userId);
	}
	//신고목록 조회 전 개수 카운트
	public int reportCount() {
		return sql.selectOne("AdminManagement.ReportCount");
	}
	//신고 목록 조회
	public List<ReportDTO> adminMemerReport(PageDTO paging) {
		return sql.selectList("AdminManagement.MemberReport", paging);
	}
	//회원 정지
	public int adminMemberReport(HashMap<String, Object> map) {
		return sql.update("AdminManagement.MemberSuspend", map);
	}
	//신고 처리된 신고글 삭제
	public void adminReportDelete(HashMap<String, Object> map) {
		sql.delete("AdminManagement.ReportDelete", map);
	}
	//정지 회원 목록 불리오기 전 정지 회원 카운트
	public int suspendMemberCount() {
		return sql.selectOne("AdminManagement.SuspendMemberCount");
	}
	//정지 회원 목록
	public List<MemberDTO> adminMemberSuspendList(PageDTO paging) {
		return sql.selectList("AdminManagement.MemberSuspendList", paging);
	}
	//문의 내역 불러오기전 카운트
	public int askCount() {
		return sql.selectOne("AdminManagement.AskListCount");
	}
	//문의 내역
	public List<GoodsDTO> adminAskList(PageDTO paging) {
		return sql.selectList("AdminManagement.AskList",paging);
	}
	//문의글 답변
	public int adminAskAnswer(GoodsDTO goods) {
		return sql.update("AdminManagement.AskAnswer", goods);
	}
	//쿠폰 작성
	public void couponWrite(CouponDTO coupon) {
		sql.insert("AdminManagement.CouponWrite", coupon);
	}
	//쿠폰 발행
	public void adminMemberGiveACoupon(HashMap<String, String> coupon) {
		sql.insert("AdminManagement.CouponGive", coupon);
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//호텔 예약 목록 조회 전 카운트
	public int hotelReserveCount() {
		return sql.selectOne("AdminManagement.HotelReserveCount");
	}
	//호텔 예약 목록 조회
	public List<HotelDTO> adminHotelReserveList(PageDTO paging) {
		return sql.selectList("AdminManagement.HotelReserve",paging);
	}
	//미용 예약 목록 조회 전 카운트
	public int beautyReserveCount() {
		return sql.selectOne("AdminManagement.BeautyReserveCount");
	}
	//미용 예약 목록 조회
	public List<BeautyDTO> adminBeautyReserveList(PageDTO paging) {
		return sql.selectList("AdminManagement.BeautyReserve",paging);
	}
	//병원 예약 목록 조회 전 카운트
	public int medicalReserveCount() {
		return sql.selectOne("AdminManagement.MedicalReserveCount");
	}
	//병원 예약 목록 조회
	public List<MedicalDTO> adminMedicalReserveList(PageDTO paging) {
		return sql.selectList("AdminManagement.MedicalReserve",paging);
	}
	//용품 구매 목록 조회 전 카운트
	public int goodsBuyCount() {
		return sql.selectOne("AdminManagement.GoodsBuyCount");
	}
	//용품 구매 목록 조회
	public List<GoodsDTO> adminGoodsBuyList(PageDTO paging) {
		return sql.selectList("AdminManagement.GoodsBuy",paging);
	}
	
	
	
	
	
	
	
	
	
	
}
