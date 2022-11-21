package com.wannaattention.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.DonationVO;
/**
 * @ClassName : DonationDAO.java
 * @Description : 후원하기 데이터 접근 클래스 (쿼리 호출하기)
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
@Repository
public class DonationDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	/** 후원을 신청한다 -이하영- */
	public int insertDonate(DonationVO donationVO) {
		return template.getMapper(DonationMapper.class).insertDonate(donationVO);
	}
}
