package com.icia.project.dto;

import lombok.Data;

@Data
public class EventCommentLikeDTO {
	private String likeUserId;
	private int likeCommentEventNum, likeCommentNum;
	public String getLikeUserId() {
		return likeUserId;
	}
	public void setLikeUserId(String likeUserId) {
		this.likeUserId = likeUserId;
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
