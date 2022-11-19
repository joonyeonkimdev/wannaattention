package com.wannaattention.www.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.wannaattention.www.vo.Board;

public interface BoardMapper {

	@Select("SELECT NVL(MAX(BOARD_NUM), 0) FROM BOARD_TB")
	public int getMaxBoardNum();
	
	@Insert("INSERT INTO BOARD_TB (BOARD_NUM, WRITER_NUM, BOARD_TYPE, TITLE, REG_DATE, READ_CNT, CONTENT, GRP, GRP_LEVEL, GRP_STEP, PHOTO_FILENAME, VIDEO_FILENAME, ETC_FILENAME)"
			+ " VALUES (#{boardNum}, #{writerNum}, #{boardType}, #{title}, SYSDATE, #{readCnt}, #{content}, #{grp}, #{grpLevel}, #{grpStep}, #{photoFilename}, #{videoFilename}, #{etcFilename})")
	public int insertBoard(Board board);

	@Select("SELECT B.BOARD_NUM, U.USER_NUM AS WRITER_NUM, U.ID AS WRITER_ID, U.NICKNAME AS WRITER_NICKNAME, B.BOARD_TYPE, B.TITLE, B.REG_DATE, B.READ_CNT, B.CONTENT, B.GRP, B.GRP_LEVEL, B.GRP_STEP, B.PHOTO_FILENAME, B.VIDEO_FILENAME, B.ETC_FILENAME"
			+ " FROM BOARD_TB B, USER_TB U"
			+ " WHERE B.WRITER_NUM = U.USER_NUM AND B.BOARD_NUM = #{boardNum}")
	public Board selectBoardByBN(Integer boardNum);

	

}
