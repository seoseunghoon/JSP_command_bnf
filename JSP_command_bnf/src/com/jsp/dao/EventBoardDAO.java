package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.EventBoardVO;


public interface EventBoardDAO {
	List<EventBoardVO> selectEventBoardCriteria(SqlSession session,SearchCriteria cri) throws SQLException;
	
	int selectEventBoardCriteriaTotalCount(SqlSession session,SearchCriteria cri) throws SQLException;
	
	EventBoardVO selectEventBoardByBno(SqlSession session,int bno)throws SQLException;
	
	
	void insertEventBoard(SqlSession session,EventBoardVO evnetBoard)throws SQLException;
	void updateEventBoard(SqlSession session,EventBoardVO evnetBoard)throws SQLException;
	void deleteEventBoard(SqlSession session,int bno)throws SQLException;
	
	
	//pds_seq.nextval 가져오기
	int selectSeqNextValue(SqlSession session) throws SQLException;
	//viewcnt  증가
	void increaseViewCnt(SqlSession session,int bno)throws SQLException;
	
}
