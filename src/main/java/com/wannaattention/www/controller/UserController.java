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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.UserService;
import com.wannaattention.www.vo.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService service;
	
	@GetMapping("*")
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());
		return mav;
	}
	
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
	
	@RequestMapping("idDuplChk")
	public String idDuplChk() {
		return null;
	}
	
	@RequestMapping("idDuplChkDone")
	public ModelAndView idDuplChkDone(String id) {
		ModelAndView mav = new ModelAndView();
		User user = service.selectUserById(id);
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
		request.getSession().setAttribute("userNickname", user.getNickname());
		return mav;
	}
	
	@RequestMapping("welcome")
	public String welcome() {
		return null;
	}
	
	@PostMapping("login")
	public ModelAndView login(User user, BindingResult bindingresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 입력값 유효성 검사
		if(user.getId() == null || user.getId().equals("") || user.getPw() == null || user.getPw().equals("")) {
			bindingresult.rejectValue("id", "error.login");
		}
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.login.id");
			return mav;
		}
	
		// id 존재 확인
		 User dbUser = service.selectUserById(user.getId());
		 if (dbUser == null) {
			 bindingresult.reject("error.login.id");
			 mav.getModel().putAll(bindingresult.getModel());
			 return mav;
		 }
		 
		 // 비밀번호 비교
		 boolean pwFlag = service.login(user);
		 if (pwFlag) {
			 session.setAttribute("loginUser", dbUser);
		 } else {
			 bindingresult.reject("error.login.pw");
			 mav.getModel().putAll(bindingresult.getModel());
			 return mav;
		 }
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	@PostMapping("idSearch")
	public ModelAndView idSearch(User user) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.selectUserByEmail(user.getEmail());
		if (dbUser != null && dbUser.getQues1().equals(user.getQues1()) 
							&& dbUser.getQues2().equals(user.getQues2()) 
							&& dbUser.getQues3().equals(user.getQues3())) {
			mav.addObject("user", dbUser);
		} else {
			mav.addObject("user", null);
		}
		mav.setViewName("user/idsResult");
		return mav;
	}
	
	@RequestMapping("idsResult")
	public String idsResult() {
		return null;
	}
	
	@PostMapping("pwSearch")
	public ModelAndView pwSearch(User user) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.selectUserById(user.getId());
		if (dbUser != null && dbUser.getQues1().equals(user.getQues1()) 
							&& dbUser.getQues2().equals(user.getQues2()) 
							&& dbUser.getQues3().equals(user.getQues3())) {
			mav.addObject("user", dbUser);
		} else {
			mav.addObject("user", null);
		}
		mav.setViewName("user/initiPw");
		return mav;
	}
	
	@RequestMapping("initiPw")
	public ModelAndView initializePw(User user, BindingResult bindingresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(user.getPw() == null || user.getPw().equals("")) {
			bindingresult.rejectValue("pw", "error.pw.combination");
		}
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.pw.combination");
			return mav;
		}
		try {
			service.updateUserPw(user);
		} catch(Exception e) {
			e.printStackTrace();
			bindingresult.rejectValue("pw", "error.initial.pw");
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.initial.pw");
			return mav;
		}
		mav.setViewName("redirect:initiPwDone");
		return mav;
	}
	
	
	
	
	
	
	
	

}
