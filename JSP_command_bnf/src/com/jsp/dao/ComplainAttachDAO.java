package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.ComplainAttachVO;

public interface ComplainAttachDAO {
	
	public List<ComplainAttachVO> selectComplainAttachesByBno(SqlSession session, int bno) throws SQLException;
	
	public ComplainAttachVO selectComplainAttachByAno(SqlSession session, int ano) throws SQLException;
	
	public void insertComplainAttach(SqlSession session, ComplainAttachVO complainAttach) throws SQLException;
	
	public void deleteComplainAttach(SqlSession session, int ano) throws SQLException;
	
	public void deleteAllComplainAttach(SqlSession session, int bno) throws SQLException;
	
}
