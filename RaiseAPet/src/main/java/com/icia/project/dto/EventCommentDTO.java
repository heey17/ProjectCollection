package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventCommentDTO {

	private String commentContents, commentUserId, commentImage, commentDate,likeUserId;
	private MultipartFile commentImageFile;
	private int commentEventNum, commentNum, commentLike,likeCommentEventNum, likeCommentNum;
}
