package com.wannaattention.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.User;

public interface AnimalMapper {

	@Select("SELECT NVL(MAX(ANIMAL_NUM), 0) FROM ANIMAL_TB")
	public int selectMaxAnimalNum();

	@Insert("INSERT INTO ANIMAL_TB (ANIMAL_NUM, SHELTER_NUM, NAME, AGE, SPECIES, BREED, GENDER, NEUTRALIZATION, VACCINATION, ENTER_DATE, PROTECT_END_DATE, ADOPT_STEP, PROFILE_FILENAME)"
			+ " VALUES (#{animalNum}, #{shelterNum}, #{name}, #{age}, #{species}, #{breed}, #{gender}, #{neutralization}, #{vacccination}, #{enterDate}, #{protectEndDate}, #{adoptStep}, #{profileFilename})")
	public void insertAnimal(Animal animal);

	@Select("SELECT COUNT(*) FROM ANIMAL_TB")
	public int animalCount();

	@Select("SELECT *" + 
			" FROM (SELECT ROWNUM AS RNUM, ANIMAL_NUM, SHELTER_NUM, SHELTER_NAME, NAME, AGE, SPECIES, BREED, GENDER, NEUTRALIZATION, VACCINATION, ENTER_DATE, PROTECT_END_DATE, ADOPT_STEP, PROFILE_FILENAME" + 
			" FROM (SELECT A.ANIMAL_NUM, A.SHELTER_NUM, U.NAME AS SHELTER_NAME, A.NAME, A.AGE, A.SPECIES, A.BREED, A.GENDER, A.NEUTRALIZATION, A.VACCINATION, A.ENTER_DATE, A.PROTECT_END_DATE, A.ADOPT_STEP, A.PROFILE_FILENAME" + 
			" FROM ANIMAL_TB A, USER_TB U WHERE A.SHELTER_NUM = U.USER_NUM ORDER BY PROTECT_END_DATE))" + 
			" WHERE RNUM BETWEEN #{startRow} AND #{endRow}")
	public List<Animal> animalList(Map<String, Object> param);

	@Select("SELECT A.ANIMAL_NUM, A.SHELTER_NUM, U.NAME AS SHELTER_NAME, A.NAME, A.AGE, A.SPECIES, A.BREED, A.GENDER, A.NEUTRALIZATION, A.VACCINATION, A.ENTER_DATE, A.PROTECT_END_DATE, A.ADOPT_STEP, A.PROFILE_FILENAME"
			+ " FROM ANIMAL_TB A, USER_TB U WHERE A.SHELTER_NUM = U.USER_NUM AND A.ANIMAL_NUM = #{animalNum}")
	public Animal selectAnimal(Integer animalNum);

	@Select("SELECT * FROM USER_TB WHERE USER_NUM = #{shelterNum}")
	public User selectShelter(String shelterNum);
	
	

}
