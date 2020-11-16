package com.icia.project.controller;


import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.service.BeautyService;

@Controller
public class BeautyController {

	private ModelAndView mav = new ModelAndView();
	List<CouponDTO> lcd = new ArrayList<CouponDTO>();
	
	@Autowired
	private BeautyService beautySvc;
	
	
	// 미용 페이지 이동
	@RequestMapping(value="/beauty")
	public String Design() {
		return "Beauty";
	}
	
	// 미용사 리스트 페이지 이동
	@RequestMapping(value="/beautyList", method = RequestMethod.GET)
	public ModelAndView beautyList(@ModelAttribute BeautyDTO beauty) {
		mav = beautySvc.beautyList(beauty);
		return mav;
	}
	
	// 미용사 정보
	BeautyDTO bdl = new BeautyDTO();
	@RequestMapping(value = "/designerInformation", method = RequestMethod.GET)
	public ModelAndView designerInformation(@ModelAttribute BeautyDTO beauty) {
		mav = beautySvc.DesignerInformation(beauty);
		return mav;
	}
	// 미용 예약 페이지 이동
	@RequestMapping(value="/beautyReservationForm", method = RequestMethod.GET)
	public ModelAndView beautyReservationForm(@ModelAttribute BeautyDTO beauty) {
		mav = beautySvc.beautyReservationForm(beauty);
		return mav;
	}
	
	//미용 예약 날짜확인
	List<BeautyDTO> lbd = new ArrayList<BeautyDTO>();
	@RequestMapping(value = "/beautyReserveResult", method = RequestMethod.GET)
	public @ResponseBody List<BeautyDTO> beautyReserveResult(@ModelAttribute BeautyDTO beauty) {
		lbd = beautySvc.beautyReserveResult(beauty);
		return lbd;
	}
	
	//미용 예약 쿠폰확인
	@RequestMapping(value = "/beautyReserveCouponList", method = RequestMethod.GET)
	public @ResponseBody List<CouponDTO> beautyReserveCouponList(@RequestParam String userId) {
		lcd = beautySvc.beautyReserveCouponList(userId);
		return lcd;
	}
	

	// 미용 예약하기
	@RequestMapping(value="/beautyReservation",method = RequestMethod.POST)
	public ModelAndView beautyReservation(@ModelAttribute BeautyDTO beauty,@ModelAttribute CouponDTO coupon,@ModelAttribute MemberDTO member) {
		mav = beautySvc.beautyReservation(beauty,coupon,member);
		return mav;
	}
	
	// 미용사 예약하기(카카오페이Ajax)
	@RequestMapping(value = "/beautyKakaoPayment",method = RequestMethod.POST)
	public @ResponseBody BeautyDTO beautyKakaoPayment(@ModelAttribute BeautyDTO beauty,@ModelAttribute CouponDTO coupon,@ModelAttribute MemberDTO member) {
		bdl = beautySvc.beautyKakaoPayment(beauty,coupon,member);
		return bdl;
	}
}
