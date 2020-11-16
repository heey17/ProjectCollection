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

}
