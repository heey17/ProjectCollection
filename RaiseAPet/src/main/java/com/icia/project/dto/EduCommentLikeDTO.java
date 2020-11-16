package com.icia.project.dto;

import lombok.Data;

@Data
public class EduCommentLikeDTO {
	private String likeUserId;
	private int likeCommentEduNum, likeCommentNum;
}
