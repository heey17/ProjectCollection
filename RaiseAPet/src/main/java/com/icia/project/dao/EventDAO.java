package com.icia.project.dao;


import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.EventCommentDTO;
import com.icia.project.dto.EventCommentLikeDTO;
import com.icia.project.dto.EventDTO;
import com.icia.project.dto.MemberDTO;


@Repository
public class EventDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	
	//이벤트게시판
	//EventList
	public List<EventDTO> EventList(EventDTO event) {
		return sql.selectList("event.eventList",event);
	}
	
	//이벤트게시판 조회수 증가
	public int EventHit(EventDTO event) {
		return sql.update("event.eventHit",event);
	}
	
	//EventView
	public EventDTO EventView(EventDTO event) {
		return sql.selectOne("event.eventView",event);
	}
	
	
	
	
	//댓글

	//EventCommentList
	public List<EventCommentDTO> EventCommentList(int commentEventNum) {
		return sql.selectList("event.eventCommentList",commentEventNum);
	}
	
	
	//EventCommentWrite
	public int EventCommentWrite(EventCommentDTO eventComment) {
		return sql.insert("event.eventCommentWrite",eventComment);
	}
	
	//EventCommentLikeDelete
	public int EventCommentLikeDelete(EventCommentDTO eventComment) {
		return sql.delete("event.EventCommentLikeDelete", eventComment);
	}
	
	//EventCommentDelete
	public int EventCommnetDelete(EventCommentDTO eventComment) {
		return sql.delete("event.eventCommentDelete",eventComment);
	}
		
	//EventCommentModifyProcess
	public int EventCommentModifyProcess(EventCommentDTO eventComment) {
		return sql.update("event.eventCommentModifyProcess", eventComment);
	}
	
	//EventCommentLikeCheck(좋아요 누르기 전에 아이디 체크)
	public String EventCommentLikeCheck(EventCommentDTO eventComment) {
		return sql.selectOne("event.eventCommentLikeCheck",eventComment);
	}
	//EventCommentLikeAdd(좋아요테이블에 값 넣기)
	public int EventCommentLikeAdd(EventCommentDTO eventComment) {
		return sql.insert("event.eventCommentLikeAdd",eventComment);
	}
	
	//EventCommentLike
	public int EventCommentLike(EventCommentDTO eventComment) {
		return sql.update("event.eventCommentLike",eventComment);
	}
	
	//EventCommentUnLike
	public int EventCommentUnLike(EventCommentDTO eventComment) {
		return sql.update("event.eventCommentUnLike",eventComment);
	}
	
	//EventCommentLikeUserIdDelete(취소누르면 테이블 안에 있는 아이디삭제)
	public int EventCommentLikeUserIdDelete(EventCommentDTO eventComment) {
		return sql.delete("event.EventCommentLikeUserIdDelete", eventComment);
	}
	
	//쿠폰 지급
	public int EventCouponPayment(HashMap<String, String> map) {
		return sql.insert("event.eventCouponPayment",map);
	}
	
	//포인트 지급
	public int EventPointPayment(MemberDTO member) {
		return sql.update("event.eventPointPayment",member);
	}
	
	
	
	
	
	
	

	

}
