package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.CollusionAttachVO;

public interface CollusionAttachDAO {
	
	List<CollusionAttachVO> selectAttachesByBno(SqlSession session, int bno) throws SQLException;
	
	CollusionAttachVO selectAttachByAno(SqlSession session, int ano) throws SQLException;
	
	void insertAttach(SqlSession session, CollusionAttachVO attach) throws SQLException;
	
	void deleteAttach(SqlSession session, int ano) throws SQLException;
	
	void deleteAllAttach(SqlSession session, int bno) throws SQLException;
}
