package com.wannaattention.www.vo;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int boardNum;
	private int writerNum;
	private String writerId;
	private String writerNickname;
	@NotEmpty(message = "게시판 종류를 선택해 주세요.")
	private String boardType;
	@NotEmpty(message = "제목은 필수 입력사항입니다.")
	private String title;
	private Date regDate;
	private int readCnt;
	private String content;
	private int grp;
	private int grpLevel;
	private int grpStep;
	private String photoFilename;
	private String videoFilename;
	private String etcFilename;
	private MultipartFile photoFile;
	private MultipartFile videoFile;
	private MultipartFile etcFile;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getWriterNum() {
		return writerNum;
	}
	public void setWriterNum(int writerNum) {
		this.writerNum = writerNum;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getWriterNickname() {
		return writerNickname;
	}
	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrpLevel() {
		return grpLevel;
	}
	public void setGrpLevel(int grpLevel) {
		this.grpLevel = grpLevel;
	}
	public int getGrpStep() {
		return grpStep;
	}
	public void setGrpStep(int grpStep) {
		this.grpStep = grpStep;
	}
	public String getPhotoFilename() {
		return photoFilename;
	}
	public void setPhotoFilename(String photoFilename) {
		this.photoFilename = photoFilename;
	}
	public String getVideoFilename() {
		return videoFilename;
	}
	public void setVideoFilename(String videoFilename) {
		this.videoFilename = videoFilename;
	}
	public String getEtcFilename() {
		return etcFilename;
	}
	public void setEtcFilename(String etcFilename) {
		this.etcFilename = etcFilename;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	public MultipartFile getVideoFile() {
		return videoFile;
	}
	public void setVideoFile(MultipartFile videoFile) {
		this.videoFile = videoFile;
	}
	public MultipartFile getEtcFile() {
		return etcFile;
	}
	public void setEtcFile(MultipartFile etcFile) {
		this.etcFile = etcFile;
	}
	
	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", writerNum=" + writerNum + ", writerId=" + writerId
				+ ", writerNickname=" + writerNickname + ", boardType=" + boardType + ", title=" + title + ", regDate="
				+ regDate + ", readCnt=" + readCnt + ", content=" + content + ", grp=" + grp + ", grpLevel=" + grpLevel
				+ ", grpStep=" + grpStep + ", photoFilename=" + photoFilename + ", videoFilename=" + videoFilename
				+ ", etcFilename=" + etcFilename + ", photoFile=" + photoFile + ", videoFile=" + videoFile
				+ ", etcFile=" + etcFile + "]";
	}
	
	
	
	
}
