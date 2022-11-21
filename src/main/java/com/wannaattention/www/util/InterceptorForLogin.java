package com.wannaattention.www.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.User;

public class InterceptorForLogin extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			throw new InterceptedException("로그인 후 이용 가능합니다.", "/user/login");
		}
		return super.preHandle(request, response, handler);
	}
	
}
