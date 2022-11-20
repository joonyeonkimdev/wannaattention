package com.wannaattention.www.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class MissingAnimal {
	private int missingAnimalNum;
	private int writerNum;
	private String writerNickname;
	@NotEmpty(message = "실종 상태를 선택하세요.")
	private String status;
	private String species;
	private String breed;
	private String gender;
	@NotEmpty(message = "발견 위치는 필수 입력사항입니다.")
	private String location;
	private Date regDate;
	private String description;
	private String photoFilename;
	private MultipartFile photoFile;
	
	public int getMissingAnimalNum() {
		return missingAnimalNum;
	}
	public void setMissingAnimalNum(int missingAnimalNum) {
		this.missingAnimalNum = missingAnimalNum;
	}
	public int getWriterNum() {
		return writerNum;
	}
	public void setWriterNum(int writerNum) {
		this.writerNum = writerNum;
	}
	public String getWriterNickname() {
		return writerNickname;
	}
	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPhotoFilename() {
		return photoFilename;
	}
	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	@Override
	public String toString() {
		return "MissingAnimal [missingAnimalNum=" + missingAnimalNum + ", writerNum=" + writerNum + ", writerNickname="
				+ writerNickname + ", status=" + status + ", species=" + species + ", breed=" + breed + ", gender="
				+ gender + ", location=" + location + ", regDate=" + regDate + ", description=" + description
				+ ", photoFilename=" + photoFilename + ", photoFile=" + photoFile + "]";
	}
	
	
	

}
