package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.MarketBoardVO;

public interface MarketBoardDAO {

	
	public List<MarketBoardVO> selectBoardCriteria(SqlSession session, SearchCriteria cri )throws SQLException;
	public int selectBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri)throws SQLException;
	
	
	public MarketBoardVO selectBoardByBno(SqlSession session, int bno)throws SQLException;
	
	public void insertBoard(SqlSession session, MarketBoardVO board)throws SQLException;
	public void deleteBoard(SqlSession session, int bno)throws SQLException;
	public void updateBoard(SqlSession session, MarketBoardVO board)throws SQLException;
	
	
	//시퀀스는 db에 접근할때마다 무조건올라가나? 아니다. insert할때마다올라간다?
	public int selectSeqNextValue(SqlSession session);
	
	//조회수.
	public void increaseViewCNT(SqlSession session, int bno)throws SQLException;
	
	
	
	
	
	
	
}
