package com.icia.project.dto;

import lombok.Data;

@Data
public class CouponDTO {

	private String couponName, couponCode, couponDate, couponContents;
	private int couponSale;
}
