package com.icia.project.dto;

import lombok.Data;

@Data
public class EduCommentDTO {

	private String commentUserId, commentDate, commentContents;
	private int commentEduNum, commentNum, commentLike;
	public String getCommentUserId() {
		return commentUserId;
	}
	public void setCommentUserId(String commentUserId) {
		this.commentUserId = commentUserId;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public int getCommentEduNum() {
		return commentEduNum;
	}
	public void setCommentEduNum(int commentEduNum) {
		this.commentEduNum = commentEduNum;
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
}
