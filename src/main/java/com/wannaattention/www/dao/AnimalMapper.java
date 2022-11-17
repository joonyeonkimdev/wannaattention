package com.wannaattention.www.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wannaattention.www.vo.Animal;

public interface AnimalMapper {

	@Select("SELECT NVL(MAX(ANIMAL_NUM), 0) FROM ANIMAL_TB")
	public int selectMaxAnimalNum();

	@Insert("INSERT INTO ANIMAL_TB (ANIMAL_NUM, SHELTER_NUM, NAME, AGE, SPECIES, BREED, GENDER, NEUTRALIZATION, VACCINATION, ENTER_DATE, PROTECT_END_DATE, ADOPT_STEP, PROFILE_FILENAME)"
			+ " VALUES (#{animalNum}, #{shelterNum}, #{name}, #{age}, #{species}, #{breed}, #{gender}, #{neutralization}, #{vacccination}, #{enterDate}, #{protectEndDate}, #{adoptStep}, #{profileFilename})")
	public void insertAnimal(Animal animal);
	
	

}
