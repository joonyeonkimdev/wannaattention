package com.wannaattention.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wannaattention.www.vo.Animal;
import com.wannaattention.www.vo.Booking;
import com.wannaattention.www.vo.User;

public interface AnimalMapper {

	@Select("SELECT NVL(MAX(ANIMAL_NUM), 0) FROM ANIMAL_TB")
	public int selectMaxAnimalNum();

	@Insert("INSERT INTO ANIMAL_TB (ANIMAL_NUM, SHELTER_NUM, NAME, AGE, SPECIES, BREED, GENDER, NEUTRALIZATION, VACCINATION, ENTER_DATE, PROTECT_END_DATE, ADOPT_STEP, PROFILE_FILENAME)"
			+ " VALUES (#{animalNum}, #{shelterNum}, #{name}, #{age}, #{species}, #{breed}, #{gender}, #{neutralization}, #{vaccination}, #{enterDate}, #{protectEndDate}, #{adoptStep}, #{profileFilename})")
	public void insertAnimal(Animal animal);

	@Select("SELECT COUNT(*) FROM ANIMAL_TB")
	public int animalCount();

	@Select({"<script>",
			"SELECT *" + 
			" FROM (SELECT ROWNUM AS RNUM, ANIMAL_NUM, SHELTER_NUM, SHELTER_NAME, NAME, AGE, SPECIES, BREED, GENDER, NEUTRALIZATION, VACCINATION, ENTER_DATE, PROTECT_END_DATE, ADOPT_STEP, PROFILE_FILENAME" + 
			" FROM (SELECT A.ANIMAL_NUM, A.SHELTER_NUM, U.NAME AS SHELTER_NAME, A.NAME, A.AGE, A.SPECIES, A.BREED, A.GENDER, A.NEUTRALIZATION, A.VACCINATION, A.ENTER_DATE, A.PROTECT_END_DATE, A.ADOPT_STEP, A.PROFILE_FILENAME" + 
			" FROM ANIMAL_TB A, USER_TB U WHERE A.SHELTER_NUM = U.USER_NUM",
			"<if test='species != null and species != \"0\"'> AND A.SPECIES = #{species}</if>",
			" ORDER BY A.PROTECT_END_DATE)) WHERE RNUM BETWEEN #{startRow} AND #{endRow}",
			"</script>"})
	public List<Animal> animalList(Map<String, Object> param);

	@Select("SELECT A.ANIMAL_NUM, A.SHELTER_NUM, U.NAME AS SHELTER_NAME, A.NAME, A.AGE, A.SPECIES, A.BREED, A.GENDER, A.NEUTRALIZATION, A.VACCINATION, A.ENTER_DATE, A.PROTECT_END_DATE, A.ADOPT_STEP, A.PROFILE_FILENAME"
			+ " FROM ANIMAL_TB A, USER_TB U WHERE A.SHELTER_NUM = U.USER_NUM AND A.ANIMAL_NUM = #{animalNum}")
	public Animal selectAnimal(Integer animalNum);

	@Select("SELECT * FROM USER_TB WHERE USER_NUM = #{shelterNum}")
	public User selectShelter(String shelterNum);

	@Select("SELECT NVL(MAX(BOOKING_NUM), 0) FROM BOOKING_TB")
	public int selectMaxBookingNum();
	
	@Insert("INSERT INTO BOOKING_TB (BOOKING_NUM, BOOKER_NUM, SHELTER_NUM, ANIMAL_NUM, BOOKING_DATE) VALUES (#{bookingNum}, #{bookerNum}, #{shelterNum}, #{animalNum}, #{bookingDate})")
	public void insertBooking(Booking booking);

	@Delete("DELETE FROM ANIMAL_TB WHERE ANIMAL_NUM = #{animalNum}")
	public void deleteAnimal(Integer animalNum);

	@Update("UPDATE ANIMAL_TB"
			+ " SET NAME = #{name}, AGE = #{age}, SPECIES = #{species}, BREED = #{breed}, GENDER = #{gender}, NEUTRALIZATION = #{neutralization}, VACCINATION = #{vaccination}, ENTER_DATE = #{enterDate}, PROTECT_END_DATE = #{protectEndDate}, ADOPT_STEP = #{adoptStep}, PROFILE_FILENAME = #{profileFilename}"
			+ " WHERE ANIMAL_NUM = #{animalNum}")
	public void updateAnimal(Animal animal);
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
