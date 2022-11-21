package com.wannaattention.www.dao;

import org.apache.ibatis.annotations.Insert;

import com.wannaattention.www.vo.DonationVO;
/**	
 * @ClassName : DonationMapper.java
 * @Description : 후원하기 쿼리실행
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
public interface DonationMapper {

	/** 후원을 신청한다 -이하영-*/
	@Insert("INSERT INTO DONATION_TB (DONA_NUM, DONOR_TYPE, DONA_TYPE, DONA_AMOUNT, "
			+ "DONOR_NAME, DONOR_TEL, DONOR_EMAIL, "
			+ "PAY_METHOD, BANK_NAME, ACCOUNT_NUM, DEPOSITOR_NAME, BIRTHDAY, WITH_DATE, DEDUCT_TYPE, DEDUCT_NUM, "
			+ "CARD_NAME, CARD_NUM, EXP_DATE, CARD_OWNER)"
			+ "VALUES (DONA_SEQ.NEXTVAL, #{donorType}, #{donaType}, #{donaAmount}, "
			+ "#{donorName}, #{donorTel}, #{donorEmail}, "
			+ "#{payMethod}, #{bankName}, #{accountNum}, #{depositorName}, TO_DATE(#{birthday}, 'rrmmdd'), TO_DATE(#{withDate}, 'dd'), #{deductType}, TO_NUMBER(#{deductNum}), "
			+ "#{cardName}, #{cardNum}, TO_DATE(#{expDate}, 'rrmm'), #{cardOwner})")
	public int insertDonate(DonationVO donationVO);
}