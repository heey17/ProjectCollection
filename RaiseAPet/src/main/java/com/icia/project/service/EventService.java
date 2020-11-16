package com.icia.project.service;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.EventDAO;

import com.icia.project.dto.EventCommentDTO;
import com.icia.project.dto.EventCommentLikeDTO;
import com.icia.project.dto.EventDTO;
import com.icia.project.dto.MemberDTO;

@Service
public class EventService {

	ModelAndView mav = new ModelAndView();

	@Autowired
	EventDAO edao = new EventDAO();

	@Autowired
	HttpSession session;

	List<EventCommentDTO> commentList = new ArrayList<EventCommentDTO>();
	
	
	MemberDTO member = new MemberDTO();
	
	// 이벤트게시판
	// EventList
	public ModelAndView EventList(EventDTO event) {
		List<EventDTO> eventList = edao.EventList(event);
		mav.addObject("eventList", eventList);
		mav.setViewName("EventList");
		return mav;
	}

	// EventView
	public ModelAndView EventView(EventDTO event) {
		//조회수 증가
		int eventHit = edao.EventHit(event);
			if(eventHit>0) {
				//상세조회
				EventDTO eventView = edao.EventView(event);
				mav.addObject("eventView", eventView);
				mav.setViewName("EventView");
			}
		return mav;
	}
	
	//쿠폰
	//쿠폰지급
	public HashMap<String, String> EventCouponPayment(HashMap<String, String> map) {
		edao.EventCouponPayment(map);
		return map;
	}
	
	//포인트
	//PointPayment
	public MemberDTO pointPayment(MemberDTO member) {
		edao.EventPointPayment(member);
		return member;
	}

	// 댓글

	List<EventCommentDTO> ecl = new ArrayList<EventCommentDTO>();
	
	EventCommentLikeDTO EventCommentLike = new EventCommentLikeDTO();

	// EventCommentList
	public List<EventCommentDTO> EventCommentList(EventCommentDTO eventComment) {
		commentList = edao.EventCommentList(eventComment.getCommentEventNum());
		
		return commentList;
	}

	// EventCommentWrite
	public List<EventCommentDTO> EventCommentWrite(EventCommentDTO eventComment) throws IllegalStateException, IOException {
		int eventCommentWrite = edao.EventCommentWrite(eventComment);
		if (eventCommentWrite > 0) {
			commentList = edao.EventCommentList(eventComment.getCommentEventNum());
		} else {
			commentList = null;
		}
		return commentList;
	}

	// EventCommentDelete
	public List<EventCommentDTO> EventCommentDelete(EventCommentDTO eventComment) {
			int eventCommentLikeDelete = edao.EventCommentLikeDelete(eventComment);
			if(eventCommentLikeDelete>0) {
				int eventCommentDelete = edao.EventCommnetDelete(eventComment);
				if (eventCommentDelete > 0) {
					commentList = edao.EventCommentList(eventComment.getCommentEventNum());
				} else {
					commentList = null;
				}
			}else {
				int eventCommentDelete = edao.EventCommnetDelete(eventComment);
				if (eventCommentDelete > 0) {
					commentList = edao.EventCommentList(eventComment.getCommentEventNum());
				} else {
					commentList = null;
				}
			}
		return commentList;
	}

	// EventCommentModifyProcess
	public List<EventCommentDTO> EventCommentModifyProcess(EventCommentDTO eventComment) {		
		int eventCommentModifyProcess = edao.EventCommentModifyProcess(eventComment);
		  if (eventCommentModifyProcess > 0) {
			  commentList = edao.EventCommentList(eventComment.getCommentEventNum());
		  }else {
			  commentList = null;
		  }
		return commentList;
	}

	// EventCommentLike
	public List<EventCommentDTO> EventCommentLike(EventCommentDTO eventComment) {		
		//좋아요 테이블에 아이디 값 조회
		String eventCommentLikeCheck = edao.EventCommentLikeCheck(eventComment);
		if(eventCommentLikeCheck == null) {
			int eventLikeAdd = edao.EventCommentLikeAdd(eventComment);
			if(eventLikeAdd>0) {
				int eventLike = edao.EventCommentLike(eventComment);
				if (eventLike > 0) {
					commentList = edao.EventCommentList(eventComment.getCommentEventNum());
				}
			}
		}else {
			int eventUnLikeDelete = edao.EventCommentLikeUserIdDelete(eventComment);
			if(eventUnLikeDelete>0) {
				//좋아요 -1을 하고 commentList로 가라
				int eventUnLike = edao.EventCommentUnLike(eventComment);
				if (eventUnLike > 0) {
					commentList = edao.EventCommentList(eventComment.getCommentEventNum());
				}
			} 
		}
		return commentList;
	}
}	

