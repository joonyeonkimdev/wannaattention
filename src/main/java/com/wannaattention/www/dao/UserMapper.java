package com.wannaattention.www.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wannaattention.www.vo.User;

public interface UserMapper {

	@Select("SELECT NVL(MAX(USER_NUM), 0) FROM USER_TB")
	public int selectMaxUserNum();

	@Insert("INSERT INTO USER_TB (USER_NUM, USER_TYPE, ID, PW, NAME, NICKNAME, BIRTHDAY, EMAIL, PHONE, TEL, POST_NUM, ADDRESS, SIGNUP_DATE, BUSI_NUM, PROFILE_FILENAME, SHELTER_DES_FILENAME)"
			+ " VALUES (#{userNum}, #{userType}, #{id}, #{pw}, #{name}, #{nickname}, #{birthday}, #{email}, #{phone}, #{tel}, #{postNum}, SYSDATE, #{busiNum}, #{busiNum}, #{profileFilename}, #{shelterDesFilename})")
	public void insertUser(User user);

	@Select("SELECT * FROM USER_TB WHERE ID = #{id}")
	public User selectUser(String id);
}
