package com.wannaattention.www.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.AnimalService;
import com.wannaattention.www.vo.Animal;

@Controller
@RequestMapping("animal")
public class AnimalController {
	@Autowired
	private AnimalService service;
	
	@GetMapping("*")
	public ModelAndView getAnimal() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Animal());
		return mav;
	}
	
	@PostMapping("animalRegister")
	public ModelAndView animalRegister(@Valid Animal animal, BindingResult bindingresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.animal");
			return mav;
		}
		try {
			service.insertAnimal(animal, request);
			mav.addObject("animal", animal);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.register.animal");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:animalList");
		return mav;
	}
	
	@RequestMapping("animalList")
	public ModelAndView animalList(Integer pageNum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			   pageNum = 1;
		}
		
		int limit = 10;
		int listCount = service.animalCount(); // 동물 리스트 갯수
		List<Animal> animalList = service.animalList(pageNum, limit); // 동물 리스트 가져오기 
		
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
		mav.addObject("animalList", animalList);
		return mav;
	}
	

}
