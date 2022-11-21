package com.wannaattention.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wannaattention.www.service.InfoService;
import com.wannaattention.www.vo.Facility;

@Controller
@RequestMapping("info")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@RequestMapping("animalHospitalList")
	public String animalHospitalList() {
		return null;
	}
	@RequestMapping("animalHotelList")
	public String animalHotelList() {
		return null;
	}
	@RequestMapping("animalSalonList")
	public String animalSalonList() {
		return null;
	}
	@RequestMapping("animalPlaygroundList")
	public ModelAndView animalPlaygroundList(Integer pageNum, Integer region) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;
		int listCount = service.infoCount();
		
		List<Facility> facList = service.selectPgList(pageNum, limit, region);
		int maxPage = (int)((double)listCount/limit + 0.95); // 출력 최대 페이지
		int startPage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1; // 페이징 시작번호
		int endPage = startPage + 9; // 페이징 끝번호
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		mav.addObject("pageNum", pageNum); 
		mav.addObject("maxPage", maxPage); 
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage); 
		mav.addObject("listCount", listCount);
		mav.addObject("facList", facList);
		return mav;
	}
	@RequestMapping("animalFestList")
	public String animalFestList() {
		return null;
	}

}
