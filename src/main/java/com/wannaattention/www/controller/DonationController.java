package com.wannaattention.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wannaattention.www.service.DonationService;
import com.wannaattention.www.vo.DonationVO;
import com.wannaattention.www.service.UserService;
/**
 * @ClassName : DonationController.java
 * @Description : 후원하기 URL 호출 컨트롤러
 *
 * @author 이하영
 * @since 2022. 11. 14.
 * @version 1.0
 * << 개발이력 >>
 *
 *  수정일                           수정자                  수정내용
 *  ------------    --------    ---------------------------
 *  2022.11.14		이하영		최초생성
 */
/* -이하영- */
@Controller
@RequestMapping("donation/donate") 
public class DonationController {
	
	/** 콘솔 오류로그 등을 보기 위한 로거 생성 -이하영-*/
	private static final Logger LOGGER = LoggerFactory.getLogger(DonationController.class);
	private static final String JSP_DIR = "donation/";
	
	/** DonationService (후원하기) -이하영-*/
	@Autowired
	private DonationService donationService;
	
	/** UserService (회원정보) -이하영-*/
	@Autowired
	private UserService userService;
	
	/** 후원하기 페이지로 이동한다 -이하영- */
	@RequestMapping(value="/registDonate")
	public String registDonate(
			@ModelAttribute("donationVO") DonationVO donationVO, ModelMap model) throws Exception {
	
		// 모델에다가 donationVO 담아주기 -이하영-
		model.addAttribute("donationVO", donationVO);
		return JSP_DIR + "donateMain";
	}	
	/* -이하영- */
	@RequestMapping(value="/donateConfirm")
	public String donateConfirm(
			@ModelAttribute("donationVO") DonationVO donationVO, ModelMap model) throws Exception {
		
		donationVO = donationService.confirmDonate(donationVO);
		model.addAttribute("dVO", donationVO);
		
		return JSP_DIR + "donateConfirm";
	} 
	
	
	/** 후원을 신청한다 -이하영- */
	@RequestMapping(value="/insertDonate")
	@ResponseBody
	public String insertDonate(@ModelAttribute("donationVO") DonationVO donationVO) throws Exception { 
		
		int result = 0; 
		
		result = donationService.insertDonate(donationVO);
		
		return result == 1 ? "success" : "error";
	
	} 

}
