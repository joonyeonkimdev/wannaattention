package com.wannaattention.www.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wannaattention.www.dao.UserDAO;
import com.wannaattention.www.vo.User;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;

	// 임시폴더에 임시파일 저장
	public void tempUpload(MultipartFile tempFile, HttpServletRequest request) {
		if(tempFile != null && !tempFile.isEmpty()) {
			String tempUploadPath = request.getServletContext().getRealPath("/") + "tempUploadFile/";
			uploadFileCreat(tempFile, tempUploadPath);
		}
	}
	
	// 회원가입
	public void insertUser(User user, HttpServletRequest request) {
		// 임시 파일 -> 프로필 파일 업로드
		if (user.getProfileFilename() != null && !user.getProfileFilename().isEmpty()) {
			String tempFilePath = request.getServletContext().getRealPath("/") + "tempUploadFile/" + user.getProfileFilename();
			String newFilePath = request.getServletContext().getRealPath("/") + "profileFile/" + user.getId() + "_profile" + user.getProfileFilename().substring(user.getProfileFilename().lastIndexOf("."));
			File tempProfileFile = new File(tempFilePath);
			File newProfileFile = new File(newFilePath);
			if (tempProfileFile.exists()) {
				if (!newProfileFile.exists()) {
					newProfileFile.mkdirs();
				}
				try {
					Files.copy(tempProfileFile.toPath(), newProfileFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
					user.setProfileFilename(user.getId() + "_profile" + user.getProfileFilename().substring(user.getProfileFilename().lastIndexOf(".")));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (newProfileFile.exists()) {
				tempProfileFile.delete();
			}	
		}
		
		// 사업자 등록증 업로드
		if(user.getShelterDesFile() != null && !user.getShelterDesFile().isEmpty()) {
			String shelterDocUploadPath = request.getServletContext().getRealPath("/") + "shelterDocsFile/";
			uploadFileCreat(user.getShelterDesFile(), shelterDocUploadPath);
			user.setShelterDesFilename(user.getShelterDesFile().getOriginalFilename());
			File currentDocFile = new File(shelterDocUploadPath + user.getShelterDesFilename());
			File newDocFile = new File(shelterDocUploadPath + user.getId() + "_shelterDoc");
			try {
				Files.copy(currentDocFile.toPath(), newDocFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (currentDocFile.exists()) {
				currentDocFile.delete();
			}
			user.setShelterDesFilename(user.getId() + "_shelterDoc" + user.getShelterDesFilename().substring(user.getShelterDesFilename().lastIndexOf(".")));
		}
		
		// 회원등록
		int maxUserNum = dao.selectMaxUserNum();
		user.setUserNum(maxUserNum+1);
		String encPw = encoder.encode(user.getPw());
		user.setPw(encPw);
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

	public User selectUserById(String id) {
		return dao.selectUserById(id);
	}

	public boolean login(User user) {
		User dbUser = dao.selectUserById(user.getId());
		return encoder.matches(user.getPw(), dbUser.getPw());
	}

	public User selectUserByEmail(String email) {
		return dao.selectUserByEmail(email);
	}

	public void updateUserPw(User user) {
		String encPw = encoder.encode(user.getPw());
		user.setPw(encPw);
		dao.updateUserPw(user);
	}

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
