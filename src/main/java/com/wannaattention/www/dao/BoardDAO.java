package com.wannaattention.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannaattention.www.vo.Board;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	public int getMaxBoardNum() {
		return template.getMapper(BoardMapper.class).getMaxBoardNum();
	}
	
	public int insertBoard(Board board) {
		return template.getMapper(BoardMapper.class).insertBoard(board);
	}

	public Board selectBoardByBN(Integer boardNum) {
		return template.getMapper(BoardMapper.class).selectBoardByBN(boardNum);
	}

	public int boardCount(String boardType) {
		return template.getMapper(BoardMapper.class).boardCount(boardType);
		
	}

	public List<Board> boardList(Integer pageNum, int limit, String boardType) {
		param.clear();
		int startRow = (pageNum - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("boardType", boardType);
		return template.getMapper(BoardMapper.class).boardList(param);
	}

	
}
