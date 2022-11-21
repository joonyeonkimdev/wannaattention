package com.wannaattention.www.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wannaattention.www.dao.AnimalDAO;
import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.User;

public class InterceptorForMyPost extends HandlerInterceptorAdapter {
	@Autowired
	private AnimalDAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if (request.getParameter("animalNum") == null) {
			throw new InterceptedException("올바르지 않은 접근입니다.", "/animal/animalList");
		}
		Integer animalNum = Integer.parseInt(request.getParameter("animalNum"));
		User loginUser = (User)session.getAttribute("loginUser");
		Animal animal = dao.selectAnimal(animalNum);
		if (loginUser.getUserNum() != animal.getShelterNum()) {
			throw new InterceptedException("접근 권한이 없습니다.", "/animal/animalList");
		}
		return super.preHandle(request, response, handler);
	}
	

}
