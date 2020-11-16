package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewDTO {

	private String reviewContents, reviewImage, reviewRating, reviewDate, reviewBlind, reviewTitle, reviewKind, reviewUserId;
	private int reviewNum, reviewLike, reserveNum;
	private MultipartFile reviewImageFile;
	// 좋아요
	private String likeUserId;
	private int likeReviewNum;
	// 신고
	private String reportUserId, reportKind;
	private int reportReviewNum;
}
