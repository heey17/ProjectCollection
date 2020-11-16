package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportDTO {

	//신고
	private int reportReviewNum, reportDate;//정지 기간
	private String reportUserId, reportKind;

	
	//리뷰
	private String reviewContents, reviewImage, reviewRating, reviewDate, reviewBlind, reviewTitle, reviewKind, reviewUserId;
	private int reviewNum, reviewLike;
	MultipartFile reviewImageFile;
	
}
