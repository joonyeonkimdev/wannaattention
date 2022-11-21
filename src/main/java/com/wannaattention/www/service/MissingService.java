package com.wannaattention.www.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannaattention.www.dao.MissingDAO;
import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.MissingAnimal;
import com.wannaattention.www.vo.User;

@Service
public class MissingService {
	@Autowired
	private MissingDAO dao;

	public int insertMissingAnimal(MissingAnimal missingAnimal, HttpServletRequest request) {
		if (missingAnimal.getPhotoFilename() != null && !missingAnimal.getPhotoFilename().isEmpty()) {
			HttpSession session = request.getSession();
			User loginUser = (User)session.getAttribute("loginUser");
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm"); 
			String nowDate = simpleDateFormat.format(new Date());
			String tempFilePath = request.getServletContext().getRealPath("/") + "tempUploadFile/"
					+ missingAnimal.getPhotoFilename();
			String newFilePath = request.getServletContext().getRealPath("/") + "missingPhoto/" 
					+ loginUser.getId() + "_missingPhoto" + nowDate + missingAnimal.getPhotoFilename().substring(missingAnimal.getPhotoFilename().lastIndexOf("."));
			File tempFile = new File(tempFilePath);
			File newFile = new File(newFilePath);
			if (tempFile.exists()) {
				if (!newFile.exists()) {
					newFile.mkdirs();
				}
				try {
					Files.copy(tempFile.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (newFile.exists()) {
				tempFile.delete();
			}
			missingAnimal.setPhotoFilename(loginUser.getId() + "_missingPhoto" + nowDate + missingAnimal.getPhotoFilename().substring(missingAnimal.getPhotoFilename().lastIndexOf(".")));
		}

		// 동물 등록
		int maxMissingAnimalNum = dao.selectMaxMissingAnimalNum();
		missingAnimal.setMissingAnimalNum(maxMissingAnimalNum + 1);
		dao.insertMissingAnimal(missingAnimal);
		return missingAnimal.getMissingAnimalNum();
	}

	public MissingAnimal selectMissingAnimal(Integer missingAnimalNum) {
		return dao.selectMissingAnimal(missingAnimalNum);
	}

	public int missingCount() {
		return dao.missingCount();
	}

	public List<MissingAnimal> missingList(Integer pageNum, int limit) {
		return dao.missingList(pageNum, limit);
	}

	public void deleteMissing(Integer missingAnimalNum) {
		dao.deleteMissing(missingAnimalNum);
	}

}
