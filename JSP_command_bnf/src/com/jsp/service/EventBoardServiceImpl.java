package com.jsp.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.EventBoardDAO;
import com.jsp.dto.EventBoardVO;


public class EventBoardServiceImpl implements EventBoardService {

	private SqlSessionFactory sqlSessionFactory;
	private EventBoardDAO eventBoardDAO;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setEventBoardDAO(EventBoardDAO eventBoardDAO) {
		this.eventBoardDAO = eventBoardDAO;
	}

	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			List<EventBoardVO> eventBoardList = eventBoardDAO.selectEventBoardCriteria(session, cri);
			
			PageMaker pageMaker = new PageMaker();//
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(eventBoardDAO.selectEventBoardCriteriaTotalCount(session, cri));

			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("eventBoardList", eventBoardList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
		} finally {
			session.close();
		}
	}

	@Override
	public void regist(EventBoardVO eventBoard) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			int bno = eventBoardDAO.selectSeqNextValue(session);
			eventBoard.setBno(bno);
			eventBoardDAO.insertEventBoard(session, eventBoard);

		} finally {
			session.close();
		}

	}

	@Override
	public EventBoardVO read(int bno) throws SQLException {

		SqlSession session = sqlSessionFactory.openSession();
		try {

			EventBoardVO eventBoard = eventBoardDAO.selectEventBoardByBno(session, bno);
			eventBoardDAO.increaseViewCnt(session, bno);

			
			
			return eventBoard;

		} finally {
			session.close();
		}
	}

	@Override
	public EventBoardVO getEventBoard(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			EventBoardVO eventBoard = eventBoardDAO.selectEventBoardByBno(session, bno);
			
			return eventBoard;
		} finally {
			session.close();
		}
	}

	@Override
	public void modify(EventBoardVO eventBoard) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			eventBoardDAO.updateEventBoard(session, eventBoard);

		} finally {
			session.close();
		}
	}

	@Override
	public void remove(int bno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		try {

			eventBoardDAO.deleteEventBoard(session, bno);

		} finally {
			session.close();
		}
	}
}


	
	

	
