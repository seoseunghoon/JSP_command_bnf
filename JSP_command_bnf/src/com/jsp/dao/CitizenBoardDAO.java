package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.CitizenBoardVO;

public interface CitizenBoardDAO {
	
	List<CitizenBoardVO> selectCitizenBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException;
	
	int selectCitizenBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	CitizenBoardVO selectCitizenBoardByBno(SqlSession session, int bno)throws SQLException;
	
	void insertCitizenBoardVO(SqlSession session, CitizenBoardVO citizenBoard) throws SQLException;
	void updateCitizenBoardVO(SqlSession session, CitizenBoardVO citizenBoard) throws SQLException;
	void deleteCitizenBoardVO(SqlSession session, int bno) throws SQLException;
	
	int selectSeqNextValue(SqlSession session) throws SQLException;
	
	void increaseViewCnt(SqlSession session,int bno)throws SQLException;
	
}
