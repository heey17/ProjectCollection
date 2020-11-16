package com.icia.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.project.dao.GoodsDAO;

import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;

@Service
public class GoodsService {
	
	@Autowired
	HttpSession session;
	
	ModelAndView mav = new ModelAndView();
	
	@Autowired
	GoodsDAO goddao = new GoodsDAO();

	List<GoodsDTO> GoodsList = new ArrayList<GoodsDTO>();
	List<GoodsDTO> goodsAskList = new ArrayList<GoodsDTO>();
	GoodsDTO gd = new GoodsDTO();
	PageDTO paging = new PageDTO();
	
	private static final int BLOCK_LIMIT = 12; // 화면에 보여 줄 페이지 번호 갯수
	
	// 용품 리스트	
	public ModelAndView goodsLineUpList(String searchData, String goodsCategory, String lineUp, int page, int count,
			GoodsDTO goods,String goodsAnimalKind) {
		// 페이징처리에 사용될 글 개수 세기
				HashMap<String, Object> goodsMap = new HashMap<String, Object>();
				goodsMap.put("searchData", searchData);
				goodsMap.put("goodsCategory",goodsCategory);
				goodsMap.put("goodsAnimalKind",goodsAnimalKind);
				
				
				 		int listCount = goddao.goodsListCount(goodsMap); 
						int startRow = (page - 1) * count + 1;
						int endRow = page * count;
						int maxPage = (int) (Math.ceil((double) listCount / count));	// ceil : 값보다 큰 정수를 찾는 것.
						int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
						int endPage = startPage + BLOCK_LIMIT - 1;
						if (endPage > maxPage) {
							endPage = maxPage;
						}
						paging.setEndRow(endRow);
						paging.setStartRow(startRow);
						paging.setEndPage(endPage);
						paging.setPage(page);
						paging.setStartPage(startPage);
						paging.setMaxPage(maxPage);
			
				
						goodsMap.put("startRow", startRow);
						goodsMap.put("endRow", endRow);
				
				if(lineUp.equals("좋아요순")) {
					GoodsList = goddao.goodsLikeLineUp(goodsMap);
				} else if (lineUp.equals("오래된순")){
					GoodsList = goddao.goodsOidLineUp(goodsMap);
				} else {
					GoodsList = goddao.goodsSearchList(goodsMap);
				}
				
				mav.addObject("count", count);
				mav.addObject("lineUp", lineUp);
				mav.addObject("searchData", searchData);
				mav.addObject("menu", goodsCategory);
				mav.addObject("menu2", goodsAnimalKind);
				mav.addObject("paging", paging);
				mav.addObject("goodsList", GoodsList);
				mav.setViewName("GoodsList");
				return mav;
	}


	// 용품 상세보기
	public ModelAndView goodsView(GoodsDTO goods, MemberDTO member) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("likeUserId", member.getUserId());
		map.put("goodsNum", goods.getGoodsNum());
		
		GoodsDTO goodsView = goddao.goodsView(goods);
		String likeUserId = goddao.goodsLikeId2(map);
		goddao.goodsHit(goods);
		
		mav.addObject("likeUserId",likeUserId);
		mav.addObject("goodsView",goodsView);
		mav.setViewName("GoodsView");
		return mav;
	}
	GoodsDTO gsdo = new GoodsDTO();
	
	//좋아요 수
	public GoodsDTO goodsLikeSelect(GoodsDTO goods) {
		gsdo = goddao.goodsLikeSelect(goods);
		return gsdo;
	}

	// 용품 좋아요
	public GoodsDTO goodssLike(GoodsDTO goods) {
		String gsd = goddao.goodsLikeId(goods);
		if(gsd==null) {			
			goddao.goodssLike(goods);
			goddao.goodsLikeUser(goods);
			gsdo = goddao.goodsLikeSelect(goods);
		}else {
			goddao.goodsUnLike(goods);
			goddao.goodsUnLikeUser(goods);		
			gsdo = goddao.goodsLikeSelect(goods);
		}
		return gsdo;
	}

	// 용품 주문 페이지
	public ModelAndView GoodsPayMent(GoodsDTO goods) {
			mav.addObject("goodsPayMent",goods);
			mav.setViewName("GoodsPayMent");	
		return mav;
	}
	
	// 카카오페이 결제
	public GoodsDTO goodsPayMents(GoodsDTO goods) {
		//결제하기
		goddao.GoodsCard(goods);
		
		//아이디불러오기
		goddao.GoodsReservationAddPoint(goods);
		MemberDTO member2 = goddao.memberSelect(goods);
		session.setAttribute("loginUser", member2);
		return gd;
	}
	// 문의 리스트
	public List<GoodsDTO> goodsAskList(GoodsDTO goods) {
		goodsAskList = goddao.goodsAskList(goods);
		return goodsAskList;
	}

	// 문의하기 폼
	public ModelAndView goodsAskForm(GoodsDTO goods) {
		mav.addObject("goodsAsk",goods);
		mav.setViewName("GoodsAsk");
		return mav;
	}

	// 문의 작성
	public GoodsDTO goodsAsk(GoodsDTO goods) {
		String userId = goddao.goodsAskIdCheck(goods);
		GoodsDTO msg = null;
		if(userId==null) {
			goddao.goodsAsk(goods);			
		}else {
			gd = msg;
		}
		return gd;
	}
	
	//비밀글 가져오기

	public GoodsDTO goodsAskSecret(GoodsDTO goods) {
		gd = goddao.goodsAskSecret(goods);	
		return gd;	
}
	
	//장바구니에 넣기
	public void goodsBasket(GoodsDTO goods) {
		goddao.goodsBasket(goods);
	}
	
	//새 주소 띄우기
	public String addressUpdate(String postcode, String address, String detailAddress, String extraAddress) {
	      String resultMsg = null;
	      
	      if(address!=null) {
	         session.setAttribute("newAddress", address);
	         // 업데이트 누르면 session에 저장되고 결제 후에는 session 삭제됨
	         resultMsg = address;
	      }else {
	         resultMsg = null;
	      }
	      
	      return resultMsg;
	}


	
	
}
