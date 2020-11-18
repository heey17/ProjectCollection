package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class HotelDTO {

	// HOTEL
	private String hotelSize, hotelCode, hotelRoomName, hotelContents, hotelRoomImage1, hotelRoomImage2, 
					hotelRoomImage3, hotelRoomImage4, hotelRoomImage5, kind;
	private MultipartFile hotelRoomImageFile;
	private int hotelPrice, hotelPoint, hotelMaxAnimal;
	


	public String getHotelSize() {
		return hotelSize;
	}
	public void setHotelSize(String hotelSize) {
		this.hotelSize = hotelSize;
	}
	public String getHotelCode() {
		return hotelCode;
	}
	public void setHotelCode(String hotelCode) {
		this.hotelCode = hotelCode;
	}
	public String getHotelRoomName() {
		return hotelRoomName;
	}
	public void setHotelRoomName(String hotelRoomName) {
		this.hotelRoomName = hotelRoomName;
	}
	public String getHotelContents() {
		return hotelContents;
	}
	public void setHotelContents(String hotelContents) {
		this.hotelContents = hotelContents;
	}
	public String getHotelRoomImage1() {
		return hotelRoomImage1;
	}
	public void setHotelRoomImage1(String hotelRoomImage1) {
		this.hotelRoomImage1 = hotelRoomImage1;
	}
	public String getHotelRoomImage2() {
		return hotelRoomImage2;
	}
	public void setHotelRoomImage2(String hotelRoomImage2) {
		this.hotelRoomImage2 = hotelRoomImage2;
	}
	public String getHotelRoomImage3() {
		return hotelRoomImage3;
	}
	public void setHotelRoomImage3(String hotelRoomImage3) {
		this.hotelRoomImage3 = hotelRoomImage3;
	}
	public String getHotelRoomImage4() {
		return hotelRoomImage4;
	}
	public void setHotelRoomImage4(String hotelRoomImage4) {
		this.hotelRoomImage4 = hotelRoomImage4;
	}
	public String getHotelRoomImage5() {
		return hotelRoomImage5;
	}
	public void setHotelRoomImage5(String hotelRoomImage5) {
		this.hotelRoomImage5 = hotelRoomImage5;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public MultipartFile getHotelRoomImageFile() {
		return hotelRoomImageFile;
	}
	public void setHotelRoomImageFile(MultipartFile hotelRoomImageFile) {
		this.hotelRoomImageFile = hotelRoomImageFile;
	}
	public int getHotelPrice() {
		return hotelPrice;
	}
	public void setHotelPrice(int hotelPrice) {
		this.hotelPrice = hotelPrice;
	}
	public int getHotelPoint() {
		return hotelPoint;
	}
	public void setHotelPoint(int hotelPoint) {
		this.hotelPoint = hotelPoint;
	}
	public int getHotelMaxAnimal() {
		return hotelMaxAnimal;
	}
	public void setHotelMaxAnimal(int hotelMaxAnimal) {
		this.hotelMaxAnimal = hotelMaxAnimal;
	}
	public String getHotelUserName() {
		return hotelUserName;
	}
	public void setHotelUserName(String hotelUserName) {
		this.hotelUserName = hotelUserName;
	}
	public String getHotelUserPhone() {
		return hotelUserPhone;
	}
	public void setHotelUserPhone(String hotelUserPhone) {
		this.hotelUserPhone = hotelUserPhone;
	}
	public String getHotelCheckIn() {
		return hotelCheckIn;
	}
	public void setHotelCheckIn(String hotelCheckIn) {
		this.hotelCheckIn = hotelCheckIn;
	}
	public String getHotelCheckOut() {
		return hotelCheckOut;
	}
	public void setHotelCheckOut(String hotelCheckOut) {
		this.hotelCheckOut = hotelCheckOut;
	}
	public String getHotelAnimalKind() {
		return hotelAnimalKind;
	}
	public void setHotelAnimalKind(String hotelAnimalKind) {
		this.hotelAnimalKind = hotelAnimalKind;
	}
	public String getHotelSpecialNote() {
		return hotelSpecialNote;
	}
	public void setHotelSpecialNote(String hotelSpecialNote) {
		this.hotelSpecialNote = hotelSpecialNote;
	}
	public String getHotelPayment() {
		return hotelPayment;
	}
	public void setHotelPayment(String hotelPayment) {
		this.hotelPayment = hotelPayment;
	}
	public String getHotelUserId() {
		return hotelUserId;
	}
	public void setHotelUserId(String hotelUserId) {
		this.hotelUserId = hotelUserId;
	}
	public int getHotelReservePrice() {
		return hotelReservePrice;
	}
	public void setHotelReservePrice(int hotelReservePrice) {
		this.hotelReservePrice = hotelReservePrice;
	}
	public int getHotelReservePoint() {
		return hotelReservePoint;
	}
	public void setHotelReservePoint(int hotelReservePoint) {
		this.hotelReservePoint = hotelReservePoint;
	}
	public int getHotelReserveNum() {
		return hotelReserveNum;
	}
	public void setHotelReserveNum(int hotelReserveNum) {
		this.hotelReserveNum = hotelReserveNum;
	}
	// HOTEL_RESERVATION
	private String hotelUserName, hotelUserPhone, hotelCheckIn, hotelCheckOut, 
					hotelAnimalKind, hotelSpecialNote, hotelPayment, hotelUserId;
	private int hotelReservePrice, hotelReservePoint, hotelReserveNum;
}
