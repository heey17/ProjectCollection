package com.icia.project.dto;

import lombok.Data;

@Data
public class EduCommentDTO {

	private String commentUserId, commentDate, commentContents;
	private int commentEduNum, commentNum, commentLike;
}
