package com.wannaattention.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.AnimalService;
import com.wannaattention.www.vo.Animal;

@Controller
@RequestMapping("animal")
public class AnimalController {
	@Autowired
	AnimalService service;
	
	@GetMapping("*")
	public ModelAndView getAnimal() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Animal());
		return mav;
	}
	
	

}
