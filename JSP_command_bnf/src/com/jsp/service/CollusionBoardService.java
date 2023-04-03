package com.jsp.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.CollusionAttachVO;
import com.jsp.dto.CollusionBoardVO;

public interface CollusionBoardService {
	
	Map<String, Object> getList(SearchCriteria cri) throws SQLException;
	
	void regist(CollusionBoardVO board) throws SQLException;
	
	CollusionBoardVO read(int bno) throws SQLException;
	
	CollusionBoardVO getBoard(int bno) throws SQLException;
	
	void modify(CollusionBoardVO board) throws SQLException;
	
	void remove(int bno) throws SQLException;
	
	CollusionAttachVO getAttachByAno(int ano) throws SQLException;
	
}
