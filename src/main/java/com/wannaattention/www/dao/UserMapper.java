package com.wannaattention.www.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wannaattention.www.vo.User;

public interface UserMapper {

	@Select("SELECT NVL(MAX(USER_NUM), 0) FROM USER_TB")
	public int selectMaxUserNum();

	@Insert("INSERT INTO USER_TB (USER_NUM, USER_TYPE, ID, PW, NAME, NICKNAME, BIRTHDAY, EMAIL, PHONE, TEL, POST_NUM, ADDRESS, SIGNUP_DATE, BUSI_NUM, PROFILE_FILENAME, SHELTER_DES_FILENAME, QUES1, QUES2, QUES3)"
			+ " VALUES (#{userNum}, #{userType}, #{id}, #{pw}, #{name}, #{nickname}, #{birthday}, #{email}, #{phone}, #{tel}, #{postNum}, #{address}, SYSDATE, #{busiNum}, #{profileFilename}, #{shelterDesFilename}, #{ques1}, #{ques2}, #{ques2})")
	public void insertUser(User user);

	@Select("SELECT * FROM USER_TB WHERE ID = #{id}")
	public User selectUserById(String id);

	@Select("SELECT * FROM USER_TB WHERE EMAIL = #{email}")
	public User selectUserByEmail(String email);

	@Update("UPDATE USER_TB SET PW = #{PW} WHERE USER_NUM = #{userNum}")
	public Object updateUserPw(User user);
}
