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
	public int getReportReviewNum() {
		return reportReviewNum;
	}
	public void setReportReviewNum(int reportReviewNum) {
		this.reportReviewNum = reportReviewNum;
	}
	public int getReportDate() {
		return reportDate;
	}
	public void setReportDate(int reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportUserId() {
		return reportUserId;
	}
	public void setReportUserId(String reportUserId) {
		this.reportUserId = reportUserId;
	}
	public String getReportKind() {
		return reportKind;
	}
	public void setReportKind(String reportKind) {
		this.reportKind = reportKind;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public String getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}
	public String getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(String reviewRating) {
		this.reviewRating = reviewRating;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewBlind() {
		return reviewBlind;
	}
	public void setReviewBlind(String reviewBlind) {
		this.reviewBlind = reviewBlind;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewKind() {
		return reviewKind;
	}
	public void setReviewKind(String reviewKind) {
		this.reviewKind = reviewKind;
	}
	public String getReviewUserId() {
		return reviewUserId;
	}
	public void setReviewUserId(String reviewUserId) {
		this.reviewUserId = reviewUserId;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}
	public MultipartFile getReviewImageFile() {
		return reviewImageFile;
	}
	public void setReviewImageFile(MultipartFile reviewImageFile) {
		this.reviewImageFile = reviewImageFile;
	}
	
}
