package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.User;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	public int selectMaxUserNum() {
		return template.getMapper(UserMapper.class).selectMaxUserNum();
	}

	public void insertUser(User user) {
		template.getMapper(UserMapper.class).insertUser(user);
	}

	public User selectUserById(String id) {
		return template.getMapper(UserMapper.class).selectUserById(id);
	}

	public User selectUserByEmail(String email) {
		return template.getMapper(UserMapper.class).selectUserByEmail(email);
	}

	public void updateUserPw(User user) {
		template.getMapper(UserMapper.class).updateUserPw(user);
	}

}
