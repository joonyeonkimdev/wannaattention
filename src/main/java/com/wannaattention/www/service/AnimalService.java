package com.wannaattention.www.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wannaattention.www.dao.AnimalDAO;

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
