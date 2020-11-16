package com.icia.project.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dto.PageDTO;
import com.icia.project.dao.ReviewDAO;
import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.ReviewDTO;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	private ModelAndView mav = new ModelAndView();
	@Autowired
	private HttpSession session;
	SimpleDateFormat date = new SimpleDateFormat ( "yyMMdd_HHmmss");
	Date time = new Date();
	PageDTO paging = new PageDTO();
	
	//리뷰 작성 전 결제 정보 가져오기
	public ModelAndView reviewWriteForm(String code, int num, String kind, int reserveNum) {
		// 리뷰 정보를 가져오기 전, 회원 정지를 받았는지 확인
		MemberDTO member = (MemberDTO)session.getAttribute("loginUser");
		int suspendResult = reviewDAO.suspendCheck(member.getUserId());
		
		
		
		
		
		// sysdate보다 lockdate가 큰 회원이 select 되면
		if(suspendResult>0) {
			mav.addObject("suspendCheck", "정지");
			mav.setViewName("windowClose");					//은희한테 주소값 받고, alert 창 뜨게 해주기.
		} else {// 회원이 select 되지 않는다면
			// 리뷰할 정보 가져오기
			if(kind.equals("호텔")) {
				HotelDTO hotel = reviewDAO.hotelReviewWriteForm(code);
				mav.addObject("medicalView", null);
				mav.addObject("goodsView", null);
				mav.addObject("beautyView", null);
				mav.addObject("hotelView", hotel);
			} else if(kind.equals("미용")) {
				BeautyDTO beauty = reviewDAO.beautyReviewWriteForm(code);
				mav.addObject("medicalView", null);
				mav.addObject("goodsView", null);
				mav.addObject("hotelView", null);
				mav.addObject("beautyView", beauty);
			} else if(kind.equals("용품")) {
				GoodsDTO goods = reviewDAO.goodsReviewWriteForm(num);
				mav.addObject("medicalView", null);
				mav.addObject("hotelView", null);
				mav.addObject("beautyView", null);
				mav.addObject("goodsView", goods);
			} else {
				MedicalDTO medical = reviewDAO.medicalReviewWriteForm(code);
				mav.addObject("hotelView", null);
				mav.addObject("goodsView", null);
				mav.addObject("beautyView", null);
				mav.addObject("medicalView", medical);
			}
			
			mav.addObject("reserveNum", reserveNum);
			mav.setViewName("ReviewWriteForm");
		}
		return mav;
	}
	// 리뷰 작성
	public ModelAndView reviewWrite(ReviewDTO review) throws IllegalStateException, IOException {
		
		
		
		MultipartFile reviewFile = review.getReviewImageFile();
			
			String fileName = date.format(time)+"ㅡ"+reviewFile.getOriginalFilename();
			
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/reviewFile/"+fileName;
			
		
			if(!reviewFile.isEmpty()) {
				reviewFile.transferTo(new File(savePath));
			}
			review.setReviewImage(fileName);
	
			MemberDTO member = (MemberDTO)session.getAttribute("loginUser");
			review.setReviewUserId(member.getUserId());
			//리뷰 작성
			int result = reviewDAO.reviewWrite(review);
			//리뷰 카운트 +1
			if(result>0) {
				if(review.getReviewKind().equals("호텔")) {
					reviewDAO.reviewHotelUp(review.getReserveNum());
				}else if(review.getReviewKind().equals("미용")) {
					reviewDAO.reviewBeautyUp(review.getReserveNum());
				}else if(review.getReviewKind().equals("병원")) {
					reviewDAO.reviewMedicalUp(review.getReserveNum());
				}else{
					reviewDAO.reviewGoodsUp(review.getReserveNum());
				}
			}
			mav.setViewName("windowClose");
		return mav;
	}
	
	
	List<ReviewDTO> reviewResult = new ArrayList<ReviewDTO>();
	private static final int BLOCK_LIMIT = 5;
	
	//리뷰 - 순 정렬 데이터 요청
	public ModelAndView reviewLineUpList(String searchData, String reviewKind, String lineUp, int page, int count) {
		// 페이징처리에 사용될 글 개수 세기
		HashMap<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("searchData", searchData);
		reviewMap.put("reviewKind",reviewKind);
		
		
				int listCount = reviewDAO.ListCount(reviewMap); 
				int startRow = (page - 1) * count + 1;
				int endRow = page * count;
				int maxPage = (int) (Math.ceil((double) listCount / count));	// ceil : 값보다 큰 정수를 찾는 것.
				int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				if (endPage > maxPage) {
					endPage = maxPage;
				}
				paging.setEndRow(endRow);
				paging.setStartRow(startRow);
				paging.setEndPage(endPage);
				paging.setPage(page);
				paging.setStartPage(startPage);
				paging.setMaxPage(maxPage);
		
		
		
		reviewMap.put("startRow", startRow);
		reviewMap.put("endRow", endRow);
		
		if(lineUp.equals("좋아요순")) {
			reviewResult=reviewDAO.reviewLikeLineUp(reviewMap);
		} else if (lineUp.equals("오래된순")){
			reviewResult=reviewDAO.reviewLikeLineUp(reviewMap);
		} else {
			reviewResult = reviewDAO.reviewSearchList(reviewMap);
		}
		mav.addObject("count", count);
		mav.addObject("lineUp", lineUp);
		mav.addObject("searchData", searchData);
		mav.addObject("menu", reviewKind);
		mav.addObject("paging", paging);
		mav.addObject("reviewList", reviewResult);
		mav.setViewName("Review");
		return mav;
	}
	
	//리뷰 좋아요 체크
	public List<ReviewDTO> reviewLikeCheck() {
		MemberDTO member = (MemberDTO)session.getAttribute("loginUser");
		List<ReviewDTO> likeCheckResult = reviewDAO.reviewLikeCheck(member);
		return likeCheckResult;
	}
	HashMap<String, Object> map = new HashMap<String, Object>();
	//리뷰 좋아요
	public int reviewLike(ReviewDTO review) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginUser");
		map.put("reviewNum",review.getReviewNum());
		map.put("userId",member.getUserId());
		// 좋아요+1
		reviewDAO.reviewLikeUp(review.getReviewNum());
		// 좋아요 테이블에 아이디 입력
		int likeResult = reviewDAO.reviewLike(map);
		return likeResult;
	}
	
	//리뷰 좋아요 취소
	public int reviewUnLike(ReviewDTO review) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginUser");
		map.put("reviewNum",review.getReviewNum());
		map.put("userId",member.getUserId());
		// 좋아요 -1
		reviewDAO.reviewLikeDown(review.getReviewNum());
		// 좋아요 테이블에 있던 아이디 삭제
		int unLikeResult = reviewDAO.reviewUnLike(map);
		return unLikeResult;
	}
	
	//신고 작성하기 전 정보 가져오기
	public ModelAndView reviewReportForm(int reviewNum) {
		ReviewDTO reviewView = reviewDAO.reviewView(reviewNum);
		mav.addObject("reviewView", reviewView);
		mav.setViewName("ReviewReportForm");
		return mav;
	}
	//리뷰 신고
	public int reviewReport(ReviewDTO review) {
		//리뷰 신고
		int result = reviewDAO.reviewReport(review);
		return result;
	}
	//리뷰 수정 전 정보 가져오기
	public ModelAndView reviewModifyForm(int reviewNum) {
		ReviewDTO reviewView = reviewDAO.reviewView(reviewNum);
		mav.addObject("reviewView", reviewView);
		mav.setViewName("ReviewModifyForm");
		return mav;
	}
	//리뷰 수정 처리
	public ModelAndView reviewModifyProcess(ReviewDTO review)throws IllegalStateException, IOException {
		MultipartFile reviewFile = review.getReviewImageFile();
			
			String fileName = date.format(time)+"ㅡ"+reviewFile.getOriginalFilename();
			
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/reviewFile/"+fileName;
			
			
			if(!reviewFile.isEmpty()) {
				reviewFile.transferTo(new File(savePath));
			}
			review.setReviewImage(fileName);

			reviewDAO.reviewModifyProcess(review);

			mav.setViewName("redirect:/reviewList");
		return mav;
	}
	//리뷰 삭제
	public ModelAndView reviewDelete(int reviewNum) {
		reviewDAO.reviewDelete(reviewNum);
		mav.setViewName("redirect:/reviewList");
		return mav;
	}




	
	

}
