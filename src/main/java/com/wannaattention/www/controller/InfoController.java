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
	public ModelAndView animalPlaygroundList(Integer region) {
		ModelAndView mav = new ModelAndView();
		List<Facility> facList = service.selectPgList(region);
		mav.addObject("facList", facList);
		return mav;
	}
	
	@RequestMapping("animalFestList")
	public String animalFestList() {
		return null;
	}

}
