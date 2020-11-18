package com.icia.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MedicalDTO {

	// 의사 정보
	private String doctorName, doctorCode, doctorImage, doctorOff, doctorCareer, doctorSubject;
	private MultipartFile doctorImageFile;

	// 예약 정보
	private String medicalReserveDate, medicalReserveTime, medicalReserveAnimalKind, medicalReserveAnimalNote, 
					medicalReserveDoctor, medicalReserveUserId, medicalReservePayment, medicalReserveSubject;
	private int medicalReserveAnimalAge, medicalReservePrice, medicalReservePoint, medicalReserveNum;
	private String kind;
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDoctorCode() {
		return doctorCode;
	}
	public void setDoctorCode(String doctorCode) {
		this.doctorCode = doctorCode;
	}
	public String getDoctorImage() {
		return doctorImage;
	}
	public void setDoctorImage(String doctorImage) {
		this.doctorImage = doctorImage;
	}
	public String getDoctorOff() {
		return doctorOff;
	}
	public void setDoctorOff(String doctorOff) {
		this.doctorOff = doctorOff;
	}
	public String getDoctorCareer() {
		return doctorCareer;
	}
	public void setDoctorCareer(String doctorCareer) {
		this.doctorCareer = doctorCareer;
	}
	public String getDoctorSubject() {
		return doctorSubject;
	}
	public void setDoctorSubject(String doctorSubject) {
		this.doctorSubject = doctorSubject;
	}
	public MultipartFile getDoctorImageFile() {
		return doctorImageFile;
	}
	public void setDoctorImageFile(MultipartFile doctorImageFile) {
		this.doctorImageFile = doctorImageFile;
	}
	public String getMedicalReserveDate() {
		return medicalReserveDate;
	}
	public void setMedicalReserveDate(String medicalReserveDate) {
		this.medicalReserveDate = medicalReserveDate;
	}
	public String getMedicalReserveTime() {
		return medicalReserveTime;
	}
	public void setMedicalReserveTime(String medicalReserveTime) {
		this.medicalReserveTime = medicalReserveTime;
	}
	public String getMedicalReserveAnimalKind() {
		return medicalReserveAnimalKind;
	}
	public void setMedicalReserveAnimalKind(String medicalReserveAnimalKind) {
		this.medicalReserveAnimalKind = medicalReserveAnimalKind;
	}
	public String getMedicalReserveAnimalNote() {
		return medicalReserveAnimalNote;
	}
	public void setMedicalReserveAnimalNote(String medicalReserveAnimalNote) {
		this.medicalReserveAnimalNote = medicalReserveAnimalNote;
	}
	public String getMedicalReserveDoctor() {
		return medicalReserveDoctor;
	}
	public void setMedicalReserveDoctor(String medicalReserveDoctor) {
		this.medicalReserveDoctor = medicalReserveDoctor;
	}
	public String getMedicalReserveUserId() {
		return medicalReserveUserId;
	}
	public void setMedicalReserveUserId(String medicalReserveUserId) {
		this.medicalReserveUserId = medicalReserveUserId;
	}
	public String getMedicalReservePayment() {
		return medicalReservePayment;
	}
	public void setMedicalReservePayment(String medicalReservePayment) {
		this.medicalReservePayment = medicalReservePayment;
	}
	public String getMedicalReserveSubject() {
		return medicalReserveSubject;
	}
	public void setMedicalReserveSubject(String medicalReserveSubject) {
		this.medicalReserveSubject = medicalReserveSubject;
	}
	public int getMedicalReserveAnimalAge() {
		return medicalReserveAnimalAge;
	}
	public void setMedicalReserveAnimalAge(int medicalReserveAnimalAge) {
		this.medicalReserveAnimalAge = medicalReserveAnimalAge;
	}
	public int getMedicalReservePrice() {
		return medicalReservePrice;
	}
	public void setMedicalReservePrice(int medicalReservePrice) {
		this.medicalReservePrice = medicalReservePrice;
	}
	public int getMedicalReservePoint() {
		return medicalReservePoint;
	}
	public void setMedicalReservePoint(int medicalReservePoint) {
		this.medicalReservePoint = medicalReservePoint;
	}
	public int getMedicalReserveNum() {
		return medicalReserveNum;
	}
	public void setMedicalReserveNum(int medicalReserveNum) {
		this.medicalReserveNum = medicalReserveNum;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
}
