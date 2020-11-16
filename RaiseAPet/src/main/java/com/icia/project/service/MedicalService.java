package com.icia.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.MedicalDAO;
import com.icia.project.dao.MemberDAO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;

@Service
public class MedicalService {

	ModelAndView mav = new ModelAndView();
	List<CouponDTO> lcd = new ArrayList<CouponDTO>();
	List<MedicalDTO> lmd = new ArrayList<MedicalDTO>();
	MedicalDTO md = new MedicalDTO();

	@Autowired
	MedicalDAO mddao = new MedicalDAO();

	@Autowired
	HttpSession session;

	@Autowired
	MemberDAO mDAO;

	// 의사리스트
	public ModelAndView medicalList(MedicalDTO medical) {
		List<MedicalDTO> medicalList = mddao.medicalList(medical);
		mav.addObject("medicalList", medicalList);
		mav.setViewName("MedicalDoctorList");
		return mav;
	}

	// 의사 정보
	public ModelAndView DoctorInformation(MedicalDTO medical) {
		md = mddao.DoctorInformation(medical);
		mav.addObject("doctor", md);
		mav.setViewName("MedicalReservation");
		return mav;
	}

	// 예약페이지
	public ModelAndView medicalReservationForm(MedicalDTO medical) {
		md = mddao.DoctorInformation(medical);
		mav.addObject("doctor", md);
		mav.setViewName("MedicalReservationForm");
		return mav;
	}

	// 의료진 예약 날짜확인
	public List<MedicalDTO> medicalReserveResult(MedicalDTO medical) {
		lmd = mddao.medicalReserveResult(medical.getMedicalReserveDate());
		return lmd;
	}

	// 쿠폰확인
	public List<CouponDTO> medicalReserveCouponList(String userId) {
		// 쿠폰 정보 가져오기
		List<CouponDTO> lcd = mDAO.memberCouponList(userId);
		return lcd;
	}

	// 의료진 예약하기
	public ModelAndView medicalReservation(MedicalDTO medical, CouponDTO coupon, MemberDTO member) {
		if (medical.getMedicalReservePayment().equals("온라인결제")) {
			// 결제 정보가 온라인결제라면 정보값을 들고 다시 카카오페이로 이동해라
			mav.addObject("coupon", coupon);
			mav.addObject("member", member);
			mav.addObject("medical", medical);
			mav.setViewName("MedicalReservationKakao");
		} else {
			// 아니면 여기서 예약하고 끝
			mddao.medicalReservation(medical);
			//포인트적립
			mddao.medicalReservationAddPoint(medical);
			MemberDTO member2 = mddao.memberSelect(medical);
			session.setAttribute("loginUser", member2);
			mav.setViewName("MedicalReservationSuccess");
		}
		return mav;
	}

	// 의료진 카카오페이로 예약하기(Ajax)
	public MedicalDTO medicalKakaoPayment(MedicalDTO medical, CouponDTO coupon, MemberDTO member) {
		// 쿠폰적용
		if (coupon.getCouponCode() != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userId", member.getUserId());
			map.put("couponCode", coupon.getCouponCode());
			mddao.ReservationCoupon(map);
		}

		// 포인트적용
		if (member.getUserPoint() > 0) {
			mddao.ReservationPoint(member);
		}

		// 결제 정보 저장하기
		mddao.medicalReservation(medical);
		
		//결제정보 저장 후 포인트 적립
			mddao.medicalReservationAddPoint(medical);
			MemberDTO member2 = mddao.memberSelect(medical);
			session.setAttribute("loginUser", member2);

		return md;
	}

}
