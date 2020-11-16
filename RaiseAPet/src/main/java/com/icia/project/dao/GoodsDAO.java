package com.icia.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;

@Repository
public class GoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sql;


	//용품 리스트 페이징처리
	public int goodsListCount(HashMap<String, Object> goodsMap) {
		return sql.selectOne("goods.goodsListCount",goodsMap);
	}

	// 용품 상세보기
	public GoodsDTO goodsView(GoodsDTO goods) {
		return sql.selectOne("goods.goodsView",goods);
	}
	
	// 용품 조회수
	public void goodsHit(GoodsDTO goods) {
		sql.update("goods.goodsHit",goods);
		
	}
	// 용품 좋아요
	public void goodssLike(GoodsDTO goods) {
		sql.update("goods.goodssLike",goods);	
	}
	// 용품 좋아요 Id
	public void goodsLikeUser(GoodsDTO goods) {
		sql.insert("goods.goodsLikeUser",goods);
	}
	// 용품 좋아요 취소
	public void goodsUnLike(GoodsDTO goods) {
		sql.update("goods.goodsUnLike",goods);
	}
	// 용품 좋아요 취소 id
	public void goodsUnLikeUser(GoodsDTO goods) {
		sql.insert("goods.goodsUnLikeUser",goods);
	}
	// 용품 좋아요 수 조회
	public int goodsLike(GoodsDTO goods) {
		return sql.selectOne("goods.goodsLike",goods);
	}
	// 좋아요 아이디 조회
	public String goodsLikeUserId(GoodsDTO goods) {
		return sql.selectOne("goods.goodsLikeUserIdCheck",goods);
	}
	// 용품 구매 상세페이지
	public GoodsDTO goodsPayMent(GoodsDTO goods) {
		return sql.selectOne("goods.goodsPayMent",goods);
	}
	// 용품 결제
	public void GoodsCard(GoodsDTO goods) {
		sql.insert("goods.goodsCard",goods);
	}
	// 문의글 리스트
	public List<GoodsDTO> goodsAskList(GoodsDTO goods) {
		return sql.selectList("goods.goodsAskList",goods);
	}
	// 문의글 작성
	public int goodsAsk(GoodsDTO goods) {
		return sql.insert("goods.goodsAskWrite",goods);
	}

	//비밀번호 확인
	public String goodsAskPw(int askPw) {
		return sql.selectOne("goods.goodsAskPw",askPw);
	}
	//비밀글 가져오기
	public GoodsDTO goodsAskSecret(GoodsDTO goods) {
		return sql.selectOne("goods.goodsAskSecret",goods);
	}

	//장바구니
	public void goodsBasket(GoodsDTO goods) {
		sql.insert("goods.goodsBasket",goods);
	}
	//좋아요순
	public List<GoodsDTO> goodsLikeLineUp(HashMap<String, Object> goodsMap) {
		return sql.selectList("goods.goodsLikeLineUp", goodsMap);
	}
	//오래된 순
	public List<GoodsDTO> goodsOidLineUp(HashMap<String, Object> goodsMap) {
		return sql.selectList("goods.goodsOldLineUp", goodsMap);
	}
	//검색 순
	public List<GoodsDTO> goodsSearchList(HashMap<String, Object> goodsMap) {
		return sql.selectList("goods.goodsSearchList", goodsMap);
	}
	
	//좋아요 아이디 검색
	public String goodsLikeId(GoodsDTO goods) {
		return sql.selectOne("goods.goodsLikeId", goods);
	}
	
	//좋아요수
	public GoodsDTO goodsLikeSelect(GoodsDTO goods) {
		return sql.selectOne("goods.goodsLikeSelect",goods);
	}

	public String goodsLikeId2(HashMap<Object, Object> map) {
		return sql.selectOne("goods.goodsLikeId2", map);
	}


	//포인트적립
	public void GoodsReservationAddPoint(GoodsDTO goods) {
		sql.update("goods.memberAddpoint",goods);		
	}
	
	//아이디 불러옴
	public MemberDTO memberSelect(GoodsDTO goods) {
		return sql.selectOne("goods.memberSelect",goods);
	}
	
	//문의아이디체크
	public String goodsAskIdCheck(GoodsDTO goods) {
		return sql.selectOne("goods.askIdCheck",goods);
	}


	
	



	}




