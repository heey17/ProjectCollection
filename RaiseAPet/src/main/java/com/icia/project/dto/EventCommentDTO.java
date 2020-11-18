package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventCommentDTO {

	private String commentContents, commentUserId, commentImage, commentDate,likeUserId;
	private MultipartFile commentImageFile;
	private int commentEventNum, commentNum, commentLike,likeCommentEventNum, likeCommentNum;
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public String getCommentUserId() {
		return commentUserId;
	}
	public void setCommentUserId(String commentUserId) {
		this.commentUserId = commentUserId;
	}
	public String getCommentImage() {
		return commentImage;
	}
	public void setCommentImage(String commentImage) {
		this.commentImage = commentImage;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}
	public MultipartFile getCommentImageFile() {
		return commentImageFile;
	}
	public void setCommentImageFile(MultipartFile commentImageFile) {
		this.commentImageFile = commentImageFile;
	}
	public int getCommentEventNum() {
		return commentEventNum;
	}
	public void setCommentEventNum(int commentEventNum) {
		this.commentEventNum = commentEventNum;
	}
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getCommentLike() {
		return commentLike;
	}
	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}
	public int getLikeCommentEventNum() {
		return likeCommentEventNum;
	}
	public void setLikeCommentEventNum(int likeCommentEventNum) {
		this.likeCommentEventNum = likeCommentEventNum;
	}
	public int getLikeCommentNum() {
		return likeCommentNum;
	}
	public void setLikeCommentNum(int likeCommentNum) {
		this.likeCommentNum = likeCommentNum;
	}
}
