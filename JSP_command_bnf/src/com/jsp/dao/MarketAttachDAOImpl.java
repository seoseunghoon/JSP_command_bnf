package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MarketAttachVO;

public class MarketAttachDAOImpl implements MarketAttachDAO {

	@Override
	public List<MarketAttachVO> selectAttachByBno(SqlSession session, int bno) throws SQLException {
		List<MarketAttachVO> attachList = session.selectList("MarketAttach-Mapper.selectAttachListByBno", bno);
		
		 
		 
		 return attachList;
	}

	@Override
	public MarketAttachVO selectAttachByAno(SqlSession session, int ano) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("MarketAttach-Mapper.selectAttachByAno", ano);
	}

	@Override
	public void deleteAttach(SqlSession session, int ano) throws SQLException {
		session.update("MarketAttach-Mapper.deleteAttach", ano);		
	}

	@Override
	public void deleteAllAttach(SqlSession session, int bno) throws SQLException {
		session.update("MarketAttach-Mapper.deleteAllAttach", bno);		
		
	}

	@Override
	public void insertAttach(SqlSession session, MarketAttachVO attach) throws SQLException {
		session.update("MarketAttach-Mapper.insertAttach", attach);		
		
	}

	

}
