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
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public MultipartFile getReviewImageFile() {
		return reviewImageFile;
	}
	public void setReviewImageFile(MultipartFile reviewImageFile) {
		this.reviewImageFile = reviewImageFile;
	}
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}
	public int getLikeReviewNum() {
		return likeReviewNum;
	}
	public void setLikeReviewNum(int likeReviewNum) {
		this.likeReviewNum = likeReviewNum;
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
	public int getReportReviewNum() {
		return reportReviewNum;
	}
	public void setReportReviewNum(int reportReviewNum) {
		this.reportReviewNum = reportReviewNum;
	}
}
