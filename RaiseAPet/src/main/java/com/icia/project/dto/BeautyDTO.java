package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BeautyDTO {

	// 디자이너 정보
	private String designerName, designerCode, designerImage, designerOff, designerCareer;
	private MultipartFile designerImageFile;
	
	// 예약 정보
	private String beautyReserveDate, beautyReserveTime, beautyReserveAnimalKind, beautyReserveAnimalNote, beautyReserveSubject, beautyReserveDesigner, beautyReserveUserId, beautyReservePayment, kind;
	private int beautyReserveAnimalAge, beautyReservePrice, beautyReservePoint, beautyReserveNum;
}
