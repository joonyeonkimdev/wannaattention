package com.wannaattention.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("board")
public class BoardContoller {
	@RequestMapping("animalList")
	public ModelAndView animalList() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
}
