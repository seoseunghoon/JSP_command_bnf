package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.ComplainAttachVO;

public class ComplainAttachDAOImpl implements ComplainAttachDAO {

	@Override
	public List<ComplainAttachVO> selectComplainAttachesByBno(SqlSession session, int bno) throws SQLException {
		
		List<ComplainAttachVO> complainAttachList = session.selectList("ComplainAttach-Mapper.selectComplainAttachByBno", bno);
		
		return complainAttachList;
		
	}

	@Override
	public ComplainAttachVO selectComplainAttachByAno(SqlSession session, int ano) throws SQLException {
		
		ComplainAttachVO complainAttach = session.selectOne("ComplainAttach-Mapper.selectComplainAttachByAno", ano);
		
		return complainAttach;
		
	}

	@Override
	public void insertComplainAttach(SqlSession session, ComplainAttachVO complainAttach) throws SQLException {
		
		session.update("ComplainAttach-Mapper.insertComplainAttach", complainAttach);
		
	}

	@Override
	public void deleteComplainAttach(SqlSession session, int ano) throws SQLException {
		
		session.update("ComplainAttach-Mapper.deleteComplainAttach", ano);
		
	}

	@Override
	public void deleteAllComplainAttach(SqlSession session, int bno) throws SQLException {
		
		session.update("ComplainAttach-Mapper.deleteAllComplainAttach", bno);
		
	}
	
}
