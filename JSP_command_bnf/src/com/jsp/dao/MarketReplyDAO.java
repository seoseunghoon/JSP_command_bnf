package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.MarketReplyVO;

public interface MarketReplyDAO {

	public List<MarketReplyVO> selectReplyByBno(SqlSession session, int bno)throws SQLException;
	
	public MarketReplyVO selectReplyByRno(SqlSession session, int rno)throws SQLException;
	
	public void deleteReply(SqlSession session, int rno)throws SQLException;
	
	public void deleteAllReply(SqlSession session, int bno)throws SQLException;
	
	public void insertReply(SqlSession session, MarketReplyVO reply)throws SQLException;
	
	public void updateReply(SqlSession session, MarketReplyVO reply)throws SQLException;
	
	
}
