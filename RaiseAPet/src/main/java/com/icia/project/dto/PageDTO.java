/*
 Date : 2020-09-11
 Author : 윤희영
 Descript : 어드민
 Version : 1.0
 */
package com.icia.project.dto;

import lombok.Data;

@Data
public class PageDTO {
	private int page, maxPage, startPage, endPage, startRow, endRow;
}
