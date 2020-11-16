package com.icia.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.HotelDAO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;

@Service
public class HotelService {
	ModelAndView mav = new ModelAndView();
	@Autowired
	HotelDAO htdao;
	@Autowired
	HttpSession session;
	PageDTO paging = new PageDTO();

	// 호텔 작은방
	public ModelAndView hotelList1(HotelDTO hotel) {
		HotelDTO hotelList = htdao.hotelList1(hotel);
		mav.addObject("hotel1", hotelList);
		mav.setViewName("Hotel");
		return mav;
	}
	
	//호텔 중간방
	public ModelAndView hotelList2(HotelDTO hotel) {
		HotelDTO hotelList = htdao.hotelList2(hotel);
		mav.addObject("hotel2", hotelList);
		mav.setViewName("Hotel");
		return mav;
	}
	
	// 호텔 큰방
	public ModelAndView hotelList3(HotelDTO hotel) {
		HotelDTO hotelList = htdao.hotelList3(hotel);
		mav.addObject("hotel3", hotelList);
		mav.setViewName("Hotel");
		return mav;
	}


	// 호텔상세보기
	public ModelAndView hotelReservation(String code) {
		HotelDTO hotelView = htdao.hotelReservation(code);

		mav.addObject("hotel", hotelView);
		mav.setViewName("HotelReservationForm");
		return mav;
	}
	
	// 호텔예약 온라인결제
	public int cardPayment(HotelDTO hotel, CouponDTO coupon, int use_point) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginUser");
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("use_point", use_point);
		hashMap.put("couponCode",coupon.getCouponCode());
		hashMap.put("UserId",hotel.getHotelUserId());
		// 사용쿠폰 삭제
		if(coupon.getCouponCode() != null) {
			htdao.couponDelete(hashMap);
		} 
		// 사용 포인트 차감
		if(use_point > 0) { 
			htdao.use_point(hashMap);
		}
		hotel.setHotelUserName(member.getUserName());
		hotel.setHotelUserId(member.getUserId());
		hotel.setHotelUserPhone(member.getUserPhone());
		// 호텔 예약정보 저장
		int hotelCard = htdao.HotelCard(hotel);
		// 포인트 적립
		int result = htdao.hotelPoint(hotel);
		
		MemberDTO member2 = htdao.memberSelect(hotel);
		session.setAttribute("loginUser", member2);
		
		return result;
	}
	
	// 호텔예약 현장결제
	public ModelAndView cashiPayment(HotelDTO hotel) {
		int hotelcashi = htdao.HotelCashi(hotel);

		if (hotelcashi > 0) {
			mav.setViewName("Hotel");
		}
		return mav;
	}
	// 카카오페이
	public ModelAndView kakaopay(HotelDTO hotel) {
		hotel.setHotelCheckOut(hotel.getHotelCheckOut().replace("-", ""));
		hotel.setHotelCheckIn(hotel.getHotelCheckIn().replace("-", ""));
		String userId = hotel.getHotelUserId();
		List<CouponDTO> couponList = htdao.coupon(userId);
		
		int day = Integer.parseInt(hotel.getHotelCheckOut())-Integer.parseInt(hotel.getHotelCheckIn());
		int sum = day * hotel.getHotelPrice();

		mav.addObject("couponList",couponList);
		mav.addObject("sum",sum);
		mav.addObject("hotel",hotel);
		mav.setViewName("kakaopay");
		return mav;
	}

	
	


}
