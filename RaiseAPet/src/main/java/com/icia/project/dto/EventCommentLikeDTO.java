package com.icia.project.dto;

import lombok.Data;

@Data
public class EventCommentLikeDTO {
	private String likeUserId;
	private int likeCommentEventNum, likeCommentNum;
}
