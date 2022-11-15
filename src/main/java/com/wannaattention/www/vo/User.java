package com.wannaattention.www.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class User {
	private int userNum;
	private String userType;
	@Size(message = "아이디는 5~15자리를 사용해야 합니다.")
	private String id;
	@Size(min=8,max=16,message="비밀번호는 영문+숫자+특수문자 조합 8~25자리를 사용해야 합니다.")
	private String pw;
	@NotEmpty(message="사용자 이름은 필수 입력사항입니다.")
	private String name;
	@NotEmpty(message="사용자 닉네임은 필수 입력사항입니다.")
	private String nickname;
	private Date birthday;
	@NotEmpty(message="이메일은 필수 입력사항입니다.")
	private String email;
	@NotEmpty(message="휴대전화번호는 필수 입력사항입니다.")
	private String phone;
	private String tel;
	@NotEmpty(message="우편번호는 필수 입력사항입니다.")
	private String postNum;
	@NotEmpty(message="주소는 필수 입력사항입니다.")
	private String address;
	private Date signupDate;
	private String busiNum;
	@NotEmpty(message = "보안 질문은 필수 입력사항입니다.(ID/PW 찾기에 활용)")
	private String ques1;
	@NotEmpty(message = "보안 질문은 필수 입력사항입니다.(ID/PW 찾기에 활용)")
	private String ques2;
	@NotEmpty(message = "보안 질문은 필수 입력사항입니다.(ID/PW 찾기에 활용)")
	private String ques3;
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
	
	public String getQues1() {
		return ques1;
	}
	public void setQues1(String ques1) {
		this.ques1 = ques1;
	}
	public String getQues2() {
		return ques2;
	}
	public void setQues2(String ques2) {
		this.ques2 = ques2;
	}
	public String getQues3() {
		return ques3;
	}
	public void setQues3(String ques3) {
		this.ques3 = ques3;
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
