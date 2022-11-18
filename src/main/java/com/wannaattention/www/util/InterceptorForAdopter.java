package com.wannaattention.www.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wannaattention.www.vo.User;

public class InterceptorForAdopter extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if (loginUser.getUserType().equals("1")) {
			throw new InterceptedException("일반 회원만 이용 가능합니다.", "/animal/animalList");
		}
		return super.preHandle(request, response, handler);
	}

}
