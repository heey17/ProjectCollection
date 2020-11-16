package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.MemberDTO;
@Repository
public class BeautyDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	// 미용 리스트
	public List<BeautyDTO> beautyList(BeautyDTO beauty) {
		return sql.selectList("beauty.beautyList",beauty);
	}

	//디자이너 정보
	public BeautyDTO DesignerInformation(BeautyDTO beauty) {
		return sql.selectOne("beauty.designerInformation",beauty);
	}
	
	//예약된 정보 db에 넣기	
	public void beautyReservation(BeautyDTO beauty) {
		sql.insert("beauty.beautyReservation",beauty);
	}
	
	//미용예약 날짜확인
	public List<BeautyDTO> beautyReserveResult(String beautyReserveDate) {
		return sql.selectList("beauty.beautyReserveResult", beautyReserveDate);
	}
	
	//쿠폰사용(쿠폰삭제)
	public void ReservationCoupon(HashMap<String, Object> map) {
		sql.delete("beauty.reservationCoupon",map);
	}
	//포인트사용(포인트차감)
	public void ReservationPoint(MemberDTO member) {
		sql.update("beauty.reservationPoint",member);
	}
	
	//포인트적립
	public void beautyReservationAddPoint(BeautyDTO beauty) {
		sql.update("beauty.memberAddpoint",beauty);		
	}

	public MemberDTO memberSelect(BeautyDTO beauty) {
		return sql.selectOne("beauty.memberSelect",beauty);
	}

	
	
	
	

}
