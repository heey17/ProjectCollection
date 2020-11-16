package com.icia.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.BeautyDAO;
import com.icia.project.dao.MemberDAO;
import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.MemberDTO;

@Service
public class BeautyService {
	
	ModelAndView mav = new ModelAndView();
	List<BeautyDTO> lbd = new ArrayList<BeautyDTO>();
	List<CouponDTO> lcd = new ArrayList<CouponDTO>();
	
	@Autowired
	BeautyDAO btdao = new BeautyDAO();
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberDAO mDAO;
	
	BeautyDTO bdl = new BeautyDTO();
	
	// 미용사 리스트
	public ModelAndView beautyList(BeautyDTO beauty) {
		List<BeautyDTO> beautyList = btdao.beautyList(beauty);
		mav.addObject("beautyList",beautyList);
		mav.setViewName("BeautyDesignerList");
		return mav;
	}
	
	//디자이너 정보
	public ModelAndView DesignerInformation(BeautyDTO beauty) {
		BeautyDTO Designer = btdao.DesignerInformation(beauty);
		mav.addObject("Designer",Designer);
		mav.setViewName("DesignerInformation");
		return mav;
	}
	
	//예약페이지
	public ModelAndView beautyReservationForm(BeautyDTO beauty) {
		//예약페이지로 넘어갈때 디자이너정보 갖고 넘어가기
		BeautyDTO Designer = btdao.DesignerInformation(beauty);
		mav.addObject("Designer",Designer);
		mav.setViewName("BeautyReservationForm");
		return mav;
	}
	
	//미용예약 날짜확인
	public List<BeautyDTO> beautyReserveResult(BeautyDTO beauty) {
		lbd = btdao.beautyReserveResult(beauty.getBeautyReserveDate());
		return lbd;
	}
	
	//쿠폰확인
	public List<CouponDTO> beautyReserveCouponList(String userId) {			
		//쿠폰 정보 가져오기
		List<CouponDTO> lcd = mDAO.memberCouponList(userId);
		
		return lcd;
	}
	
	//미용예약하기
	public ModelAndView beautyReservation(BeautyDTO beauty, CouponDTO coupon, MemberDTO member) {
		if(beauty.getBeautyReservePayment().equals("온라인결제")) {
			//결제 정보가 온라인결제라면 정보값을 들고 다시 카카오페이로 이동해라
			mav.addObject("coupon",coupon);
			mav.addObject("member",member);
			mav.addObject("beauty",beauty);
			mav.setViewName("BeautyReservationKakao");
		}else {
			//아니면 여기서 예약하고 끝
			btdao.beautyReservation(beauty);
			//회원포인트 적립
			btdao.beautyReservationAddPoint(beauty);
			MemberDTO member2 = btdao.memberSelect(beauty);
			session.setAttribute("loginUser", member2);
			mav.setViewName("BeautyReservationSuccess");
		}
		return mav;
	}
	
	//미용카카오페이로 예약하기
	public BeautyDTO beautyKakaoPayment(BeautyDTO beauty, CouponDTO coupon, MemberDTO member) {
		
		//쿠폰적용
		if(coupon.getCouponCode() != null) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userId", member.getUserId());
		map.put("couponCode", coupon.getCouponCode());
		btdao.ReservationCoupon(map);
		}
		
	    //포인트적용
		if(member.getUserPoint() > 0) {
		btdao.ReservationPoint(member);
		}
		
		//결제 정보 저장하기
		btdao.beautyReservation(beauty);
		//회원포인트 적립
		btdao.beautyReservationAddPoint(beauty);
		
		MemberDTO member2 = btdao.memberSelect(beauty);
		session.setAttribute("loginUser", member2);
		
		return bdl;
	}
	
	

		
	
}
