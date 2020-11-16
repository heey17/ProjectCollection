package com.icia.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.icia.project.dto.ReviewDTO;
import com.icia.project.service.ReviewService;

@Controller
public class ReveiwController {
	
	@Autowired 
	private ReviewService reviewSvc;
	private ModelAndView mav = new ModelAndView();
	
	//리뷰 작성 전 결제 정보 가져오기
	@RequestMapping(value="reviewWriteForm", method=RequestMethod.GET)
	public ModelAndView reviewWriteForm(@RequestParam(value="code", required=false, defaultValue="") String code,
										@RequestParam(value="num", required=false, defaultValue="0") int num,
										@RequestParam(value="reviewKind") String reviewKind,
										@RequestParam(value="reserveNum") int reserveNum) {
		
		
		mav = reviewSvc.reviewWriteForm(code, num, reviewKind, reserveNum);
		return mav;
	}
	//리뷰 작성
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public ModelAndView reviewWrite(@ModelAttribute ReviewDTO review) throws IllegalStateException, IOException {
		mav = reviewSvc.reviewWrite(review);
		return mav;
	}

	//리뷰 - 순 정렬 및 검색 데이터 요청 - 목록 요청
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public ModelAndView reviewLineUpList(@RequestParam(value="searchData", required=false, defaultValue="") String searchData,
											@RequestParam(value="reviewKind", required=false, defaultValue="") String reviewKind,
											@RequestParam(value="lineUp", required=false, defaultValue="최신순") String lineUp,
											@RequestParam(value="page", required=false, defaultValue="1") int page,
											@RequestParam(value="count", required=false, defaultValue="4") int count) {
		mav = reviewSvc.reviewLineUpList(searchData, reviewKind, lineUp, page, count);
		return mav;
	}
	List<ReviewDTO> reviewLikeResult = new ArrayList<ReviewDTO>();
	
	//리뷰 좋아요 체크
	@RequestMapping(value = "reviewLikeCheck", method = RequestMethod.POST)
	public @ResponseBody List<ReviewDTO> reviewLikeCheck() {
		List<ReviewDTO> likeCheckResult = reviewSvc.reviewLikeCheck();
		return likeCheckResult;
	};
	
	//리뷰 좋아요(a.jax)
	@RequestMapping(value = "reviewLike", method = RequestMethod.POST)
	public @ResponseBody int reviewLike(@ModelAttribute ReviewDTO review) {
		int likeResult = reviewSvc.reviewLike(review);
		return likeResult;
	}
	//리뷰 좋아요 취소(a.jax)
	@RequestMapping(value = "reviewUnLike", method = RequestMethod.POST)
	public @ResponseBody int reviewUnLike(@ModelAttribute ReviewDTO review) {
		int unLikeResult = reviewSvc.reviewUnLike(review);
		return unLikeResult;
	}
	// 신고 전 정보 가져오기
	@RequestMapping(value = "reviewReportForm", method = RequestMethod.GET)
	public ModelAndView reviewReportForm(@RequestParam(value="reviewNum") int reviewNum) {
		mav = reviewSvc.reviewReportForm(reviewNum);
		return mav;
	}
	//리뷰 신고(a.jax)
	@RequestMapping(value ="reviewReport", method = RequestMethod.POST)
	public @ResponseBody int reviewReport(@ModelAttribute ReviewDTO review) {
		int result = reviewSvc.reviewReport(review);
		return result;
	}
	//리뷰 수정전 정보 가져오기
	@RequestMapping(value = "reviewModifyForm")
	public ModelAndView reviewModifyForm(@RequestParam(value="reviewNum") int reviewNum) {
		mav = reviewSvc.reviewModifyForm(reviewNum);
		return mav;
	}
	//리뷰 수정 처리
	@RequestMapping(value = "reviewModifyProcess", method = RequestMethod.POST)
	public ModelAndView reviewModifyProcess(@ModelAttribute ReviewDTO review) throws IllegalStateException, IOException {
		mav = reviewSvc.reviewModifyProcess(review);
		return mav;
	}
	//리뷰 삭제
	@RequestMapping(value = "reviewDelete")
	public ModelAndView reviewDelete(@ModelAttribute ReviewDTO review) {
		mav = reviewSvc.reviewDelete(review.getReviewNum());
		return mav;
	}
	
	
}
