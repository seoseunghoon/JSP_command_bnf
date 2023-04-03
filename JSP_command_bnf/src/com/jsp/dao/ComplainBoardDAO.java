package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.ComplainBoardVO;

public interface ComplainBoardDAO {
	
	List<ComplainBoardVO> selectComplainBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException;
	int selectComplainBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	ComplainBoardVO selectComplainBoardByBno(SqlSession session, int bno) throws SQLException;
	
	void insertComplainBoard(SqlSession session, ComplainBoardVO complainBoard) throws SQLException;
	void updateComplainBoard(SqlSession session, ComplainBoardVO complainBoard) throws SQLException;
	void deleteComplainBoard(SqlSession session, int bno) throws SQLException;
	
	int selectSeqNextValue(SqlSession session) throws SQLException;
	
	void increasViewCnt(SqlSession session, int bno) throws SQLException;
	
}
