package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.Animal;

@Repository
public class AnimalDAO {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public int selectMaxAnimalNum() {
		return template.getMapper(AnimalMapper.class).selectMaxAnimalNum();
	}

	public void insertAnimal(Animal animal) {
		template.getMapper(AnimalMapper.class).insertAnimal(animal);
		
	}

}
