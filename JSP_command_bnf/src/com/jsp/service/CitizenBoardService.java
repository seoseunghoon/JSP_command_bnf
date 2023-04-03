package com.jsp.service;

import java.sql.SQLException;
import java.util.Map;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.CitizenAttachVO;
import com.jsp.dto.CitizenBoardVO;

public interface CitizenBoardService {
	
	Map<String, Object> getCitizenBoardList(SearchCriteria cri) throws SQLException;

	void registCitizenBoard(CitizenBoardVO citizenBoard) throws SQLException;

	CitizenBoardVO readCitizenBoard(int bno) throws SQLException;

	CitizenBoardVO getCitizenBoard(int bno) throws SQLException;

	void modifyCitizenBoard(CitizenBoardVO citizenBoard) throws SQLException;

	void removeCitizenBoard(int bno) throws SQLException;
	
	CitizenAttachVO getCitizenAttachByAno(int ano) throws SQLException;
	
	void removeCitizenAttachByAno(int ano) throws SQLException;
	
}
