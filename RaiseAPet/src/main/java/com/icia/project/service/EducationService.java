package com.icia.project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.EducationDAO;
import com.icia.project.dto.EduCommentDTO;
import com.icia.project.dto.EduCommentLikeDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;
import com.icia.project.dto.ReviewDTO;

@Service
public class EducationService {
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	EducationDAO edudao = new EducationDAO();
	
	@Autowired
	HttpSession session;
	
	List<EduCommentDTO> educommentList = new ArrayList<EduCommentDTO>();
	
	private static final int BLOCK_LIMIT = 5;
	
	PageDTO paging = new PageDTO();
	
	List<EducationDTO> eduResult = new ArrayList<EducationDTO>();
	
	//교육리스트	
	public ModelAndView educationList(String searchData, String eduAnimalKind, String lineUp, int page, int count) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchData", searchData);
		map.put("eduAnimalKind",eduAnimalKind);
		
		
				int listCount = edudao.ListCount(map); 
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
		
		
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		if(lineUp.equals("좋아요순")) {
			eduResult=edudao.eduLikeLineUp(map);
		} else if (lineUp.equals("오래된순")){
			eduResult=edudao.eduHitLineUp(map);
		} else {
			eduResult = edudao.eduList(map);
		}
		mav.addObject("count", count);
		mav.addObject("lineUp", lineUp);
		mav.addObject("searchData", searchData);
		mav.addObject("menu", eduAnimalKind);
		mav.addObject("paging", paging);
		mav.addObject("eduResult", eduResult);
		mav.setViewName("Education");
		return mav;
	}
	
	
	// 교육 상세보기
	public ModelAndView educationView(int eduNum) {
		EducationDTO educationView = edudao.educationView(eduNum);
		
//		edudao.eduHit(eduNum);
		
		mav.addObject("educationView",educationView);
		mav.setViewName("EducationView");
		
		return mav;
	}
	
	
	// 댓글
	List<EduCommentDTO> edul = new ArrayList<EduCommentDTO>();
	
	// 댓글 리스트
	public List<EduCommentDTO> educationCommentList(EduCommentDTO eduComment) {
		educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
		return educommentList;
	}

	// 댓글 작성
	public List<EduCommentDTO> educationComment(EduCommentDTO eduComment)throws IllegalStateException, IOException {
		int educationComment = edudao.educationComment(eduComment);
		if(educationComment>0) {
			educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
		} else {
			educommentList = null;
		}
		return educommentList;
	}

	// 댓글 삭제
	public List<EduCommentDTO> educationCommentDelete(EduCommentDTO eduComment) {
		int educationCommentLikeDelete = edudao.educationCommentLikeDelete(eduComment);
		if(educationCommentLikeDelete>0) {
			int educationCommentDelete = edudao.educationCommentDelete(eduComment);
			if(educationCommentDelete>0) {
				educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
			} else {
				educommentList = null;
			}
		
		}else {
			int educationCommentDelete = edudao.educationCommentDelete(eduComment);
			if (educationCommentDelete>0) {
				educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
			}else {
				educommentList = null;
			}
		}
		return educommentList;
	}

	// 좋아요
	public List<EduCommentDTO> educationCommentLike(EduCommentDTO eduComment) {
		// 좋아요 테이블 아이디 조회
		EduCommentLikeDTO educationCommentLikeCheck = edudao.educationCommentLikeCheck(eduComment);
		
		if(educationCommentLikeCheck!=null) {
			// 좋아요 취소
			int educationUnLike = edudao.educationCommentUnLike(eduComment);
			if(educationUnLike>0) {
				int educationUnLikeDelete = edudao.educationCommentLikeUserIdDelete(eduComment);
				if(educationUnLikeDelete>0) {
					educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
				}
			}
		}else {
			// 좋아요
			int educationLikeAdd = edudao.educationCommentLikeAdd(eduComment);
			if(educationLikeAdd>0) {
				int educationLike = edudao.educationCommentLike(eduComment);
				if(educationLike>0) {
					educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
				}
			}
		}
		return educommentList;
	}

	// 댓글 수정
	public List<EduCommentDTO> educationCommentModify(EduCommentDTO eduComment) {
		int educationCommentModify = edudao.educationCommentModify(eduComment);
		
		if (educationCommentModify >0) {
			educommentList = edudao.educationCommentList(eduComment.getCommentEduNum());
		}else {
			educommentList = null;
		}
		return educommentList;
	}
	EduCommentDTO edu = new EduCommentDTO();
	
	EducationDTO eduu = new EducationDTO();
	
	//좋아요 수 조회
	public EducationDTO eduLike(EducationDTO education) {
		//좋아요 수
		eduu.setEduLike(edudao.eduLike(education));
		eduu.setLikeUserId(edudao.eduLikeUserId(education));
		
		return eduu;
	}
	
	// 교육 게시글 좋아요
	public EducationDTO educationLike(EducationDTO education) {
		edudao.eduLikeUser(education);
		edudao.educationLike(education);
		eduu.setEduLike(edudao.eduLike(education));
		eduu.setLikeUserId(edudao.eduLikeUserId(education));
	
		return eduu;
	}
	
	// 교육 게시글 좋아요 취소
	public EducationDTO educationUnLike(EducationDTO education) {
		edudao.educationUnLike(education);
		edudao.eduUnLikeUser(education);
		eduu.setEduLike(edudao.eduLike(education));
		eduu.setLikeUserId(edudao.eduLikeUserId(education));
		
		return eduu;
	}



}
