package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MarketAttachVO;
import com.jsp.dto.MarketReplyVO;

public class MarketReplyDAOImpl implements MarketReplyDAO {

	@Override
	public List<MarketReplyVO> selectReplyByBno(SqlSession session, int bno) throws SQLException {
		return session.selectList("MarketReply-Mapper.selectReplyListByBno", bno);
	}

	@Override
	public MarketReplyVO selectReplyByRno(SqlSession session, int rno) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("MarketReply-Mapper.selectReplyByRno", rno);
	}

	@Override
	public void deleteReply(SqlSession session, int rno) throws SQLException {
		session.update("MarketReply-Mapper.deleteReply",rno);
	}

	@Override
	public void deleteAllReply(SqlSession session, int bno) throws SQLException {
		session.update("MarketReply-Mapper.deleteAllReply",bno);
		
	}

	@Override
	public void insertReply(SqlSession session, MarketReplyVO reply) throws SQLException {
		session.update("MarketReply-Mapper.insertReply",reply);
		
	}

	@Override
	public void updateReply(SqlSession session, MarketReplyVO reply) throws SQLException {
		session.update("MarketReply-Mapper.updateReply",reply);
		
	}

	
	

}
