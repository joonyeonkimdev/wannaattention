package com.wannaattention.www.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wannaattention.www.dao.CommunityDAO;
import com.wannaattention.www.vo.Board;

@Service
public class CommunityService {
	@Autowired
	private CommunityDAO dao;

	public int insertBoard(Board board, HttpServletRequest request) {
		int maxBoardNum = dao.getMaxBoardNum();
		board.setBoardNum(maxBoardNum + 1);
		if(board.getPhotoFile() != null && !board.getPhotoFile().isEmpty()) {
			String boardPhotoUploadPath = request.getServletContext().getRealPath("/") + "boardPhoto/";
			uploadFileCreate(board.getPhotoFile(), boardPhotoUploadPath);
			board.setPhotoFilename(board.getPhotoFile().getOriginalFilename());
			File currentFile = new File(boardPhotoUploadPath + board.getPhotoFilename());
			File newFile = new File(boardPhotoUploadPath + board.getWriterId() + "_" + board.getBoardNum() + "_boardPhoto" + board.getPhotoFilename().substring(board.getPhotoFilename().lastIndexOf(".")));
			try {
				Files.copy(currentFile.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (currentFile.exists()) {
				currentFile.delete();
			}
			board.setPhotoFilename(board.getWriterId() + "_" + board.getBoardNum() + "_boardPhoto" + board.getPhotoFilename().substring(board.getPhotoFilename().lastIndexOf(".")));
		}
		dao.insertBoard(board);
		return board.getBoardNum();
	}
	
	private void uploadFileCreate(MultipartFile file, String uploadPath) {
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

	public Board selectBoardByBN(Integer boardNum) {
		return dao.selectBoardByBN(boardNum);
	}

	public int boardCount(String boardType) {
		return dao.boardCount(boardType);
	}

	public List<Board> boardList(Integer pageNum, int limit, String boardType) {
		return dao.boardList(pageNum, limit, boardType);
	}

	public void readCntAdd(Integer boardNum) {
		dao.readCntAdd(boardNum);
	}

	public void deleteBoard(Integer boardNum) {
		dao.deleteBoard(boardNum);	
	}

	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}
	
	
}
