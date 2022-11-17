package com.wannaattention.www.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wannaattention.www.dao.AnimalDAO;
import com.wannaattention.www.vo.Animal;

@Service
public class AnimalService {
	@Autowired
	private AnimalDAO dao;
	
	// 임시 프로필 파일 업로드
	public void tempUpload(MultipartFile tempFile, HttpServletRequest request) {
		if(tempFile != null && !tempFile.isEmpty()) {
			String tempUploadPath = request.getServletContext().getRealPath("/") + "tempUploadFile/";
			uploadFileCreat(tempFile, tempUploadPath);
		}
	}

	public void insertAnimal(Animal animal, HttpServletRequest request) {
		// 임시 파일 -> 프로필 파일 업로드
		if (animal.getProfileFilename() != null && !animal.getProfileFilename().isEmpty()) {
			String tempFilePath = request.getServletContext().getRealPath("/") + "tempUploadFile/"
					+ animal.getProfileFilename();
			String newFilePath = request.getServletContext().getRealPath("/") + "profileFile/" + "animal_" + animal.getShelterNum() + animal.getName() + "_profile"
					 + animal.getProfileFilename().substring(animal.getProfileFilename().lastIndexOf("."));
			File tempProfileFile = new File(tempFilePath);
			File newProfileFile = new File(newFilePath);
			if (tempProfileFile.exists()) {
				if (!newProfileFile.exists()) {
					newProfileFile.mkdirs();
				}
				try {
					Files.copy(tempProfileFile.toPath(), newProfileFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
					animal.setProfileFilename("animal_" + animal.getShelterNum() + animal.getName() + "_profile"
								+ animal.getProfileFilename().substring(animal.getProfileFilename().lastIndexOf(".")));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (newProfileFile.exists()) {
				tempProfileFile.delete();
			}
		}
		
		// 

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
