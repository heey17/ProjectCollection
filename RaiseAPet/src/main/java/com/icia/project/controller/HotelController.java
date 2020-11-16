package com.icia.project.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;


import com.icia.project.dto.HotelDTO;

import com.icia.project.service.HotelService;

@Controller
public class HotelController {

	
	@Autowired
	HttpSession session;
	
	@Autowired
	HotelService hotel;
	
	ModelAndView mav = new ModelAndView();

	// 호텔 목록
	@RequestMapping(value = "hotelList", method = RequestMethod.GET)
	public ModelAndView reviewWrite(@ModelAttribute HotelDTO Hotel){
		
		mav = hotel.hotelList1(Hotel);
		mav = hotel.hotelList2(Hotel);
		mav = hotel.hotelList3(Hotel);
		
		return mav;
	}
	// 호텔 상세보기
	@RequestMapping(value = "hotelReservation", method = RequestMethod.GET)
	public ModelAndView hotelReservation(@RequestParam(value="code")String code){
		mav = hotel.hotelReservation(code);
		return mav;
	}
	
	// 카카오페이
	@RequestMapping(value = "kakaopay")
	public ModelAndView kakaopay(@ModelAttribute HotelDTO Hotel){
		mav = hotel.kakaopay(Hotel);
		return mav;
	}
	// 현장결제
	@RequestMapping(value = "cashiPayment", method = RequestMethod.POST)
	public ModelAndView cashiPayment(@ModelAttribute HotelDTO Hotel){
		mav = hotel.cashiPayment(Hotel);
	return mav;
	}
}
