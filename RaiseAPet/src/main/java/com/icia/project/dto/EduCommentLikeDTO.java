package com.icia.project.dto;

import lombok.Data;

@Data
public class EduCommentLikeDTO {
	private String likeUserId;
	private int likeCommentEduNum, likeCommentNum;
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
	}
	public int getLikeCommentEduNum() {
		return likeCommentEduNum;
	}
	public void setLikeCommentEduNum(int likeCommentEduNum) {
		this.likeCommentEduNum = likeCommentEduNum;
	}
	public int getLikeCommentNum() {
		return likeCommentNum;
	}
	public void setLikeCommentNum(int likeCommentNum) {
		this.likeCommentNum = likeCommentNum;
	}
}
