package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.EventBoardVO;



public class EventBoardDAOImpl implements EventBoardDAO{

	@Override
	public List<EventBoardVO> selectEventBoardCriteria(SqlSession session, SearchCriteria cri) throws SQLException {
		int offset=cri.getStartRowNum();//여기번호부터
		int limit=cri.getPerPageNum();//몇개가져온다~~
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<EventBoardVO> eventBoardList=
		   session.selectList("EventBoard-Mapper.selectSearchEventBoardList",cri,rowBounds);	
			
		return eventBoardList;
	}

	@Override
	public int selectEventBoardCriteriaTotalCount(SqlSession session, SearchCriteria cri) throws SQLException {
		int count=session.selectOne("EventBoard-Mapper.selectSearchEventBoardListCount",cri);
		return count;
	}

	@Override
	public EventBoardVO selectEventBoardByBno(SqlSession session, int bno) throws SQLException {
		EventBoardVO eventBoard=session.selectOne("EventBoard-Mapper.selectEventBoardByBno",bno);
		return eventBoard;
	}

	@Override
	public void insertEventBoard(SqlSession session, EventBoardVO evnetBoard) throws SQLException {
		session.update("EventBoard-Mapper.insertEventBoard",evnetBoard);	
	}

	@Override
	public void updateEventBoard(SqlSession session, EventBoardVO evnetBoard) throws SQLException {
		session.update("EventBoard-Mapper.updateEventBoard",evnetBoard);
		
	}

	@Override
	public void deleteEventBoard(SqlSession session, int bno) throws SQLException {
		session.update("EventBoard-Mapper.deleteEventBoard",bno);
		
	}

	@Override
	public int selectSeqNextValue(SqlSession session) throws SQLException {
		int eventBoard=session.selectOne("EventBoard-Mapper.selectEventBoardSeqNext");
		return eventBoard;
	}

	@Override
	public void increaseViewCnt(SqlSession session, int bno) throws SQLException {
		session.update("EventBoard-Mapper.updateEventBoard",bno);
		
	}


}
