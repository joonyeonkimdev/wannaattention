package com.wannaattention.www.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Animal {
	private int animalNum;
	private String name;
	private int age;
	private String species;
	private String breed;
	private int gender;
	private int neutralization;
	private int vacccination;
	private Date enterDate;
	private Date protectEndDate;
	private int adoptStep;
	private String profileFilename;
	private MultipartFile profileFile;
	
	public int getAnimalNum() {
		return animalNum;
	}
	public void setAnimalNum(int animalNum) {
		this.animalNum = animalNum;
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
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getNeutralization() {
		return neutralization;
	}
	public void setNeutralization(int neutralization) {
		this.neutralization = neutralization;
	}
	public int getVacccination() {
		return vacccination;
	}
	public void setVacccination(int vacccination) {
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
	public int getAdoptStep() {
		return adoptStep;
	}
	public void setAdoptStep(int adoptStep) {
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
		return "Animal [animalNum=" + animalNum + ", name=" + name + ", age=" + age + ", species=" + species
				+ ", breed=" + breed + ", gender=" + gender + ", neutralization=" + neutralization + ", vacccination="
				+ vacccination + ", enterDate=" + enterDate + ", protectEndDate=" + protectEndDate + ", adoptStep="
				+ adoptStep + ", profileFilename=" + profileFilename + ", profileFile=" + profileFile + "]";
	}
	
	
}
