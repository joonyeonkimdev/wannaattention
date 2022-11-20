package com.wannaattention.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wannaattention.www.vo.MissingAnimal;

public interface MissingMapper {

	@Select("SELECT NVL(MAX(MISSING_ANIMAL_NUM), 0) FROM MISSING_ANIMAL_TB")
	public int selectMaxMissingAnimalNum();

	@Insert("INSERT INTO MISSING_ANIMAL_TB (MISSING_ANIMAL_NUM, WRITER_NUM, STATUS, SPECIES, BREED, GENDER, LOCATION, REG_DATE, DESCRIPTION, PHOTO_FILENAME)"
			+ " VALUES (#{missingAnimalNum}, #{writerNum}, #{status}, #{species}, #{breed}, #{gender}, #{location}, SYSDATE, #{description}, #{photoFilename})")
	public void insertMissingAnimal(MissingAnimal missingAnimal);

	@Select("SELECT M.MISSING_ANIMAL_NUM, U.USER_NUM AS WRITER_NUM, U.NICKNAME AS WRITER_NICKNAME, M.STATUS, M.SPECIES, M.BREED, M.GENDER, M.LOCATION, M.REG_DATE, M.DESCRIPTION ,M.PHOTO_FILENAME"
			+ " FROM MISSING_ANIMAL_TB M, USER_TB U WHERE M.WRITER_NUM = U.USER_NUM AND MISSING_ANIMAL_NUM = #{missingAnimalNum}")
	public MissingAnimal selectMissingAnimal(Integer missingAnimalNum);

	@Select("SELECT COUNT(*) FROM MISSING_ANIMAL_TB")
	public int missingCount();

	@Select("SELECT *" + 
			" FROM (SELECT ROWNUM AS RNUM, MISSING_ANIMAL_NUM, WRITER_NUM, WRITER_NICKNAME, STATUS, SPECIES, BREED, GENDER, LOCATION, REG_DATE, DESCRIPTION, PHOTO_FILENAME" + 
			" FROM (SELECT M.MISSING_ANIMAL_NUM, U.USER_NUM AS WRITER_NUM, U.NICKNAME AS WRITER_NICKNAME, M.STATUS, M.SPECIES, M.BREED, M.GENDER, M.LOCATION, M.REG_DATE, M.DESCRIPTION ,M.PHOTO_FILENAME" + 
			" FROM MISSING_ANIMAL_TB M, USER_TB U WHERE M.WRITER_NUM = U.USER_NUM ORDER BY M.REG_DATE DESC))" + 
			" WHERE RNUM BETWEEN #{startRow} AND #{endRow}")
	public List<MissingAnimal> missingList(Map<String, Object> param);

}
