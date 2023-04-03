package com.jsp.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.ComplainAttachVO;
import com.jsp.dto.ComplainBoardVO;

public interface ComplainBoardService {
	
	Map<String, Object> getComplainBoardList(SearchCriteria cri) throws SQLException;
	
	void registComplainBoard(ComplainBoardVO complainBoard) throws SQLException;
	
	ComplainBoardVO readComplainBoard(int bno) throws SQLException;
	
	ComplainBoardVO getComplainBoard(int bno) throws SQLException;
	
	void modifyComplainBoard(ComplainBoardVO complainBoard) throws SQLException;
	
	void removeComplainBoard(int bno) throws SQLException;
	
	ComplainAttachVO getComplainAttachByAno(int ano) throws SQLException;
	
	void removeComplainAttachByAno(int ano) throws SQLException;
	
}
