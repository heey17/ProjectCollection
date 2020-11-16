package com.icia.project.controller;





import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.service.GoodsService;

@Controller
public class GoodsController {

	ModelAndView mav = new ModelAndView();
	
	@Autowired
	private GoodsService goodsSvc = new GoodsService();
	
	@Autowired
	HttpSession session;
	
	GoodsDTO gdo = new GoodsDTO();
	
	// 순 정렬 및 검색 데이터 요청 - 목록 요청
	@RequestMapping(value="goodsList", method=RequestMethod.GET)
	public ModelAndView goodsLineUpList(@RequestParam(value="searchData", required=false, defaultValue="") String searchData,
										 @RequestParam(value="goodsCategory", required=false, defaultValue="") String goodsCategory,
										 @RequestParam(value="goodsAnimalKind", required=false, defaultValue="") String goodsAnimalKind,
										 @RequestParam(value="lineUp", required=false, defaultValue="최신순") String lineUp,
										 @RequestParam(value="page", required=false, defaultValue="1") int page,
										 @RequestParam(value="count", required=false, defaultValue="4") int count,
										 @ModelAttribute GoodsDTO goods) {
		
		mav = goodsSvc.goodsLineUpList(searchData, goodsCategory, lineUp, page, count,goods,goodsAnimalKind);
		return mav;
	}
	
	
	// 용품 상세정보
	@RequestMapping(value="/goodsView", method = RequestMethod.GET)
	public ModelAndView goodsView(@ModelAttribute GoodsDTO goods,@ModelAttribute MemberDTO member) {
		mav = goodsSvc.goodsView(goods,member);
		return mav;
	}
	
	//용품 좋아요 수
	@RequestMapping(value="/goodsLikeSelect", method = RequestMethod.GET)
	public @ResponseBody GoodsDTO goodsLikeSelect(@ModelAttribute GoodsDTO goods) {
		gdo = goodsSvc.goodsLikeSelect(goods);
		return gdo;
	}

	// 용품 좋아요
	@RequestMapping(value="/goodsLike", method = RequestMethod.GET)
	public @ResponseBody GoodsDTO goodssLike(@ModelAttribute GoodsDTO goods) {
		goodsSvc.goodssLike(goods);
		return gdo;
	}

	// 결제 상세
	@RequestMapping(value="/goodsPayMent", method = RequestMethod.GET)
		public  @ResponseBody ModelAndView goodsPayMent(@ModelAttribute GoodsDTO goods) {
			mav = goodsSvc.GoodsPayMent(goods);
			return mav;
	}
		
	// 카카오페이 결제
	@RequestMapping(value="/goodsPayMents", method=RequestMethod.POST)
		public @ResponseBody GoodsDTO goodsPayMents(@ModelAttribute GoodsDTO goods) {
			gdo = goodsSvc.goodsPayMents(goods);
			return gdo;
	}

		List<GoodsDTO> gask = new ArrayList<GoodsDTO>();

		
		
	// 문의하기 폼
	@RequestMapping(value="/goodsAsk")
	public ModelAndView goodsAskForm(@ModelAttribute GoodsDTO goods) {
			mav = goodsSvc.goodsAskForm(goods);
		return mav;
	}
		
	// 문의하기
	@RequestMapping(value="/goodsAskWrite", method=RequestMethod.GET)
	public @ResponseBody GoodsDTO goodsAsk(@ModelAttribute GoodsDTO goods,@RequestParam(value="askPw", required=false) int askPw)throws IllegalStateException, IOException{
			gd = goodsSvc.goodsAsk(goods);
		return gd;
	}
	// 문의하기 리스트
	@RequestMapping(value="/goodsAskList",method = RequestMethod.GET)
	public @ResponseBody List<GoodsDTO> goodsAskList(@ModelAttribute GoodsDTO goods) {
			gask = goodsSvc.goodsAskList(goods);
		return gask;
	}
	//비밀글 가져오기
	GoodsDTO gd = new GoodsDTO();
	@RequestMapping(value="/goodsAskSecret",method = RequestMethod.GET)
	public @ResponseBody GoodsDTO goodsAskSecret(@ModelAttribute GoodsDTO goods) {
		gd = goodsSvc.goodsAskSecret(goods);
		return gd;
	}
	//장바구니
	@RequestMapping(value="/goodsBasket",method = RequestMethod.GET)
	public @ResponseBody GoodsDTO goodsBasket(@ModelAttribute GoodsDTO goods) {
			goodsSvc.goodsBasket(goods);
		return gd;
	}
		
	// 신규 주소 업데이트
	   @RequestMapping(value="/goodsAddressUpdate", method=RequestMethod.POST)
	public @ResponseBody String AddressUpdate(@RequestParam("postcode") String postcode, @RequestParam("address") String address, @RequestParam("detailAddress") String detailAddress, @RequestParam("extraAddress") String extraAddress) {
		   session.removeAttribute("newAddress");
		   String resultMsg = goodsSvc.addressUpdate(postcode, address, detailAddress, extraAddress); 
		  return resultMsg;
	}
		
		
		
}

