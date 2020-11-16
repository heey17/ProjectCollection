package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventDTO {

	private String eventTitleImage, eventImage, eventDate, eventContents,eventCouponCode;
	private int eventNum, eventHit;
	private MultipartFile eventTitleImageFile, eventImageFile;
	private String kind;
}
