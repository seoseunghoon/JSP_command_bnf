package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.CollusionBoardVO;

public interface CollusionBoardDAO {
	
	List<CollusionBoardVO> selectCollusionBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException;
	
	int selectCollusionBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	CollusionBoardVO selectCollusionBoardByBno(SqlSession session, int bno) throws SQLException;
	
	void insertCollusionBoard(SqlSession session, CollusionBoardVO board) throws SQLException;
	
	void updateCollusionBoard(SqlSession session, CollusionBoardVO board) throws SQLException;
	
	void deleteCollusionBoard(SqlSession session, int bno )throws SQLException;
	
	int selectSeqNextValue(SqlSession session) throws SQLException;
	
	void increaseViewCnt(SqlSession session, int bno) throws SQLException;
	
}
