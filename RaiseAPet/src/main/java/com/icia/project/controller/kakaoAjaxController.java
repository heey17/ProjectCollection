package com.icia.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.service.HotelService;

@Controller
@RequestMapping("/kakao/*")
public class kakaoAjaxController {
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HotelService hotel;
	
	// 카드결제
		@RequestMapping(value = "cardPament", method = RequestMethod.GET)
		public @ResponseBody int cardPayment(@ModelAttribute HotelDTO Hotel,CouponDTO coupon,@RequestParam(value="use_point", required=false, defaultValue="0")int use_point){
			int result= hotel.cardPayment(Hotel,coupon,use_point);
		return result;
		}
}
