package com.wannaattention.www.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class Booking {
	private int bookingNum;
	private int bookerNum;
	private String bookerName;
	private int shelterNum;
	private String shelterName;
	private int animalNum;
	private String animalName;
	@NotNull
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date bookingDate;
	
	public int getBookingNum() {
		return bookingNum;
	}
	public void setBookingNum(int bookingNum) {
		this.bookingNum = bookingNum;
	}
	public int getBookerNum() {
		return bookerNum;
	}
	public void setBookerNum(int bookerNum) {
		this.bookerNum = bookerNum;
	}
	public String getBookerName() {
		return bookerName;
	}
	public void setBookerName(String bookerName) {
		this.bookerName = bookerName;
	}
	public int getShelterNum() {
		return shelterNum;
	}
	public void setShelterNum(int shelterNum) {
		this.shelterNum = shelterNum;
	}
	public String getShelterName() {
		return shelterName;
	}
	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}
	public int getAnimalNum() {
		return animalNum;
	}
	public void setAnimalNum(int animalNum) {
		this.animalNum = animalNum;
	}
	public String getAnimalName() {
		return animalName;
	}
	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	
	@Override
	public String toString() {
		return "Booking [bookingNum=" + bookingNum + ", bookerNum=" + bookerNum + ", bookerName=" + bookerName
				+ ", shelterNum=" + shelterNum + ", shelterName=" + shelterName + ", animalNum=" + animalNum
				+ ", animalName=" + animalName + ", bookingDate=" + bookingDate + ", timeSlot=" + "]";
	}
	
	
	
	
	
}
