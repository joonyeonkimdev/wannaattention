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
	private UserService service;
	
	@GetMapping("*")
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
		request.getSession().setAttribute("userNickname", user.getNickname());
		mav.setViewName("redirect:welcome");
		return mav;
	}
	
	@RequestMapping("welcome")
	public String welcome(HttpSession session) {
		if (session.getAttribute("userNickname") == null) {
			return "/home";
		} else {
			session.removeAttribute("userNickname");
			return null;
		}
	}
	
	@PostMapping("login")
	public ModelAndView login(User user, BindingResult bindingresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// ????????? ????????? ??????
		if(user.getId() == null || user.getId().equals("") || user.getPw() == null || user.getPw().equals("")) {
			bindingresult.rejectValue("id", "error.login");
		}
		if(bindingresult.hasErrors()) {
			mav.getModel().putAll(bindingresult.getModel());
			bindingresult.reject("error.login.id");
			return mav;
		}
	
		// id ?????? ??????
		 User dbUser = service.selectUserById(user.getId());
		 if (dbUser == null) {
			 bindingresult.reject("error.login.id");
			 mav.getModel().putAll(bindingresult.getModel());
			 return mav;
		 }
		 
		 // ???????????? ??????
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
	
	@GetMapping("pwSearch")
	public ModelAndView pwSearch() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());
		return mav;
	}
	
	@PostMapping("pwSearch")
	public ModelAndView pwSearch(User user) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.selectUserById(user.getId());
		System.out.println("dbUser");
		System.out.println(dbUser);
		if (dbUser != null && dbUser.getQues1().equals(user.getQues1()) 
							&& dbUser.getQues2().equals(user.getQues2()) 
							&& dbUser.getQues3().equals(user.getQues3())) {
			user.setUserNum(dbUser.getUserNum());
			System.out.println("user");
			System.out.println(user);
			mav.addObject("user", user);
		} else {
			mav.addObject("user", null);
		}
		mav.setViewName("user/initiPw");
		return mav;
	}
	
	@PostMapping("initiPw")
	public ModelAndView initiPw(User user, BindingResult bindingresult) {
		System.out.println("????????? user post");
		System.out.println(user);
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