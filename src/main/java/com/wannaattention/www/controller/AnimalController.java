package com.wannaattention.www.controller;

import javax.servlet.http.HttpServletRequest;
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
	
	

}
