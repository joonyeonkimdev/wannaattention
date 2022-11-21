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
	
	public List<Facility> selectPgList(Integer pageNum, Integer limit, Integer region) {
		int startRow = (pageNum - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		param.clear();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("region", region);
		return template.getMapper(InfoMapper.class).selectPgList(param);
	}

	public int infoCount() {
		return template.getMapper(InfoMapper.class).infoCount();
	}

}
