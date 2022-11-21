package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.MissingAnimal;

@Repository
public class MissingDAO {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();

	public int selectMaxMissingAnimalNum() {
		return template.getMapper(MissingMapper.class).selectMaxMissingAnimalNum();
	}

	public void insertMissingAnimal(MissingAnimal missingAnimal) {
		template.getMapper(MissingMapper.class).insertMissingAnimal(missingAnimal);
	}

	public MissingAnimal selectMissingAnimal(Integer missingAnimalNum) {
		return template.getMapper(MissingMapper.class).selectMissingAnimal(missingAnimalNum);
	}

	public int missingCount() {
		return template.getMapper(MissingMapper.class).missingCount();
	}

	public List<MissingAnimal> missingList(Integer pageNum, int limit) {
		int startRow = (pageNum - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		param.clear();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return template.getMapper(MissingMapper.class).missingList(param);
	}

	public void deleteMissing(Integer missingAnimalNum) {
		template.getMapper(MissingMapper.class).deleteMissing(missingAnimalNum);
	}

	public void updateMissing(MissingAnimal missingAnimal) {
		template.getMapper(MissingMapper.class).updateMissing(missingAnimal);
	}

}
