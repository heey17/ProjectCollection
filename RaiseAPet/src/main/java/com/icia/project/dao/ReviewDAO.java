package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.ReviewDTO;
import com.icia.project.dto.GoodsDTO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sql;

	//리뷰 작성 전 회원 정지 체크
	public int suspendCheck(String userId) {
		return sql.selectOne("Review.SuspendCheck", userId);
	}
	//리뷰 작성 전 결제 정보 가져오기
	public HotelDTO hotelReviewWriteForm(String code) {
		return sql.selectOne("Review.HotelReview", code);
	}
	public BeautyDTO beautyReviewWriteForm(String code) {
		return sql.selectOne("Review.BeautyWrite", code);
	}
	public GoodsDTO goodsReviewWriteForm(int num) {
		return sql.selectOne("Review.GoodsReview", num);
	}
	public MedicalDTO medicalReviewWriteForm(String code) {
		return sql.selectOne("Review.MedicalReview", code);
	}
	//리뷰 작성
	public int reviewWrite(ReviewDTO review) {
		return sql.insert("Review.ReviewWrite", review);
	}
		//리뷰 생성 시 카운트 +1
		public void reviewHotelUp(int reserveNum) {
			sql.update("Review.HotelUp", reserveNum);
		}
		public void reviewBeautyUp(int reserveNum) {
			sql.update("Review.BeautyUp", reserveNum);
		}
		public void reviewMedicalUp(int reserveNum) {
			sql.update("Review.MedicalUp", reserveNum);
		}
		public void reviewGoodsUp(int reserveNum) {
			sql.update("Review.GoodsUp", reserveNum);
		}
	//목록 가져올 게시글 카운팅하기
	public int ListCount(HashMap<String, Object> reviewMap) {
		return sql.selectOne("Review.ReviewCount", reviewMap);
	}
	//리뷰 목록 가져오기
	public List<ReviewDTO> reviewList() {
		return sql.selectList("Review.ReviewList");
	}
	//리뷰 종류 및 검색 데이터 요청
	public List<ReviewDTO> reviewSearchList(HashMap<String, Object> reviewMap) {
		return sql.selectList("Review.ReviewSearchList", reviewMap);
	}
	//리뷰 좋아요 순 정렬 데이터 요청
	public List<ReviewDTO> reviewLikeLineUp(HashMap<String, Object> reviewMap) {
		return sql.selectList("Review.ReviewLikeLineUp", reviewMap);
	}
	//리뷰 오래된 순 정렬 데이터 요청
	public List<ReviewDTO> reviewOldLineUp(HashMap<String, Object> reviewMap) {
		return sql.selectList("Review.ReviewOldLineUp", reviewMap);
	}
	//리뷰 좋아요 체크
	public List<ReviewDTO> reviewLikeCheck(MemberDTO member) {
		return sql.selectList("Review.ReviewLikeCheck", member);
	}
	//리뷰 좋아요
	public void reviewLikeUp(int reviewNum) {
		sql.update("Review.ReviewLikeUp",reviewNum);
	}
	public int reviewLike(HashMap<String, Object> map) {
		return sql.insert("Review.ReviewLikeInsert", map);
	}
	//리뷰 좋아요 취소
	public void reviewLikeDown(int reviewNum) {
		sql.update("Review.ReviewLikeDown",reviewNum);
	}
	public int reviewUnLike(HashMap<String, Object> map) {
		return sql.insert("Review.ReviewLikeDelete", map);
	}
	//리뷰 신고 전 정보 가져오기
	public ReviewDTO reviewView(int reviewNum) {
		return sql.selectOne("Review.ReviewView", reviewNum);
	}
	//리뷰 신고
	public int reviewReport(ReviewDTO review) {
		return sql.insert("Review.ReviewReport", review);
	}
	//리뷰 리스트 목록 불러오기 전 카운트
	public int ListCount(String searchData, String kind) {
		return sql.selectOne("Review.ReviewCount");
	}
	//리뷰 수정 처리
	public void reviewModifyProcess(ReviewDTO review) {
		sql.update("Review.ReviewModify", review);
	}
	//리뷰 삭제
	public void reviewDelete(int reviewNum) {
		sql.insert("Review.ReviewDelete", reviewNum);
	}
	
	
}
