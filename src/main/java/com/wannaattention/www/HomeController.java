package com.wannaattention.www;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
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
		mav.setViewName("tempUploadDone");
		return mav;
	}
	
}
