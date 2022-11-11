package com.wannaattention.www.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.UserService;
import com.wannaattention.www.vo.UserVO;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService service;
	
	@GetMapping("join")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		UserVO user = new UserVO();
		mav.addObject("user", user);
		return mav;
	}
	
	@PostMapping("join")
	public ModelAndView join(@Valid UserVO user, BindingResult bindingresult) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) { 
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.user");
			return mav;
		}
		try {
//			service.userInsert(user);
			mav.addObject("user",user);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.duplicate.user");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:login");
		return mav;
	}

}
