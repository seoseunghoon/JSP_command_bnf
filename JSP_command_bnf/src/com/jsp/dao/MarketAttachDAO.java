package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MarketAttachVO;

public interface MarketAttachDAO {

	//첨부파일이니까. 필요한게 bno별로 Attachlist,  ano별로 Attach
	public List<MarketAttachVO> selectAttachByBno(SqlSession session, int bno)throws SQLException;
	
	public MarketAttachVO selectAttachByAno(SqlSession session, int ano)throws SQLException;
	
	public void deleteAttach(SqlSession session, int ano)throws SQLException;
	
	public void deleteAllAttach(SqlSession session, int bno)throws SQLException;
	
	public void insertAttach(SqlSession session, MarketAttachVO attach)throws SQLException;
	
	
	
	
}
