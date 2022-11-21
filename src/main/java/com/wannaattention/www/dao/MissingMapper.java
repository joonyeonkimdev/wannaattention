package com.wannaattention.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wannaattention.www.vo.MissingAnimal;

public interface MissingMapper {

	@Select("SELECT NVL(MAX(MISSING_ANIMAL_NUM), 0) FROM MISSING_ANIMAL_TB")
	public int selectMaxMissingAnimalNum();

	@Insert("INSERT INTO MISSING_ANIMAL_TB (MISSING_ANIMAL_NUM, WRITER_NUM, STATUS, SPECIES, BREED, GENDER, LOCATION, REG_DATE, DESCRIPTION, PHOTO_FILENAME)"
			+ " VALUES (#{missingAnimalNum}, #{writerNum}, #{status}, #{species}, #{breed}, #{gender}, #{location}, SYSDATE, #{description}, #{photoFilename})")
	public void insertMissingAnimal(MissingAnimal missingAnimal);

	@Select("SELECT M.MISSING_ANIMAL_NUM, U.USER_NUM AS WRITER_NUM, U.NICKNAME AS WRITER_NICKNAME, M.STATUS, M.SPECIES, M.BREED, M.GENDER, M.LOCATION, M.REG_DATE, M.DESCRIPTION ,M.PHOTO_FILENAME"
			+ " FROM MISSING_ANIMAL_TB M, USER_TB U WHERE M.WRITER_NUM = U.USER_NUM AND M.MISSING_ANIMAL_NUM = #{missingAnimalNum}")
	public MissingAnimal selectMissingAnimal(Integer missingAnimalNum);

	@Select({"<script>",
		"SELECT COUNT(*) FROM MISSING_ANIMAL_TB",
		"<if test='species != null and species != \"0\"'> WHERE SPECIES = #{species}</if>",
		"</script>"})
	public int missingCount(Map<String, Object> param);

	@Select({"<script>",
			"SELECT *" + 
			" FROM (SELECT ROWNUM AS RNUM, MISSING_ANIMAL_NUM, WRITER_NUM, WRITER_NICKNAME, STATUS, SPECIES, BREED, GENDER, LOCATION, REG_DATE, DESCRIPTION, PHOTO_FILENAME" + 
			" FROM (SELECT M.MISSING_ANIMAL_NUM, U.USER_NUM AS WRITER_NUM, U.NICKNAME AS WRITER_NICKNAME, M.STATUS, M.SPECIES, M.BREED, M.GENDER, M.LOCATION, M.REG_DATE, M.DESCRIPTION ,M.PHOTO_FILENAME" + 
			" FROM MISSING_ANIMAL_TB M, USER_TB U WHERE M.WRITER_NUM = U.USER_NUM",
			" <if test='species != null and species != \"0\"'> AND M.SPECIES = #{species}</if>",
			" ORDER BY M.REG_DATE DESC))" + 
			" WHERE RNUM BETWEEN #{startRow} AND #{endRow}",
			"</script>"})
	public List<MissingAnimal> missingList(Map<String, Object> param);

	@Delete("DELETE FROM MISSING_ANIMAL_TB WHERE MISSING_ANIMAL_NUM = #{missingAnimalNum}")
	public void deleteMissing(Integer missingAnimalNum);

	@Update("UPDATE MISSING_ANIMAL_TB"
			+ " SET MISSING_ANIMAL_NUM = #{missingAnimalNum}, WRITER_NUM = #{writerNum}, STATUS = #{status}, SPECIES = #{species}, BREED = #{breed}, GENDER = #{gender}, LOCATION = #{location}, DESCRIPTION = #{description}, PHOTO_FILENAME = #{photoFilename}"
			+ " WHERE MISSING_ANIMAL_NUM = #{missingAnimalNum}")
	public void updateMissing(MissingAnimal missingAnimal);

}
