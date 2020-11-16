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

import com.icia.project.dto.EduCommentDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.service.EducationService;

@Controller
public class EducationController {

	ModelAndView mav = new ModelAndView();
	
	@Autowired
	EducationService educationSvc = new EducationService();
	
	// 교육

	// 교육 페이지 이동
	@RequestMapping(value="/educationList", method = RequestMethod.GET)
	public ModelAndView educationLineUpList(@RequestParam(value="searchData", required=false, defaultValue="") String searchData,
			@RequestParam(value="eduAnimalKind", required=false, defaultValue="") String eduAnimalKind,
			@RequestParam(value="lineUp", required=false, defaultValue="최신순") String lineUp,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value="count", required=false, defaultValue="4") int count) {
			mav = educationSvc.educationList(searchData, eduAnimalKind, lineUp, page, count);
			return mav;
	}
	
	// 교육 상세페이지 이동
	@RequestMapping(value="/educationView", method = RequestMethod.GET)
	public ModelAndView educationView(@RequestParam(value="eduNum")int eduNum) {
		mav = educationSvc.educationView(eduNum);
		return mav;
	}
	//==========================================================
	// 댓글
	List<EduCommentDTO> edul = new ArrayList<EduCommentDTO>();
	
	// 댓글 DTO
	EduCommentDTO edud = new EduCommentDTO();
	
	// 댓글 리스트
	@RequestMapping(value="/educationCommentList", method = RequestMethod.GET)
	public @ResponseBody List<EduCommentDTO> educationCommentList(@ModelAttribute EduCommentDTO eduComment) {
		edul = educationSvc.educationCommentList(eduComment);
		return edul;
	}

	// 댓글 작성
	@RequestMapping(value="/educationComment")
	public @ResponseBody List<EduCommentDTO> educationComment(@ModelAttribute EduCommentDTO eduComment)throws IllegalStateException, IOException {
		edul = educationSvc.educationComment(eduComment);
		return edul;
	}
	
	// 댓글 삭제
	@RequestMapping(value="/educationCommentDelete", method = RequestMethod.GET)
	public @ResponseBody List<EduCommentDTO> educationCommentDelete(@ModelAttribute EduCommentDTO eduComment) {
		edul = educationSvc.educationCommentDelete(eduComment);
		return edul;
	}
	
	// 댓글 좋아요
	@RequestMapping(value="/educationCommentLike", method = RequestMethod.GET)
	public @ResponseBody List<EduCommentDTO> educationCommentLike(@ModelAttribute EduCommentDTO eduComment){

		edul = educationSvc.educationCommentLike(eduComment);
		return edul;
	}
	
	// 댓글 수정
	@RequestMapping(value="/educationCommentModify", method = RequestMethod.GET)
	public @ResponseBody List<EduCommentDTO> educationCommentModify(@ModelAttribute EduCommentDTO eduComment) {
		edul = educationSvc.educationCommentModify(eduComment);
		return edul;
	}
	
	// 교육 게시글 좋아요
	@RequestMapping(value="/educationLike", method = RequestMethod.GET)
	public @ResponseBody EducationDTO educationLike(@ModelAttribute EducationDTO education) {
		EducationDTO edu = educationSvc.educationLike(education);
		return edu;
	}
	
	// 교육 게시글 좋아요 취소
	@RequestMapping(value="/educationUnLike",method = RequestMethod.GET)
	public @ResponseBody EducationDTO educationUnLike(@ModelAttribute EducationDTO education) {
		EducationDTO edu = educationSvc.educationUnLike(education);
		return edu;
		
	}
	EducationDTO edu = new EducationDTO();
	//좋아요 수 조회
	@RequestMapping(value="/eduLike",method = RequestMethod.GET)
	public @ResponseBody EducationDTO eduLike(@ModelAttribute EducationDTO education) {
		EducationDTO edu = educationSvc.eduLike(education);
		return edu;
	}
	
	
	
	
	
	
	
	
	
	
	
}
