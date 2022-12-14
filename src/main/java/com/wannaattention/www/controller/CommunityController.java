package com.wannaattention.www.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.CommunityService;
import com.wannaattention.www.vo.Board;
import com.wannaattention.www.vo.User;

@Controller
@RequestMapping("community")
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/") +"boardPhoto/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) {
		  File file = new File(path, upload.getOriginalFilename());
		  try {
			  upload.transferTo(file);
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		}
		
		// 파일이름 변경
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm"); 
		String nowDate = simpleDateFormat.format(new Date()); 
		File currentFile = new File(path + upload.getOriginalFilename());
		File newFile = new File(path + loginUser.getId() + "_ckedit_" + nowDate + upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf(".")));
		try {
			Files.copy(currentFile.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (currentFile.exists()) {
			currentFile.delete();
		}
		String fileName = "/boardPhoto/" + loginUser.getId() + "_ckedit_" + nowDate + upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf("."));		
		System.out.println(fileName);
		model.addAttribute("fileName", fileName);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "/ckedit";
	}
	
	@GetMapping("boardWrite")
	public ModelAndView boardWrite(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String boardType = (String)session.getAttribute("boardType");
		if (boardType == null) {
			boardType = "4";
		}
		String boardName = null;
		switch(boardType) {
		case "1" : boardName = "공지사항"; break;
		case "2" : boardName = "후원금 사용내역"; break;
		case "3" : boardName = "QnA"; break;
		case "4" : boardName = "자유게시판"; break;
		case "5" : boardName = "입양 후기"; break; 
		}
		mav.addObject(new Board());
		session.setAttribute("boardName", boardName);
		mav.addObject("boardType", boardType);
		return mav;
	}
	
	@PostMapping("boardWrite")
	public ModelAndView boardWrite(@Valid Board board, BindingResult bindingresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) { 
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.board");
			return mav;
		}
		int boardNum;
		try {
			boardNum = service.insertBoard(board, request);
			mav.addObject("user",board);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.write.board");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:boardDetail?boardNum=" + boardNum);
		return mav;
	}
	
	@RequestMapping("boardDetail")
	public ModelAndView boardDetail(Integer boardNum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String boardType = (String)session.getAttribute("boardType");
		if (boardType == null) {
			boardType = "4";
		}
		String boardName = null;
		switch(boardType) {
		case "1" : boardName = "공지사항"; break;
		case "2" : boardName = "후원금 사용내역"; break;
		case "3" : boardName = "QnA"; break;
		case "4" : boardName = "자유게시판"; break;
		case "5" : boardName = "입양 후기"; break; 
		}
		mav.addObject(new Board());
		session.setAttribute("boardName", boardName);
		service.readCntAdd(boardNum);
		Board board = service.selectBoardByBN(boardNum);
		mav.addObject("board", board);
		return mav;
	}
	
	@RequestMapping("boardList")
	public ModelAndView boardList(Integer pageNum, String boardType, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(boardType == null || boardType.equals("")) {
			boardType = "4";
		}
		session.setAttribute("boardType", boardType);
		String boardName = null;
		switch(boardType) {
			case "1" : boardName = "공지사항"; break;
			case "2" : boardName = "후원금 사용내역"; break;
			case "3" : boardName = "QnA"; break;
			case "4" : boardName = "자유게시판"; break;
			case "5" : boardName = "입양후기"; break;
		}
		
		int limit = 10;
		int listCount = service.boardCount(boardType);
		List<Board> boardList = service.boardList(pageNum, limit, boardType);
		
		int maxPage = (int)((double)listCount/limit + 0.95);
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endPage = startPage + 9;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		int boardNo = listCount - (pageNum - 1) * limit; // 글번호
		
		mav.addObject("boardType", boardType);
		mav.addObject("boardName", boardName);
		mav.addObject("pageNum", pageNum); 
		mav.addObject("maxPage", maxPage); 
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage); 
		mav.addObject("listCount", listCount);
		mav.addObject("boardList", boardList);
		mav.addObject("boardNo", boardNo);
		return mav;
	}
	
	@RequestMapping("boardDelete")
	public ModelAndView boardDelete(Integer boardNum) {
		ModelAndView mav = new ModelAndView();
		Board board = service.selectBoardByBN(boardNum);
		service.deleteBoard(boardNum);
		mav.addObject("msg", "게시글이 삭제되었습니다.");
		mav.addObject("url", "boardList?boardType=" + board.getBoardType());
		mav.setViewName("/alert");
		return mav;	
	}
	
	@GetMapping("boardUpdate")
	public ModelAndView boardUpdate(Integer boardNum) {
		ModelAndView mav = new ModelAndView();
		Board board = service.selectBoardByBN(boardNum);
		mav.addObject("board", board);
		String boardType = board.getBoardType();
		if(boardType == null || boardType.equals("1"))
			mav.addObject("boardName","공지시항");
		else if(boardType.equals("2"))
			mav.addObject("boardName","후원금 사용내역");
		else if(boardType.equals("3"))
			mav.addObject("boardName","QNA");
		else if(boardType.equals("4"))
			mav.addObject("boardName","자유게시판");
		else if(boardType.equals("5"))
			mav.addObject("boardName","입양 후기");
		return mav;
	}
	
	@PostMapping("boardUpdate")
	public ModelAndView boardUpdate(@Valid Board board, BindingResult bindingresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.board");
			return mav;
		}
		try {
		    service.updateBoard(board);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.update.board");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:boardDetail?boardNum=" + board.getBoardNum());
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
