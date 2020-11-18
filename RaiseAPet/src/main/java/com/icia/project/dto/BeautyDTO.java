package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;


public class BeautyDTO {

	// 디자이너 정보
	private String designerName, designerCode, designerImage, designerOff, designerCareer;
	private MultipartFile designerImageFile;
	
	// 예약 정보
	private String beautyReserveDate, beautyReserveTime, beautyReserveAnimalKind, beautyReserveAnimalNote, beautyReserveSubject, beautyReserveDesigner, beautyReserveUserId, beautyReservePayment, kind;
	private int beautyReserveAnimalAge, beautyReservePrice, beautyReservePoint, beautyReserveNum;
	public String getDesignerName() {
		return designerName;
	}
	public void setDesignerName(String designerName) {
		this.designerName = designerName;
	}
	public String getDesignerCode() {
		return designerCode;
	}
	public void setDesignerCode(String designerCode) {
		this.designerCode = designerCode;
	}
	public String getDesignerImage() {
		return designerImage;
	}
	public void setDesignerImage(String designerImage) {
		this.designerImage = designerImage;
	}
	public String getDesignerOff() {
		return designerOff;
	}
	public void setDesignerOff(String designerOff) {
		this.designerOff = designerOff;
	}
	public String getDesignerCareer() {
		return designerCareer;
	}
	public void setDesignerCareer(String designerCareer) {
		this.designerCareer = designerCareer;
	}
	public MultipartFile getDesignerImageFile() {
		return designerImageFile;
	}
	public void setDesignerImageFile(MultipartFile designerImageFile) {
		this.designerImageFile = designerImageFile;
	}
	public String getBeautyReserveDate() {
		return beautyReserveDate;
	}
	public void setBeautyReserveDate(String beautyReserveDate) {
		this.beautyReserveDate = beautyReserveDate;
	}
	public String getBeautyReserveTime() {
		return beautyReserveTime;
	}
	public void setBeautyReserveTime(String beautyReserveTime) {
		this.beautyReserveTime = beautyReserveTime;
	}
	public String getBeautyReserveAnimalKind() {
		return beautyReserveAnimalKind;
	}
	public void setBeautyReserveAnimalKind(String beautyReserveAnimalKind) {
		this.beautyReserveAnimalKind = beautyReserveAnimalKind;
	}
	public String getBeautyReserveAnimalNote() {
		return beautyReserveAnimalNote;
	}
	public void setBeautyReserveAnimalNote(String beautyReserveAnimalNote) {
		this.beautyReserveAnimalNote = beautyReserveAnimalNote;
	}
	public String getBeautyReserveSubject() {
		return beautyReserveSubject;
	}
	public void setBeautyReserveSubject(String beautyReserveSubject) {
		this.beautyReserveSubject = beautyReserveSubject;
	}
	public String getBeautyReserveDesigner() {
		return beautyReserveDesigner;
	}
	public void setBeautyReserveDesigner(String beautyReserveDesigner) {
		this.beautyReserveDesigner = beautyReserveDesigner;
	}
	public String getBeautyReserveUserId() {
		return beautyReserveUserId;
	}
	public void setBeautyReserveUserId(String beautyReserveUserId) {
		this.beautyReserveUserId = beautyReserveUserId;
	}
	public String getBeautyReservePayment() {
		return beautyReservePayment;
	}
	public void setBeautyReservePayment(String beautyReservePayment) {
		this.beautyReservePayment = beautyReservePayment;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getBeautyReserveAnimalAge() {
		return beautyReserveAnimalAge;
	}
	public void setBeautyReserveAnimalAge(int beautyReserveAnimalAge) {
		this.beautyReserveAnimalAge = beautyReserveAnimalAge;
	}
	public int getBeautyReservePrice() {
		return beautyReservePrice;
	}
	public void setBeautyReservePrice(int beautyReservePrice) {
		this.beautyReservePrice = beautyReservePrice;
	}
	public int getBeautyReservePoint() {
		return beautyReservePoint;
	}
	public void setBeautyReservePoint(int beautyReservePoint) {
		this.beautyReservePoint = beautyReservePoint;
	}
	public int getBeautyReserveNum() {
		return beautyReserveNum;
	}
	public void setBeautyReserveNum(int beautyReserveNum) {
		this.beautyReserveNum = beautyReserveNum;
	}
}
