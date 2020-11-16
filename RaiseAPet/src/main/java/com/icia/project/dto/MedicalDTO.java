package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MedicalDTO {

	// 의사 정보
	private String doctorName, doctorCode, doctorImage, doctorOff, doctorCareer, doctorSubject;
	private MultipartFile doctorImageFile;

	// 예약 정보
	private String medicalReserveDate, medicalReserveTime, medicalReserveAnimalKind, medicalReserveAnimalNote, 
					medicalReserveDoctor, medicalReserveUserId, medicalReservePayment, medicalReserveSubject;
	private int medicalReserveAnimalAge, medicalReservePrice, medicalReservePoint, medicalReserveNum;
	private String kind;
}
