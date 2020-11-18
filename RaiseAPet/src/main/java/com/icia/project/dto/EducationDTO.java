package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EducationDTO {

	// 훈련 정보
	private String eduTitle, eduContents, eduImage, eduVideo, likeUserId;
	private int eduLike, eduHit, eduNum, likeEduNum;
	private MultipartFile eduImageFile;
	private String kind;
	private String eduAnimalKind;
	private String[] eduAnimalKinds;
	public String getEduTitle() {
		return eduTitle;
	}
	public void setEduTitle(String eduTitle) {
		this.eduTitle = eduTitle;
	}
	public String getEduContents() {
		return eduContents;
	}
	public void setEduContents(String eduContents) {
		this.eduContents = eduContents;
	}
	public String getEduImage() {
		return eduImage;
	}
	public void setEduImage(String eduImage) {
		this.eduImage = eduImage;
	}
	public String getEduVideo() {
		return eduVideo;
	}
	public void setEduVideo(String eduVideo) {
		this.eduVideo = eduVideo;
	}
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}
	public int getEduLike() {
		return eduLike;
	}
	public void setEduLike(int eduLike) {
		this.eduLike = eduLike;
	}
	public int getEduHit() {
		return eduHit;
	}
	public void setEduHit(int eduHit) {
		this.eduHit = eduHit;
	}
	public int getEduNum() {
		return eduNum;
	}
	public void setEduNum(int eduNum) {
		this.eduNum = eduNum;
	}
	public int getLikeEduNum() {
		return likeEduNum;
	}
	public void setLikeEduNum(int likeEduNum) {
		this.likeEduNum = likeEduNum;
	}
	public MultipartFile getEduImageFile() {
		return eduImageFile;
	}
	public void setEduImageFile(MultipartFile eduImageFile) {
		this.eduImageFile = eduImageFile;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getEduAnimalKind() {
		return eduAnimalKind;
	}
	public void setEduAnimalKind(String eduAnimalKind) {
		this.eduAnimalKind = eduAnimalKind;
	}
	public String[] getEduAnimalKinds() {
		return eduAnimalKinds;
	}
	public void setEduAnimalKinds(String[] eduAnimalKinds) {
		this.eduAnimalKinds = eduAnimalKinds;
	}

}
