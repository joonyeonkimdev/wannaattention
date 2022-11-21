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

import com.wannaattention.www.service.AnimalService;
import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.Booking;
import com.wannaattention.www.vo.User;

@Controller
@RequestMapping("animal")
public class AnimalController {
	@Autowired
	private AnimalService service;
	
	@GetMapping("animalRegister")
	public ModelAndView animalRegister() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Animal());
		return mav;
	}
	
	@PostMapping("animalRegister")
	public ModelAndView animalRegister(@Valid Animal animal, BindingResult bindingresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int animalNum;
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.animal");
			return mav;
		}
		try {
		    animalNum = service.insertAnimal(animal, request);
			mav.addObject("animal", animal);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.register.animal");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:animalDetail?animalNum=" + animalNum);
		return mav;
	}
	
	@RequestMapping("animalList")
	public ModelAndView animalList(Integer pageNum, HttpSession session, String species) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			   pageNum = 1;
		}
		if (species == null || species.equals("")) {
			species = "0";
		}
		
		int limit = 10;
		int listCount = service.animalCount(); // 동물 리스트 갯수
		List<Animal> animalList = service.animalList(pageNum, limit, species); // 동물 리스트 가져오기 
		
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
		mav.addObject("species", species);
		return mav;
	}
	
	@RequestMapping("animalDetail")
	public ModelAndView animalDetail(Integer animalNum) {
		ModelAndView mav = new ModelAndView();
		Animal animal = service.selectAnimal(animalNum);
		mav.addObject("animal", animal);
		return mav;
	}
	
	@RequestMapping("shelterInfo")
	public ModelAndView shelterInfo(String shelterNum) {
		ModelAndView mav = new ModelAndView();
		User shelter = service.selectShelter(shelterNum);
		mav.addObject("shelter", shelter);
		return mav;
	}
	
	@GetMapping("booking")
	public ModelAndView booking(Integer animalNum) {
		ModelAndView mav = new ModelAndView();
		Animal animal = service.selectAnimal(animalNum);
		mav.addObject("animal", animal);
		mav.addObject(new Booking());
		return mav;
	}
	
	@PostMapping("booking")
	public ModelAndView booking(@Valid Booking booking, BindingResult bindingresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.booking");
			return mav;
		}
		try {
		    service.insertBooking(booking);
			mav.addObject("booking", booking);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.booking.adopt");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		HttpSession session = request.getSession();
		session.setAttribute("booking", booking);
		mav.setViewName("redirect:bookingConfirm");
		return mav;
	}
	
	@GetMapping("bookingConfirm")
	public String bookingConfirm(HttpSession session) {
		if (session.getAttribute("booking") == null) {
			return "/home";
		} else {
			session.removeAttribute("booking");
			return null;
		}
	}
	
	@RequestMapping("animalDelete")
	public ModelAndView animalDelete(Integer animalNum) {
		ModelAndView mav = new ModelAndView();
		service.deleteAnimal(animalNum);
		mav.addObject("msg", "등록 동물이 삭제되었습니다.");
		mav.addObject("url", "animalList");
		mav.setViewName("/alert");
		return mav;
	}
	
	@GetMapping("animalUpdate")
	public ModelAndView animalUpdate(Integer animalNum) {
		ModelAndView mav = new ModelAndView();
		Animal animal = service.selectAnimal(animalNum);
		mav.addObject("animal", animal);
		return mav;
	}
	
	@PostMapping("animalUpdate")
	public ModelAndView animalUpdate(@Valid Animal animal, BindingResult bindingresult, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.animal");
			return mav;
		}
		try {
		    service.updateAnimal(animal, request);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.update.animal");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:animalDetail?animalNum=" + animal.getAnimalNum());
		return mav;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
