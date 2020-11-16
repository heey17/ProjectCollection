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
	


	// HOTEL_RESERVATION
	private String hotelUserName, hotelUserPhone, hotelCheckIn, hotelCheckOut, 
					hotelAnimalKind, hotelSpecialNote, hotelPayment, hotelUserId;
	private int hotelReservePrice, hotelReservePoint, hotelReserveNum;
}
