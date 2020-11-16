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

import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.service.MedicalService;

@Controller
public class MedicalController {

	private ModelAndView mav = new ModelAndView();
	List<CouponDTO> lcd = new ArrayList<CouponDTO>();
	List<MedicalDTO> lmd = new ArrayList<MedicalDTO>();
	@Autowired
	private MedicalService medicalSvc;

	MedicalDTO md = new MedicalDTO();

	// 병원 페이지 이동
	@RequestMapping(value = "/medical")
	public String Medical() {
		return "Medical";
	}

	// 의사 리스트 페이지 이동
	@RequestMapping(value = "/medicalDoctorList", method = RequestMethod.GET)
	public ModelAndView medicalList(@ModelAttribute MedicalDTO medical) {
		mav = medicalSvc.medicalList(medical);
		return mav;
	}

	// 의사 정보
	@RequestMapping(value = "/doctorInformation", method = RequestMethod.GET)
	public ModelAndView doctorInformation(@ModelAttribute MedicalDTO medical) {
		mav = medicalSvc.DoctorInformation(medical);
		return mav;
	}

	// 예약페이지
	@RequestMapping(value = "/medicalReservation", method = RequestMethod.GET)
	public ModelAndView medicalReservationForm(@ModelAttribute MedicalDTO medical) {
		mav = medicalSvc.medicalReservationForm(medical);
		return mav;
	}

	//의료진 예약 날짜확인
	@RequestMapping(value = "/medicalReserveResult", method = RequestMethod.GET)
	public @ResponseBody List<MedicalDTO> medicalReserveResult(@ModelAttribute MedicalDTO medical) {
		lmd = medicalSvc.medicalReserveResult(medical);
		return lmd;
	}

	//의료진 예약 쿠폰확인
	@RequestMapping(value = "/medicalReserveCouponList", method = RequestMethod.GET)
	public @ResponseBody List<CouponDTO> medicalReserveCouponList(@RequestParam String userId) {
		lcd = medicalSvc.medicalReserveCouponList(userId);
		return lcd;
	}

	//의료진 예약하기
	@RequestMapping(value = "/medicalReservationForm", method = RequestMethod.POST)
	public ModelAndView medicalReservation(@ModelAttribute MedicalDTO medical, @ModelAttribute CouponDTO coupon,
			@ModelAttribute MemberDTO member) {
		mav = medicalSvc.medicalReservation(medical, coupon, member);
		return mav;
	}

	//의료진 예약하기(카카오페이Ajax)
	@RequestMapping(value = "/medicalKakaoPayment", method = RequestMethod.POST)
	public @ResponseBody MedicalDTO medicalKakaoPayment(@ModelAttribute MedicalDTO medical,
			@ModelAttribute CouponDTO coupon, @ModelAttribute MemberDTO member) {
		md = medicalSvc.medicalKakaoPayment(medical, coupon, member);
		return md;
	}

}
