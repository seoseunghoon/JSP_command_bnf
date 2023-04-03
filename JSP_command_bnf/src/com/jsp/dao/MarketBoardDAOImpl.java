package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.MarketBoardVO;

public class MarketBoardDAOImpl implements MarketBoardDAO {

	@Override
	public List<MarketBoardVO> selectBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		return session.selectList("MarketBoard-Mapper.selectSearchBoardList",cri,rowBounds);
	}
	
	@Override
	public int selectBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException {
		
		int total = session.selectOne("MarketBoard-Mapper.selectSearchBoardTotalCount",cri);
		return total;
	}


	@Override
	public MarketBoardVO selectBoardByBno(SqlSession session, int bno) throws SQLException {
		return session.selectOne("MarketBoard-Mapper.selectBoardByBno", bno);
	}

	@Override
	public void insertBoard(SqlSession session, MarketBoardVO board) throws SQLException {
		session.update("MarketBoard-Mapper.insertBoard",board);
	}

	

	@Override
	public void updateBoard(SqlSession session, MarketBoardVO board) throws SQLException {
		session.update("MarketBoard-Mapper.updateBoard", board);	
	}

	
	@Override
	public void deleteBoard(SqlSession session, int bno) throws SQLException {
		session.update("MarketBoard-Mapper.deleteBoard",bno);
	}

	@Override
	public int selectSeqNextValue(SqlSession session) {
		return session.selectOne("MarketBoard-Mapper.selectBoardSeqNext");
	}

	@Override
	public void increaseViewCNT(SqlSession session,int bno) throws SQLException {
		session.update("MarketBoard-Mapper.increaseViewCNT",bno);
		
	}
	
	

	

	

}
