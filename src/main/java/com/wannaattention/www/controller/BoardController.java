package com.wannaattention.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.BoardService;
import com.wannaattention.www.vo.Board;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@GetMapping("write")
	public ModelAndView write(HttpSession session) {
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
		mav.addObject("boardType", boardType);
		mav.addObject("boardName",boardName);
		return mav;
	}
	
	@PostMapping("write")
	public ModelAndView write(@Valid Board board, BindingResult bindingresult, HttpServletRequest request) {
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
	public ModelAndView boardDetail() {
		ModelAndView mav = new ModelAndView();
		return null;
	}
	
	
	
	
	
	
	
	
}
