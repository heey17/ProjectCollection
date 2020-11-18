package com.icia.project.dto;


public class CouponDTO {

	private String couponName, couponCode, couponDate, couponContents;
	private int couponSale;
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getCouponDate() {
		return couponDate;
	}
	public void setCouponDate(String couponDate) {
		this.couponDate = couponDate;
	}
	public String getCouponContents() {
		return couponContents;
	}
	public void setCouponContents(String couponContents) {
		this.couponContents = couponContents;
	}
	public int getCouponSale() {
		return couponSale;
	}
	public void setCouponSale(int couponSale) {
		this.couponSale = couponSale;
	}
}
