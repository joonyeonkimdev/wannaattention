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

	

}
