package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.CitizenAttachVO;

public interface CitizenAttachDAO {
	
	public List<CitizenAttachVO> selectCitizenAttachesByBno(SqlSession session, int bno) throws SQLException;
	public CitizenAttachVO selectCitizenAttachByAno(SqlSession session, int ano) throws SQLException;
	
	public void insertCitizenAttach(SqlSession session, CitizenAttachVO citizenAttach) throws SQLException;

	public void deleteCitizenAttach(SqlSession session, int ano) throws SQLException;

	public void deleteAllCitizenAttach(SqlSession session, int bno) throws SQLException;
	
}
