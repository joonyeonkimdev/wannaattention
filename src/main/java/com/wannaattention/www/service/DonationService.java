package com.wannaattention.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannaattention.www.dao.DonationDAO;
import com.wannaattention.www.vo.DonationVO;
/**
 * @ClassName : DonationService.java
 * @Description : 후원하기 실제 작동하는 부분
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
@Service /*-이하영-*/
public class DonationService {

	/** DonationDAO (후원하기 실행쿼리 불러오기) */
	@Autowired
	private DonationDAO donationDAO;
	
	/** 후원을 신청한다 */
	public int insertDonate(DonationVO donationVO) {
		return donationDAO.insertDonate(donationVO);
	}
	
	public DonationVO confirmDonate(DonationVO donationVO) {
		return donationVO;
	}
}
