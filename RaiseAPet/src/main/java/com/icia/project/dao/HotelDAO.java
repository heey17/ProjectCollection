package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MemberDTO;
@Repository
public class HotelDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	// 호텔 작은방
	public HotelDTO hotelList1(HotelDTO hotel) {
		return sql.selectOne("Hotel.hotelList1", hotel);
	}
	
	// 호텔 중간방
	public HotelDTO hotelList2(HotelDTO hotel) {
		return sql.selectOne("Hotel.hotelList2", hotel);
	}
	
	// 호텔 큰방
	public HotelDTO hotelList3(HotelDTO hotel) {
		return sql.selectOne("Hotel.hotelList3", hotel);
	}

	
	// 호텔 상세보기
	public HotelDTO hotelReservation(String code) {
		return sql.selectOne("Hotel.hotelReservation",code);
	}
	// 현장결제
	public int HotelCashi(HotelDTO hotel) {
		return sql.insert("Hotel.hotelcashi",hotel);
	}
	// 온라인결제
	public int HotelCard(HotelDTO hotel) {
		return sql.insert("Hotel.hotelcashi",hotel);
	}
	// 쿠폰리스트
	public List<CouponDTO> coupon(String userid) {
		return sql.selectList("member.memberCouponList",userid);
	}

	// 쿠폰삭제
	public int couponDelete(HashMap<String, Object> hashMap) {
		return sql.delete("Hotel.couponDelete",hashMap);
	}
	
	// 포인트 차감 
	public int use_point(HashMap<String, Object> hashMap) {
		return sql.update("Hotel.pointMinus",hashMap);
	}
	// 포인트 적립
	public int hotelPoint(HotelDTO hotel) {
		return sql.update("Hotel.pointPlus",hotel);
	}

	public MemberDTO memberSelect(HotelDTO hotel) {
		return sql.selectOne("Hotel.memberSelect",hotel);
	}

	

	

	

	




}
