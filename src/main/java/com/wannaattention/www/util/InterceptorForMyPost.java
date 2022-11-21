package com.wannaattention.www.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wannaattention.www.dao.AnimalDAO;
import com.wannaattention.www.dao.CommunityDAO;
import com.wannaattention.www.dao.MissingDAO;
import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.Board;
import com.wannaattention.www.vo.MissingAnimal;
import com.wannaattention.www.vo.User;

public class InterceptorForMyPost extends HandlerInterceptorAdapter {
	@Autowired
	private AnimalDAO animalDao;
	@Autowired
	private MissingDAO missingDao;
	@Autowired
	private CommunityDAO communityDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
//		
//		// 입양 동물 수정/삭제 권한
//		if (request.getParameter("animalNum") == null) {
//			throw new InterceptedException("올바르지 않은 접근입니다.", "/animal/animalList");
//		}
//		Integer animalNum = Integer.parseInt(request.getParameter("animalNum"));
//		Animal animal = animalDao.selectAnimal(animalNum);
//		if (loginUser.getUserNum() != animal.getShelterNum()) {
//			throw new InterceptedException("접근 권한이 없습니다.", "/animal/animalList");
//		}
//		
//		// 실종 동물 수정/삭제 권한
//		if (request.getParameter("missingAnimalNum") == null) {
//			throw new InterceptedException("올바르지 않은 접근입니다.", "/missing/missingList");
//		}
//		Integer missingAnimalNum = Integer.parseInt(request.getParameter("missingAnimalNum"));
//		MissingAnimal missingAnimal = missingDao.selectMissingAnimal(missingAnimalNum);
//		if (loginUser.getUserNum() != missingAnimal.getWriterNum()) {
//			throw new InterceptedException("접근 권한이 없습니다.", "/missing/missingList");
//		}
//		
//		// 게시물 수정/삭제 권한
//		if (request.getParameter("boardNum") == null) {
//			throw new InterceptedException("올바르지 않은 접근입니다.", "/community/boardList");
//		}
//		Integer boardNum = Integer.parseInt(request.getParameter("boardNum"));
//		Board board = communityDao.selectBoardByBN(boardNum);
//		if (loginUser.getUserNum() != board.getWriterNum()) {
//			throw new InterceptedException("접근 권한이 없습니다.", "/community/boardList");
//		}
		return super.preHandle(request, response, handler);
	}
	

}
