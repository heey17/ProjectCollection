package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventDTO {

	private String eventTitleImage, eventImage, eventDate, eventContents,eventCouponCode;
	private int eventNum, eventHit;
	private MultipartFile eventTitleImageFile, eventImageFile;
	private String kind;
	public String getEventTitleImage() {
		return eventTitleImage;
	}
	public void setEventTitleImage(String eventTitleImage) {
		this.eventTitleImage = eventTitleImage;
	}
	public String getEventImage() {
		return eventImage;
	}
	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventContents() {
		return eventContents;
	}
	public void setEventContents(String eventContents) {
		this.eventContents = eventContents;
	}
	public String getEventCouponCode() {
		return eventCouponCode;
	}
	public void setEventCouponCode(String eventCouponCode) {
		this.eventCouponCode = eventCouponCode;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public int getEventHit() {
		return eventHit;
	}
	public void setEventHit(int eventHit) {
		this.eventHit = eventHit;
	}
	public MultipartFile getEventTitleImageFile() {
		return eventTitleImageFile;
	}
	public void setEventTitleImageFile(MultipartFile eventTitleImageFile) {
		this.eventTitleImageFile = eventTitleImageFile;
	}
	public MultipartFile getEventImageFile() {
		return eventImageFile;
	}
	public void setEventImageFile(MultipartFile eventImageFile) {
		this.eventImageFile = eventImageFile;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
}
