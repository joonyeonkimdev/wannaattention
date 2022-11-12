package com.wannaattention.www.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wannaattention.www.dao.UserDAO;
import com.wannaattention.www.vo.User;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;

	// 임시폴더에 임시파일 저장
	public void tempUpload(MultipartFile tempFile, HttpServletRequest request) {
		if(tempFile != null && !tempFile.isEmpty()) {
			String tempUploadPath = request.getServletContext().getRealPath("/") + "tempUploadFile/";
			uploadFileCreat(tempFile, tempUploadPath);
		}
	}
	
	// 회원가입
	public void insertUser(User user, HttpServletRequest request) {
		System.out.println("서블릿 콘텍스트" + request.getServletContext());
		System.out.println("리얼 루트 경로" + request.getServletContext().getRealPath("/"));
		
		// 임시 파일 -> 프로필 파일 업로드
		String tempFilePath = request.getServletContext().getRealPath("/") + "tempUploadFile/" + user.getProfileFilename();
		String newFilePath = request.getServletContext().getRealPath("/") + "profileFile/" + user.getId() + "_profile";
		File tempProfileFile = new File(tempFilePath);
		File newProfileFile = new File(newFilePath);
		if (tempProfileFile.exists()) {
			try {
				Files.copy(tempProfileFile.toPath(), newProfileFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (newProfileFile.exists()) {
			tempProfileFile.delete();
		}
		user.setProfileFilename(user.getId() + "_profile");
		
		// 사업자 등록증 업로드
		if(user.getShelterDesFile() != null && !user.getShelterDesFile().isEmpty()) {
			String shelterDocUploadPath = request.getServletContext().getRealPath("/") + "shelterDocsFile/";
			uploadFileCreat(user.getShelterDesFile(), shelterDocUploadPath);
			File currentDocFile = new File(shelterDocUploadPath + user.getShelterDesFile());
			File newDocFile = new File(shelterDocUploadPath + user.getId() + "_shelterDoc");
			try {
				Files.copy(currentDocFile.toPath(), newDocFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (currentDocFile.exists()) {
				currentDocFile.delete();
			}
			user.setShelterDesFilename(user.getId() + "_shelterDoc");
		}
		int maxUserNum = dao.selectMaxUserNum();
		user.setUserNum(maxUserNum+1);
		dao.insertUser(user);
	}
	
	// 파일 업로드
	private void uploadFileCreat(MultipartFile file, String uploadPath) {
		String getOriginalFilename = file.getOriginalFilename();
		File filePath = new File(uploadPath);
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		try {
			file.transferTo(new File(uploadPath + getOriginalFilename));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User selectUser(String id) {
		return dao.selectUser(id);
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
