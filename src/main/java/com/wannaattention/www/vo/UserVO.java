package com.wannaattention.www.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private int userNum;
	private String userType;
	@Size(min=3, max=10, message="아이디는 3자이상 10자 이하로 입력하세요")
	private String id;
	@Size(min=8,max=16,message="비밀번호는 8자이상 16자 이하로 입력하세요")
	private String pw;
	@NotEmpty(message="사용자 이름 입력은 필수입니다.")
	private String name;
	private String nickname;
	private Date birthday;
	@NotEmpty(message="이메일 입력은 필수입니다.")
	private String email;
	@NotEmpty(message="휴대전화번호 입력은 필수입니다.")
	private String phone;
	private String tel;
	@NotEmpty(message="휴대전화번호 입력은 필수입니다.")
	private String postNum;
	@NotEmpty(message="주소 입력은 필수입니다.")
	private String address;
	private Date signupDate;
	private String busiNum;
	private String profileFilename;
	private String shelterDesFilename;
	private MultipartFile profileFile;
	private MultipartFile shelterDesFile;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getSignupDate() {
		return signupDate;
	}
	public void setSignupDate(Date signupDate) {
		this.signupDate = signupDate;
	}
	public String getBusiNum() {
		return busiNum;
	}
	public void setBusiNum(String busiNum) {
		this.busiNum = busiNum;
	}
	public String getProfileFilename() {
		return profileFilename;
	}
	public void setProfileFilename(String profileFilename) {
		this.profileFilename = profileFilename;
	}
	public String getShelterDesFilename() {
		return shelterDesFilename;
	}
	public void setShelterDesFilename(String shelterDesFilename) {
		this.shelterDesFilename = shelterDesFilename;
	}
	public MultipartFile getProfileFile() {
		return profileFile;
	}
	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}
	public MultipartFile getShelterDesFile() {
		return shelterDesFile;
	}
	public void setShelterDesFile(MultipartFile shelterDesFile) {
		this.shelterDesFile = shelterDesFile;
	}
	
	@Override
	public String toString() {
		return "UserVO [userNum=" + userNum + ", userType=" + userType + ", id=" + id + ", pw=" + pw + ", name=" + name
				+ ", nickname=" + nickname + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone
				+ ", tel=" + tel + ", postNum=" + postNum + ", address=" + address + ", signupDate=" + signupDate
				+ ", busiNum=" + busiNum + ", profileFilename=" + profileFilename + ", shelterDesFilename="
				+ shelterDesFilename + ", profileFile=" + profileFile + ", shelterDesFile=" + shelterDesFile + "]";
	}
	
	
}
