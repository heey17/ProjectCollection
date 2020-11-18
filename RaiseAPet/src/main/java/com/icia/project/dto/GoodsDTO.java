package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsDTO {

	// 용품 정보
	private String goodsName, goodsAnimalKind, goodsCategory, goodsContents, goodsImage1,goodsImage2,goodsImage3,goodsImage4,goodsImage5,likeUserId, kind;
	private int goodsNum, goodsPrice, goodsStock, goodsLike, goodsHit, goodsPoint,likeGoodsNum;
	private MultipartFile goodsImageFile, goodsContentsFile;
	private String[] goodsAnimalKinds;
	
	// 구매 정보
	private String buyUserId, buyPayment, buyAddress, buyDelevery;
	private int buyGoodsNum, buyCount, buyPrice, goodsBuyNum;
	
	
	// 장바구니 정보
	private int basketGoodsNum, basketGoodsCount;
	private String basketUserId;
	
	
	// 문의 정보
	private String askContents, askUserId, askSecret, askAnswer;
	private int askGoodsNum, askNum, askPw;
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsAnimalKind() {
		return goodsAnimalKind;
	}
	public void setGoodsAnimalKind(String goodsAnimalKind) {
		this.goodsAnimalKind = goodsAnimalKind;
	}
	public String getGoodsCategory() {
		return goodsCategory;
	}
	public void setGoodsCategory(String goodsCategory) {
		this.goodsCategory = goodsCategory;
	}
	public String getGoodsContents() {
		return goodsContents;
	}
	public void setGoodsContents(String goodsContents) {
		this.goodsContents = goodsContents;
	}
	public String getGoodsImage1() {
		return goodsImage1;
	}
	public void setGoodsImage1(String goodsImage1) {
		this.goodsImage1 = goodsImage1;
	}
	public String getGoodsImage2() {
		return goodsImage2;
	}
	public void setGoodsImage2(String goodsImage2) {
		this.goodsImage2 = goodsImage2;
	}
	public String getGoodsImage3() {
		return goodsImage3;
	}
	public void setGoodsImage3(String goodsImage3) {
		this.goodsImage3 = goodsImage3;
	}
	public String getGoodsImage4() {
		return goodsImage4;
	}
	public void setGoodsImage4(String goodsImage4) {
		this.goodsImage4 = goodsImage4;
	}
	public String getGoodsImage5() {
		return goodsImage5;
	}
	public void setGoodsImage5(String goodsImage5) {
		this.goodsImage5 = goodsImage5;
	}
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsStock() {
		return goodsStock;
	}
	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}
	public int getGoodsLike() {
		return goodsLike;
	}
	public void setGoodsLike(int goodsLike) {
		this.goodsLike = goodsLike;
	}
	public int getGoodsHit() {
		return goodsHit;
	}
	public void setGoodsHit(int goodsHit) {
		this.goodsHit = goodsHit;
	}
	public int getGoodsPoint() {
		return goodsPoint;
	}
	public void setGoodsPoint(int goodsPoint) {
		this.goodsPoint = goodsPoint;
	}
	public int getLikeGoodsNum() {
		return likeGoodsNum;
	}
	public void setLikeGoodsNum(int likeGoodsNum) {
		this.likeGoodsNum = likeGoodsNum;
	}
	public MultipartFile getGoodsImageFile() {
		return goodsImageFile;
	}
	public void setGoodsImageFile(MultipartFile goodsImageFile) {
		this.goodsImageFile = goodsImageFile;
	}
	public MultipartFile getGoodsContentsFile() {
		return goodsContentsFile;
	}
	public void setGoodsContentsFile(MultipartFile goodsContentsFile) {
		this.goodsContentsFile = goodsContentsFile;
	}
	public String[] getGoodsAnimalKinds() {
		return goodsAnimalKinds;
	}
	public void setGoodsAnimalKinds(String[] goodsAnimalKinds) {
		this.goodsAnimalKinds = goodsAnimalKinds;
	}
	public String getBuyUserId() {
		return buyUserId;
	}
	public void setBuyUserId(String buyUserId) {
		this.buyUserId = buyUserId;
	}
	public String getBuyPayment() {
		return buyPayment;
	}
	public void setBuyPayment(String buyPayment) {
		this.buyPayment = buyPayment;
	}
	public String getBuyAddress() {
		return buyAddress;
	}
	public void setBuyAddress(String buyAddress) {
		this.buyAddress = buyAddress;
	}
	public String getBuyDelevery() {
		return buyDelevery;
	}
	public void setBuyDelevery(String buyDelevery) {
		this.buyDelevery = buyDelevery;
	}
	public int getBuyGoodsNum() {
		return buyGoodsNum;
	}
	public void setBuyGoodsNum(int buyGoodsNum) {
		this.buyGoodsNum = buyGoodsNum;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getGoodsBuyNum() {
		return goodsBuyNum;
	}
	public void setGoodsBuyNum(int goodsBuyNum) {
		this.goodsBuyNum = goodsBuyNum;
	}
	public int getBasketGoodsNum() {
		return basketGoodsNum;
	}
	public void setBasketGoodsNum(int basketGoodsNum) {
		this.basketGoodsNum = basketGoodsNum;
	}
	public int getBasketGoodsCount() {
		return basketGoodsCount;
	}
	public void setBasketGoodsCount(int basketGoodsCount) {
		this.basketGoodsCount = basketGoodsCount;
	}
	public String getBasketUserId() {
		return basketUserId;
	}
	public void setBasketUserId(String basketUserId) {
		this.basketUserId = basketUserId;
	}
	public String getAskContents() {
		return askContents;
	}
	public void setAskContents(String askContents) {
		this.askContents = askContents;
	}
	public String getAskUserId() {
		return askUserId;
	}
	public void setAskUserId(String askUserId) {
		this.askUserId = askUserId;
	}
	public String getAskSecret() {
		return askSecret;
	}
	public void setAskSecret(String askSecret) {
		this.askSecret = askSecret;
	}
	public String getAskAnswer() {
		return askAnswer;
	}
	public void setAskAnswer(String askAnswer) {
		this.askAnswer = askAnswer;
	}
	public int getAskGoodsNum() {
		return askGoodsNum;
	}
	public void setAskGoodsNum(int askGoodsNum) {
		this.askGoodsNum = askGoodsNum;
	}
	public int getAskNum() {
		return askNum;
	}
	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}
	public int getAskPw() {
		return askPw;
	}
	public void setAskPw(int askPw) {
		this.askPw = askPw;
	}

}
