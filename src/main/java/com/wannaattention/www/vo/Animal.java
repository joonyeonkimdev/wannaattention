package com.wannaattention.www.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class Animal {
	private int animalNum;
	private int shelterNum;
	private String shelterName;
	private String name;
	private int age;
	@NotEmpty(message = "동물 종류는 필수 입력사항입니다.")
	private String species;
	private String breed;
	@NotEmpty(message = "동물 성별은 필수 입력사항입니다.")
	private String gender;
	@NotEmpty(message = "중성화 여부는 필수 입력사항입니다.")
	private String neutralization;
	@NotEmpty(message = "접종 여부는 필수 입력사항입니다.")
	private String vacccination;
	@NotNull(message = "보호소 입소일자는 필수 입력사항입니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enterDate;
	@NotNull(message = "보호기간 종료일자는 필수 입력사항입니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date protectEndDate;
	private String adoptStep;
	private String profileFilename;
	private MultipartFile profileFile;
	
	public int getAnimalNum() {
		return animalNum;
	}
	public void setAnimalNum(int animalNum) {
		this.animalNum = animalNum;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public String getNeutralization() {
		return neutralization;
	}
	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}
	public String getVacccination() {
		return vacccination;
	}
	public void setVacccination(String vacccination) {
		this.vacccination = vacccination;
	}
	public Date getEnterDate() {
		return enterDate;
	}
	public void setEnterDate(Date enterDate) {
		this.enterDate = enterDate;
	}
	public Date getProtectEndDate() {
		return protectEndDate;
	}
	public void setProtectEndDate(Date protectEndDate) {
		this.protectEndDate = protectEndDate;
	}
	public String getAdoptStep() {
		return adoptStep;
	}
	public void setAdoptStep(String adoptStep) {
		this.adoptStep = adoptStep;
	}
	public String getProfileFilename() {
		return profileFilename;
	}
	public void setProfileFilename(String profileFilename) {
		this.profileFilename = profileFilename;
	}
	public MultipartFile getProfileFile() {
		return profileFile;
	}
	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}
	
	@Override
	public String toString() {
		return "Animal [animalNum=" + animalNum + ", shelterNum=" + shelterNum + ", shelterName=" + shelterName
				+ ", name=" + name + ", age=" + age + ", species=" + species + ", breed=" + breed + ", gender=" + gender
				+ ", neutralization=" + neutralization + ", vacccination=" + vacccination + ", enterDate=" + enterDate
				+ ", protectEndDate=" + protectEndDate + ", adoptStep=" + adoptStep + ", profileFilename="
				+ profileFilename + ", profileFile=" + profileFile + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
