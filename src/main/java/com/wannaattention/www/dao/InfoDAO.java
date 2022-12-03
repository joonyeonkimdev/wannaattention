package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.Facility;

@Repository
public class InfoDAO {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public List<Facility> selectPgList(Integer region) {
		param.clear();
		param.put("region", region);
		return template.getMapper(InfoMapper.class).selectPgList(param);
	}

}
