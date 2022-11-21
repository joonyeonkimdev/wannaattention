package com.wannaattention.www.vo;

import java.util.Date;

public class Facility {
	private int facNum;
	private String facType;
	private String name;
	private String officeHours;
	private String address;
	private String homepage;
	private String tel;
	private int rating;
	private String insta;
	private String kakao;
	private String treatSpecies;
	private String allday;
	private String emergency;
	private String ambulance;
	private String pgScale;
	private String holiday;
	private String pgBigPossible;
	private String festStatus;
	private Date festStartDate;
	private Date festEndDate;
	public int getFacNum() {
		return facNum;
	}
	public void setFacNum(int facNum) {
		this.facNum = facNum;
	}
	public String getFacType() {
		return facType;
	}
	public void setFacType(String facType) {
		this.facType = facType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOfficeHours() {
		return officeHours;
	}
	public void setOfficeHours(String officeHours) {
		this.officeHours = officeHours;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getInsta() {
		return insta;
	}
	public void setInsta(String insta) {
		this.insta = insta;
	}
	public String getKakao() {
		return kakao;
	}
	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	public String getTreatSpecies() {
		return treatSpecies;
	}
	public void setTreatSpecies(String treatSpecies) {
		this.treatSpecies = treatSpecies;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}
	public String getEmergency() {
		return emergency;
	}
	public void setEmergency(String emergency) {
		this.emergency = emergency;
	}
	public String getAmbulance() {
		return ambulance;
	}
	public void setAmbulance(String ambulance) {
		this.ambulance = ambulance;
	}
	public String getPgScale() {
		return pgScale;
	}
	public void setPgScale(String pgScale) {
		this.pgScale = pgScale;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getPgBigPossible() {
		return pgBigPossible;
	}
	public void setPgBigPossible(String pgBigPossible) {
		this.pgBigPossible = pgBigPossible;
	}
	public String getFestStatus() {
		return festStatus;
	}
	public void setFestStatus(String festStatus) {
		this.festStatus = festStatus;
	}
	public Date getFestStartDate() {
		return festStartDate;
	}
	public void setFestStartDate(Date festStartDate) {
		this.festStartDate = festStartDate;
	}
	public Date getFestEndDate() {
		return festEndDate;
	}
	public void setFestEndDate(Date festEndDate) {
		this.festEndDate = festEndDate;
	}
	@Override
	public String toString() {
		return "Facility [facNum=" + facNum + ", facType=" + facType + ", name=" + name + ", officeHours=" + officeHours
				+ ", address=" + address + ", homepage=" + homepage + ", tel=" + tel + ", rating=" + rating + ", insta="
				+ insta + ", kakao=" + kakao + ", treatSpecies=" + treatSpecies + ", allday=" + allday + ", emergency="
				+ emergency + ", ambulance=" + ambulance + ", pgScale=" + pgScale + ", holiday=" + holiday
				+ ", pgBigPossible=" + pgBigPossible + ", festStatus=" + festStatus + ", festStartDate=" + festStartDate
				+ ", festEndDate=" + festEndDate + "]";
	} 
	
	
}
