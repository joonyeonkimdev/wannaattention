package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.Booking;
import com.wannaattention.www.vo.User;

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

	public int animalCount(String species) {
		param.clear();
		param.put("species", species);
		return template.getMapper(AnimalMapper.class).animalCount(param);
	}

	public List<Animal> animalList(Integer pageNum, int limit, String species) {
		int startRow = (pageNum - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		param.clear();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("species", species);
		return template.getMapper(AnimalMapper.class).animalList(param);
	}

	public Animal selectAnimal(Integer animalNum) {
		return template.getMapper(AnimalMapper.class).selectAnimal(animalNum);
	}

	public User selectShelter(String shelterNum) {
		return template.getMapper(AnimalMapper.class).selectShelter(shelterNum);
	}
	
	public int selectMaxBookingNum() {
		return template.getMapper(AnimalMapper.class).selectMaxBookingNum();
	}

	public void insertBooking(Booking booking) {
		template.getMapper(AnimalMapper.class).insertBooking(booking);	
	}

	public void deleteAnimal(Integer animalNum) {
		template.getMapper(AnimalMapper.class).deleteAnimal(animalNum);
		
	}

	public void updateAnimal(Animal animal) {
		template.getMapper(AnimalMapper.class).updateAnimal(animal);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
