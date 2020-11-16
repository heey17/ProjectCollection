package com.icia.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;



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


import com.icia.project.dto.EventCommentDTO;
import com.icia.project.dto.EventDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.service.EventService;

@Controller

public class EventController {

	ModelAndView mav = new ModelAndView();

	@Autowired
	EventService eventSvc = new EventService();
	
	MemberDTO member = new MemberDTO();

	// 이벤트

	// EventList
	@RequestMapping(value = "/eventList", method = RequestMethod.GET)
	public ModelAndView eventList(@ModelAttribute EventDTO event) {
		mav = eventSvc.EventList(event);

		return mav;
	}

	// EventView
	@RequestMapping(value = "/eventView", method = RequestMethod.GET)
	public ModelAndView eventView(@ModelAttribute EventDTO event) {
		mav = eventSvc.EventView(event);
		return mav;
	}
	
	//쿠폰
	
	//쿠폰지급
	@RequestMapping(value="/eventCouponPayment",method=RequestMethod.GET)
	public @ResponseBody HashMap<String, String> coupon(@RequestParam("eventCouponCode")String eventCouponCode,@RequestParam("userId")String userId) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("eventCouponCode", eventCouponCode);
		map.put("userId", userId);
	
		map = eventSvc.EventCouponPayment(map);
		return map;
	}
	
	//이벤트게임
	
	// 이벤트게임jsp
	@RequestMapping(value="/eventGame", method=RequestMethod.GET)
	public String eventGame() {
		return "EventGame";
	}
	//벽돌부시기 게임
	@RequestMapping(value="/stonebreakgame", method=RequestMethod.GET)
	public String Game() {
		return "EventStoneBreakGame";
	}
	
	//달리기 게임
	@RequestMapping(value="/gunGame", method=RequestMethod.GET)		
	public String Game2() {
		return "EventGunGame";
	}
	
	//테트리스
	@RequestMapping(value="/tetrisGame", method=RequestMethod.GET)		
	public String Game3() {
		return "EventTetris";
	}
	
	//카드맞추기
	@RequestMapping(value="/cardGame", method=RequestMethod.GET)		
	public String Game4() {
		return "EventCardGame";
	}
		
	//겜 승리시 포인트 지급
	@RequestMapping(value="/pointPayment", method=RequestMethod.GET)
	public @ResponseBody MemberDTO pointPayment(@ModelAttribute MemberDTO member) {
		member = eventSvc.pointPayment(member);
		return member;
	}

	// 댓글

	// 댓글 리스트
	List<EventCommentDTO> ecl = new ArrayList<EventCommentDTO>();
	
	//댓글DTO
	EventCommentDTO ecd = new EventCommentDTO();

	// EventCommentList
	@RequestMapping(value = "/commentList", method = RequestMethod.GET)
	public @ResponseBody List<EventCommentDTO> eventCommentList(@ModelAttribute EventCommentDTO eventComment) {
		ecl = eventSvc.EventCommentList(eventComment);
		return ecl;
	}

	// EventCommentWrite
	@RequestMapping(value = "/commentWrite",method = RequestMethod.POST)
	public @ResponseBody List<EventCommentDTO> eventCommentWrite(MultipartHttpServletRequest multi,@ModelAttribute EventCommentDTO eventComment) throws IllegalStateException, IOException {	
		
		MultipartFile commentImageFile = eventComment.getCommentImageFile();
		//실제로 업로드 된 파일

		String fileName = commentImageFile.getOriginalFilename();
		// 업로드 된 파일의 이름
		
		eventComment.setCommentImage(fileName);
		
		// 저장할 공간
		String savePath = "C:/Users/1/Desktop/RaiseApet/src/main/webapp/resources/eventCommentFile/"
				+ fileName;
		
		//파일이 업로드 될 경우(첨부파일 선택 할 경우)
		if (!commentImageFile.isEmpty()) {
			commentImageFile.transferTo(new File(savePath));
		}
		//우리가 파일을 업로드한 경우만 boardFile에 넣겠다.	
		
		eventComment.setCommentEventNum(Integer.parseInt(multi.getParameter("num")));
		eventComment.setCommentImage(fileName);
		eventComment.setCommentUserId(multi.getParameter("id"));
		eventComment.setCommentContents(multi.getParameter("commentContents"));
		
		ecl = eventSvc.EventCommentWrite(eventComment);
		return ecl;
	}	

	// EventCommentDelete
	@RequestMapping(value = "/commentDelete", method = RequestMethod.GET)
	public @ResponseBody List<EventCommentDTO> eventCommentDelete(@ModelAttribute EventCommentDTO eventComment) {
		ecl = eventSvc.EventCommentDelete(eventComment);
		return ecl;
	}

	// EventCommentModifyProcess
	@RequestMapping(value = "/commnetModifyProcess", method = RequestMethod.GET)
	public @ResponseBody List<EventCommentDTO> eventCommentModifyProcess(@ModelAttribute EventCommentDTO eventComment) {
		ecl = eventSvc.EventCommentModifyProcess(eventComment);
		return ecl;
	}


	// EventCommentLike
	@RequestMapping(value = "/commentLike", method = RequestMethod.GET)
	public @ResponseBody List<EventCommentDTO> eventCommentLike(@ModelAttribute EventCommentDTO eventComment) {
		ecl = eventSvc.EventCommentLike(eventComment);
		return ecl;
	}
}
