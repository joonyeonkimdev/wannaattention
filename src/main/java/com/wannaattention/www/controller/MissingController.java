package com.wannaattention.www.controller;

import java.util.List;

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

import com.wannaattention.www.service.MissingService;
import com.wannaattention.www.vo.MissingAnimal;

@Controller
@RequestMapping("missing")
public class MissingController {
	
	@Autowired
	private MissingService service;
	
	@GetMapping("missingRegister")
	public ModelAndView missingRegister() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new MissingAnimal());
		return mav;
	}
	
	@PostMapping("missingRegister")
	public ModelAndView missingRegister(@Valid MissingAnimal missingAnimal, BindingResult bindingresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int missingAnimalNum;
		System.out.println(missingAnimal.getPhotoFilename());
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.missing");
			return mav;
		}
		try {
			missingAnimalNum = service.insertMissingAnimal(missingAnimal, request);
			mav.addObject("missingAnimal", missingAnimal);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.register.missing");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:missingDetail?missingAnimalNum=" + missingAnimalNum);
		return mav;
	}

	@RequestMapping("missingDetail")
	public ModelAndView missingDetail(Integer missingAnimalNum) {
		ModelAndView mav = new ModelAndView();
		MissingAnimal missingAnimal = service.selectMissingAnimal(missingAnimalNum);
		mav.addObject("missingAnimal", missingAnimal);
		return mav;
	}
	
	@RequestMapping("missingList")
	public ModelAndView missingList(Integer pageNum, HttpSession session, String species) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			   pageNum = 1;
		}
		
		int limit = 10;
		int listCount = service.missingCount(); // 동물 리스트 갯수
		List<MissingAnimal> missingList = service.missingList(pageNum, limit); // 동물 리스트 가져오기 
		
		int maxPage = (int)((double)listCount/limit + 0.95); // 출력 최대 페이지
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1; // 페이징 시작번호
		int endPage = startPage + 9; // 페이징 끝번호
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		mav.addObject("pageNum", pageNum); 
		mav.addObject("maxPage", maxPage); 
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage); 
		mav.addObject("listCount", listCount);
		mav.addObject("missingList", missingList);
		return mav;
	}
	
	@RequestMapping("missingDelete")
	public ModelAndView missingDelete(Integer missingAnimalNum) {
		ModelAndView mav = new ModelAndView();
		service.deleteMissing(missingAnimalNum);
		mav.addObject("msg", "실종 등록 동물이 삭제되었습니다.");
		mav.addObject("url", "missingList");
		mav.setViewName("/alert");
		return mav;
	}
	
	@GetMapping("missingUpdate")
	public ModelAndView missingUpdate(Integer missingAnimalNum) {
		ModelAndView mav = new ModelAndView();
		MissingAnimal missingAnimal = service.selectMissingAnimal(missingAnimalNum);
		mav.addObject("missingAnimal", missingAnimal);
		System.out.println(missingAnimal);
		return mav;
	}
	
	@PostMapping("missingUpdate")
	public ModelAndView missingUpdate(@Valid MissingAnimal missingAnimal, BindingResult bindingresult, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(missingAnimal);
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.missing");
			return mav;
		}
		try {
		    service.updateMissing(missingAnimal, request);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.update.missing");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:missingDetail?missingAnimalNum=" + missingAnimal.getMissingAnimalNum());
		return mav;
	}
	
	
}
