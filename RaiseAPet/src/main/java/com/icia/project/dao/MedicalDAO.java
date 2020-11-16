package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
@Repository
public class MedicalDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 의사 리스트 
	public List<MedicalDTO> medicalList(MedicalDTO medical) {
		return sql.selectList("medical.medicalList",medical);
	}
	
	//의사 목록
	public MedicalDTO DoctorInformation(MedicalDTO medical) {
		return sql.selectOne("medical.DoctorInformation",medical);
	}
	
	//의료진날짜확인
	public List<MedicalDTO> medicalReserveResult(String medicalReserveDate) {
		return sql.selectList("medical.DoctorReserveResult", medicalReserveDate);
	}
	
	//예약하기
	public void medicalReservation(MedicalDTO medical) {
		sql.insert("medical.DoctorReservation",medical);
	}
	
	//쿠폰사용(쿠폰삭제)
	public void ReservationCoupon(HashMap<String, Object> map) {
		sql.delete("medical.reservationCoupon",map);
	}
	
	//포인트사용(포인트차감)
	public void ReservationPoint(MemberDTO member) {
		sql.update("medical.reservationPoint",member);
	}
	
	//포인트적립
	public void medicalReservationAddPoint(MedicalDTO medical) {
		sql.update("medical.memberAddpoint",medical);		
	}

	public MemberDTO memberSelect(MedicalDTO medical) {
		return sql.selectOne("medical.memberSelect",medical);
	}
	


}
