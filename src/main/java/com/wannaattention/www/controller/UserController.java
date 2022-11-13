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

import com.wannaattention.www.service.UserService;
import com.wannaattention.www.vo.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService service;
	
	@GetMapping("tempUpload")
	public String tempUpload() {
		return null;
	}
	
	@PostMapping("tempUpload")
	public ModelAndView tempUpload(MultipartFile tempFile, HttpServletRequest request) {
		service.tempUpload(tempFile, request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("filename", tempFile.getOriginalFilename());
		mav.setViewName("user/tempUploadDone");
		return mav;
	}
	
	@GetMapping("join")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping("idDuplChk")
	public String idDuplChk() {
		return null;
	}
	
	@RequestMapping("idDuplChkDone")
	public ModelAndView idDuplChkDone(String id) {
		ModelAndView mav = new ModelAndView();
		User user = service.selectUser(id);
		mav.addObject("user", user);
		mav.addObject("id", id);
		return mav;
		
	}
	
	@PostMapping("join")
	public ModelAndView join(@Valid User user, BindingResult bindingresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if(bindingresult.hasErrors()) { 
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.input.user");
			return mav;
		}
		try {
			service.insertUser(user, request);
			mav.addObject("user",user);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.reject("error.join.user");
			mav.getModel().putAll(bindingresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:welcome");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	

}
